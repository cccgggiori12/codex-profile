# codex-profile

Private, portable Codex behavior defaults for use across personal accounts and machines.

## What this repository carries

- `AGENTS.md`: global communication, accuracy, safety, and collaboration preferences.
- `config.toml.example`: non-secret configuration defaults.
- `install.sh`: installs `AGENTS.md` safely and preserves an existing `config.toml`.

Skills are maintained in the separate private `cccgggiori12/skills` repository.
Codex memories remain a separate local state set because they can contain project history,
absolute paths, and other machine- or company-specific context.

## Install on another account or machine

```bash
git clone git@github.com:cccgggiori12/codex-profile.git
cd codex-profile
./install.sh
```

Restart Codex after installation so a new session loads the global guidance.

## Minimal cross-server migration

Use three layers instead of copying all of `~/.codex`:

1. Clone this repository and run `./install.sh` for stable work habits and reviewed
   non-secret defaults.
2. Clone the private skills repository as `~/.codex/skills`, or copy only the
   personally maintained skill directories into an existing installation.
3. Only when the destination should inherit the same historical context, stop Codex on
   the destination and transfer `~/.codex/memories/` through a trusted private channel:

   ```bash
   rsync -a --info=progress2 \
     "${CODEX_HOME:-${HOME}/.codex}/memories/" \
     user@server:~/.codex/memories/
   ```

The configuration key `features.memories = true` enables the feature; it does not transfer
memory content. Review memory files before moving them to a server with a different trust or
company boundary. Do not merge two memory directories while either Codex instance is writing.

## Never add

- `auth.json`, API keys, OAuth tokens, GitHub tokens, passwords, or `.env` files
- sessions, chat history, raw memory content, goals, logs, SQLite state, caches, or plugin caches
- company-managed policy or machine-specific credentials

The allowlist `.gitignore` intentionally ignores every file except the reviewed portable files.

## Configuration model

`~/.codex/AGENTS.md` contains developer-wide behavior preferences. Repository-level
`AGENTS.md` files remain the source of project-specific build, test, and review rules.
`~/.codex/config.toml` controls local client settings and must be reviewed per account.
Project trust paths, UI onboarding state, credentials, and managed policy are deliberately
excluded because they must be re-established on each destination.
