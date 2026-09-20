# Providercheck (Deutsch)

Clean-Room-Ordner für eine **read-only**-Erstprüfung lokaler AI-Coding-Tools
(Token-Verbrauch / Quota-Verschwendung).

## Start

1. Öffne deinen AI-Coding-Agenten **mit diesem Ordner (`de/`) als
   Arbeitsverzeichnis** (nicht den Paket-Root darüber).
2. Sende genau:

```text
Run STARTPROMPT.md
```

Grok bevorzugt:

```powershell
pwsh -NoProfile -File tools/Start-CleanRoomGrok.ps1
```

Befunde landen unter `tasks/<Lauf>/evidence/`.

## Zu den lokalen Startankern

Dieser Ordner liefert lokale `AGENTS.md` / `CLAUDE.md` / `.grok/rules` für
**alle Provider**, damit die Sitzung den Ordner als **neutralen Clean Room**
behandeln kann.

**Lokale Startanker hebeln userglobale Startanker nicht vollständig aus** —
Skills und Hooks können technisch weiter laden. Was sie ermöglichen, ist eine
**Erstprüfung**: sie drängen projektbezogene Anweisungen zurück und sollen
einen **Standard-Session-Start** (Resume, fremde Handoffs/Briefings) fachlich
abbrechen.

Ergebnisse sind ein Triage-Lauf, keine Garantie, dass jede globale Vorgabe
ignoriert wurde.

## Regeln des Laufs

- Read-only gegen deine echten Tool-Configs (keine stillen Edits).
- Keine Secrets im Report.
- Ein Task-Ordner pro Lauf; jede Provider-Surface schreibt nur in ihren
  eigenen Handoff-Namespace.
