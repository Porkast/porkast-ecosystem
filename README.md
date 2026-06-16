# porkast-ecosystem

This repository is a tiny "skill" / meta-repo that documents the Porkast projects and installs itself into agent skill directories. It is not an application or monorepo — it only maps other Porkast repositories and provides a short architecture overview.

Quick summary
- Primary content: `SKILL.md` (authoritative overview of the Porkast ecosystem).
- Installer: `./install.sh` — creates symlinks into agent skill directories (`~/.config/opencode/skills/`, `~/.claude/skills/`, `~/.gemini/skills/`).

Quick install
1. Run the installer: `./install.sh`
2. If the installer refuses to overwrite a path, remove the existing (non-symlink) path yourself and re-run the script.
3. Reload or restart your agent session to pick up the skill:
   - OpenCode: restart the session or reopen the project
   - Claude Code: run `/skills`
   - Gemini CLI: run `/skills reload`

Important notes for contributors and agents
- This repo does NOT contain the app code. The actual projects live at `github.com/Porkast/{project}` (for example, `porkast-svc`, `porkast-web-app`, `porkast-tele-mini-app`, `porkast-ios`). Do not assume those repositories are cloned locally.
- If you need local project paths, check the `PORKAST_PROJECT_PATH` environment variable; default is `~/Porkast`.
- Branching: do NOT make changes on `main` or `master`. Use the `dev` branch for edits. Create it if missing: `git switch -c dev`.
- This repo has no build/test/package scripts. Don't run `npm`, `pnpm`, or other language-specific toolchains here — follow each project's README for build/test instructions.

Where to look next
- Read `SKILL.md` for the ecosystem overview.
- Read `AGENTS.md` for concise agent-focused guidance.

License
See individual project repositories for licensing and contribution rules.
