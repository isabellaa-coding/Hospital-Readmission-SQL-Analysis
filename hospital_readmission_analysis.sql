/*
===========================================================
Hospital Readmission SQL Analysis
Author: Isabella

Purpose:
Analyze simulated hospital encounter data to identify factors
associated with 30-day readmissions and patient risk factors.

Skills Demonstrated:
- SQL database creation
- Data analysis and KPI calculation
- CASE statements, aggregate functions, window functions
- Healthcare quality improvement metrics
- Clinical risk stratification

Dataset: 125 simulated encounters with 30-day
readmission base rates (overall ~16%, ranging from ~9% for
Asthma to ~23% for Heart Failure), consistent with published
hospital quality benchmarks.
===========================================================
*/


-- ==========================================
-- 1. Create Database
-- ==========================================

CREATE DATABASE IF NOT EXISTS hospital_readmission_analysis;
USE hospital_readmission_analysis;


-- ==========================================
-- 2. Create Hospital Encounters Table
-- ==========================================

DROP TABLE IF EXISTS hospital_encounters;

CREATE TABLE hospital_encounters (
    patient_id                  INT PRIMARY KEY,
    age                         INT,
    gender                      VARCHAR(10),
    diagnosis                   VARCHAR(50),   -- primary reason for THIS admission
    admission_type              VARCHAR(20),
    length_of_stay              INT,
    num_medications             INT,
    previous_admissions         INT,
    diabetes                    VARCHAR(5),    -- chronic comorbidity flag, independent of diagnosis
    hypertension                VARCHAR(5),    -- chronic comorbidity flag, independent of diagnosis
    has_asthma                  VARCHAR(5),    -- chronic history flag, independent of diagnosis
    has_copd                    VARCHAR(5),    -- chronic history flag, independent of diagnosis
    has_heart_failure_history   VARCHAR(5),    -- chronic history flag, independent of diagnosis
    readmitted_30_days          VARCHAR(5)
);


-- ==========================================
-- 3. Insert Patient Records (125 encounters)
-- ==========================================

INSERT INTO hospital_encounters
    (patient_id, age, gender, diagnosis, admission_type, length_of_stay,
     num_medications, previous_admissions, diabetes, hypertension,
     has_asthma, has_copd, has_heart_failure_history, readmitted_30_days)
VALUES
(1001,60,'Female','COPD','Emergency',5,10,1,'No','No','No','Yes','No','No'),
(1002,66,'Female','COPD','Emergency',11,12,1,'No','Yes','No','Yes','No','No'),
(1003,77,'Male','Diabetes','Emergency',5,10,0,'No','No','No','Yes','No','No'),
(1004,44,'Female','Pneumonia','Emergency',2,9,1,'No','No','No','No','No','No'),
(1005,67,'Male','Heart Failure','Urgent',5,16,3,'No','No','No','No','Yes','Yes'),
(1006,89,'Male','Stroke','Emergency',8,17,2,'Yes','Yes','No','No','No','Yes'),
(1007,33,'Male','Asthma','Urgent',3,6,0,'No','No','Yes','No','No','No'),
(1008,52,'Male','Asthma','Urgent',3,1,0,'No','No','Yes','No','No','No'),
(1009,85,'Male','Heart Failure','Emergency',6,18,2,'No','Yes','No','No','Yes','No'),
(1010,25,'Female','Asthma','Emergency',1,8,1,'No','No','Yes','No','No','No'),
(1011,58,'Female','Heart Failure','Emergency',7,18,3,'No','Yes','No','No','Yes','No'),
(1012,56,'Male','Pneumonia','Emergency',4,8,2,'No','Yes','No','No','No','No'),
(1013,27,'Male','Asthma','Urgent',9,4,1,'No','No','Yes','No','No','No'),
(1014,66,'Male','Stroke','Emergency',7,13,4,'No','No','No','No','No','No'),
(1015,44,'Female','Pneumonia','Emergency',4,11,0,'No','No','No','No','No','No'),
(1016,67,'Male','Stroke','Urgent',11,13,3,'No','No','No','No','No','No'),
(1017,67,'Female','Stroke','Elective',9,13,2,'No','No','No','No','No','No'),
(1018,35,'Male','Pneumonia','Emergency',6,9,0,'Yes','No','No','No','No','No'),
(1019,59,'Male','Heart Failure','Emergency',8,19,2,'Yes','Yes','No','No','Yes','Yes'),
(1020,60,'Female','Pneumonia','Emergency',5,10,0,'Yes','Yes','No','No','No','No'),
(1021,75,'Female','COPD','Urgent',6,13,2,'Yes','No','No','Yes','No','No'),
(1022,48,'Female','Diabetes','Emergency',3,10,0,'No','No','No','No','No','No'),
(1023,40,'Male','Pneumonia','Emergency',1,10,0,'No','Yes','Yes','No','No','Yes'),
(1024,67,'Male','Pneumonia','Emergency',8,14,0,'No','Yes','No','No','No','No'),
(1025,58,'Male','Heart Failure','Urgent',7,16,1,'No','Yes','No','No','Yes','No'),
(1026,71,'Male','Diabetes','Elective',6,16,0,'Yes','Yes','No','No','No','No'),
(1027,80,'Female','Pneumonia','Elective',3,13,1,'Yes','Yes','No','No','No','No'),
(1028,57,'Male','Asthma','Emergency',4,3,1,'No','No','Yes','No','No','No'),
(1029,19,'Female','Asthma','Emergency',3,7,0,'No','No','Yes','No','No','No'),
(1030,80,'Male','COPD','Urgent',10,10,5,'No','Yes','No','Yes','No','No'),
(1031,80,'Male','Pneumonia','Emergency',9,7,0,'No','Yes','No','No','No','No'),
(1032,88,'Female','Heart Failure','Elective',8,13,2,'No','No','No','No','Yes','No'),
(1033,74,'Female','Pneumonia','Elective',9,7,2,'No','No','No','No','No','No'),
(1034,75,'Male','Heart Failure','Emergency',9,19,3,'Yes','Yes','No','No','Yes','No'),
(1035,46,'Female','Diabetes','Urgent',3,9,1,'No','No','Yes','No','No','Yes'),
(1036,54,'Male','Diabetes','Emergency',3,6,0,'No','No','No','No','No','No'),
(1037,30,'Male','Asthma','Urgent',3,3,0,'No','No','Yes','No','No','No'),
(1038,31,'Male','Asthma','Emergency',3,2,0,'No','No','Yes','No','No','No'),
(1039,76,'Female','Heart Failure','Urgent',5,12,1,'No','No','No','No','Yes','No'),
(1040,40,'Male','Diabetes','Emergency',8,7,0,'No','No','No','No','No','No'),
(1041,64,'Male','COPD','Emergency',7,14,1,'Yes','Yes','No','Yes','No','Yes'),
(1042,32,'Male','Asthma','Urgent',2,3,0,'No','No','Yes','No','No','No'),
(1043,37,'Male','Asthma','Urgent',2,7,1,'No','No','Yes','No','No','Yes'),
(1044,85,'Male','COPD','Urgent',3,12,2,'No','No','No','Yes','No','No'),
(1045,70,'Male','Diabetes','Emergency',2,19,1,'Yes','Yes','No','Yes','No','No'),
(1046,69,'Male','Stroke','Urgent',6,18,1,'Yes','Yes','No','No','No','No'),
(1047,58,'Male','Heart Failure','Emergency',7,16,2,'No','No','No','No','Yes','No'),
(1048,74,'Female','COPD','Emergency',6,14,2,'Yes','Yes','No','Yes','No','No'),
(1049,50,'Female','COPD','Emergency',1,10,2,'No','No','No','Yes','No','No'),
(1050,52,'Male','Pneumonia','Elective',4,8,0,'No','No','No','No','No','No'),
(1051,75,'Male','COPD','Emergency',5,16,2,'No','Yes','No','Yes','No','No'),
(1052,85,'Male','Stroke','Emergency',8,14,2,'No','No','Yes','No','No','No'),
(1053,51,'Female','Pneumonia','Urgent',1,7,1,'No','No','No','No','No','No'),
(1054,55,'Male','Pneumonia','Emergency',8,7,1,'No','No','No','No','No','No'),
(1055,40,'Male','Pneumonia','Emergency',7,6,0,'No','No','No','No','No','No'),
(1056,43,'Female','Asthma','Emergency',1,5,1,'No','No','Yes','No','No','No'),
(1057,88,'Male','Stroke','Urgent',10,13,1,'Yes','No','No','No','No','No'),
(1058,76,'Female','Stroke','Emergency',10,16,2,'No','No','No','No','No','No'),
(1059,27,'Female','Asthma','Emergency',3,4,0,'No','No','Yes','No','No','No'),
(1060,74,'Female','Diabetes','Elective',6,11,3,'Yes','No','No','No','No','No'),
(1061,71,'Male','COPD','Emergency',5,6,2,'No','No','No','Yes','No','No'),
(1062,80,'Male','Diabetes','Emergency',6,12,1,'Yes','No','No','No','No','No'),
(1063,65,'Female','Diabetes','Urgent',5,14,2,'Yes','Yes','No','No','No','No'),
(1064,51,'Male','Pneumonia','Emergency',7,5,0,'No','No','No','No','No','Yes'),
(1065,85,'Male','COPD','Emergency',7,10,2,'Yes','No','No','Yes','No','Yes'),
(1066,86,'Male','Stroke','Urgent',9,16,1,'Yes','No','No','No','No','Yes'),
(1067,44,'Male','Diabetes','Emergency',6,10,2,'No','No','No','No','No','No'),
(1068,72,'Female','COPD','Emergency',4,10,1,'No','No','No','Yes','No','No'),
(1069,73,'Male','Stroke','Urgent',5,17,2,'Yes','No','No','No','No','No'),
(1070,30,'Female','Asthma','Urgent',2,6,1,'No','No','Yes','No','No','No'),
(1071,59,'Male','Asthma','Urgent',3,4,0,'No','Yes','Yes','No','No','No'),
(1072,55,'Male','Pneumonia','Emergency',4,11,1,'Yes','No','No','Yes','No','No'),
(1073,68,'Male','COPD','Emergency',3,11,4,'No','Yes','No','Yes','No','Yes'),
(1074,73,'Female','Diabetes','Emergency',5,11,1,'Yes','No','No','No','No','No'),
(1075,74,'Male','Stroke','Urgent',7,15,1,'Yes','No','No','No','No','Yes'),
(1076,88,'Male','Heart Failure','Urgent',10,14,1,'Yes','No','No','No','Yes','No'),
(1077,79,'Female','COPD','Elective',6,12,3,'No','No','No','Yes','No','No'),
(1078,86,'Female','Stroke','Urgent',4,16,1,'No','Yes','No','No','No','No'),
(1079,50,'Female','COPD','Emergency',6,12,2,'No','No','No','Yes','No','No'),
(1080,85,'Female','Stroke','Urgent',7,11,2,'No','No','No','No','No','No'),
(1081,67,'Female','Stroke','Urgent',10,13,3,'No','No','No','No','No','No'),
(1082,48,'Male','Diabetes','Urgent',8,10,0,'No','No','No','No','No','No'),
(1083,81,'Female','Heart Failure','Elective',6,19,0,'No','Yes','Yes','No','Yes','No'),
(1084,30,'Female','Asthma','Urgent',2,5,1,'No','No','Yes','Yes','No','No'),
(1085,76,'Female','COPD','Urgent',5,8,0,'No','No','No','Yes','No','No'),
(1086,60,'Female','Heart Failure','Urgent',6,16,2,'No','Yes','No','No','Yes','No'),
(1087,51,'Female','Diabetes','Elective',1,7,0,'No','No','No','No','No','No'),
(1088,60,'Female','Heart Failure','Emergency',11,17,2,'No','No','No','No','Yes','No'),
(1089,67,'Male','Stroke','Emergency',6,17,1,'Yes','Yes','Yes','No','No','No'),
(1090,27,'Male','Asthma','Urgent',4,2,0,'No','No','Yes','No','No','No'),
(1091,57,'Female','Asthma','Emergency',3,6,1,'No','Yes','Yes','No','No','Yes'),
(1092,71,'Female','Stroke','Emergency',9,17,2,'No','Yes','No','No','No','No'),
(1093,50,'Female','Diabetes','Emergency',6,10,2,'No','No','No','No','No','Yes'),
(1094,83,'Male','Stroke','Emergency',9,11,2,'No','No','No','No','No','No'),
(1095,30,'Female','Asthma','Elective',5,3,2,'No','No','Yes','No','No','No'),
(1096,74,'Male','Stroke','Elective',11,11,1,'No','No','No','No','No','No'),
(1097,50,'Female','Diabetes','Emergency',9,11,2,'No','No','No','No','No','No'),
(1098,76,'Male','COPD','Emergency',8,9,1,'No','No','No','Yes','No','Yes'),
(1099,60,'Male','Heart Failure','Emergency',9,17,3,'No','No','No','No','Yes','No'),
(1100,62,'Female','Diabetes','Emergency',1,8,0,'No','Yes','No','No','No','No'),
(1101,21,'Female','Asthma','Elective',1,2,0,'No','No','Yes','No','No','No'),
(1102,51,'Male','Pneumonia','Emergency',7,9,1,'No','No','No','No','No','No'),
(1103,64,'Male','Diabetes','Elective',6,11,0,'No','Yes','No','Yes','No','No'),
(1104,56,'Male','Asthma','Emergency',2,6,1,'No','No','Yes','No','Yes','No'),
(1105,77,'Male','COPD','Emergency',8,15,1,'No','Yes','No','Yes','No','No'),
(1106,73,'Female','Heart Failure','Emergency',10,18,3,'No','Yes','No','No','Yes','No'),
(1107,71,'Female','Pneumonia','Emergency',4,12,0,'Yes','No','Yes','No','No','No'),
(1108,67,'Female','Pneumonia','Urgent',5,9,0,'Yes','No','No','No','No','No'),
(1109,83,'Male','Heart Failure','Urgent',5,20,2,'Yes','No','No','No','Yes','No'),
(1110,79,'Female','Heart Failure','Urgent',8,12,1,'Yes','No','No','No','Yes','No'),
(1111,62,'Male','COPD','Emergency',6,10,3,'No','Yes','No','Yes','No','No'),
(1112,61,'Female','Diabetes','Emergency',3,12,2,'Yes','Yes','No','No','No','No'),
(1113,69,'Female','Heart Failure','Urgent',11,14,4,'No','Yes','No','No','Yes','Yes'),
(1114,54,'Male','Diabetes','Emergency',6,12,0,'No','No','Yes','No','No','No'),
(1115,35,'Female','Pneumonia','Urgent',5,11,0,'Yes','No','No','No','No','No'),
(1116,75,'Female','Heart Failure','Emergency',8,11,2,'No','No','No','No','Yes','Yes'),
(1117,55,'Female','Diabetes','Urgent',7,7,0,'No','No','No','No','No','No'),
(1118,35,'Female','Asthma','Urgent',3,9,0,'No','Yes','Yes','No','No','No'),
(1119,58,'Male','Heart Failure','Emergency',12,13,1,'No','No','No','No','Yes','No'),
(1120,63,'Male','Heart Failure','Emergency',8,17,0,'No','No','No','No','Yes','No'),
(1121,75,'Male','Diabetes','Emergency',1,14,1,'Yes','Yes','No','No','No','Yes'),
(1122,70,'Male','Pneumonia','Urgent',2,11,1,'No','No','No','No','No','Yes'),
(1123,81,'Male','Heart Failure','Elective',9,12,2,'Yes','No','No','No','Yes','Yes'),
(1124,60,'Female','Asthma','Emergency',3,3,1,'No','Yes','Yes','No','No','No'),
(1125,50,'Female','COPD','Emergency',6,9,2,'Yes','No','No','Yes','No','No');

-- ==========================================
-- 4. Data Exploration
-- ==========================================

-- Preview the dataset
SELECT * FROM hospital_encounters;

-- Total patient encounters
SELECT COUNT(*) AS total_encounters
FROM hospital_encounters;


-- ==========================================
-- 5. Overall 30-Day Readmission Rate
-- ==========================================

SELECT
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted_30_days = 'Yes' THEN 1 ELSE 0 END) AS total_readmissions,
    ROUND(SUM(CASE WHEN readmitted_30_days = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_percentage
FROM hospital_encounters;

-- Insight: this could be a top-line KPI a quality improvement team would track
-- month over month to evaluate discharge and care-transition effectiveness.


-- ==========================================
-- 6. Readmission Rate by Diagnosis
-- ==========================================

SELECT
    diagnosis,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted_30_days = 'Yes' THEN 1 ELSE 0 END) AS readmissions,
    ROUND(SUM(CASE WHEN readmitted_30_days = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_percentage
FROM hospital_encounters
GROUP BY diagnosis
ORDER BY readmission_rate_percentage DESC;

-- Insight: identifies which diagnostic categories should be prioritized
-- for targeted discharge planning and follow-up interventions.


-- ==========================================
-- 7. Chronic Condition Comorbidity Analysis
-- ==========================================

SELECT
    diabetes,
    hypertension,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted_30_days = 'Yes' THEN 1 ELSE 0 END) AS readmissions,
    ROUND(SUM(CASE WHEN readmitted_30_days = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_percentage
FROM hospital_encounters
GROUP BY diabetes, hypertension
ORDER BY readmission_rate_percentage DESC;

-- Insight: comorbidity burden compounds readmission risk -- patients with
-- BOTH diabetes and hypertension show the highest readmission rate of any
-- segment in the dataset, ahead of any single-diagnosis group. A patient's
-- chronic disease profile matters as much as the reason for the current visit.


-- ==========================================
-- 8. High-Risk Patient Identification
-- ==========================================

-- Basic flag: 3+ prior admissions
SELECT
    patient_id,
    age,
    diagnosis,
    previous_admissions,
    length_of_stay
FROM hospital_encounters
WHERE previous_admissions >= 3
ORDER BY previous_admissions DESC;

-- Expanded risk stratification: combines admission history with
-- comorbidity burden for a more clinically realistic high-risk cohort
SELECT
    patient_id,
    age,
    diagnosis,
    previous_admissions,
    diabetes,
    hypertension,
    length_of_stay,
    CASE
        WHEN previous_admissions >= 3 AND diabetes = 'Yes' AND hypertension = 'Yes' THEN 'High Risk'
        WHEN previous_admissions >= 3 OR (diabetes = 'Yes' AND hypertension = 'Yes') THEN 'Moderate Risk'
        ELSE 'Lower Risk'
    END AS risk_category
FROM hospital_encounters
ORDER BY
    FIELD(
        CASE
            WHEN previous_admissions >= 3 AND diabetes = 'Yes' AND hypertension = 'Yes' THEN 'High Risk'
            WHEN previous_admissions >= 3 OR (diabetes = 'Yes' AND hypertension = 'Yes') THEN 'Moderate Risk'
            ELSE 'Lower Risk'
        END,
        'High Risk', 'Moderate Risk', 'Lower Risk'
    );

-- Window function example: rank each patient's admission history
-- within their own diagnosis group (useful for care-team prioritization)
SELECT
    patient_id,
    diagnosis,
    previous_admissions,
    RANK() OVER (PARTITION BY diagnosis ORDER BY previous_admissions DESC) AS risk_rank_within_diagnosis
FROM hospital_encounters
ORDER BY diagnosis, risk_rank_within_diagnosis;


-- ==========================================
-- 9. Average Length of Stay by Diagnosis
-- ==========================================

SELECT
    diagnosis,
    ROUND(AVG(length_of_stay), 2) AS average_length_of_stay
FROM hospital_encounters
GROUP BY diagnosis
ORDER BY average_length_of_stay DESC;


-- ==========================================
-- 10. Medication Use by Diagnosis
-- ==========================================

SELECT
    diagnosis,
    ROUND(AVG(num_medications), 2) AS average_medications
FROM hospital_encounters
GROUP BY diagnosis
ORDER BY average_medications DESC;

-- Insight: medication count is a rough proxy for case complexity and
-- polypharmacy risk, both associated with higher readmission likelihood.


-- ==========================================
-- 11. Chronic Condition History vs. Current Admission
-- ==========================================

-- Demonstrates the schema distinction between a patient's CURRENT admitting
-- diagnosis and their broader chronic disease history. E.g., a patient
-- admitted for Pneumonia who also has a history of asthma or heart failure
-- may carry more readmission risk than the primary diagnosis alone suggests.
SELECT
    diagnosis AS current_admission_diagnosis,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN has_asthma = 'Yes' THEN 1 ELSE 0 END) AS with_asthma_history,
    SUM(CASE WHEN has_copd = 'Yes' THEN 1 ELSE 0 END) AS with_copd_history,
    SUM(CASE WHEN has_heart_failure_history = 'Yes' THEN 1 ELSE 0 END) AS with_hf_history,
    SUM(CASE WHEN readmitted_30_days = 'Yes' THEN 1 ELSE 0 END) AS readmissions
FROM hospital_encounters
GROUP BY diagnosis
ORDER BY diagnosis;


-- ==========================================
-- 12. Reusable View: High-Risk Patient Registry
-- ==========================================

CREATE OR REPLACE VIEW high_risk_patients AS
SELECT
    patient_id,
    age,
    diagnosis,
    previous_admissions,
    diabetes,
    hypertension,
    length_of_stay,
    readmitted_30_days
FROM hospital_encounters
WHERE previous_admissions >= 3
   OR (diabetes = 'Yes' AND hypertension = 'Yes');

-- Usage: SELECT * FROM high_risk_patients;
-- This view could feed a Power BI / Tableau dashboard directly,
-- keeping the risk logic defined once in SQL rather than duplicated
-- across downstream reporting tools.
