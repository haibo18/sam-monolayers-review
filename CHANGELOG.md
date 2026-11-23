# Changelog

本仓库所有显著变更均记录于此。格式遵循
[Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [Semantic Versioning](https://semver.org/lang/zh-CN/)。
All notable changes are recorded here; format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
versioning follows [Semantic Versioning](https://semver.org/).

## [0.2.0] - 2026-11-24

### Added

- 英文版综述 `paper/sam_monolayers_review_en.md`（与中文 `sam_monolayers_review.md` 内容对齐）。
- 英文项目说明 `README.en.md`，与中文 `README.md` 互相链接。
- Added English review `paper/sam_monolayers_review_en.md` and English README `README.en.md`, kept in sync with the Chinese versions.

### Changed

- 中文 `README.md` 顶部增加英文版链接。
- Chinese `README.md` now links to the English version.

## [0.1.0] - 2026-11-21

### Added

- 综述论文 `paper/sam_monolayers_review.md`：SAM 三层结构与自组装动力学、
  Au(111) 晶格与倾斜角、发展时间线、典型体系、应用（分子电子学、生物界面、
  μCP、MEMS 防黏、有机电子）、未决问题与科学奖项潜质评估。
- Lean 4 形式化工程 `SamMonolayers/`（工具链 `leanprover/lean4:v4.36.0`，核心库）：
  - 时间线年份链 `chronology_ordered`（1980/1983/1996/2026）；
  - 结构参数 `tiltAngleDeg`、`auNearestNeighborPm`、`sulfurLatticePm`
    与合理区间命题；
  - 链长–厚度记录 `SamSystem` 与单调链命题 `thickness_increases_with_chain`；
  - 锚定体系 `SamAnchor` 与 `usesSulfurBond`；
  - 汇总命题 `paper_evidence_summary`。
- GitHub Actions Lean CI（`leanprover/lean-action`）。
- 仓库说明 `README.md` 与本变更日志。

### Verification

- `lake build`：`Build completed successfully`，`errors=0`，`warnings=0`。
- `sorry` / `admit` / `axiom`：0 处。
