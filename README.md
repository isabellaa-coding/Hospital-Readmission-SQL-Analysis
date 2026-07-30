# Hospital Readmission SQL Analysis

A SQL-based analysis of simulated hospital encounter data to evaluate 30-day readmission rates and identify patient populations at higher risk for readmission — built by a Registered Nurse transitioning into healthcare analytics.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Why This Project](#why-this-project)
- [Skills Demonstrated](#skills-demonstrated)
- [Dataset](#dataset)
- [Repository Structure](#repository-structure)
- [Analysis & Key Findings](#analysis--key-findings)
- [Tools & Technologies](#tools--technologies)
- [Future Improvements](#future-improvements)
- [Author](#author)

---

## Project Overview

This project simulates a healthcare analytics workflow end-to-end: designing a SQL database, loading simulated hospital encounter data, and writing queries to evaluate 30-day readmission rates and the factors associated with increased readmission risk. It demonstrates how SQL can turn raw encounter-level data into the kind of metrics hospital quality and operations teams use to make decisions.

**Business questions answered:**
1. What is the overall 30-day hospital readmission rate?
2. Which diagnoses are associated with the highest readmission rates?
3. How do chronic comorbidities (diabetes, hypertension) affect readmission risk?
4. Which patients represent higher-risk populations?
5. How does length of stay vary by diagnosis?
6. How does medication burden vary by diagnosis?

## Why This Project

As a Registered Nurse moving into healthcare analytics, I wanted to combine clinical experience with SQL to explore how encounter-level data becomes actionable insight. Readmissions are a core healthcare quality metric — they surface opportunities to improve discharge planning, care coordination, and chronic disease management, and they're one of the most common KPIs analytics teams in hospital systems are asked to track. This project was a hands-on way to practice the SQL techniques and clinical framing that quality improvement and operational reporting roles rely on.

## Skills Demonstrated

- SQL database and table design
- Data insertion, validation, and exploration
- Aggregate functions (`COUNT`, `AVG`, `SUM`)
- `CASE` statements for KPI calculation
- Window functions (`RANK() OVER`) for cohort-level risk ranking
- `GROUP BY` / `ORDER BY` for segmentation
- `WHERE` filtering for cohort identification
- Reusable `VIEW` creation for downstream reporting
- Healthcare KPI calculation (readmission rate, LOS, medication burden)
- Translating clinical domain knowledge into query logic

## Dataset

A simulated dataset of 125 inpatient hospital encounters, created for educational and portfolio purposes.

| Column | Description |
|---|---|
| `patient_id` | Unique patient identifier |
| `age` | Patient age |
| `gender` | Patient gender |
| `diagnosis` | Primary diagnosis (Heart Failure, COPD, Pneumonia, Diabetes, Stroke, Asthma) |
| `admission_type` | Emergency, Urgent, or Elective |
| `length_of_stay` | Hospital length of stay (days) |
| `num_medications` | Number of medications prescribed |
| `previous_admissions` | Count of prior hospital admissions |
| `diabetes` | Chronic diabetes diagnosis (Yes/No) |
| `hypertension` | Chronic hypertension diagnosis (Yes/No) |
| `has_asthma` | Chronic asthma history (Yes/No), independent of current admitting diagnosis |
| `has_copd` | Chronic COPD history (Yes/No), independent of current admitting diagnosis |
| `has_heart_failure_history` | Chronic heart failure history (Yes/No), independent of current admitting diagnosis |
| `readmitted_30_days` | Readmitted within 30 days (Yes/No) |

> **Note:** `diagnosis` reflects the primary reason for the current admission, which may itself be a chronic condition (e.g., Asthma, COPD, Heart Failure) having an acute exacerbation. `diabetes` and `hypertension` are tracked separately as standalone chronic comorbidity flags, independent of the current admitting diagnosis.

Data lives in a single table, `hospital_encounters`, designed to support analysis across demographics, diagnosis, utilization, chronic conditions, and readmission outcomes.

## Repository Structure

```
Hospital-Readmission-SQL-Analysis/
│
├── README.md
├── hospital_readmission_analysis.sql   # table creation, data load, all analysis queries
├── data/
│   └── hospital_encounters.csv          # source dataset
├── outputs/                             # exported query results referenced in this README
│   ├── readmission_rate_overall.csv
│   ├── readmission_rate_by_diagnosis.csv
│   ├── chronic_conditions_readmission_rate.csv
│   ├── average_length_of_stay.csv
│   ├── medication_usage.csv
│   └── high_risk_patients.csv
└── screenshots/                         # query results / ERD, referenced inline below
```

## Analysis & Key Findings

### 1. Data Exploration
Reviewed and validated the encounter dataset; confirmed total record count (125 encounters).

### 2. Overall 30-Day Readmission Rate
Calculated the percentage of patients readmitted within 30 days using `CASE` statements and aggregate functions.

**Finding:** 20 of 125 encounters (16.0%) resulted in a 30-day readmission — in line with published hospital quality benchmarks, which typically place 30-day readmission rates in the 15–25% range depending on diagnosis.

### 3. Readmission Analysis by Diagnosis and Chronic Conditions

**Diagnosis-based readmission rates.** Compared 30-day readmission rates across six primary diagnoses to identify which conditions carry the highest return-visit risk:
- Heart Failure
- COPD
- Pneumonia
- Diabetes
- Stroke
- Asthma

**Finding:** Heart Failure showed the highest readmission rate (22.7%), followed by COPD (20.0%) and Stroke (16.7%). Asthma had the lowest readmission rate (9.1%), consistent with it generally being a more manageable, lower-acuity chronic condition than the others in this dataset.

**Chronic condition comorbidity analysis.** Beyond primary diagnosis, examined how diabetes and hypertension compound readmission risk, segmenting patients into four comorbidity groups:

| Diabetes | Hypertension | Total Patients | Readmissions | Readmission Rate |
|---|---|---|---|---|
| Yes | Yes | 14 | 4 | 28.6% |
| Yes | No | 19 | 4 | 21.1% |
| No | Yes | 25 | 4 | 16.0% |
| No | No | 67 | 8 | 11.9% |

**Finding:** Patients with both diabetes and hypertension had the highest readmission rate of any segment in the dataset — higher than any single diagnosis group — while patients with neither chronic condition had the lowest. This is a clinically important point: primary diagnosis alone doesn't capture full readmission risk. A Pneumonia admission in a patient with poorly controlled diabetes and hypertension carries meaningfully more risk than the same diagnosis in an otherwise healthy patient, and this analysis demonstrates the ability to layer multiple risk factors rather than relying on a single variable.

### 4. High-Risk Patient Identification
Identified patients with elevated previous-admission counts, and separately built an expanded risk stratification combining admission history with comorbidity burden (High / Moderate / Lower Risk), to flag a cohort for targeted intervention (e.g., discharge planning, follow-up scheduling, medication reconciliation).

**Finding:** 27 of 125 patients (21.6%) met the expanded high-risk criteria (3+ prior admissions, or both diabetes and hypertension). A `RANK() OVER (PARTITION BY diagnosis ...)` window function was used to rank patients by admission history within their own diagnosis group, supporting care-team prioritization within a clinical service line.

### 5. Length of Stay Analysis
Calculated average length of stay by diagnosis.

**Finding:** Stroke patients had the longest average stay (8.11 days), followed closely by Heart Failure (7.95 days) and COPD (5.90 days). Asthma had the shortest average stay (2.95 days), consistent with it being the lowest-acuity condition in the dataset.

### 6. Medication Burden Analysis
Calculated average medication count by diagnosis as a proxy for case complexity.

**Finding:** Heart Failure (15.77 meds) and Stroke (14.5 meds) patients carried the highest average medication burden, consistent with the clinical complexity of managing these conditions. Asthma had the lowest (4.5 meds).

### 7. Chronic Condition History vs. Current Admission
Compared each patient's *current* admitting diagnosis against their broader chronic disease history (`has_asthma`, `has_copd`, `has_heart_failure_history`) to demonstrate that these are tracked as independent dimensions rather than conflated.

**Finding:** This distinction matters clinically — a patient currently admitted for Pneumonia but with a chronic history of heart failure or COPD carries a different risk profile than a Pneumonia patient with no such history, even though both would otherwise appear identical based on primary diagnosis alone.

## Tools & Technologies

- MySQL / MySQL Workbench
- SQL (Aggregate functions, `CASE`, window functions, `GROUP BY`, `WHERE`, `VIEW`)
- Git / GitHub

## Future Improvements

- Expand the dataset to thousands of encounters for more statistically robust segment-level rates
- Add demographic and clinical variables (e.g., insurance type, discharge disposition, comorbidity index)
- Build an interactive Power BI or Tableau dashboard for readmission trends
- Apply a predictive model (logistic regression) to estimate readmission risk per patient
- Add an entity-relationship diagram (ERD) if the schema expands beyond a single table

## Author

**Isabella** — Registered Nurse transitioning into Healthcare Analytics, focused on SQL, clinical data analysis, quality improvement, and data visualization.

---
*This project is intended for educational and portfolio purposes.*
