# STARTPROMPT — token-burn audit

Read-only. Execute `audit.yaml` in this folder root.

1. If needed, create exactly one task with:
   `pwsh -NoProfile -File tools/New-NeutralTask.ps1 -TaskName 'token-burn-audit'`
2. Run the checklist in `audit.yaml`.
3. Write the report to that task’s `evidence/` (and a short `docs/` summary if useful).
4. Update only your own provider handoff under the task (`.claude/` / `.grok/` / `.codex/` / `.kimi-code/`).

No config edits. No billing changes. No secrets in output.
