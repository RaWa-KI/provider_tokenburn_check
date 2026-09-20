# Neutral audit anchor

This folder is a **neutral-task** clean room for a one-shot toolchain audit.
It is **not** a normal product workspace and is **not** part of a workspace
registry.

Applies to every provider used in this folder (Claude, Codex, Grok, Kimi, and
similar tools).

## Identity

- Keep `session_scope: neutral-task` for the whole session.
- Target paths or topics in the user request do not change this identity.
- Do not load foreign project handoffs, briefings, sidecars, plans, signals,
  profiles, or cross-session memories.
- User-global safety, archive, secret, and quality rules may still apply.
  Local files here do **not** fully disable them; they enable a **first-pass
  check** in a clean room.

## Session start (important)

If the tool triggers a **default session start** (“see session”, session
resume, handoff intake, workspace briefing, status inventory of other
projects):

1. Do **not** run that intake.
2. Briefly confirm: this folder is a one-shot audit clean room
   (`neutral-task`).
3. Wait for `Run STARTPROMPT.md` — or run it immediately if the user already
   asked.

Hooks and user-global skills may still load technically; for this run, only
this anchor plus `STARTPROMPT.md` / `audit.yaml` govern the work.

## Work

- Before a concrete run: create nothing.
- After the user starts the audit: create exactly one task via
  `tools/New-NeutralTask.ps1`, then work only there.
- Write evidence under that task. Each provider surface writes only into its
  own namespace (`.claude/`, `.grok/`, `.codex/`, `.kimi-code/`).

## Entry

Read and execute `STARTPROMPT.md`. Do not expand scope beyond `audit.yaml`.

## Grok

Prefer starting with:

```powershell
pwsh -NoProfile -File tools/Start-CleanRoomGrok.ps1
```

That sets the working directory to this folder and disables cross-session
memory (`--no-memory`) when the CLI supports it.
