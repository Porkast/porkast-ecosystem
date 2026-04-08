#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="porkast-ecosystem"
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SKILL_FILE="$SCRIPT_DIR/SKILL.md"

if [[ ! -f "$SKILL_FILE" ]]; then
  printf 'Missing skill file: %s\n' "$SKILL_FILE" >&2
  exit 1
fi

install_link() {
  local tool_name="$1"
  local target_path="$2"

  mkdir -p "$(dirname "$target_path")"

  if [[ -L "$target_path" ]]; then
    local current_target
    current_target="$(readlink "$target_path")"
    if [[ "$current_target" == "$SCRIPT_DIR" ]]; then
      printf '%s already installed at %s\n' "$tool_name" "$target_path"
      return
    fi
    rm "$target_path"
  elif [[ -e "$target_path" ]]; then
    printf 'Refusing to overwrite existing path for %s: %s\n' "$tool_name" "$target_path" >&2
    printf 'Remove it first, then rerun this installer.\n' >&2
    exit 1
  fi

  ln -s "$SCRIPT_DIR" "$target_path"
  printf 'Installed %s skill at %s\n' "$tool_name" "$target_path"
}

install_link "OpenCode" "$HOME/.config/opencode/skills/$SKILL_NAME"
install_link "Claude Code" "$HOME/.claude/skills/$SKILL_NAME"
install_link "Gemini CLI" "$HOME/.gemini/skills/$SKILL_NAME"

printf '\nReload or reopen your agent after installation:\n'
printf -- '- OpenCode: restart the session or reopen the project\n'
printf -- '- Claude Code: run /skills\n'
printf -- '- Gemini CLI: run /skills reload\n'
