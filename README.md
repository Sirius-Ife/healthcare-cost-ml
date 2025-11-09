# Healthcare Cost Prediction — Machine Learning (R)

This repository contains a reproducible machine-learning project in **R** that predicts individual healthcare costs and identifies members likely to be in the top 10% of costs. The project uses **synthetic data** and focuses on extensive analysis, model comparison, and interpretability.

**Key contents**
- `data/generate_synthetic_data.R` — generate a realistic synthetic dataset (20,000 members).
- `analysis/01_EDA_and_Feature_Engineering.Rmd` — exploratory data analysis, charts, feature engineering.
- `analysis/02_Modeling_and_Interpretation.Rmd` — regression and classification modeling, variable importance, SHAP-like explanations.
- `scripts/` — utility and helper scripts.
- `report/non_technical_summary.md` — plain-language summary in first person.

## How to run
1. Install packages:
```bash
Rscript requirements.R
```
2. Generate synthetic data:
```bash
Rscript data/generate_synthetic_data.R
```
3. Open and knit the R Markdown files in `analysis/` (I used RStudio). The notebooks produce charts and save models to the repo root.

## Files to review first
- `analysis/01_EDA_and_Feature_Engineering.Rmd` — start here to understand the data and features.
- `analysis/02_Modeling_and_Interpretation.Rmd` — then run the modeling and interpretation.

## Non-technical summary
See `report/non_technical_summary.md` for a plain-language explanation of findings and recommendations.

---

If you want, I can:
- Knit the Rmd files to HTML and add the HTML outputs to the repo,
- Tweak model hyperparameters further or add cross-validated hyperparameter search,
- Prepare a short portfolio README blurb you can paste into your GitHub profile.
