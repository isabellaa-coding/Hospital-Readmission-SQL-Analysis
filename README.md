# Hospital-Readmission-SQL-Analysis
# Hospital Readmission Analysis | SQL Project

## Project Overview

This project analyzes synthetic hospital encounter data to evaluate factors associated with 30-day patient readmissions. The goal was to simulate a healthcare analytics workflow by designing a relational database, loading clinical data, and using SQL queries to identify trends in patient utilization and readmission risk.

This project demonstrates the application of SQL and healthcare knowledge to analyze clinical data and generate insights that can support quality improvement and operational decision-making.

---

## Objectives

- Calculate overall 30-day hospital readmission rates
- Identify diagnoses associated with higher readmission risk
- Analyze patient utilization patterns
- Evaluate hospital length of stay trends
- Compare readmission rates by admission type and discharge disposition
- Identify patients with increased readmission risk

---

## Tools Used

- MySQL
- MySQL Workbench
- SQL

---

# Database Design

The database was created using a relational schema consisting of four connected tables:

---

## Tables

### Patients

Stores patient demographic information.

**Columns:**

- Patient ID
- Age
- Gender
- Insurance Type

---

### Encounters

Stores hospital admission and discharge information.

**Columns:**

- Encounter ID
- Patient ID
- Admission Date
- Discharge Date
- Admission Type
- Length of Stay
- Discharge Disposition

---

### Diagnoses

Stores clinical diagnoses associated with each hospital encounter.

**Columns:**

- Diagnosis ID
- Encounter ID
- Diagnosis Name
- Diagnosis Category

---

### Readmissions

Stores whether a patient was readmitted within 30 days.

**Columns:**

- Readmission ID
- Patient ID
- Encounter ID
- Readmitted Within 30 Days

---

# Analysis Performed

## 1. Overall 30-Day Readmission Rate

Calculated the percentage of hospital encounters resulting in a readmission within 30 days.

**Metric:**

---

## 2. Diagnosis-Based Readmission Analysis

Evaluated which diagnoses were associated with higher readmission rates.

Conditions analyzed included:

- Heart Failure
- COPD
- Pneumonia
- Diabetes
- Stroke

---

## 3. High-Risk Patient Identification

Analyzed patient characteristics associated with increased utilization, including:

- Multiple hospital encounters
- Previous readmissions
- Demographic factors

---

## 4. Length of Stay Analysis

Calculated average hospital length of stay by diagnosis to identify conditions associated with longer admissions.

---

## 5. Admission Type Analysis

Compared readmission patterns across:

- Emergency admissions
- Urgent admissions
- Elective admissions

---

## 6. Discharge Disposition Analysis

Evaluated whether discharge destination influenced readmission risk.

Dispositions analyzed:

- Home
- Rehabilitation Facility
- Skilled Nursing Facility

---

# SQL Skills Demonstrated

- Relational database design
- Creating database schemas
- Primary keys and foreign keys
- Data relationships
- INNER JOIN operations
- Aggregations
- GROUP BY analysis
- CASE statements
- WHERE and HAVING filters
- Healthcare KPI calculations
- Clinical data analysis

---

# Example Business Questions Answered

### What percentage of patients are readmitted within 30 days?

Calculated the overall hospital readmission rate.

---

### Which diagnoses have the highest readmission rates?

Compared readmission outcomes across clinical conditions.

---

### Which patients demonstrate higher utilization?

Identified patients with repeat encounters and readmission events.

---

### Do emergency admissions have higher readmission rates?

Compared readmission outcomes based on admission type.

---

### Does discharge destination affect readmission risk?

Evaluated readmission patterns by discharge disposition.

---

# Project Files

---

# Future Improvements

Future enhancements could include:

- Expanding the dataset with additional hospital encounters
- Adding laboratory values and vital signs
- Incorporating comorbidity scoring
- Adding medication data
- Developing predictive models for readmission risk
- Creating healthcare dashboards for quality reporting

---

# About This Project

This project was created to demonstrate the intersection of healthcare and data analytics by applying SQL skills to a clinical dataset.

The project reflects common data structures found in electronic medical record (EMR) systems and demonstrates how healthcare data can be organized, analyzed, and used to identify trends in patient outcomes.
