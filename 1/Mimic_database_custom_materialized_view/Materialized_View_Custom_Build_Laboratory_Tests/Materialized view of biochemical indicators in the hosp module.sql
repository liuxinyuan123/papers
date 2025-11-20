create materialized view if not exists 生化_hosp_白蛋白 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS albumin,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50862;

alter materialized view 生化_hosp_白蛋白 owner to postgres;

create materialized view if not exists 生化_hosp_球蛋白 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS globulin,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50930;

alter materialized view 生化_hosp_球蛋白 owner to postgres;

create materialized view if not exists 生化_hosp_总蛋白 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS total_protein,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50976;

alter materialized view 生化_hosp_总蛋白 owner to postgres;

create materialized view if not exists 生化_hosp_阴离子间隙 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS aniongap,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50868;

alter materialized view 生化_hosp_阴离子间隙 owner to postgres;

create materialized view if not exists 生化_hosp_二氧化碳 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS bicarbonate,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50882;

alter materialized view 生化_hosp_二氧化碳 owner to postgres;

create materialized view if not exists 生化_hosp_尿素氮 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS urea_nitrogen,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 51006;

alter materialized view 生化_hosp_尿素氮 owner to postgres;

create materialized view if not exists 生化_hosp_肌酐 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS creatinine,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50912;

alter materialized view 生化_hosp_肌酐 owner to postgres;

create materialized view if not exists 生化_hosp_葡萄糖 as
SELECT
	subject_id,
	hadm_id,
	itemid,
	charttime,
	valuenum                                                                AS glucose,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50931;

alter materialized view 生化_hosp_葡萄糖 owner to postgres;

create materialized view if not exists 生化_hosp_钠 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS sodium,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50983;

alter materialized view 生化_hosp_钠 owner to postgres;

create materialized view if not exists 生化_hosp_氯 as
SELECT
	subject_id,
	hadm_id,
	charttime,
	valuenum                                                                AS chloride,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_hosp.labevents
WHERE
	itemid = 50902;

alter materialized view 生化_hosp_氯 owner to postgres;
