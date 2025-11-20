WITH cases AS (
         SELECT diagnoses_icd.subject_id,
            diagnoses_icd.hadm_id,
            diagnoses_icd.seq_num,
            diagnoses_icd.icd_code,
            diagnoses_icd.icd_version
           FROM mimiciv_hosp.diagnoses_icd diagnoses_icd
          WHERE (diagnoses_icd.icd_version = 9 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ '433_1'::text AND length(TRIM(BOTH FROM diagnoses_icd.icd_code)) = 5 OR diagnoses_icd.icd_version = 9 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ '434_1'::text AND length(TRIM(BOTH FROM diagnoses_icd.icd_code)) = 5 OR diagnoses_icd.icd_version = 10 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ 'I63%'::text OR diagnoses_icd.icd_version = 9 AND (TRIM(BOTH FROM diagnoses_icd.icd_code) = ANY (ARRAY['430'::text, '431'::text, '432_1'::text])) AND length(TRIM(BOTH FROM diagnoses_icd.icd_code)) = 5 OR diagnoses_icd.icd_version = 10 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ 'I60%'::text OR diagnoses_icd.icd_version = 10 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ 'I61%'::text OR diagnoses_icd.icd_version = 10 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ 'I62%'::text OR diagnoses_icd.icd_version = 9 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ '410_1'::text AND length(TRIM(BOTH FROM diagnoses_icd.icd_code)) = 5 OR diagnoses_icd.icd_version = 10 AND TRIM(BOTH FROM diagnoses_icd.icd_code) ~~ 'I21%'::text) AND diagnoses_icd.seq_num = 1
        ), icu_cases AS (
         SELECT icustays.subject_id,
            icustays.hadm_id,
            min(icustays.stay_id) AS stay_id
           FROM mimiciv_icu.icustays
          GROUP BY icustays.subject_id, icustays.hadm_id
        ), ventilation AS (
         SELECT ventilation.stay_id,
                CASE
                    WHEN ventilation.ventilation_status = ANY (ARRAY['InvasiveVent'::text, 'Tracheostomy'::text]) THEN 1
                    ELSE 0
                END AS invasivevent,
                CASE
                    WHEN ventilation.ventilation_status = 'SupplementalOxygen'::text AND (ventilation.ventilation_status <> ALL (ARRAY['InvasiveVent'::text, 'Tracheostomy'::text])) THEN 1
                    ELSE 0
                END AS supplementaloxygen
           FROM mimiciv_derived.ventilation
          GROUP BY ventilation.stay_id, ventilation.ventilation_status
        ), ventilation_combined AS (
         SELECT ventilation.stay_id,
            max(ventilation.invasivevent) AS invasivevent,
            max(ventilation.supplementaloxygen) AS supplementaloxygen
           FROM ventilation
          GROUP BY ventilation.stay_id
        ), icu_los AS (
         SELECT icustays.subject_id,
            icustays.hadm_id,
            icustays.stay_id,
            icustays.los,
            icustays.intime
           FROM mimiciv_icu.icustays
        )
 SELECT cases.hadm_id,
    cases.subject_id,
    icu_cases.stay_id,
    icu_los.intime AS icu_intime,
    icu_los.los,
    max(
        CASE
            WHEN cases.icd_version = 9 AND TRIM(BOTH FROM cases.icd_code) ~~ '433_1'::text AND length(TRIM(BOTH FROM cases.icd_code)) = 5 OR cases.icd_version = 9 AND TRIM(BOTH FROM cases.icd_code) ~~ '434_1'::text AND length(TRIM(BOTH FROM cases.icd_code)) = 5 OR cases.icd_version = 10 AND TRIM(BOTH FROM cases.icd_code) ~~ 'I63%'::text THEN 1
            ELSE 0
        END) AS is_cerebral_infarction,
    max(
        CASE
            WHEN cases.icd_version = 9 AND (TRIM(BOTH FROM cases.icd_code) = ANY (ARRAY['430'::text, '431'::text, '432_1'::text])) AND length(TRIM(BOTH FROM cases.icd_code)) = 5 OR cases.icd_version = 10 AND TRIM(BOTH FROM cases.icd_code) ~~ 'I60%'::text OR cases.icd_version = 10 AND TRIM(BOTH FROM cases.icd_code) ~~ 'I61%'::text OR cases.icd_version = 10 AND TRIM(BOTH FROM cases.icd_code) ~~ 'I62%'::text THEN 1
            ELSE 0
        END) AS is_cerebral_hemorrhage,
    max(
        CASE
            WHEN cases.icd_version = 9 AND TRIM(BOTH FROM cases.icd_code) ~~ '410_1'::text AND length(TRIM(BOTH FROM cases.icd_code)) = 5 OR cases.icd_version = 10 AND TRIM(BOTH FROM cases.icd_code) ~~ 'I21%'::text THEN 1
            ELSE 0
        END) AS is_myocardial_infarction,
    NULL::text AS ventilation_combined_title,
    max(ventilation_combined.invasivevent) AS invasivevent,
    max(ventilation_combined.supplementaloxygen) AS supplementaloxygen
   FROM icu_cases
     JOIN cases ON cases.subject_id = icu_cases.subject_id AND cases.hadm_id = icu_cases.hadm_id
     LEFT JOIN icu_los ON icu_cases.stay_id = icu_los.stay_id AND icu_cases.hadm_id = icu_los.hadm_id AND icu_cases.subject_id = icu_los.subject_id
     LEFT JOIN ventilation_combined ON icu_cases.stay_id = ventilation_combined.stay_id
  GROUP BY cases.hadm_id, cases.subject_id, icu_cases.stay_id, icu_los.intime, icu_los.los
