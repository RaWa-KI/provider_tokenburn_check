# Neutraler Audit-Anker (Claude)

Dieser Ordner ist ein **neutral-task**-Clean-Room für einen einmaligen
Toolchain-Audit. Er ist **kein** normales Produkt-Workspace und gehört
**nicht** zu einer Workspace-Registry.

## Identität

- `session_scope: neutral-task` für die gesamte Sitzung beibehalten.
- Zielpfade oder Fachthemen im Auftrag ändern diese Identität nicht.
- Keine fremden Projekt-Handoffs, Briefings, Sidecars, Pläne, Signale,
  Profile oder Cross-Session-Memories laden.
- Userglobale Sicherheits- und Qualitätsregeln können weiter gelten.
  Lokale Dateien hier hebeln sie **nicht vollständig** aus; sie ermöglichen
  eine **Erstprüfung** im Clean Room.

## Session-Start (wichtig)

Wenn Claude einen **Standard-Session-Start** anstößt
(„Siehe Session“, Session-Resume, Handoff-Intake, Workspace-Briefing,
Statusinventar fremder Projekte):

1. Diesen Intake **nicht** ausführen.
2. Kurz bestätigen: dieser Ordner ist ein einmaliger Audit-Clean-Room
   (`neutral-task`).
3. Auf `Run STARTPROMPT.md` warten — oder sofort ausführen, wenn der Nutzer
   das bereits verlangt hat.

Usereglobale Hooks/Skills können technisch weiter laden; fachlich gilt nur
dieser Anker plus `STARTPROMPT.md` / `audit.yaml`.

## Arbeit

- Vor einem konkreten Lauf: nichts anlegen.
- Nach Start des Audits: genau einen Task über
  `tools/New-NeutralTask.ps1` anlegen und nur dort arbeiten.
- Evidenz unter diesem Task. Claude schreibt nur unter `.claude/`.

## Einstieg

`STARTPROMPT.md` lesen und ausführen. Umfang nicht über `audit.yaml`
hinaus erweitern.
