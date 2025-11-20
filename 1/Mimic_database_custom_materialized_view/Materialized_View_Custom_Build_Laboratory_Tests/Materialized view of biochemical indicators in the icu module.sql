create materialized view icu甘油三酯 as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                                AS triglycerides_value,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id ORDER BY charttime)              AS rn
FROM
	mimiciv_icu.chartevents l
WHERE
	itemid = 51000;

alter materialized view icu甘油三酯 owner to postgres;

create materialized view icu指尖血糖 as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS glucose_value,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	itemid = 225664
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu指尖血糖 owner to postgres;

create index icu指尖血糖_subject_id_index
	on icu指尖血糖 (subject_id, hadm_id, stay_id, charttime, glucose_value);

create materialized view icu心率 as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS heart_rate_value,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	itemid = 220045
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu心率 owner to postgres;

create index icu心率_subject_id_index
	on icu心率 (subject_id, hadm_id, stay_id, charttime, heart_rate_value);

create materialized view icu呼吸 as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS resp_rate,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	 itemid = 220210
  OR itemid = 224690
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu呼吸 owner to postgres;

create index icu呼吸_subject_id_index
	on icu呼吸 (subject_id, hadm_id, stay_id, charttime, resp_rate);

create materialized view icu_sbp as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS sbp,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	itemid = 220179
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu_sbp owner to postgres;

create index icu_sbp_subject_id_index
	on icu_sbp (subject_id, hadm_id, stay_id, charttime, sbp);

create materialized view icu_dbp as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS dbp,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	itemid = 220180
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu_dbp owner to postgres;

create index icu_dbp_subject_id_index
	on icu_dbp (subject_id, hadm_id, stay_id, charttime, dbp);

create materialized view icu_so2 as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS so2,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	itemid = 220277
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu_so2 owner to postgres;

create index icu_so2_subject_id_index
	on icu_so2 (subject_id, hadm_id, stay_id, charttime, so2);

create materialized view icu_mbp as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS mbp,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	itemid = 220181
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu_mbp owner to postgres;

create index icu_mbp_subject_id_index
	on icu_mbp (subject_id, hadm_id, stay_id, charttime, mbp);

create materialized view icu_temperature as
SELECT
	subject_id,
	hadm_id,
	stay_id,
	charttime,
	valuenum                                                            AS temperature,
	valueuom,
	row_number()
	OVER (PARTITION BY subject_id, hadm_id, stay_id ORDER BY charttime) AS rn
FROM
	mimiciv_icu.chartevents
WHERE
	itemid = 224642
ORDER BY
	subject_id, hadm_id, stay_id;

alter materialized view icu_temperature owner to postgres;

create index icu_temperature_subject_id_index
	on icu_temperature (subject_id, hadm_id, stay_id, charttime, temperature);
