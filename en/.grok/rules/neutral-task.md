# Neutral task mode

This root is an explicit `neutral-task` clean-room start anchor for a one-shot
token-burn audit. Not a normal product workspace.

## Identity

- `session_scope: neutral-task` for the whole session.
- Do not load foreign project handoffs, briefings, sidecars, or cross-session
  memories.
- Local files do **not** fully disable user-global anchors; they enable a
  **first-pass check**.

## Session start

Do **not** run default session start / resume / foreign-project handoff
intake. Briefly confirm clean-room scope, then follow `STARTPROMPT.md` or
wait for the user.

Prefer:

```powershell
pwsh -NoProfile -File tools/Start-CleanRoomGrok.ps1
```

## Work

- On audit start, follow `STARTPROMPT.md` and `audit.yaml` only.
- Write only under the active `tasks/<run>/` folder.
- This surface writes only under `.grok/`.
