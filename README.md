# sam-monolayers-review

自组装单分子层（SAM）综述论文 + Lean 4 形式化核验骨架。

本仓库沉淀「自组装单分子层：分子精度表面化学」课题的
研究内容、结论与可机器核验的形式化命题，按语义化版本持续维护。

## 目录结构

```
sam-monolayers-review/
├── paper/
│   └── sam_monolayers_review.md   # 完整综述论文
├── SamMonolayers.lean              # Lean 库根模块
├── SamMonolayers/
│   ├── Basic.lean
│   └── Proofs.lean                 # 时间线 / 结构参数 / 链长与厚度记录
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/              # Lean CI
├── CHANGELOG.md
└── README.md
```

## 论文要点

- **原理**：两亲分子在固体表面化学吸附自发形成致密结晶状单层；锚定头基 + 烷基链 + 末端官能团三层结构。
- **里程碑**：1980 Sagiv 硅烷/SiO₂；1983 Nuzzo & Allara 烷基硫醇/Au；1996 Ulman 综述。
- **结构**：Au(111) 上 (√3×√3)R30° 晶格，烷基链相对法线倾斜 ~30°；层厚随链长约 0.1 nm/CH₂。
- **体系**：硫醇/Au、硅烷/SiO₂、膦酸/金属氧化物；C10/C14/C18 层厚 1.3/1.8/2.4 nm。
- **应用**：分子电子学、生物界面、微接触印刷 μCP、MEMS 防黏、有机电子界面、传感。
- **奖项**：2026 Clarivate 引文桂冠化学方向 Allara、Nuzzo、Sagiv。

## Lean 形式化工程

工具链：`leanprover/lean4:v4.36.0`，仅依赖核心库，**无 Mathlib**。

构建：

```bash
lake build
```

形式化只覆盖论文中**可数值判定**的陈述：

1. 发展时间线严格递增（`chronology_ordered`）：1980 → 1983 → 1996 → 2026；
2. 结构参数：倾斜角 30°、Au 最近邻 288 pm、硫晶格 500 pm；
3. 链长–厚度记录 `SamSystem` 与厚度单调链；
4. 锚定体系 `SamAnchor` 与硫–金键标志 `usesSulfurBond`；
5. 汇总命题 `paper_evidence_summary`。

> 表面化学与材料结论以同行评审文献为准；本工程不把化学机制
> 当作可由算术证明的命题。工程内 `sorry` / `admit` / `axiom` 数量为 0。

## 版本维护

- 遵循语义化版本（SemVer）：`MAJOR.MINOR.PATCH`。
- 所有显著变更记录于 [`CHANGELOG.md`](CHANGELOG.md)。
- `main` 为主干分支；论文修订、形式化补充、依赖升级分别提交，提交信息
  采用 Conventional Commits（`feat:` / `docs:` / `fix:` / `chore:` 等）。
- 每个发布基线打 Git tag：`vX.Y.Z`。

## 参考文献

见论文末尾「参考文献」一节。
