# STARTPROMPT — Token-Burn-Audit

Read-only. Führe `audit.yaml` in diesem Ordner-Root aus.

1. Falls nötig, genau einen Task anlegen mit:
   `pwsh -NoProfile -File tools/New-NeutralTask.ps1 -TaskName 'token-burn-audit'`
2. Die Checkliste in `audit.yaml` abarbeiten.
3. Den Report in `evidence/` dieses Tasks schreiben (kurz auch unter `docs/`,
   wenn sinnvoll).
4. Nur den eigenen Provider-Handoff unter dem Task aktualisieren
   (`.claude/` / `.grok/` / `.codex/` / `.kimi-code/`).

Keine Config-Edits. Keine Billing-Änderungen. Keine Secrets in der Ausgabe.
