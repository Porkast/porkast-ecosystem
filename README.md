# Porkast Ecosystem

This repository contains the full stack of Porkast projects, including the backend service, web application, Telegram mini app, and iOS application.

## Projects

- **[porkast-svc](./porkast-svc)**: Backend service (Bun/Hono/PostgreSQL)
- **[porkast-next-app](./porkast-next-app)**: Web application (Next.js 14)
- **[porkast-tele-mini-app](./porkast-tele-mini-app)**: Telegram Mini App (React/Vite)
- **[porkast-ios](./porkast-ios)**: Native iOS app (SwiftUI)

## AI Agent Integration

This repository provides a shared `porkast-ecosystem` skill in `SKILL.md` for OpenCode, Claude Code, and Gemini CLI.

### Install the skill

```bash
bash install.sh
```

The installer creates symlinks for the skill in:

- `~/.config/opencode/skills/porkast-ecosystem`
- `~/.claude/skills/porkast-ecosystem`
- `~/.gemini/skills/porkast-ecosystem`

After installation:

- OpenCode: restart the session or reopen the project
- Claude Code: run `/skills`
- Gemini CLI: run `/skills reload`

## Development Guidelines (CRITICAL)

- **Branching Strategy:** **DO NOT** make changes in the `main` or `master` branch. Always use the `dev` branch. If the `dev` branch doesn't exist, create it.
- **Deep Context:** For project-specific details (build commands, testing, styles), always refer to the project-specific `AGENTS.md`, `README.md`, `CLAUDE.md`, or equivalent docs within that repository.
- **Remote Repo:** All projects are part of [https://github.com/Porkast](https://github.com/Porkast).
