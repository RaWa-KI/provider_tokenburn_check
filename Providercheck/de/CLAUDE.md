# Neutraler Audit-Anker (Claude)

Dieser Ordner ist ein **neutral-task**-Clean-Room für einen einmaligen
Toolchain-Audit. Er ist kein normales Produkt-Workspace.

## Identität

- `session_scope: neutral-task` für die gesamte Sitzung beibehalten.
- Keine fremden Projekt-Handoffs, Briefings, Memories oder unpassenden Skills
  laden.
- Userglobale Sicherheitsregeln können weiter gelten; lokale Dateien hier
  hebeln sie nicht vollständig aus.

## Arbeit

- Vor einem konkreten Lauf: nichts anlegen.
- Nach Start des Audits durch den Nutzer: genau einen Task über
  `tools/New-NeutralTask.ps1` anlegen und nur dort arbeiten.
- Evidenz unter diesem Task ablegen. Claude schreibt nur unter `.claude/`.

## Einstieg

Wenn der Nutzer den Audit starten lässt: `STARTPROMPT.md` lesen und ausführen.
Den Umfang nicht über `audit.yaml` hinaus erweitern.
