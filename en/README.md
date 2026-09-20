# Providercheck (English)

Clean-room folder for a **read-only** first-pass audit of local AI coding
tools (token burn / quota waste).

## Start

1. Open your AI coding agent **with this folder (`Providercheck/en`) as the working directory**.
2. Send exactly:

```text
Run STARTPROMPT.md
```

Findings are written under `tasks/<run>/evidence/`.

## About local start anchors

This folder ships short local `AGENTS.md` / `CLAUDE.md` / `.grok/rules` so the
session can treat the directory as a **neutral clean room**.

**Local start anchors do not fully override or disable user-global start
anchors**, skills, or hooks — those may still load depending on the tool.
What they do enable is a **first-pass check**: they displace project-level
instructions enough that the audit can run without dragging in unrelated
project context.

Treat results as a triage pass, not a guarantee that every global preference
was ignored.

## Rules of the run

- Read-only against your real tool configs (no silent edits).
- No secrets in the report.
- One task folder per run; each provider writes only its own handoff namespace.
