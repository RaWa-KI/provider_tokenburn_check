[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$TaskName
)

$ErrorActionPreference = 'Stop'
$neutralRoot = [System.IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot))
$sentinelPath = Join-Path $neutralRoot '.neutral-task-anchor.json'
if (-not (Test-Path -LiteralPath $sentinelPath -PathType Leaf)) {
    throw "Neutral sentinel missing: $sentinelPath"
}

$sentinel = Get-Content -LiteralPath $sentinelPath -Raw | ConvertFrom-Json
if ($sentinel.sessionScope -ne 'neutral-task') {
    throw 'Invalid neutral sentinel (sessionScope must be neutral-task).'
}

$slug = $TaskName.Trim().ToLowerInvariant() -replace '[^a-z0-9]+', '-'
$slug = $slug.Trim('-')
if (-not $slug) {
    throw 'TaskName does not produce a safe folder name.'
}

$stamp = [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ')
$tasksRoot = Join-Path $neutralRoot 'tasks'
$taskRoot = [System.IO.Path]::GetFullPath((Join-Path $tasksRoot "$stamp--$slug"))
if (-not $taskRoot.StartsWith($neutralRoot + [System.IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Task path escaped the neutral root.'
}
if (Test-Path -LiteralPath $taskRoot) {
    throw "Task folder already exists: $taskRoot"
}

$providerDirs = @('.claude', '.grok', '.codex', '.kimi-code')

if (-not $PSCmdlet.ShouldProcess($taskRoot, 'Create neutral task folder')) {
    [pscustomobject]@{
        TaskRoot = $taskRoot
        Created = $false
        SessionScope = 'neutral-task'
        ProviderHandoffDirs = $providerDirs
    }
    return
}

$directories = @(
    $taskRoot,
    (Join-Path $taskRoot 'docs'),
    (Join-Path $taskRoot 'evidence')
) + @($providerDirs | ForEach-Object { Join-Path $taskRoot $_ })
foreach ($directory in $directories) {
    New-Item -ItemType Directory -Path $directory | Out-Null
}

$utf8 = [Text.UTF8Encoding]::new($false)
$created = [DateTime]::Now.ToString('yyyy-MM-ddTHH:mm:sszzz')

function New-ProviderHandoffText {
    param([string]$ProviderDir)
    @"
# Neutral-task handoff ($ProviderDir)

- Updated: $created
- Scope: neutral-task
- Provider-surface: $ProviderDir
- Status: active

## Result

Pending.

## Evidence

Pending.

## Open points

Pending.

## Rule

Only this provider surface updates this file.
"@
}

$files = @{
    (Join-Path $taskRoot 'TASK.md') = @"
# $TaskName

- session_scope: neutral-task
- created: $created
- status: active

## Assignment

Read-only token-burn / quota first-pass audit (`audit.yaml` at repo root).

## Provider handoffs

Each surface owns `.claude/`, `.grok/`, `.codex/`, or `.kimi-code/`
(`session-handoff.md`, `session-tts.txt`). No cross-namespace writes.
"@
    (Join-Path $taskRoot 'docs\README.md') = "# Task docs`n`nNotes for this neutral audit run only.`n"
    (Join-Path $taskRoot 'evidence\README.md') = "# Evidence`n`nPut the audit report and raw notes here.`n"
}

foreach ($providerDir in $providerDirs) {
    $files[(Join-Path $taskRoot "$providerDir\session-handoff.md")] = (New-ProviderHandoffText -ProviderDir $providerDir)
    $files[(Join-Path $taskRoot "$providerDir\session-tts.txt")] =
        "Neutral task $TaskName ($providerDir): created, work pending.`n"
}

foreach ($entry in $files.GetEnumerator()) {
    if (Test-Path -LiteralPath $entry.Key) {
        throw "File collision: $($entry.Key)"
    }
    [System.IO.File]::WriteAllText($entry.Key, $entry.Value, $utf8)
}

[pscustomobject]@{
    TaskRoot = $taskRoot
    Created = $true
    SessionScope = 'neutral-task'
    ProviderHandoffDirs = $providerDirs
}
