#!/usr/bin/env bash
# living-project 一次性安装脚本
#   ./install.sh          软链到已存在的技能根（推荐，跟随仓库更新）
#   ./install.sh --copy   复制一份（不跟随更新）
set -euo pipefail

MODE="link"
[ "${1:-}" = "--copy" ] && MODE="copy"

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOTS=(
  "${DSH_HOME:-$HOME/.dsh}/skills"
  "$HOME/.claude/skills"
  "$HOME/.agents/skills"
)

installed=0
for root in "${ROOTS[@]}"; do
  [ -d "$root" ] || continue
  dest="$root/living-project"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "skip (already exists): $dest"
    continue
  fi
  if [ "$MODE" = "copy" ]; then
    cp -R "$SRC" "$dest"
  else
    ln -s "$SRC" "$dest"
  fi
  echo "installed ($MODE): $dest"
  installed=$((installed + 1))
done

if [ "$installed" -eq 0 ] && [ "$MODE" = "link" ]; then
  mkdir -p "$HOME/.agents/skills"
  ln -s "$SRC" "$HOME/.agents/skills/living-project"
  echo "installed ($MODE): $HOME/.agents/skills/living-project (created root)"
  installed=$((installed + 1))
fi

echo
echo "done. installed: $installed"
echo "verify: 让宿主列出技能，确认 living-project 出现在 catalog 里"
echo "        指针存在不等于技能可达 —— 看不到就检查技能根是否是该宿主真正扫描的目录"
