[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$cleanRoot = [System.IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot))
$sentinel = Join-Path $cleanRoot '.neutral-task-anchor.json'
if (-not (Test-Path -LiteralPath $sentinel -PathType Leaf)) {
    throw "Clean-room sentinel missing: $sentinel"
}

Set-Location -LiteralPath $cleanRoot
& grok --cwd $cleanRoot --no-memory
exit $LASTEXITCODE
