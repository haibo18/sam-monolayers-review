# sam-monolayers-review

Self-assembled monolayers (SAM) review + Lean 4 formalization skeleton.

**中文版：[README.md](./README.md)**

This repository collects the research output, conclusions, and machine-checkable
formalization of "self-assembled monolayers: molecular-precision surface chemistry",
maintained under Semantic Versioning with bilingual Chinese/English documents.

## Layout

```
sam-monolayers-review/
├── paper/
│   ├── sam_monolayers_review.md    # 中文综述
│   └── sam_monolayers_review_en.md # English review
├── SamMonolayers.lean              # Lean library root
├── SamMonolayers/
│   ├── Basic.lean
│   └── Proofs.lean                 # timeline / structural parameters / chain-length & thickness records
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/              # Lean CI
├── CHANGELOG.md
└── README.md / README.en.md
```

## Highlights

- **Principle**: amphiphilic molecules chemisorb spontaneously on solid surfaces to form thermodynamically stable, crystalline, dense monolayers; anchor head + alkyl chain + terminal functional group, three-layer structure.
- **Milestones**: 1980 Sagiv silane/SiO₂; 1983 Nuzzo & Allara alkanethiol/Au; 1996 Ulman review.
- **Structure**: (√3×√3)R30° lattice on Au(111), alkyl chain tilted ~30° from normal; thickness grows ~0.1 nm per CH₂.
- **Systems**: thiol/Au, silane/SiO₂, phosphonate/metal oxide; C10/C14/C18 thickness 1.3/1.8/2.4 nm.
- **Applications**: molecular electronics, bio-interfaces, micro-contact printing μCP, MEMS anti-stiction, organic-electronics interfaces, sensing.
- **Prize case**: 2026 Clarivate Citation Laureates in Chemistry — Allara, Nuzzo, Sagiv.

## Lean formalization

Toolchain: `leanprover/lean4:v4.36.0`, core library only, **no Mathlib**.

Build:

```bash
lake build
```

The formalization only covers **numerically decidable** claims:

1. Chronology strictly increasing (`chronology_ordered`): 1980 → 1983 → 1996 → 2026;
2. Structural parameters: tilt angle 30°, Au nearest neighbor 288 pm, sulfur lattice 500 pm;
3. Chain-length/thickness records `SamSystem` and monotonic thickness chain;
4. Anchor systems `SamAnchor` and `usesSulfurBond`;
5. Summary proposition `paper_evidence_summary`.

> Surface-chemistry and materials conclusions are sourced from peer-reviewed
> literature; this project does not treat chemical mechanisms as arithmetically
> provable. There are **zero** `sorry` / `admit` / `axiom`.

## Bilingual version management

- Papers: `paper/sam_monolayers_review.md` (Chinese) and `paper/sam_monolayers_review_en.md` (English) are kept in sync;
- Docs: `README.md` (Chinese) and `README.en.md` (English) cross-link each other;
- Changelog: `CHANGELOG.md` keeps both Chinese and English paragraphs;
- When revising the paper, update both language versions in the same commit, tagged `docs(zh)` / `docs(en)`.

## Versioning

- Semantic Versioning (`MAJOR.MINOR.PATCH`).
- All notable changes are recorded in [`CHANGELOG.md`](CHANGELOG.md).
- `main` is the trunk; commits use Conventional Commits.
- Each release baseline is tagged `vX.Y.Z`.

## References

See the "References" section at the end of the review papers.
