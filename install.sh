#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
codex_target="${CODEX_HOME:-${HOME}/.codex}"
timestamp="$(date +%Y%m%d-%H%M%S)"

mkdir -p "${codex_target}"

if [[ -e "${codex_target}/AGENTS.md" ]]; then
  cp -p "${codex_target}/AGENTS.md" "${codex_target}/AGENTS.md.backup-${timestamp}"
fi
install -m 0644 "${script_dir}/AGENTS.md" "${codex_target}/AGENTS.md"

if [[ ! -e "${codex_target}/config.toml" ]]; then
  install -m 0600 "${script_dir}/config.toml.example" "${codex_target}/config.toml"
  printf 'Installed AGENTS.md and a new config.toml.\n'
else
  install -m 0600 "${script_dir}/config.toml.example" "${codex_target}/config.toml.example"
  printf 'Installed AGENTS.md; existing config.toml was preserved.\n'
  printf 'Review %s/config.toml.example and merge desired settings manually.\n' "${codex_target}"
fi
