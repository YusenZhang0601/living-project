#!/usr/bin/env bash
# 最小门禁：三条检查，一条命令。全绿才算收工。
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

fails=0
fail() { echo "[FAIL] $*"; fails=$((fails + 1)); }

# ① 指针可达：AGENTS.md 里反引号提到的路径必须存在
for f in $(grep -oE "\`[^\`<>]+\.(md|sh)\`" AGENTS.md 2>/dev/null | tr -d "\`" | sort -u); do
  [ -e "$f" ] || fail "AGENTS.md 指针失效: $f"
done

# ② 分支现状字段齐全（机器可读的那几行）
if [ ! -f todo/STATE.md ]; then
  fail "缺 todo/STATE.md"
else
  for k in id 状态 下一步 更新; do
    grep -q "^$k:" todo/STATE.md 2>/dev/null || fail "todo/STATE.md 缺字段: $k"
  done
fi

# ③ 汇总里引用的支线目录必须存在
for d in $(grep -oE "^- [a-z0-9-]+$" docs/STATUS.md 2>/dev/null | sed "s/^- //" | sort -u); do
  [ -d "$d" ] || fail "STATUS 引用的支线不存在: $d"
done

# ④ 可选：取代双向。新条目写「取代 D-0xx」，旧条目补「已被 D-0xx 取代」；
#    本示例的 docs/DECISIONS.md 已示范写法，检查逻辑按你的编号格式三行可写。

if [ "$fails" -eq 0 ]; then
  echo "OK: 三条门禁全过"
else
  echo "FAIL: $fails 项待修"
  exit 1
fi
