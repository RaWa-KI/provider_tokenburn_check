# STARTPROMPT — token-burn audit

Read-only. Execute `audit.yaml` in this folder root.

1. If needed, create exactly one task with:
   `pwsh -NoProfile -File tools/New-NeutralTask.ps1 -TaskName 'token-burn-audit'`
2. Run the checklist in `audit.yaml`.
3. Write the report to that task’s `evidence/` (and a short `docs/` summary if useful).
4. Update only your own provider handoff under the task (`.claude/` / `.grok/` / `.codex/` / `.kimi-code/`).

No config edits. No billing changes.

Output:

- No people, accounts, workspace names, product names, or repo names.
- No absolute paths and no username in a path.
- Only the standard tool homes in tilde form, as `audit.yaml` lists them.
- Extra MCP servers, plugins, and skills as counts only.
- Do not invent a config key. If it is missing from `documented_controls`,
  label it `live-only` in the report.
