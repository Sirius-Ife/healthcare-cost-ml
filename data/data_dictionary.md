# Data Dictionary — Synthetic Healthcare Dataset

| **Variable Name** | **Type** | **Description (Plain Language)** | **Example Value** |
|--------------------|----------|----------------------------------|-------------------|
| `member_id` | String | Unique identifier for each synthetic member | `"M000123"` |
| `age` | Integer | Age of the individual (18–85) | 42 |
| `sex` | Categorical | Gender identity (`Female`, `Male`, `Other`) | `"Female"` |
| `region` | Categorical | Region of residence (`West`, `East`, `North`, `South`, `Central`) | `"South"` |
| `employer_id` | String | Synthetic employer identifier (to simulate group plans) | `"E045"` |
| `hypertension` | Binary (0/1) | Whether the person has hypertension (1 = yes) | 1 |
| `diabetes` | Binary (0/1) | Whether the person has diabetes (1 = yes) | 0 |
| `asthma` | Binary (0/1) | Whether the person has asthma (1 = yes) | 0 |
| `is_chronic` | Binary (0/1) | Indicates if the person has *any* chronic condition (hypertension, diabetes, or asthma) | 1 |
| `previous_visits` | Integer | Number of healthcare visits in the previous period | 6 |
| `telemedicine_visits` | Integer | Number of telemedicine sessions used | 2 |
| `prev_year_cost` | Numeric | Total healthcare cost in the previous year (synthetic currency) | 12,430 |
| `distinct_providers` | Integer | Number of unique healthcare providers visited | 4 |
| `num_prescriptions` | Integer | Number of prescriptions filled | 3 |
| `has_preventive_visit` | Binary (0/1) | Whether the person had a preventive checkup (1 = yes) | 1 |
| `adherence_index` | Numeric (0–1) | How well the person follows medical advice (1 = very adherent) | 0.78 |
| `next_period_cost` | Numeric | Total healthcare cost in the next period (target for regression) | 18,500 |
| `high_cost_flag` | Binary (0/1) | Whether the person is in the top 10% of future costs (target for classification) | 0 |
