# Neutral task mode

This root is an explicit `neutral-task` clean-room start anchor for a one-shot
token-burn audit.

- Do not load foreign project handoffs, briefings, or cross-session memories.
- Local files here do not fully disable user-global anchors; they enable a
  first-pass clean-room run.
- On audit start, follow `STARTPROMPT.md` and `audit.yaml` only.
- Write only under the active `tasks/<run>/` folder; provider surfaces stay
  in their own namespace (`.grok/` here).
