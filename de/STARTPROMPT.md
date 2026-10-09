# STARTPROMPT — Token-Burn-Audit

Read-only. Führe `audit.yaml` in diesem Ordner-Root aus.

1. Falls nötig, genau einen Task anlegen mit:
   `pwsh -NoProfile -File tools/New-NeutralTask.ps1 -TaskName 'token-burn-audit'`
2. Die Checkliste in `audit.yaml` abarbeiten.
3. Den Report in `evidence/` dieses Tasks schreiben (kurz auch unter `docs/`,
   wenn sinnvoll).
4. Nur den eigenen Provider-Handoff unter dem Task aktualisieren
   (`.claude/` / `.grok/` / `.codex/` / `.kimi-code/`).

Keine Config-Edits. Keine Billing-Änderungen.

Ausgabe:

- Keine Personen, Konten, Workspace-, Produkt- oder Repo-Namen.
- Keine absoluten Pfade und kein Benutzername im Pfad.
- Nur die Standard-Homes der Tools in Tilde-Form, wie `audit.yaml` sie nennt.
- Zusätzliche MCP-Server, Plugins und Skills nur als Anzahl.
- Keinen Config-Key erfinden. Fehlt er in `documented_controls`, im Report
  als `live-only` markieren.
