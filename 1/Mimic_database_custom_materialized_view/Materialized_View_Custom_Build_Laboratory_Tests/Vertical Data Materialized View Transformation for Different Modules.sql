create materialized view if not exists icu甘油三酯 as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS triglycerides_value,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents l
  WHERE itemid = 51000;

alter materialized view icu甘油三酯 owner to postgres;

create materialized view if not exists 血常规_hosp_血红蛋白 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS hemoglobin,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51222;

alter materialized view 血常规_hosp_血红蛋白 owner to postgres;

create materialized view if not exists 血常规_hosp_mch as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS mch,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51248;

alter materialized view 血常规_hosp_mch owner to postgres;

create materialized view if not exists 血常规_hosp_mchc as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS mchc,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51249;

alter materialized view 血常规_hosp_mchc owner to postgres;

create materialized view if not exists 血常规_hosp_mcv as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS mcv,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51250;

alter materialized view 血常规_hosp_mcv owner to postgres;

create materialized view if not exists 血常规_hosp_血小板 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS platelet,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51265;

alter materialized view 血常规_hosp_血小板 owner to postgres;

create materialized view if not exists 血常规_hosp_红细胞 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS rbc,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51279;

alter materialized view 血常规_hosp_红细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_白细胞 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS wbc,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51301;

alter materialized view 血常规_hosp_白细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_中性粒细胞 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS neutrophils,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51256;

alter materialized view 血常规_hosp_中性粒细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_淋巴细胞 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS absolute_lymphocyte_count,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51133;

alter materialized view 血常规_hosp_淋巴细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_单核细胞 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS monocyte_count,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51254;

alter materialized view 血常规_hosp_单核细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_c反应蛋白 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS c_reactive_protein,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50889;

alter materialized view 血常规_hosp_c反应蛋白 owner to postgres;

create materialized view if not exists 生化_hosp_白蛋白 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS albumin,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50862;

alter materialized view 生化_hosp_白蛋白 owner to postgres;

create materialized view if not exists 生化_hosp_球蛋白 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS globulin,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50930;

alter materialized view 生化_hosp_球蛋白 owner to postgres;

create materialized view if not exists 生化_hosp_总蛋白 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS total_protein,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50976;

alter materialized view 生化_hosp_总蛋白 owner to postgres;

create materialized view if not exists 生化_hosp_阴离子间隙 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS aniongap,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50868;

alter materialized view 生化_hosp_阴离子间隙 owner to postgres;

create materialized view if not exists 生化_hosp_二氧化碳 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS bicarbonate,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50882;

alter materialized view 生化_hosp_二氧化碳 owner to postgres;

create materialized view if not exists 生化_hosp_尿素氮 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS urea_nitrogen,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 51006;

alter materialized view 生化_hosp_尿素氮 owner to postgres;

create materialized view if not exists 生化_hosp_肌酐 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS creatinine,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50912;

alter materialized view 生化_hosp_肌酐 owner to postgres;

create materialized view if not exists 生化_hosp_葡萄糖 as
SELECT subject_id,
    hadm_id,
    itemid,
    charttime,
    valuenum AS glucose,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50931;

alter materialized view 生化_hosp_葡萄糖 owner to postgres;

create materialized view if not exists 生化_hosp_钠 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS sodium,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50983;

alter materialized view 生化_hosp_钠 owner to postgres;

create materialized view if not exists 生化_hosp_氯 as
SELECT subject_id,
    hadm_id,
    charttime,
    valuenum AS chloride,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime) AS rn
   FROM mimiciv_hosp.labevents
  WHERE itemid = 50902;

alter materialized view 生化_hosp_氯 owner to postgres;

create materialized view if not exists icu指尖血糖 as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS glucose_value,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 225664
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu指尖血糖 owner to postgres;

create index if not exists icu指尖血糖_subject_id_index
	on icu指尖血糖 (subject_id, hadm_id, stay_id, charttime, glucose_value);

create materialized view if not exists icu心率 as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS heart_rate_value,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 220045
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu心率 owner to postgres;

create index if not exists icu心率_subject_id_index
	on icu心率 (subject_id, hadm_id, stay_id, charttime, heart_rate_value);

create materialized view if not exists icu呼吸 as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS resp_rate,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 220210 OR itemid = 224690
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu呼吸 owner to postgres;

create index if not exists icu呼吸_subject_id_index
	on icu呼吸 (subject_id, hadm_id, stay_id, charttime, resp_rate);

create materialized view if not exists icu_sbp as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS sbp,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 220179
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu_sbp owner to postgres;

create index if not exists icu_sbp_subject_id_index
	on icu_sbp (subject_id, hadm_id, stay_id, charttime, sbp);

create index if not exists icu_sbp_subject_id_index_2
	on icu_sbp (subject_id, hadm_id, stay_id, charttime, valueuom);

create materialized view if not exists icu_dbp as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS dbp,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 220180
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu_dbp owner to postgres;

create index if not exists icu_dbp_subject_id_index
	on icu_dbp (subject_id, hadm_id, stay_id, charttime, dbp);

create materialized view if not exists icu_so2 as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS so2,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 220277
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu_so2 owner to postgres;

create index if not exists icu_so2_subject_id_index
	on icu_so2 (subject_id, hadm_id, stay_id, charttime, so2);

create materialized view if not exists icu_mbp as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS mbp,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 220181
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu_mbp owner to postgres;

create index if not exists icu_mbp_subject_id_index
	on icu_mbp (subject_id, hadm_id, stay_id, charttime, mbp);

create materialized view if not exists icu_temperature_c as
SELECT subject_id,
    hadm_id,
    stay_id,
    charttime,
    valuenum AS temperature,
    valueuom,
    row_number() OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
   FROM mimiciv_icu.chartevents
  WHERE itemid = 223762
  ORDER BY subject_id, hadm_id, stay_id;

alter materialized view icu_temperature_c owner to postgres;

create index if not exists icu_temperature_subject_id_index
	on icu_temperature_c (subject_id, hadm_id, stay_id, charttime, temperature);
