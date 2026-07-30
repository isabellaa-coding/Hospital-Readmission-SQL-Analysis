# Hospital Readmission SQL Analysis

I'm a Registered Nurse moving into healthcare analytics, and this project is where those two backgrounds intersect. I used SQL to analyze a simulated hospital dataset and evaluate 30-day readmissions — the kind of question a hospital quality improvement team looks at regularly.

## Why readmissions

A high 30-day readmission rate usually points to gaps somewhere in the process: discharge planning, follow-up care, or how well chronic conditions are being managed after a patient leaves. I wanted to see what SQL could surface using a realistic, if simulated, dataset. Specifically, I was looking at the overall readmission rate, which diagnoses carried the most risk, whether chronic conditions like diabetes and hypertension increased that risk, which patients could be flagged as high-risk, and how length of stay and medication burden varied by diagnosis.

## The data

The dataset includes 125 simulated hospital encounters, with fields for age, diagnosis, admission type, length of stay, medication count, prior admissions, and 30-day readmission status. I also tracked chronic condition history (diabetes, hypertension, asthma, COPD, heart failure) separately from the current admitting diagnosis, since a patient's ongoing health conditions aren't always the reason for the current visit.

The data is synthetic, but was built to reflect realistic rates rather than random values. Real-world 30-day readmission rates typically fall between 15-25% depending on the condition, and this dataset falls within that range.

## Key Findings

The overall readmission rate was 16%, or 20 of 125 encounters. Heart Failure had the highest rate at 22.7%, and Asthma had the lowest at 9%, consistent with how those conditions typically present clinically.

The most notable finding was that patients with both diabetes and hypertension had a readmission rate of 28.6% — higher than any single diagnosis group on its own. This suggests that overall chronic disease burden is a stronger predictor of readmission risk than the primary diagnosis alone, which aligns with clinical experience and reinforced the value of looking beyond a single risk factor.

Stroke and Heart Failure patients also had the longest average stays and the highest medication counts, consistent with the clinical complexity of managing those conditions. In total, 27 patients met the criteria for high-risk (three or more prior admissions, or both chronic conditions present) — a list that could realistically support care coordination and discharge follow-up planning.

## How I built it

I designed and created the table in MySQL, then used CASE statements and aggregate functions to calculate readmission rates. I grouped and filtered the data to compare diagnoses, comorbidities, and risk levels, used a window function (RANK() OVER) to rank patients by risk within their own diagnosis group, and built a reusable VIEW for the high-risk patient list so it could support downstream reporting or a dashboard.

## Files in this repo

`hospital_readmission_analysis.sql` contains the table setup, data, and all analysis queries. `data/hospital_encounters.csv` is the source dataset. `outputs/` contains CSV exports of each query result.

## What I'd do next

Next steps would include expanding to a larger, more varied dataset, building a Power BI or Tableau dashboard on top of this analysis, and applying a predictive model to estimate readmission risk rather than relying solely on rule-based flags.

Isabella — Registered Nurse transitioning into healthcare analytics. Built for learning and portfolio purposes.
