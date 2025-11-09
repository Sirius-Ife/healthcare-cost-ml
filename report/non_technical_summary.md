# Non-technical summary — Healthcare Cost Modeling (my project)

I built a machine-learning project using a realistic synthetic dataset (20,000 records) to predict individual healthcare costs and to identify members likely to be in the top 10% of costs.

## What I did (plain language)
- I created a synthetic dataset with demographic info (age, sex, region), clinical flags (hypertension, diabetes, asthma), healthcare usage (previous visits, telemedicine visits), prescriptions, and previous-year cost.
- I explored the data, visualized cost distribution and relationships, and engineered features (for example, log of previous cost and age buckets).
- I trained several models for two tasks:
  1. **Regression** — estimate each person’s expected next-period medical cost.
  2. **Classification** — flag members likely to be in the top 10% of costs (useful for targeted care).
- I compared models (regularized linear model, Random Forest, XGBoost) and tuned settings where helpful.
- I interpreted the models using variable importance and SHAP-style analysis to explain what drives predictions.

## Main findings (non-technical)
- **Past cost is the strongest predictor.** People who were expensive last year tend to be expensive again.
- **Chronic conditions matter.** Having hypertension, diabetes, or asthma raises expected costs significantly.
- **Utilization counts (visits, prescriptions)** are also strong predictors.
- **Tree-based models (Random Forest / XGBoost)** performed better than a regularized linear model because they capture non-linearities and interactions, and handle heavy-tailed cost distributions more effectively.
- **Actionable outcome:** The model can identify a relatively small group (e.g., top 10% predicted) that accounts for a much higher average cost than the average member, enabling targeted outreach and preventive care.

## What I deliver in the repo
- Reproducible synthetic data generator (R script).
- EDA and feature engineering notebook with charts and explanations.
- Modeling notebook that trains, compares, and interprets models; saves models to disk.
- Plain language summary that can be shared with non-technical stakeholders.

## Next steps I would take in practice
- Validate models on real data and add careful fairness and bias checks.
- Add a retraining pipeline and monitoring (data drift, model drift).
- Work with clinicians to ensure model-driven interventions are clinically appropriate.
