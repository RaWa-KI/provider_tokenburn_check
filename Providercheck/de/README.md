# Providercheck (Deutsch)

Clean-Room-Ordner für eine **read-only**-Erstprüfung lokaler AI-Coding-Tools
(Token-Verbrauch / Quota-Verschwendung).

## Start

1. Öffne deinen AI-Coding-Agenten **mit diesem Ordner (`Providercheck/de`)
   als Arbeitsverzeichnis**.
2. Sende genau:

```text
Run STARTPROMPT.md
```

Befunde landen unter `tasks/<Lauf>/evidence/`.

## Zu den lokalen Startankern

Dieser Ordner liefert kurze lokale `AGENTS.md` / `CLAUDE.md` / `.grok/rules`,
damit die Sitzung den Ordner als **neutralen Clean Room** behandeln kann.

**Lokale Startanker hebeln userglobale Startanker nicht vollständig aus** —
Skills und Hooks können je nach Tool weiterhin geladen werden. Was sie
ermöglichen, ist eine **Erstprüfung**: sie drängen projektbezogene Anweisungen
soweit zurück, dass der Audit ohne fremden Projektkontext laufen kann.

Ergebnisse sind ein Triage-Lauf, keine Garantie, dass jede globale Vorgabe
ignoriert wurde.

## Regeln des Laufs

- Read-only gegen deine echten Tool-Configs (keine stillen Edits).
- Keine Secrets im Report.
- Ein Task-Ordner pro Lauf; jede Provider-Surface schreibt nur in ihren
  eigenen Handoff-Namespace.
