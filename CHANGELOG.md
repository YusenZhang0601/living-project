# CHANGELOG

## Unreleased

- 移除 `install.sh`。仓库维护 Skill 本体和索引，各 Agent 按宿主自己的方式添加和更新 Skill。
- 首页索引直接链接每个 `SKILL.md`，并提供临时使用与长期添加的说明。

## v2.0.0 — 2026-11-21

仓库从「一个技能」变成「技能包」，改名 `tony-skills`（原 `living-project`）。

**Breaking**
- 技能移到 `skills/project-maintenance/`；`install.sh` 改为多技能安装，路径全变
- 技能更名：`living-project` → `project-maintenance`（项目维护）
- 旧链接会重定向到新仓库名，但仓库内路径不重定向

**新增**
- `skills/drift-check/` · 漂移检查：审计单位是「方向」而不是「改动」。根由人给不由仓读；按根/推导/冻结/孤儿清点工作；量配比；五类漂移源；只停一件；给一条穿过根的竖切；附同类技能调研
- `install.sh` 支持选装、`--link`、`--force`，技能根加入 OpenCode 与 Agent Skills 规范目录

**验证**
- 两个技能都由宿主实际加载过一次（frontmatter 合法、可被发现）

## v1.0.0 — 2026-11-19

首个公开版本。

- Release: https://github.com/YusenZhang0601/living-project/releases/tag/v1.0.0

**方法论**
- 三条关系：骨架与血肉、分支与整体、生成性（代谢）
- 文档四类判据（参考 / 解释 / 操作 / 教程），治「混写」
- 形态探测五问 → 三种形态（交付型 / 研究型 / 内容型）
- 六件骨架：入口协议 / 状态层 / 知识层 / 门禁 / 索引 / 技能层
- 首次治理六步、定期收口六动作
- 上下文交接（Handoff）：七成即落盘，三件 = 现状 / 未完成 / 下一步
- 反模式诊断表十一条
- 决策取代双向链（superseded-by）

**工程**
- `SKILL.md`（13 节）、`README.md`、`install.sh`、`examples/minimal/`（可跑的最小骨架与门禁）
- MIT 许可证

**来源**
- 来自一个运行四个月的真实项目：11 条支线、21 项结构门禁、三次事故复盘（指针断链 / 门禁缺项 / 项目参数混进技能层）
