# 最小骨架（可跑）

一个 4 文件的项目，满足六件骨架里的三件：**入口协议 + 分支现状 + 门禁**。够小的项目从这里抄就行。

```text
minimal/
  AGENTS.md          # ① 入口协议：只放指针、规则、现状一屏
  docs/STATUS.md     # ② 整体现状：列出支线、下一步、卡点
  docs/DECISIONS.md  # ③ 裁决账：append-only，取代写双向
  todo/STATE.md      # ④ 分支现状：字段化，机器可读
  check.sh           # ⑤ 门禁：三条检查，一条命令
```

## 跑一下

```bash
bash check.sh        # 全绿则输出 OK
```

## 看什么

1. `AGENTS.md` 只有一屏，且没有一条知识——知识在 `docs/DECISIONS.md` 与 `todo/STATE.md`。
2. 把 `check.sh` 里任意一个断言破坏掉（例如删掉 `todo/STATE.md` 的 `下一步:` 行），它必须变红。**门禁不红过，等于没有门禁。**
3. 新会话只读 `AGENTS.md` → `docs/STATUS.md` → `todo/STATE.md`，应该能回答：在干什么、卡在哪、下一步、先读哪个文件。

## 长到什么时候该扩

- 出现第二条工作线 → 再开一个 `<分支>/STATE.md`，不要把两件事塞进一个。
- 开始写「假设 / 手法 / 死路」→ 拆出知识库（一条知识一个 owner）。
- 文档超过 20 份 → 加生成式索引（INDEX.tsv），否则找不到东西。
