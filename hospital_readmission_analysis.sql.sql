/*
===========================================================
Hospital Readmission SQL Analysis
Author: Isabella

Purpose:
Analyze hospital encounter data to identify factors
associated with 30-day readmissions and patient risk factors.

Skills Demonstrated:
- SQL database creation
- Data analysis
- Healthcare KPI calculation
- Quality improvement metrics
- Clinical risk analysis
===========================================================
*/


-- ==========================================
-- 1. Create Database
-- ==========================================

CREATE DATABASE hospital_readmission_analysis;

USE hospital_readmission_analysis;



-- ==========================================
-- 2. Create Hospital Encounters Table
-- ==========================================

CREATE TABLE hospital_encounters (

    patient_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    diagnosis VARCHAR(50),
    admission_type VARCHAR(20),
    length_of_stay INT,
    num_medications INT,
    previous_admissions INT,
    diabetes VARCHAR(5),
    hypertension VARCHAR(5),
    readmitted_30_days VARCHAR(5)

);



-- ==========================================
-- 3. Insert 100 Patient Records
-- ==========================================

INSERT INTO hospital_encounters VALUES

INSERT INTO hospital_encounters VALUES

(1001,72,'Female','Heart Failure','Emergency',8,14,3,'Yes','Yes','Yes'),
(1002,54,'Male','Pneumonia','Emergency',5,9,1,'No','Yes','No'),
(1003,68,'Female','Diabetes','Urgent',7,16,4,'Yes','Yes','Yes'),
(1004,45,'Male','COPD','Emergency',6,11,2,'No','Yes','No'),
(1005,81,'Female','Stroke','Emergency',12,18,5,'Yes','Yes','Yes'),
(1006,39,'Male','Asthma','Elective',3,6,0,'No','No','No'),
(1007,76,'Female','Heart Failure','Emergency',10,20,6,'Yes','Yes','Yes'),
(1008,61,'Male','Pneumonia','Urgent',6,12,2,'No','Yes','Yes'),
(1009,50,'Female','Diabetes','Elective',4,10,1,'Yes','No','No'),
(1010,70,'Male','COPD','Emergency',9,15,4,'No','Yes','Yes'),

(1011,66,'Female','Stroke','Emergency',11,17,3,'Yes','Yes','Yes'),
(1012,43,'Male','Asthma','Elective',2,5,0,'No','No','No'),
(1013,79,'Female','Heart Failure','Urgent',8,19,5,'Yes','Yes','Yes'),
(1014,57,'Male','Diabetes','Emergency',7,13,2,'Yes','No','No'),
(1015,63,'Female','Pneumonia','Emergency',6,12,3,'No','Yes','Yes'),
(1016,48,'Male','COPD','Urgent',5,9,1,'No','Yes','No'),
(1017,85,'Female','Stroke','Emergency',14,22,7,'Yes','Yes','Yes'),
(1018,36,'Male','Asthma','Elective',2,4,0,'No','No','No'),
(1019,73,'Female','Heart Failure','Emergency',9,18,5,'Yes','Yes','Yes'),
(1020,59,'Male','Diabetes','Urgent',6,14,2,'Yes','Yes','No'),

(1021,67,'Female','COPD','Emergency',8,16,4,'No','Yes','Yes'),
(1022,52,'Male','Pneumonia','Urgent',5,10,1,'No','No','No'),
(1023,74,'Female','Stroke','Emergency',13,21,6,'Yes','Yes','Yes'),
(1024,46,'Male','Diabetes','Elective',4,8,1,'Yes','No','No'),
(1025,69,'Female','Heart Failure','Emergency',10,19,5,'Yes','Yes','Yes'),
(1026,71,'Male','Heart Failure','Emergency',9,17,4,'Yes','Yes','Yes'),
(1027,55,'Female','Pneumonia','Urgent',6,11,2,'No','Yes','No'),
(1028,64,'Male','Diabetes','Emergency',8,15,3,'Yes','Yes','Yes'),
(1029,38,'Female','Asthma','Elective',3,7,0,'No','No','No'),
(1030,77,'Male','COPD','Emergency',11,19,5,'No','Yes','Yes'),

(1031,60,'Female','Stroke','Urgent',10,18,4,'Yes','Yes','Yes'),
(1032,49,'Male','Pneumonia','Emergency',5,9,1,'No','No','No'),
(1033,82,'Female','Heart Failure','Emergency',12,21,7,'Yes','Yes','Yes'),
(1034,56,'Male','Diabetes','Elective',4,12,1,'Yes','No','No'),
(1035,65,'Female','COPD','Urgent',7,14,3,'No','Yes','Yes'),

(1036,42,'Male','Asthma','Elective',2,5,0,'No','No','No'),
(1037,75,'Female','Stroke','Emergency',13,22,6,'Yes','Yes','Yes'),
(1038,53,'Male','Heart Failure','Urgent',8,16,3,'Yes','Yes','No'),
(1039,62,'Female','Pneumonia','Emergency',6,13,2,'No','Yes','Yes'),
(1040,47,'Male','Diabetes','Elective',5,10,1,'Yes','No','No'),

(1041,79,'Female','COPD','Emergency',10,20,5,'No','Yes','Yes'),
(1042,58,'Male','Stroke','Urgent',9,17,3,'Yes','Yes','Yes'),
(1043,35,'Female','Asthma','Elective',2,4,0,'No','No','No'),
(1044,70,'Male','Heart Failure','Emergency',11,19,6,'Yes','Yes','Yes'),
(1045,63,'Female','Diabetes','Urgent',7,15,2,'Yes','No','No'),

(1046,51,'Male','Pneumonia','Emergency',6,12,2,'No','Yes','Yes'),
(1047,86,'Female','Stroke','Emergency',15,23,8,'Yes','Yes','Yes'),
(1048,44,'Male','COPD','Elective',4,8,1,'No','Yes','No'),
(1049,68,'Female','Heart Failure','Urgent',9,18,4,'Yes','Yes','Yes'),
(1050,57,'Male','Diabetes','Emergency',7,13,3,'Yes','No','Yes'),
(1051,73,'Female','Heart Failure','Emergency',10,20,5,'Yes','Yes','Yes'),
(1052,50,'Male','Pneumonia','Urgent',5,11,1,'No','Yes','No'),
(1053,66,'Female','Diabetes','Emergency',8,16,3,'Yes','No','Yes'),
(1054,41,'Male','Asthma','Elective',3,6,0,'No','No','No'),
(1055,78,'Female','Stroke','Emergency',14,24,7,'Yes','Yes','Yes'),

(1056,59,'Male','COPD','Urgent',7,13,2,'No','Yes','Yes'),
(1057,69,'Female','Heart Failure','Emergency',9,18,4,'Yes','Yes','Yes'),
(1058,46,'Male','Pneumonia','Elective',4,8,1,'No','No','No'),
(1059,84,'Female','Stroke','Emergency',12,22,6,'Yes','Yes','Yes'),
(1060,61,'Male','Diabetes','Urgent',6,14,2,'Yes','No','No'),

(1061,52,'Female','COPD','Emergency',8,15,3,'No','Yes','Yes'),
(1062,37,'Male','Asthma','Elective',2,5,0,'No','No','No'),
(1063,76,'Female','Heart Failure','Emergency',11,21,6,'Yes','Yes','Yes'),
(1064,63,'Male','Pneumonia','Urgent',7,12,2,'No','Yes','No'),
(1065,58,'Female','Diabetes','Emergency',8,16,3,'Yes','Yes','Yes'),

(1066,72,'Male','Stroke','Emergency',13,23,7,'Yes','Yes','Yes'),
(1067,48,'Female','COPD','Elective',4,9,1,'No','Yes','No'),
(1068,67,'Male','Heart Failure','Urgent',9,17,4,'Yes','Yes','Yes'),
(1069,54,'Female','Pneumonia','Emergency',6,12,2,'No','Yes','Yes'),
(1070,80,'Male','Diabetes','Emergency',10,19,5,'Yes','Yes','Yes'),

(1071,43,'Female','Asthma','Elective',3,6,0,'No','No','No'),
(1072,74,'Male','COPD','Emergency',11,20,5,'No','Yes','Yes'),
(1073,56,'Female','Stroke','Urgent',8,16,3,'Yes','Yes','Yes'),
(1074,65,'Male','Heart Failure','Emergency',10,18,5,'Yes','Yes','Yes'),
(1075,60,'Female','Pneumonia','Urgent',6,13,2,'No','Yes','No'),
(1076,81,'Female','Heart Failure','Emergency',12,22,7,'Yes','Yes','Yes'),
(1077,45,'Male','Pneumonia','Elective',3,7,0,'No','No','No'),
(1078,70,'Female','Diabetes','Urgent',7,15,3,'Yes','Yes','Yes'),
(1079,62,'Male','COPD','Emergency',9,17,4,'No','Yes','Yes'),
(1080,53,'Female','Stroke','Emergency',11,20,5,'Yes','Yes','Yes'),

(1081,39,'Male','Asthma','Elective',2,5,0,'No','No','No'),
(1082,77,'Female','Heart Failure','Emergency',10,19,6,'Yes','Yes','Yes'),
(1083,58,'Male','Pneumonia','Urgent',6,12,2,'No','Yes','No'),
(1084,64,'Female','Diabetes','Emergency',8,16,3,'Yes','No','Yes'),
(1085,71,'Male','COPD','Emergency',10,18,5,'No','Yes','Yes'),

(1086,49,'Female','Stroke','Urgent',9,17,3,'Yes','Yes','Yes'),
(1087,83,'Male','Heart Failure','Emergency',13,23,8,'Yes','Yes','Yes'),
(1088,55,'Female','Pneumonia','Elective',4,9,1,'No','Yes','No'),
(1089,67,'Male','Diabetes','Urgent',7,14,2,'Yes','No','No'),
(1090,74,'Female','COPD','Emergency',11,21,6,'No','Yes','Yes'),

(1091,36,'Male','Asthma','Elective',2,4,0,'No','No','No'),
(1092,69,'Female','Stroke','Emergency',12,22,6,'Yes','Yes','Yes'),
(1093,57,'Male','Heart Failure','Urgent',8,16,3,'Yes','Yes','Yes'),
(1094,63,'Female','Pneumonia','Emergency',7,13,2,'No','Yes','Yes'),
(1095,51,'Male','Diabetes','Elective',5,10,1,'Yes','No','No'),

(1096,79,'Female','COPD','Emergency',12,20,7,'No','Yes','Yes'),
(1097,60,'Male','Stroke','Urgent',9,18,4,'Yes','Yes','Yes'),
(1098,47,'Female','Asthma','Elective',3,6,0,'No','No','No'),
(1099,72,'Male','Heart Failure','Emergency',10,19,5,'Yes','Yes','Yes'),
(1100,65,'Female','Diabetes','Urgent',7,15,3,'Yes','No','Yes');

-- ==========================================
-- 4. View Dataset
-- ==========================================

SELECT *
FROM hospital_encounters;



-- ==========================================
-- 5. Total Patient Encounters
-- ==========================================

SELECT

COUNT(*) AS total_encounters

FROM hospital_encounters;



-- ==========================================
-- 6. Calculate Overall 30-Day Readmission Rate
-- ==========================================

SELECT

COUNT(*) AS total_encounters,

SUM(
    CASE
        WHEN readmitted_30_days = 'Yes'
        THEN 1
        ELSE 0
    END
) AS total_readmissions,


ROUND(

    SUM(
        CASE
            WHEN readmitted_30_days = 'Yes'
            THEN 1
            ELSE 0
        END
    ) * 100.0 / COUNT(*),

2

) AS readmission_rate_percentage


FROM hospital_encounters;



-- ==========================================
-- 7. Readmission Rate by Diagnosis
-- ==========================================

SELECT

diagnosis,

COUNT(*) AS total_patients,


SUM(
    CASE
        WHEN readmitted_30_days = 'Yes'
        THEN 1
        ELSE 0
    END
) AS readmissions,


ROUND(

    SUM(
        CASE
            WHEN readmitted_30_days = 'Yes'
            THEN 1
            ELSE 0
        END
    ) * 100.0 / COUNT(*),

2

) AS readmission_rate_percentage


FROM hospital_encounters


GROUP BY diagnosis


ORDER BY readmission_rate_percentage DESC;



-- ==========================================
-- 8. Identify High-Risk Patients
-- ==========================================

SELECT

patient_id,
age,
diagnosis,
previous_admissions,
length_of_stay


FROM hospital_encounters


WHERE previous_admissions >= 3


ORDER BY previous_admissions DESC;



-- ==========================================
-- 9. Average Length of Stay by Diagnosis
-- ==========================================

SELECT

diagnosis,

ROUND(
    AVG(length_of_stay),
    2
) AS average_length_of_stay


FROM hospital_encounters


GROUP BY diagnosis


ORDER BY average_length_of_stay DESC;



-- ==========================================
-- 10. Medication Use by Diagnosis
-- ==========================================

SELECT

diagnosis,

ROUND(
    AVG(num_medications),
    2
) AS average_medications


FROM hospital_encounters


GROUP BY diagnosis


ORDER BY average_medications DESC;



-- ==========================================
-- 11. Chronic Condition Readmission Trends
-- ==========================================

SELECT

diabetes,

hypertension,


COUNT(*) AS total_patients,


SUM(
    CASE
        WHEN readmitted_30_days = 'Yes'
        THEN 1
        ELSE 0
    END
) AS readmissions


FROM hospital_encounters


GROUP BY diabetes, hypertension;