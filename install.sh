#!/usr/bin/env bash
# tony-skills 安装脚本
#
#   ./install.sh                  复制全部技能到已存在的技能根
#   ./install.sh drift-check      只装一个（可多个）
#   ./install.sh --link           软链而不是复制（跟随仓库更新）
#   ./install.sh --force          覆盖已存在的同名技能
#
# 技能根：宿主扫描的目录。没找到任何技能根时，创建 ~/.agents/skills。
set -euo pipefail

MODE="copy"; FORCE=0; WANT=()
for a in "$@"; do
  case "$a" in
    --link) MODE="link" ;;
    --copy) MODE="copy" ;;
    --force) FORCE=1 ;;
    -*) echo "unknown option: $a" >&2; exit 2 ;;
    *) WANT+=("$a") ;;
  esac
done

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO/skills"

# 收集技能：skills/ 下每个含 SKILL.md 的目录，name 与目录同名
mapfile -t ALL < <(find "$SKILLS_DIR" -mindepth 2 -maxdepth 2 -name SKILL.md -printf '%h\n' | sort | xargs -r -n1 basename)
[ "${#ALL[@]}" -gt 0 ] || { echo "no skills found under $SKILLS_DIR" >&2; exit 1; }

if [ "${#WANT[@]}" -eq 0 ]; then CHOSEN=("${ALL[@]}"); else
  CHOSEN=()
  for w in "${WANT[@]}"; do
    printf '%s\n' "${ALL[@]}" | grep -qx "$w" || { echo "no such skill: $w (have: ${ALL[*]})" >&2; exit 2; }
    CHOSEN+=("$w")
  done
fi

if [ -n "${TONY_SKILLS_ROOTS:-}" ]; then
  IFS=: read -r -a ROOTS <<< "$TONY_SKILLS_ROOTS"
else
  ROOTS=(
    "$HOME/.config/opencode/skills"
    "$HOME/.claude/skills"
    "$HOME/.dsh/skills"
    "$HOME/.agents/skills"
  )
fi

found=0
installed=0
for root in "${ROOTS[@]}"; do
  [ -d "$root" ] || continue
  found=$((found + 1))
  for name in "${CHOSEN[@]}"; do
    src="$SKILLS_DIR/$name"
    dest="$root/$name"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
      if [ "$FORCE" -eq 1 ]; then rm -rf "$dest"; else
        echo "skip (exists, use --force): $dest"; continue
      fi
    fi
    if [ "$MODE" = "link" ]; then ln -s "$src" "$dest"; else cp -R "$src" "$dest"; fi
    echo "installed ($MODE): $dest"
    installed=$((installed + 1))
  done
done

if [ "$found" -eq 0 ]; then
  root="$HOME/.agents/skills"; mkdir -p "$root"
  for name in "${CHOSEN[@]}"; do
    cp -R "$SKILLS_DIR/$name" "$root/$name"
    echo "installed ($MODE): $root/$name (created root)"
    installed=$((installed + 1))
  done
fi

echo
echo "done. skills: ${CHOSEN[*]} — installed: $installed"
echo "verify: 让宿主列出技能，确认名字出现在 catalog 里"
echo "        指针存在不等于技能可达 —— 看不到就检查技能根是否是该宿主真正扫描的目录"
