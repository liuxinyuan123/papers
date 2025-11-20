create materialized view if not exists 血常规_hosp_血红蛋白 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS hemoglobin,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51222;

alter materialized view 血常规_hosp_血红蛋白 owner to postgres;

create materialized view if not exists 血常规_hosp_mch as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS mch,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51248;

alter materialized view 血常规_hosp_mch owner to postgres;

create materialized view if not exists 血常规_hosp_mchc as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS mchc,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51249;

alter materialized view 血常规_hosp_mchc owner to postgres;

create materialized view if not exists 血常规_hosp_mcv as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS mcv,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51250;

alter materialized view 血常规_hosp_mcv owner to postgres;

create materialized view if not exists 血常规_hosp_血小板 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS platelet,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51265;

alter materialized view 血常规_hosp_血小板 owner to postgres;

create materialized view if not exists 血常规_hosp_红细胞 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS rbc,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51279;

alter materialized view 血常规_hosp_红细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_白细胞 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS wbc,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51301;

alter materialized view 血常规_hosp_白细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_中性粒细胞 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS neutrophils,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51256;

alter materialized view 血常规_hosp_中性粒细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_淋巴细胞 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS absolute_lymphocyte_count,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51133;

alter materialized view 血常规_hosp_淋巴细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_单核细胞 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS monocyte_count,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51254;

alter materialized view 血常规_hosp_单核细胞 owner to postgres;

create materialized view if not exists 血常规_hosp_c反应蛋白 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS c_reactive_protein,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50889;

alter materialized view 血常规_hosp_c反应蛋白 owner to postgres;
