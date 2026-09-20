# Providercheck (English)

Clean-room folder for a **read-only** first-pass audit of local AI coding
tools (token burn / quota waste).

## Start

1. Open your AI coding agent **with this folder (`en/`) as the working
   directory** (not the package root above it).
2. Send exactly:

```text
Run STARTPROMPT.md
```

Prefer for Grok:

```powershell
pwsh -NoProfile -File tools/Start-CleanRoomGrok.ps1
```

Findings are written under `tasks/<run>/evidence/`.

## About local start anchors

This folder ships local `AGENTS.md` / `CLAUDE.md` / `.grok/rules` for **all
providers** so the session can treat the directory as a **neutral clean room**.

**Local start anchors do not fully override or disable user-global start
anchors** — skills and hooks may still load. What they enable is a
**first-pass check**: they displace project-level instructions and should
**abort a default session start** (resume, foreign handoffs/briefings) for
this run.

Treat results as a triage pass, not a guarantee that every global preference
was ignored.

## Rules of the run

- Read-only against your real tool configs (no silent edits).
- No secrets in the report.
- One task folder per run; each provider writes only its own handoff namespace.
