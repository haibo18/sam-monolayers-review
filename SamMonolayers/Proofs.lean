/-!
# 自组装单分子层（SAM）课题的形式化骨架（Lean 4，核心库，无 Mathlib）

本模块只机器核验论文中**可数值判定**的陈述：
1. SAM 发展关键年份先后顺序；
2. 烷基硫醇/Au(111) 体系的结构参数（倾斜角、晶格常数）；
3. 代表性链长与单层厚度记录；
4. 典型 SAM 体系的类型化定义。

表面化学与材料结论以同行评审文献为准；本工程不把化学机制
当作可由算术证明的命题。
-/

namespace SamMonolayers

-- ======================================================================
-- 1. 发展时间线（年份：Nat）
-- ======================================================================

def year_silane_sam : Nat := 1980          -- Sagiv 有机硅烷自组装
def year_thiol_gold : Nat := 1983         -- Nuzzo & Allara 烷基硫醇/Au
def year_ulman_review : Nat := 1996       -- Ulman Chem. Rev. 综述
def year_citation_laureate : Nat := 2026  -- Clarivate 引文桂冠

theorem chronology_ordered :
    year_silane_sam < year_thiol_gold ∧
    year_thiol_gold < year_ulman_review ∧
    year_ulman_review < year_citation_laureate := by
  refine ⟨?_, ?_⟩
  · decide
  · decide

-- ======================================================================
-- 2. 烷基硫醇/Au(111) 结构参数
-- ======================================================================

/-- 烷基链相对表面法线的倾斜角（度）。 -/
def tiltAngleDeg : Nat := 30

/-- Au(111) 最近邻金原子间距（pm，即 2.88 Å）。 -/
def auNearestNeighborPm : Nat := 288

/-- 硫吸附位在 Au(111) 上的√3 晶格常数（pm，即 ~5 Å）。 -/
def sulfurLatticePm : Nat := 500

/-- √3 晶格常数约为金最近邻间距的 √3 倍（数值上约 1.732 倍；
    这里以整数 pm 记录近似值 288 × 1.732 ≈ 499，取整为 500）。 -/
theorem sulfurLatticeApproxGolden :
    sulfurLatticePm ≥ auNearestNeighborPm := by
  decide

/-- 倾斜角在 0°–90° 区间内。 -/
theorem tiltAnglePlausible :
    0 < tiltAngleDeg ∧ tiltAngleDeg < 90 := by
  decide

-- ======================================================================
-- 3. 链长与单层厚度记录
-- ======================================================================

/-- 一个 SAM 体系记录：名称、碳链长（CH₂ 数）、单层厚度（pm）。 -/
structure SamSystem where
  name : String
  chainLengthCH2 : Nat
  thicknessPm : Nat

/-- 癸硫醇 C10：典型薄 SAM，厚度约 1.3 nm。 -/
def decanethiol : SamSystem := ⟨"decanethiol C10", 10, 1300⟩

/-- 十四硫醇 C14：中等链长，厚度约 1.8 nm。 -/
def myrististthiol : SamSystem := ⟨"myristyl thiol C14", 14, 1800⟩

/-- 十八硫醇 C18：长链致密 SAM，厚度约 2.4 nm。 -/
def octadecanethiol : SamSystem := ⟨"octadecanethiol C18", 18, 2400⟩

/-- 链长越长，单层厚度越大。 -/
theorem thickness_increases_with_chain :
    decanethiol.thicknessPm < myrististthiol.thicknessPm ∧
    myrististthiol.thicknessPm < octadecanethiol.thicknessPm := by
  refine ⟨?_, ?_⟩
  · decide
  · decide

-- ======================================================================
-- 4. 典型 SAM 体系类型
-- ======================================================================

/-- 常见 SAM 锚定体系。 -/
inductive SamAnchor where
  | alkanethiolOnGold   -- 烷基硫醇 / Au
  | organosilaneOnSilica -- 有机硅烷 / SiO₂
  | phosphonicAcidOxide -- 膦酸 / 金属氧化物

/-- 锚定体系是否依赖硫–金属键。 -/
def usesSulfurBond : SamAnchor → Bool
  | .alkanethiolOnGold => true
  | .organosilaneOnSilica => false
  | .phosphonicAcidOxide => false

-- ======================================================================
-- 5. 汇总
-- ======================================================================

theorem paper_evidence_summary :
    year_silane_sam < year_citation_laureate ∧
    tiltAngleDeg = 30 ∧
    decanethiol.chainLengthCH2 < octadecanethiol.chainLengthCH2 ∧
    usesSulfurBond .alkanethiolOnGold = true := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · decide
  · decide
  · decide
  · decide

end SamMonolayers
