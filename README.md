# living-project

**把一个杂乱的项目，治成会生长的有机体。**

*An agent skill that turns a messy repository into a living, self-growing project — skeleton and flesh, branches and whole, metabolism and handoff.*

![Agent Skill](https://img.shields.io/badge/agent%20skill-SKILL.md-000000)
![Works with](https://img.shields.io/badge/works%20with-Claude%20Code%20·%20Codex%20·%20DSH%20·%20any%20SKILL.md%20host-4B5563)
![License](https://img.shields.io/badge/license-MIT-16A34A)

---

## 你的项目是不是这样

- 想接着干，但**不知道从哪读起**——文档散了十几个目录，最新的事实可能只在你上一个会话里。
- 每次交班/换会话，都要**从头解释一遍**：项目是什么、现在到哪、卡在谁身上。
- 文件越来越多，**判断越来越少**：半年前的结论和上周的结论打架，没人知道该信哪个。
- 你写了 `AGENTS.md`，但它越写越厚，**后来连你自己都不读了**。

这不是执行力问题，是**结构问题**：项目缺少骨架、缺少代谢、缺少交接动作。

## 它卖的不是文档模板，是三条关系

| | 说的是什么 | 反直觉的那一半 |
|---|---|---|
| **骨架与血肉** | 骨架每轮加载、一季一改；血肉按需读、天天长 | **骨架越厚，项目越死**——入口文件一膨胀就没人读完 |
| **分支与整体** | 分支各有唯一现状；整体视图永远由分支生成 | **手写的汇总必然漂移**，且漂移无人负责 |
| **代谢** | 摄入 → 消化（裁决一种转换）→ 排出（标取代不删）→ 生长 | **结构增量比内容增量危险**：加文件容易，合回去难 |

判据只有一条：

> **治理之后，下一个接手的人（或下一个会话）少读了一半文件，却做对了更多事。**

## 30 秒看效果

```text
治理前                          治理后
├── 各种笔记.md                 ├── AGENTS.md          ← 每轮加载的地图（薄）
├── 旧方案_v2_最终版.md         ├── docs/
├── TODO(3).txt                 │   ├── STATUS.md      ← 整体现状（生成）
├── 会议记录/                   │   ├── DECISIONS.md   ← 裁决（append-only）
└── （真正的结论在哪？）         │   └── INDEX.tsv      ← 索引（生成）
                                ├── <分支>/STATE.md     ← 分支现状（字段化）
                                ├── 知识库.md           ← 假设/手法/死路
                                └── 工具/check.sh       ← 门禁（一条命令）
```

差别不在整齐，在：**新会话只读三件就能开工**，而门禁会拦住结构退化。

## 六件骨架（缺一件都会漏）

| # | 件 | 回答什么问题 | 硬约束 |
|---|---|---|---|
| 1 | **入口协议**（`AGENTS.md`） | 我在哪、该读什么、不许做什么 | 地图不是手册；必须含「怎么跑 / 怎么验 / 别碰什么 / 去哪问」 |
| 2 | **状态层** | 现在在哪、下一步、卡在谁 | 分支字段化；整体由分支**生成** |
| 3 | **知识层** | 我们相信什么、试过什么、死了什么 | 一知识一 owner；每条写得出推翻条件 |
| 4 | **门禁** | 结构有没有坏 | 一条命令能跑，error 阻断提交 |
| 5 | **索引** | 东西在哪 | 自动生成，漏项算 error |
| 6 | **技能 / 触发层** | 什么时候该做什么 | 触发词写在技能里，不写在文档里 |

## 骨架长什么样（职责，不是目录）

下面是一个**研究型项目**的实例。它不是模板——照抄目录是最常见的误用，职责对上了就够：

```text
<项目根>/
  AGENTS.md            # 1 入口协议（薄，≤12KB）
  docs|台账/
    STATUS.md          # 2 整体现状（生成）
    DECISIONS.md       #   决策账（append-only，取代双向）
    JOURNAL.md         #   工作流水（一行一天）
    INDEX.tsv          # 5 索引（生成）
  <分支>/STATE.md      # 2 分支现状（字段化）
  <分支>/README.md     #   分支立项书与结论
  知识库.md            # 3 假设 / 手法 / 死路
  工具/                # 4 门禁脚本
```

换形态就换形状：交付型常是模块目录 + 每模块一份 `STATE.md`；内容型常是主题目录加篇目清单。
**先定形态与分支切法，让目录长出来；不要先画目录再往里塞东西。**

## 装（三种宿主，一个目录）

技能就是一个目录 + 一个 `SKILL.md`，放进宿主扫描的技能根即可：

```bash
git clone https://github.com/<you>/living-project.git

# Claude Code
ln -s "$PWD/living-project" ~/.claude/skills/living-project

# DeepSeek Harness
ln -s "$PWD/living-project" ~/.dsh/skills/living-project

# 通用（兼容 Agent Skills 的宿主）
ln -s "$PWD/living-project" ~/.agents/skills/living-project
```

或者跑一次性脚本：`./install.sh`（自动检测已存在的技能根，或 `./install.sh --copy` 复制而非软链）。

装完**确认它在宿主的技能目录里真的出现了**——指针存在不等于技能可达，这条教训写在技能里。

## 用：三种触发方式

| 方式 | 怎么写 | 要不要打技能名 |
|---|---|---|
| **自然语言（推荐）** | 「把这项目治理一下」「收口」「对齐进度」「交班」 | 不用 |
| 显式调用 | `/living-project`（一般支持补全） | 要 |
| 短别名 | 见下 | 一条短命令 |

技能名长短不影响日常触发——模型按 `description` 匹配自然语言。嫌长就给自己加一个短命令：

```markdown
<!-- 存成 .claude/commands/lp.md -->
---
description: 收口本项目（加载 living-project 技能并按六动作走）
---
加载 living-project 技能，按它的六动作收口本项目；输出固定六段，最后跑项目门禁。
```

之后 `/lp` 就等于完整流程。短命令归你，可查的品牌名归仓库。

## 它会给你什么

治理与收口的输出固定六段，不许改序：

```text
1 形态判定     什么形态的项目、分支怎么切、依据
2 骨架现状     六件各自有没有、质量如何（缺的列出来）
3 本轮动作     改了什么、为什么、影响哪些文件
4 待裁         需要人判断的（合并/删除/退役/方向）
5 门禁结果     命令、退出码、剩余 error / warn 及原因
6 接手验证     模拟新会话只读三件的四问四答
```

第 6 段是最狠的一段：**如果新会话读三件还答不出「现在在干什么 / 卡在谁 / 下一步 / 先读哪个文件」，这一轮治理就是失败。**

## 为什么值得信它

这套方法不是凭空写的，是一个真实项目四个月长出来的：**11 条支线、21 项结构门禁、完整的修正史与三次事故复盘**（指针断链、门禁缺项、项目参数混进技能层）。每一条硬规则都对应一次真栽的坑。

它也明确不做什么：

- **不做个人知识库**：不进 Zettelkasten / PARA 那一套，也不往任何外部知识库写。
- **不做十几路路由器**：只做三件事——立骨架、收口、交接。
- **不替人做方向判断**：支线生死、资源投入、要不要冒险，只列待裁。

## 与相似项目的区别

| 项目 | 做法 | 差别 |
|---|---|---|
| `project-steward` 一类治理技能 | 一个技能塞十几路结果（研究、审计、日志、许可证、发布…） | 这里是**一页纸骨架**：六件套 + 三个动作，宁可少覆盖也不做路由器 |
| `Upkeep` 一类审计工具 | 扫描仓库出报告 | 审计只告诉你哪里烂；这里**建骨架 + 装门禁**，让烂不再发生 |
| `Cline Memory Bank` 一类记忆法 | 固定六文件记上下文 | 只取它的**交接机制**，不搬文件槽位——骨架按项目形态长 |
| `Diátaxis` / `ADR` | 文档分类与决策记录规范 | 借它们的判据，不借它们的仪式感 |

## 常见问题

**Q：小项目也要这么重吗？**
A：只取三件——入口协议、分支现状、三条门禁。`examples/minimal/` 里有能跑的最小样例。

**Q：会不会又多一套要维护的文档？**
A：骨架是**薄**的（入口文件有硬性体积上限），其它全是按需读；且汇总与索引由脚本生成，不靠手写。维护成本主要在每次收口 10 分钟。

**Q：和 CLAUDE.md / AGENTS.md 冲突吗？**
A：不冲突。它教你怎么安排这些文件——`AGENTS.md` 只放结构与指针，知识进 owner 文件。

**Q：中文项目能用吗？**
A：能，技能本身就是中文写的，字段与命令中英皆可。

## 借鉴（诚实清单）

| 来源 | 借了什么 |
|---|---|
| [`agents.md`](https://agents.md/) | 入口文件是给 agent 的地图，必须含可执行命令与边界 |
| [Cline Memory Bank](https://docs.cline.bot/best-practices/memory-bank) | 上下文交接：将满先落盘 |
| [Diátaxis](https://diataxis.fr/) | 文档四类（参考/解释/操作/教程），混写即病 |
| [ADR](https://github.com/joelparkerhenderson/architecture-decision-record) | 决策四字段 + superseded-by 双向链 |
| [Anthropic: Effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) | 上下文是稀缺资源，按需检索优于预加载 |
| [GitHub Spec Kit](https://github.com/github/spec-kit) | 工作单元三件套（意图/计划/现状） |
| Living Documentation（Cyrille Martraire） | 生成物单一来源 |
| blameless postmortem / AAR | 触发因素与根因分开记 |

不采纳：BMAD 一类多角色框架（与宿主 subagent 体系重叠）、Zettelkasten / PARA（目标是个人记忆，不是项目治理）。

## 仓库结构

```text
living-project/
  SKILL.md          # 技能本体（13 节，约 260 行）
  README.md         # 本文件
  install.sh        # 一次性安装脚本
  examples/minimal/ # 能跑的最小骨架（含 check.sh）
  CONTRIBUTING.md   # 怎么提改动
  CHANGELOG.md      # 版本记录
  LICENSE           # MIT
```

## License

MIT © YG

> 如果你用它治好了某个项目，欢迎在 Issues 里留一句「治理前后差多少」——那比 star 有用。
