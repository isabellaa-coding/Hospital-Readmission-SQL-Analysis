# Hospital Readmission SQL Analysis

## Project Overview

This project analyzes a simulated dataset of 125 hospital encounters using SQL to evaluate 30-day hospital readmission rates and identify patient populations at higher risk for readmission.

The objective of this project was to simulate a healthcare analytics workflow by creating a SQL database, loading simulated hospital encounter data, and performing analyses to evaluate 30-day readmission rates and identify factors associated with increased readmission risk. The project demonstrates how SQL can be used to generate actionable insights that support quality improvement and operational decision-making.

---

## Why This Project?

As a Registered Nurse transitioning into healthcare analytics, I wanted to combine my clinical experience with SQL to explore how healthcare data can be transformed into actionable insights.

Hospital readmissions are an important healthcare quality metric because they can highlight opportunities to improve discharge planning, care coordination, and chronic disease management. This project demonstrates how SQL can be used to analyze patient encounter data and support data-driven clinical decision-making.

---

## Project Highlights

- Designed and queried a SQL database containing 125 simulated hospital encounters.
- Calculated 30-day hospital readmission rates using SQL aggregate functions and CASE statements.
- Identified high-risk patient populations based on previous admissions and chronic conditions.
- Analyzed diagnosis-specific readmission rates and average length of stay.
- Demonstrated SQL techniques commonly used in healthcare quality improvement and operational reporting.

---

## Project Objectives

This project answers the following healthcare analytics questions:

- What is the overall 30-day hospital readmission rate?
- Which diagnoses are associated with higher readmission rates?
- Which patients may represent higher-risk populations?
- How does hospital length of stay vary across diagnoses?
- How do chronic conditions relate to hospital readmissions?

---

## Dataset

This project uses a **simulated dataset consisting of 125 inpatient hospital encounters** created for educational and portfolio purposes.

### Dataset Variables

| Column | Description |
|---------|-------------|
| patient_id | Unique patient identifier |
| age | Patient age |
| gender | Patient gender |
| diagnosis | Primary diagnosis |
| admission_type | Emergency, Urgent, or Elective admission |
| length_of_stay | Hospital length of stay (days) |
| num_medications | Number of medications prescribed |
| previous_admissions | Number of previous hospital admissions |
| diabetes | Diabetes diagnosis (Yes/No) |
| hypertension | Hypertension diagnosis (Yes/No) |
| readmitted_30_days | Indicates whether the patient was readmitted within 30 days |

---

## Tools Used

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub

--- 

## Technologies & Concepts

- SQL
- MySQL
- Aggregate Functions
- CASE Statements
- GROUP BY
- ORDER BY
- WHERE Filtering
- Healthcare Analytics
- Quality Metrics
- Data Exploration

---

## Database Design

The project uses a single SQL table named **hospital_encounters**, containing simulated patient encounter data commonly analyzed in healthcare quality improvement projects.

The database was designed to support SQL analysis of patient demographics, diagnoses, hospital utilization, chronic conditions, and readmission outcomes.

---

## SQL Analysis Performed

### 1. Data Exploration

- Reviewed hospital encounter records
- Validated the dataset
- Calculated total patient encounters

### 2. Overall 30-Day Readmission Rate

Calculated the percentage of patients readmitted within 30 days using SQL aggregate functions and CASE statements.

### 3. Diagnosis-Based Readmission Analysis

Compared readmission rates across multiple diagnoses, including:

- Heart Failure
- COPD
- Pneumonia
- Diabetes
- Stroke
- Asthma

### 4. High-Risk Patient Identification

Identified patients with multiple previous hospital admissions to evaluate potential readmission risk.

### 5. Length of Stay Analysis

Calculated average hospital length of stay by diagnosis to identify conditions associated with longer admissions.

### 6. Chronic Condition Analysis

Analyzed readmission trends among patients with diabetes and hypertension.

---

## SQL Skills Demonstrated

- Database and table creation
- Data insertion and validation
- Aggregate functions (COUNT, AVG, SUM)
- CASE statements
- GROUP BY and ORDER BY
- WHERE filtering
- Healthcare KPI calculations
- Clinical data exploration
- Readmission trend analysis

---

## Example Business Questions Answered

### What is the overall 30-day hospital readmission rate?

Calculated the percentage of patients readmitted within 30 days across all encounters.

### Which diagnoses demonstrate the highest readmission rates?

Compared readmission trends among common inpatient diagnoses.

### Which patients may represent higher-risk populations?

Identified patients with multiple previous admissions and longer hospital stays.

### Which diagnoses are associated with longer hospital stays?

Calculated average length of stay by diagnosis.

### Do chronic conditions influence readmission patterns?

Compared readmission outcomes among patients with diabetes and hypertension.

---

## Key Findings

Analysis of the simulated hospital encounter dataset identified several notable trends:

- The dataset included **125 total hospital encounters**.
- The overall **30-day hospital readmission rate was 60.8%** (76 readmissions out of 125 encounters).
- **Stroke** patients demonstrated the highest readmission rate (**100%**), followed by **Heart Failure** (**96%**) and **COPD** (**70%**).
- Patients with multiple previous admissions consistently appeared among the highest-risk individuals, often experiencing longer hospital stays.
- **Stroke** patients had the longest average hospital length of stay (**11.75 days**), followed by **Heart Failure** (**9.64 days**) and **COPD** (**8.00 days**).
- Patients with both **diabetes and hypertension** accounted for the largest number of readmissions (**50 readmissions among 53 patients**), suggesting a greater burden of chronic disease within the simulated dataset.
- Average medication use was highest among patients with **Stroke (19.9 medications)** and **Heart Failure (18.56 medications)**, reflecting the increased complexity of managing these conditions.

---

## Future Improvements

Potential enhancements include:

- Expanding the dataset to include thousands of hospital encounters
- Incorporating additional demographic and clinical variables
- Building an interactive Power BI dashboard
- Creating Tableau visualizations of readmission trends
- Applying predictive analytics techniques to estimate readmission risk

---

## About This Project

This project demonstrates the application of SQL within a healthcare analytics setting by analyzing simulated hospital encounter data to evaluate patient outcomes and hospital quality metrics.

It highlights the use of SQL to explore clinical data, calculate key performance indicators, identify utilization trends, and generate insights that can support healthcare quality improvement initiatives.

---

## Author

**Isabella**

Registered Nurse transitioning into Healthcare Analytics with interests in SQL, healthcare data analysis, clinical quality improvement, and data visualization. Passionate about leveraging data-driven insights to improve healthcare operations and patient outcomes.

---

## License

This project is intended for educational and portfolio purposes.

--- 

## Repository Structure

```text
Hospital-Readmission-SQL-Analysis/
│
├── hospital_readmission_analysis.sql
├── README.md
└── screenshots/
```
