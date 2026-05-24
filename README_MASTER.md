# SkyCoin444 + ShadowChat — Unified Master Recovery Repository

**Owner:** Skyler Blue Spillers (@skylerblue4444)
**Restored:** May 24, 2026
**Status:** FULLY RESTORED — 28,565+ unique files

---

## About This Repository

This is the **unified master recovery repository** for the entire SkyCoin444 / ShadowChat / Hope AI ecosystem. It was assembled by merging all 10 GitHub repositories and all Google Drive backup archives following a malicious attack.

## What's Inside

| Layer | Description |
|---|---|
| `client/` | Full React/TypeScript frontend — all pages, components, UI |
| `server/` | Node.js backend — all routes, APIs, WebSocket, Stripe |
| `shared/` | Shared types, schemas, utilities |
| `drizzle/` | Database migrations and schema |
| `mobile/` | React Native mobile app (if present) |
| `docs/` | Architecture, deployment, API documentation |
| `*.md` | All planning, handoff, and strategy documents |

## Restore Points (Git Tags)

| Tag | Description |
|---|---|
| `restore/v1-production-533k-loc` | Production build — 533,879 lines of source code |
| `restore/v2-full-merge-28k-files` | Full merge of all repos + Drive backups |
| `restore/v3-secured-backup` | Final secured snapshot |

## How to Restore If Attacked Again

```bash
# Clone the repo
git clone https://github.com/skylerblue4444/skycoin444-shadowchat-master.git
cd skycoin444-shadowchat-master

# List all restore points
git tag -l "restore/*"

# Restore to any point
git checkout restore/v2-full-merge-28k-files

# Or restore to latest
git checkout main
```

## Ecosystem Overview

- **Hope AI** — Persistent high-agency AI orchestration (voice, coding, memory)
- **ShadowChat** — Real-time social network with creator economy
- **SkyCoin444** — Multi-coin crypto infrastructure (SKY4444 token, staking, DeFi)
- **Global Marketplace** — DHgate/Alibaba adapter, NFT economy, escrow
- **12-Bot Swarm** — Autonomous DevOps framework
- **Governance** — DAO, treasury, community proposals

## Security Notice

This repository is **private**. Do not share credentials, `.env` files, or API keys publicly.
All sensitive configuration should be stored in environment variables only.
