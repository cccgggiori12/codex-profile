# codex-profile

Private, portable Codex behavior defaults for use across personal accounts and machines.

## What this repository carries

- `AGENTS.md`: global communication, accuracy, safety, and collaboration preferences.
- `config.toml.example`: non-secret configuration defaults.
- `install.sh`: installs `AGENTS.md` safely and preserves an existing `config.toml`.

Skills are maintained in the separate personal skills repository.

## Install on another account or machine

```bash
git clone git@github.com:cccgggiori12/codex-profile.git
cd codex-profile
./install.sh
```

Restart Codex after installation so a new session loads the global guidance.

## Never add

- `auth.json`, API keys, OAuth tokens, GitHub tokens, passwords, or `.env` files
- sessions, chat history, memories, goals, logs, SQLite state, caches, or plugin caches
- company-managed policy or machine-specific credentials

The allowlist `.gitignore` intentionally ignores every file except the reviewed portable files.

## Configuration model

`~/.codex/AGENTS.md` contains developer-wide behavior preferences. Repository-level
`AGENTS.md` files remain the source of project-specific build, test, and review rules.
`~/.codex/config.toml` controls local client settings and must be reviewed per account.
