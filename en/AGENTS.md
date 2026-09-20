# Neutral audit anchor

This folder is a **neutral-task** clean room for a one-shot toolchain audit.
It is not a normal product workspace.

## Identity

- Keep `session_scope: neutral-task` for the whole session.
- Do not load foreign project handoffs, briefings, memories, or unrelated skills.
- User-global safety rules may still apply; local files here do not fully disable them.

## Work

- Before a concrete run: create nothing.
- After the user starts the audit: create exactly one task via
  `tools/New-NeutralTask.ps1`, then work only there.
- Write evidence under that task. Each provider surface writes only into its own
  namespace (`.claude/`, `.grok/`, `.codex/`, `.kimi-code/`).

## Entry

If the user says to run the audit, read `STARTPROMPT.md` and execute it.
Do not expand scope beyond `audit.yaml`.
