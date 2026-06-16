---
name: porkast-ecosystem
description: Porkast full stack projects relationship map and architecture overview. Use when working on frontend, backend, and mobile projects for full stack development to understand how porkast-web-app (Web platform), porkast-svc (Backend service), porkast-tele-mini-app (Telegram mini app), and porkast-ios (iOS app) interact.
---

# Porkast Ecosystem Relationship Map

This skill provides an overview of the Porkast full-stack projects, their relationships, and fundamental development guidelines.

## Development Rules

1. **Project Details:** Do not assume project details. You **MUST** read the individual project's `AGENTS.md`, `README.md`, or `CLAUDE.md` to fetch specific project details, commands, and development guidelines.
2. **Project Locations:** 
   - All projects are part of the same organization: [https://github.com/Porkast](https://github.com/Porkast)
   - The repository for a specific project can be found at `https://github.com/Porkast/{project_name}`.
   - If a project is not cloned locally, read the system environment variable `PORKAST_PROJECT_PATH` to find the workspace directory. If it is not set, use the default path `~/Porkast`.
3. **Branching Strategy (CRITICAL):** 
   - **DO NOT** make changes in the `main` or `master` branch.
   - Always use the `dev` branch for changes.
   - If the `dev` branch does not exist in the repository, you **MUST** create it before making any changes.

## Projects Overview

### `porkast-svc` (Backend Service)
- **Feature:** Core backend REST API service running on Cloudflare Workers with Hono. Handles podcast RSS processing, Telegram bot integration, email notifications, and scheduled background jobs via Cloudflare Queues and Cron Triggers.
- **Relies on:** Cloudflare D1 (SQLite via Drizzle ORM), Cloudflare KV, Cloudflare Queues, Third-party APIs (Resend, Telegram).
- **Relied upon by:** `porkast-tele-mini-app`, `porkast` (iOS app), and `porkast-web-app`.

### `porkast-web-app` (Web Platform)
- **Feature:** Full-stack Web application for personalized podcast discovery, built with Next.js 14, React, Tailwind CSS, and Prisma. Contains Next.js API routes and Custom Email OTP auth.
- **Relies on:** PostgreSQL Database (shared or direct access). Uses `porkast-svc` for asynchronous Telegram bot integration and RSS background jobs.

### `porkast-tele-mini-app` (Telegram Mini App)
- **Feature:** Frontend application for the Telegram Mini App integration, built with React 19, TypeScript, and Vite. Provides podcast discovery and playback inside Telegram.
- **Relies on:** `porkast-svc` (for all backend REST APIs).

### `porkast-ios` (iOS App)
- **Feature:** Native iOS mobile application built with SwiftUI and Swift 5.9+. Uses an Observable pattern architecture for state management.
- **Relies on:** Backend REST APIs provided by `porkast-svc` and/or `porkast-web-app`.

## Project Relationship Map

- **Core Backend:** `porkast-svc` (Cloudflare Workers) is the central hub for data processing (RSS, Telegram Bot, Background Jobs) and serves APIs to the mini app, iOS app, and web app.
- **Web Frontend/BFF:** `porkast-web-app` is a robust full-stack app that directly queries the database via Prisma but offloads Telegram-specific or heavy scheduled RSS tasks to `porkast-svc`.
- **Pure Frontends:** Both `porkast-tele-mini-app` and `porkast-ios` (iOS) are frontend clients that rely entirely on the backend APIs (`porkast-svc`) for data and authentication.
