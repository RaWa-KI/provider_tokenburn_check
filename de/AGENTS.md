# Neutraler Audit-Anker

Dieser Ordner ist ein **neutral-task**-Clean-Room für einen einmaligen
Toolchain-Audit. Er ist **kein** normales Produkt-Workspace und gehört
**nicht** zu einer Workspace-Registry.

Gilt für alle Provider in diesem Ordner (Claude, Codex, Grok, Kimi und
vergleichbare Tools).

## Identität

- `session_scope: neutral-task` bleibt für die gesamte Sitzung erhalten.
- Zielpfade oder Fachthemen im Auftrag ändern diese Identität nicht.
- Keine fremden Projekt-Handoffs, Briefings, Sidecars, Pläne, Signale,
  Profile oder Cross-Session-Memories laden.
- Userglobale Sicherheits-, Archiv-, Secret- und Qualitätsregeln können
  weiter gelten. Lokale Dateien hier hebeln sie **nicht vollständig** aus;
  sie ermöglichen eine **Erstprüfung** im Clean Room.

## Session-Start (wichtig)

Wenn das Tool einen **Standard-Session-Start** anstößt
(„Siehe Session“, Session-Resume, Handoff-Intake, Workspace-Briefing,
Statusinventar fremder Projekte):

1. Diesen Intake **nicht** ausführen.
2. Kurz bestätigen: dieser Ordner ist ein einmaliger Audit-Clean-Room
   (`neutral-task`).
3. Auf `Run STARTPROMPT.md` warten — oder sofort ausführen, wenn der Nutzer
   das bereits verlangt hat.

Hooks und userglobale Skills können technisch weiter laden; fachlich gilt
nur dieser Anker plus `STARTPROMPT.md` / `audit.yaml`.

## Arbeit

- Vor einem konkreten Lauf: nichts anlegen.
- Nach Start des Audits: genau einen Task über
  `tools/New-NeutralTask.ps1` anlegen und nur dort arbeiten.
- Evidenz unter diesem Task. Jede Provider-Surface schreibt nur in ihren
  Namespace (`.claude/`, `.grok/`, `.codex/`, `.kimi-code/`).

## Einstieg

`STARTPROMPT.md` lesen und ausführen. Umfang nicht über `audit.yaml`
hinaus erweitern.

## Grok

Bevorzugt starten mit:

```powershell
pwsh -NoProfile -File tools/Start-CleanRoomGrok.ps1
```

Das setzt das Arbeitsverzeichnis auf diesen Ordner und deaktiviert
sitzungsübergreifendes Memory (`--no-memory`), soweit das CLI das unterstützt.
