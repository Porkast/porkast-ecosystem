Purpose
This repo is a small "skill" / meta-repo that documents the Porkast projects and installs itself into agent skill directories. It's not an app or monorepo you should build or run locally.

What matters (high-signal rules)
- This repo's canonical content is SKILL.md. Read it before making assumptions about project architecture.
- Install the skill using the provided installer: `./install.sh` (it creates symlinks into agent skill dirs).
  - If the installer refuses to overwrite a path, remove the existing path yourself and re-run the script.
  - After installing, reload/restart your agent session (OpenCode: restart session; Claude/Gemini: see install output).
- This repository only maps multiple *other* repos (porkast-svc, porkast-next-app, porkast-tele-mini-app, porkast-ios). Those are separate GitHub repos at `github.com/Porkast/{project}` and may not be cloned locally. Do not assume local code exists — read each project's AGENTS.md / README.md in that repo.
- Environment helper: if you need local paths for Porkast projects, check `PORKAST_PROJECT_PATH` (default: `~/Porkast`) as described in SKILL.md.

Branching and edits
- Do NOT make changes on `main` or `master`. Use the `dev` branch for edits. If `dev` doesn't exist, create it (for example: `git switch -c dev`).

Repository scope and typical mistakes
- This repo has no build, test, or package scripts. Don't run `npm`, `pnpm`, or other language-specific toolchains here — they belong in each project repo.
- Don't try to run or test the services from this repo. To work on an app/service, open that project's repository and follow its AGENTS.md / README.md.
- The installer creates symlinks under your home config dirs (`~/.config/opencode/skills/`, `~/.claude/skills/`, `~/.gemini/skills/`). The script will refuse to overwrite existing non-symlink paths.

Agent tooling hints (for future OpenCode sessions)
- When searching files, prefer the repo search tools: use Glob (file discovery) and Grep (content search). These use ripgrep under the hood and are faster and more reliable than manual `find`/`grep` commands.
- Prefer executable sources of truth (SKILL.md and each project's own AGENTS.md/README) over stale prose in other files.

If you need to make a change
- Update SKILL.md and any project-specific AGENTS.md in the respective project repo (not here). After editing SKILL.md you do not need to re-run the installer if the symlink target is already this directory; just restart/reload the agent to pick up changes.
- Only create git commits when the user explicitly asks you to. Do not push or force-push to remote unless instructed.

Where to look next
- SKILL.md — overview and project relationships (this repo).
- For actionable commands, build/test instructions, or CI -> open the specific project's repo and read that project's AGENTS.md / README.md.

Contact/assumptions
- This file assumes the standard skill install layout used by the included `install.sh`. If your environment uses a different skills path, set `PORKAST_PROJECT_PATH` or adapt the install command accordingly.
