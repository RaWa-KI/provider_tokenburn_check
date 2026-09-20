# Neutraler Task-Modus

Dieses Root ist ein expliziter `neutral-task`-Clean-Room-Startanker für einen
einmaligen Token-Burn-Audit. Kein normales Produkt-Workspace.

## Identität

- `session_scope: neutral-task` für die gesamte Sitzung.
- Keine fremden Projekt-Handoffs, Briefings, Sidecars oder
  sitzungsübergreifenden Memories laden.
- Lokale Dateien hebeln userglobale Anker **nicht vollständig** aus; sie
  ermöglichen eine **Erstprüfung**.

## Session-Start

Standard-Session-Start / Resume / Handoff-Intake fremder Projekte
**nicht** ausführen. Kurz Clean-Room bestätigen, dann `STARTPROMPT.md`
bzw. auf den Nutzer warten.

Bevorzugter Start:

```powershell
pwsh -NoProfile -File tools/Start-CleanRoomGrok.ps1
```

## Arbeit

- Bei Audit-Start nur `STARTPROMPT.md` und `audit.yaml`.
- Nur unter dem aktiven `tasks/<Lauf>/` schreiben.
- Diese Surface nur unter `.grok/`.
