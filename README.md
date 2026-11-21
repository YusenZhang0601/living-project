# tony-skills

**Tony 的 Agent 技能库。** 把工作中积累的方法整理成可以带到不同 Agent 的 Skill。每个 Skill 以一个 `SKILL.md` 为入口，按需附参考资料、示例或脚本。

![Agent Skill](https://img.shields.io/badge/agent%20skill-SKILL.md-000000)
![License](https://img.shields.io/badge/license-MIT-16A34A)

## 技能索引

| 技能 | 一句话 | 什么时候用 |
|---|---|---|
| **[project-maintenance](skills/project-maintenance/SKILL.md)** · 项目维护 | 让接手者找到可靠的现状和下一步 | 状态散落、反复难接手、明确要求项目交接或治理 |
| **[drift-check](skills/drift-check/SKILL.md)** · 漂移检查 | 用近期工作的证据判断方向，给出一个可验证的下一步 | 怀疑跑偏了、解释不了关键进展、要决定一项工作是否继续 |

两个技能分工明确：**项目维护管「结构乱」，漂移检查管「方向偏」。**

## 在你的 Agent 里使用

临时用一次，把对应的 `SKILL.md` 链接交给 Agent，让它读取并按需执行。想长期使用，可以直接对 Agent 说下面这句话。

> 请从 GitHub 仓库 `YusenZhang0601/tony-skills` 的索引找到 `drift-check`。读它的 `SKILL.md`，按当前宿主支持的方式添加，保留触发条件、工作步骤和必要的参考文件，再确认新会话里能找到这个 Skill。

支持 `SKILL.md` 的宿主可以直接复用技能目录。使用其他格式的宿主可以根据 `SKILL.md` 创建本地 Skill。

## 维护

- 新技能放在 `skills/<name>/SKILL.md`，文件头的 `name` 和目录同名，并同步更新上面的技能索引。
- **`description` 写清什么时候用。** 用用户会说的原话（「跑偏了」「治理一下」「回头看一眼」）帮助 Agent 找到技能。
- 正文保留实际执行所需的判断和步骤。示例和参考资料按需读取。
- **技能与具体项目无关。** 路径、命令、字段归项目自己，写进项目的入口协议。

更多维护约定见 [CONTRIBUTING.md](CONTRIBUTING.md)，变更记录见 [CHANGELOG.md](CHANGELOG.md)。

## License

MIT © YG
