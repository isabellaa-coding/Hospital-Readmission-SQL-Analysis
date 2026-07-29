# Hospital Readmission SQL Analysis

## Project Overview

This project analyzes hospital encounter data to identify factors associated with **30-day hospital readmissions** using SQL.

The goal of this analysis is to demonstrate healthcare data analytics skills by exploring patient demographics, clinical conditions, hospital utilization patterns, and potential risk factors associated with readmission.

This project applies SQL techniques commonly used in healthcare analytics, including data exploration, aggregation, filtering, grouping, and healthcare quality metric calculations.

---

## Objectives

The analysis focuses on answering the following questions:

- What is the overall 30-day hospital readmission rate?
- Which diagnoses are associated with higher readmission rates?
- Which patients may represent higher-risk populations?
- How does length of stay vary across diagnoses?
- Are chronic conditions associated with increased readmission patterns?

---

## Dataset

The dataset contains **100 simulated hospital encounters** representing inpatient admissions.

### Variables Included

| Column | Description |
|---|---|
| Patient ID | Unique patient identifier |
| Age | Patient age |
| Gender | Patient gender |
| Diagnosis | Primary diagnosis |
| Admission Type | Emergency, urgent, or elective admission |
| Length of Stay | Number of hospital days |
| Number of Medications | Medications prescribed during admission |
| Previous Admissions | Prior hospital admissions |
| Diabetes | Presence of diabetes diagnosis |
| Hypertension | Presence of hypertension diagnosis |
| Readmitted Within 30 Days | Whether patient was readmitted within 30 days |

---

## Tools Used

- SQL
- MySQL
- Healthcare Analytics
- Clinical Quality Metrics
- Data Exploration

---

## SQL Analysis Performed

### 1. Data Exploration

Reviewed hospital encounter records and calculated total patient encounters.

### 2. 30-Day Readmission Rate

Calculated the percentage of patients readmitted within 30 days using:

```
Readmission Rate =
(Number of 30-Day Readmissions / Total Encounters) × 100
```

### 3. Diagnosis-Based Readmission Analysis

Evaluated readmission trends across diagnoses to identify conditions associated with increased readmission frequency.

### 4. High-Risk Patient Identification

Identified patients with multiple previous admissions to evaluate potential readmission risk factors.

### 5. Length of Stay Analysis

Analyzed average hospital length of stay by diagnosis.

### 6. Chronic Condition Analysis

Reviewed readmission trends among patients with chronic conditions including diabetes and hypertension.

---

## Key Findings

*(Update these after running your SQL queries)*

- Overall 30-day readmission rate: **XX%**
- Diagnoses with the highest readmission rates: **XX**
- Patients with multiple previous admissions demonstrated increased readmission risk.
- Longer hospital stays were observed among higher-acuity diagnoses.

---

## Clinical Relevance

Hospital readmissions are an important healthcare quality metric used to evaluate patient outcomes, care coordination, and opportunities for improvement.

This analysis demonstrates how healthcare data can be used to identify trends, support quality improvement initiatives, and guide data-informed decision-making.

---

## Future Improvements

Potential future enhancements include:

- Expanding the dataset with additional patient encounters
- Creating visual dashboards using Power BI or Tableau
- Incorporating additional clinical variables
- Developing predictive models for readmission risk
- Performing deeper analysis of utilization patterns


## Why This Project?

As a Registered Nurse transitioning into healthcare analytics, I wanted to explore how clinical data can be used to identify trends, improve patient outcomes, and support quality improvement initiatives.

Hospital readmissions are an important healthcare quality metric because they can reflect gaps in care coordination, chronic disease management, and discharge planning. By analyzing patient encounter data, this project demonstrates how SQL can be used to transform healthcare data into meaningful insights that support clinical and operational decision-making.

This project combines my clinical background with my growing technical skills in SQL and healthcare analytics to better understand how data can be leveraged to improve patient care.

---

## Author

**Isabella**

Registered Nurse transitioning into Healthcare Analytics with an interest in leveraging clinical experience and data analysis to improve healthcare outcomes.
