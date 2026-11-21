# tony-skills

**Tony 的 agent 技能包。** 一个仓库，几个技能，每个技能一个目录、一个 `SKILL.md`。

![Agent Skill](https://img.shields.io/badge/agent%20skill-SKILL.md-000000)
![Works with](https://img.shields.io/badge/works%20with-Claude%20Code%20·%20Codex%20·%20OpenCode%20·%20any%20SKILL.md%20host-4B5563)
![License](https://img.shields.io/badge/license-MIT-16A34A)

## 里面有什么

| 技能 | 一句话 | 什么时候用 |
|---|---|---|
| **[project-maintenance](skills/project-maintenance/)** · 项目维护 | 把一个杂乱的项目治成会生长的有机体：骨架、分支、代谢、门禁、交接 | 项目变乱、要开工立骨架、要交班、要收口复盘 |
| **[drift-check](skills/drift-check/)** · 漂移检查 | 回头检查一个跑了很久的项目是否还在为「根」做事：配比、五类漂移源、停一件、给一条竖切 | 怀疑跑偏了、方向对不对、阶段该不该继续 |

两个技能分工明确：**项目维护管「结构乱」，漂移检查管「方向偏」。**

## 装

技能就是一个目录 + 一个 `SKILL.md`，放进宿主扫描的技能根即可。

```bash
git clone https://github.com/YusenZhang0601/tony-skills.git

./tony-skills/install.sh                        # 装全部
./tony-skills/install.sh drift-check            # 只装一个
./tony-skills/install.sh --link                 # 软链而不是复制
```

脚本会自动找已存在的技能根：

| 宿主 | 技能根 |
|---|---|
| OpenCode | `~/.config/opencode/skills` |
| Claude Code | `~/.claude/skills` |
| DeepSeek Harness | `~/.dsh/skills` |
| 通用（Agent Skills 规范） | `~/.agents/skills` |

装完**确认技能在宿主的 catalog 里真的出现了**——指针存在不等于技能可达。

## 结构

```text
tony-skills/
  README.md                    # 本文件：包索引
  install.sh                   # 装到各宿主的技能根
  CONTRIBUTING.md
  CHANGELOG.md
  LICENSE                      # MIT
  skills/
    project-maintenance/
      SKILL.md                 # 技能本体
      README.md                # 长说明、触发方式、参考实现
      examples/minimal/        # 能跑的最小骨架
    drift-check/
      SKILL.md
      references/              # 同类技能调研等按需加载的资料
```

新增技能 = 在 `skills/` 下加一个目录，`SKILL.md` 的 frontmatter 里 `name` 与目录同名。`install.sh` 不用改。

## 约定

- **`description` 决定被发现。** 自然语言触发靠它，所以把用户会说的原话写进去（「跑偏了」「治理一下」「回头看一眼」），而不是写功能名。
- **正文 < 5k token。** 重货放 `references/`，按需加载。
- **技能与具体项目无关。** 路径、命令、字段归项目自己，写进项目的入口协议。

## License

MIT © YG
