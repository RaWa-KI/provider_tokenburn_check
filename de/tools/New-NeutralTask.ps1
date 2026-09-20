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
# Neutral-Task-Handoff ($ProviderDir)

- Aktualisiert: $created
- Scope: neutral-task
- Provider-Surface: $ProviderDir
- Status: active

## Ergebnis

Ausstehend.

## Evidenz

Ausstehend.

## Offene Punkte

Ausstehend.

## Regel

Nur diese Provider-Surface aktualisiert diese Datei.
"@
}

$files = @{
    (Join-Path $taskRoot 'TASK.md') = @"
# $TaskName

- session_scope: neutral-task
- created: $created
- status: active

## Auftrag

Read-only Token-Burn- / Quota-Erstprüfung (`audit.yaml` im Ordner-Root).

## Provider-Handoffs

Jede Surface besitzt `.claude/`, `.grok/`, `.codex/` oder `.kimi-code/`
(`session-handoff.md`, `session-tts.txt`). Keine Writes in fremde Namespaces.
"@
    (Join-Path $taskRoot 'docs\README.md') = "# Task-Doku`n`nNotizen nur fuer diesen neutralen Audit-Lauf.`n"
    (Join-Path $taskRoot 'evidence\README.md') = "# Evidenz`n`nAudit-Report und Rohnotizen hier ablegen.`n"
}

foreach ($providerDir in $providerDirs) {
    $files[(Join-Path $taskRoot "$providerDir\session-handoff.md")] = (New-ProviderHandoffText -ProviderDir $providerDir)
    $files[(Join-Path $taskRoot "$providerDir\session-tts.txt")] =
        "Neutraler Task $TaskName ($providerDir): angelegt, Arbeit ausstehend.`n"
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
