create table if not exists icustay_times
(
	subject_id integer,
	hadm_id    integer,
	stay_id    integer,
	intime_hr  timestamp,
	outtime_hr timestamp
);

alter table icustay_times
	owner to postgres;

create table if not exists icustay_hourly
(
	stay_id integer,
	hr      bigint,
	endtime timestamp
);

alter table icustay_hourly
	owner to postgres;

create table if not exists weight_durations
(
	stay_id     integer,
	starttime   timestamp,
	endtime     timestamp,
	weight      double precision,
	weight_type text
);

alter table weight_durations
	owner to postgres;

create table if not exists kdigo_uo
(
	stay_id          integer,
	charttime        timestamp(3),
	weight           double precision,
	urineoutput_6hr  double precision,
	urineoutput_12hr double precision,
	urineoutput_24hr double precision,
	uo_rt_6hr        numeric,
	uo_rt_12hr       numeric,
	uo_rt_24hr       numeric,
	uo_tm_6hr        double precision,
	uo_tm_12hr       double precision,
	uo_tm_24hr       double precision
);

alter table kdigo_uo
	owner to postgres;

create table if not exists age
(
	subject_id  integer,
	hadm_id     integer,
	admittime   timestamp,
	anchor_age  smallint,
	anchor_year smallint,
	age         numeric
);

alter table age
	owner to postgres;

create index if not exists age_subject_id_hadm_id_admittime__index
	on age (subject_id, hadm_id, admittime);

create table if not exists icustay_detail
(
	subject_id           integer,
	hadm_id              integer,
	stay_id              integer,
	gender               char,
	dod                  date,
	admittime            timestamp,
	dischtime            timestamp,
	los_hospital         numeric,
	admission_age        numeric,
	race                 varchar(80),
	hospital_expire_flag smallint,
	hospstay_seq         bigint,
	first_hosp_stay      boolean,
	icu_intime           timestamp,
	icu_outtime          timestamp,
	los_icu              numeric,
	icustay_seq          bigint,
	first_icu_stay       boolean
);

alter table icustay_detail
	owner to postgres;

create table if not exists bg
(
	subject_id        integer,
	hadm_id           integer,
	charttime         timestamp,
	specimen          text,
	so2               double precision,
	po2               double precision,
	pco2              double precision,
	fio2_chartevents  double precision,
	fio2              double precision,
	aado2             double precision,
	aado2_calc        double precision,
	pao2fio2ratio     double precision,
	ph                double precision,
	baseexcess        double precision,
	bicarbonate       double precision,
	totalco2          double precision,
	hematocrit        double precision,
	hemoglobin        double precision,
	carboxyhemoglobin double precision,
	methemoglobin     double precision,
	chloride          double precision,
	calcium           double precision,
	temperature       double precision,
	potassium         double precision,
	sodium            double precision,
	lactate           double precision,
	glucose           double precision
);

alter table bg
	owner to postgres;

create table if not exists blood_differential
(
	subject_id            integer,
	hadm_id               integer,
	charttime             timestamp,
	specimen_id           integer,
	wbc                   double precision,
	basophils_abs         numeric,
	eosinophils_abs       numeric,
	lymphocytes_abs       numeric,
	monocytes_abs         numeric,
	neutrophils_abs       numeric,
	basophils             double precision,
	eosinophils           double precision,
	lymphocytes           double precision,
	monocytes             double precision,
	neutrophils           double precision,
	atypical_lymphocytes  double precision,
	bands                 double precision,
	immature_granulocytes double precision,
	metamyelocytes        double precision,
	nrbc                  double precision
);

alter table blood_differential
	owner to postgres;

create table if not exists cardiac_marker
(
	subject_id  integer,
	hadm_id     integer,
	charttime   timestamp,
	specimen_id integer,
	troponin_t  double precision,
	ck_mb       double precision,
	ntprobnp    double precision
);

alter table cardiac_marker
	owner to postgres;

create table if not exists chemistry
(
	subject_id    integer,
	hadm_id       integer,
	charttime     timestamp,
	specimen_id   integer,
	albumin       double precision,
	globulin      double precision,
	total_protein double precision,
	aniongap      double precision,
	bicarbonate   double precision,
	bun           double precision,
	calcium       double precision,
	chloride      double precision,
	creatinine    double precision,
	glucose       double precision,
	sodium        double precision,
	potassium     double precision
);

alter table chemistry
	owner to postgres;

create table if not exists coagulation
(
	subject_id  integer,
	hadm_id     integer,
	charttime   timestamp,
	specimen_id integer,
	d_dimer     double precision,
	fibrinogen  double precision,
	thrombin    double precision,
	inr         double precision,
	pt          double precision,
	ptt         double precision
);

alter table coagulation
	owner to postgres;

create table if not exists complete_blood_count
(
	subject_id  integer,
	hadm_id     integer,
	charttime   timestamp,
	specimen_id integer,
	hematocrit  double precision,
	hemoglobin  double precision,
	mch         double precision,
	mchc        double precision,
	mcv         double precision,
	platelet    double precision,
	rbc         double precision,
	rdw         double precision,
	rdwsd       double precision,
	wbc         double precision
);

alter table complete_blood_count
	owner to postgres;

create index if not exists complete_blood_count_subject_id_hadm_id_charttime_specimen_id_i
	on complete_blood_count (subject_id, hadm_id, charttime, specimen_id);

create table if not exists creatinine_baseline
(
	hadm_id      integer,
	gender       char,
	age          numeric,
	scr_min      double precision,
	ckd          integer,
	mdrd_est     double precision,
	scr_baseline double precision
);

alter table creatinine_baseline
	owner to postgres;

create table if not exists enzyme
(
	subject_id         integer,
	hadm_id            integer,
	charttime          timestamp,
	specimen_id        integer,
	alt                double precision,
	alp                double precision,
	ast                double precision,
	amylase            double precision,
	bilirubin_total    double precision,
	bilirubin_direct   double precision,
	bilirubin_indirect double precision,
	ck_cpk             double precision,
	ck_mb              double precision,
	ggt                double precision,
	ld_ldh             double precision
);

alter table enzyme
	owner to postgres;

create table if not exists gcs
(
	subject_id integer,
	stay_id    integer,
	charttime  timestamp,
	gcs        double precision,
	gcs_motor  double precision,
	gcs_verbal double precision,
	gcs_eyes   double precision,
	gcs_unable integer
);

alter table gcs
	owner to postgres;

create table if not exists height
(
	subject_id integer,
	stay_id    integer,
	charttime  timestamp,
	height     numeric
);

alter table height
	owner to postgres;

create table if not exists icp
(
	subject_id integer,
	stay_id    integer,
	charttime  timestamp,
	icp        double precision
);

alter table icp
	owner to postgres;

create index if not exists idx_icp_composite
	on icp (subject_id, stay_id);

create table if not exists oxygen_delivery
(
	subject_id           integer,
	stay_id              integer,
	charttime            timestamp,
	o2_flow              double precision,
	o2_flow_additional   double precision,
	o2_delivery_device_1 text,
	o2_delivery_device_2 text,
	o2_delivery_device_3 text,
	o2_delivery_device_4 text
);

alter table oxygen_delivery
	owner to postgres;

create table if not exists rhythm
(
	subject_id                 integer,
	charttime                  timestamp,
	heart_rhythm               text,
	ectopy_type                text,
	ectopy_frequency           text,
	ectopy_type_secondary      text,
	ectopy_frequency_secondary text
);

alter table rhythm
	owner to postgres;

create table if not exists urine_output_rate
(
	stay_id          integer,
	charttime        timestamp(3),
	weight           double precision,
	uo               double precision,
	urineoutput_6hr  double precision,
	urineoutput_12hr double precision,
	urineoutput_24hr double precision,
	uo_mlkghr_6hr    numeric,
	uo_mlkghr_12hr   numeric,
	uo_mlkghr_24hr   numeric,
	uo_tm_6hr        numeric,
	uo_tm_12hr       numeric,
	uo_tm_24hr       numeric
);

alter table urine_output_rate
	owner to postgres;

create table if not exists ventilator_setting
(
	subject_id                   integer,
	stay_id                      integer,
	charttime                    timestamp,
	respiratory_rate_set         double precision,
	respiratory_rate_total       double precision,
	respiratory_rate_spontaneous double precision,
	minute_volume                double precision,
	tidal_volume_set             double precision,
	tidal_volume_observed        double precision,
	tidal_volume_spontaneous     double precision,
	plateau_pressure             double precision,
	peep                         double precision,
	fio2                         double precision,
	flow_rate                    double precision,
	ventilator_mode              text,
	ventilator_mode_hamilton     text,
	ventilator_type              text
);

alter table ventilator_setting
	owner to postgres;

create table if not exists vitalsign
(
	subject_id       integer,
	stay_id          integer,
	charttime        timestamp,
	heart_rate       double precision,
	sbp              double precision,
	dbp              double precision,
	mbp              double precision,
	sbp_ni           double precision,
	dbp_ni           double precision,
	mbp_ni           double precision,
	resp_rate        double precision,
	temperature      numeric,
	temperature_site text,
	spo2             double precision,
	glucose          double precision
);

alter table vitalsign
	owner to postgres;

create index if not exists vitalsign_subject_id_stay_id_index
	on vitalsign (subject_id, stay_id);

create index if not exists vitalsign_subject_id_stay_id_charttime_index
	on vitalsign (subject_id, stay_id, charttime);

create table if not exists charlson
(
	subject_id                  integer,
	hadm_id                     integer,
	age_score                   integer,
	myocardial_infarct          integer,
	congestive_heart_failure    integer,
	peripheral_vascular_disease integer,
	cerebrovascular_disease     integer,
	dementia                    integer,
	chronic_pulmonary_disease   integer,
	rheumatic_disease           integer,
	peptic_ulcer_disease        integer,
	mild_liver_disease          integer,
	diabetes_without_cc         integer,
	diabetes_with_cc            integer,
	paraplegia                  integer,
	renal_disease               integer,
	malignant_cancer            integer,
	severe_liver_disease        integer,
	metastatic_solid_tumor      integer,
	aids                        integer,
	charlson_comorbidity_index  integer
);

alter table charlson
	owner to postgres;

create index if not exists charlson_subject_id_hadm_id_index
	on charlson (subject_id, hadm_id);

create index if not exists idx_charlson_composite
	on charlson (subject_id, hadm_id);

create table if not exists acei
(
	subject_id integer,
	hadm_id    integer,
	acei       varchar(255),
	starttime  timestamp(3),
	stoptime   timestamp(3)
);

alter table acei
	owner to postgres;

create table if not exists antibiotic
(
	subject_id integer,
	hadm_id    integer,
	stay_id    integer,
	antibiotic varchar(255),
	route      varchar(50),
	starttime  timestamp(3),
	stoptime   timestamp(3)
);

alter table antibiotic
	owner to postgres;

create table if not exists dobutamine
(
	stay_id     integer,
	linkorderid integer,
	vaso_rate   double precision,
	vaso_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table dobutamine
	owner to postgres;

create table if not exists dopamine
(
	stay_id     integer,
	linkorderid integer,
	vaso_rate   double precision,
	vaso_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table dopamine
	owner to postgres;

create table if not exists epinephrine
(
	stay_id     integer,
	linkorderid integer,
	vaso_rate   double precision,
	vaso_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table epinephrine
	owner to postgres;

create table if not exists milrinone
(
	stay_id     integer,
	linkorderid integer,
	vaso_rate   double precision,
	vaso_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table milrinone
	owner to postgres;

create table if not exists neuroblock
(
	stay_id     integer,
	orderid     integer,
	drug_rate   double precision,
	drug_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table neuroblock
	owner to postgres;

create table if not exists norepinephrine
(
	stay_id     integer,
	linkorderid integer,
	vaso_rate   double precision,
	vaso_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table norepinephrine
	owner to postgres;

create table if not exists nsaid
(
	subject_id integer,
	hadm_id    integer,
	nsaid      varchar(255),
	starttime  timestamp(3),
	stoptime   timestamp(3)
);

alter table nsaid
	owner to postgres;

create table if not exists phenylephrine
(
	stay_id     integer,
	linkorderid integer,
	vaso_rate   double precision,
	vaso_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table phenylephrine
	owner to postgres;

create table if not exists vasopressin
(
	stay_id     integer,
	linkorderid integer,
	vaso_rate   double precision,
	vaso_amount double precision,
	starttime   timestamp,
	endtime     timestamp
);

alter table vasopressin
	owner to postgres;

create table if not exists crrt
(
	stay_id                      integer,
	charttime                    timestamp,
	crrt_mode                    text,
	access_pressure              double precision,
	blood_flow                   double precision,
	citrate                      double precision,
	current_goal                 double precision,
	dialysate_fluid              text,
	dialysate_rate               double precision,
	effluent_pressure            double precision,
	filter_pressure              double precision,
	heparin_concentration        text,
	heparin_dose                 double precision,
	hourly_patient_fluid_removal double precision,
	prefilter_replacement_rate   double precision,
	postfilter_replacement_rate  double precision,
	replacement_fluid            text,
	replacement_rate             double precision,
	return_pressure              double precision,
	ultrafiltrate_output         double precision,
	system_active                integer,
	clots                        integer,
	clots_increasing             integer,
	clotted                      integer
);

alter table crrt
	owner to postgres;

create table if not exists invasive_line
(
	stay_id   integer,
	line_type varchar,
	line_site varchar,
	starttime timestamp,
	endtime   timestamp
);

alter table invasive_line
	owner to postgres;

create table if not exists rrt
(
	stay_id          integer,
	charttime        timestamp,
	dialysis_present integer,
	dialysis_active  integer,
	dialysis_type    text
);

alter table rrt
	owner to postgres;

create table if not exists ventilation
(
	stay_id            integer,
	starttime          timestamp,
	endtime            timestamp,
	ventilation_status text
);

alter table ventilation
	owner to postgres;

create index if not exists ventilation_stay_id_ventilation_status_starttime_endtime_index
	on ventilation (stay_id, ventilation_status, starttime, endtime);

create index if not exists idx_ventilation_stay_id
	on ventilation (stay_id);

create table if not exists kdigo_creatinine
(
	hadm_id             integer,
	stay_id             integer,
	charttime           timestamp(0),
	creat               double precision,
	creat_low_past_48hr double precision,
	creat_low_past_7day double precision
);

alter table kdigo_creatinine
	owner to postgres;

create table if not exists apsiii
(
	subject_id       integer,
	hadm_id          integer,
	stay_id          integer,
	apsiii           integer,
	apsiii_prob      double precision,
	hr_score         integer,
	mbp_score        integer,
	temp_score       integer,
	resp_rate_score  integer,
	pao2_aado2_score integer,
	hematocrit_score integer,
	wbc_score        integer,
	creatinine_score integer,
	uo_score         integer,
	bun_score        integer,
	sodium_score     integer,
	albumin_score    integer,
	bilirubin_score  integer,
	glucose_score    integer,
	acidbase_score   integer,
	gcs_score        integer
);

alter table apsiii
	owner to postgres;

create index if not exists idx_apsiii_composite
	on apsiii (subject_id, hadm_id, stay_id);

create table if not exists lods
(
	subject_id     integer,
	hadm_id        integer,
	stay_id        integer,
	lods           integer,
	neurologic     integer,
	cardiovascular integer,
	renal          integer,
	pulmonary      integer,
	hematologic    integer,
	hepatic        integer
);

alter table lods
	owner to postgres;

create table if not exists oasis
(
	subject_id            integer,
	hadm_id               integer,
	stay_id               integer,
	oasis                 integer,
	oasis_prob            double precision,
	age                   numeric,
	age_score             integer,
	preiculos             numeric,
	preiculos_score       integer,
	gcs                   double precision,
	gcs_score             integer,
	heartrate             double precision,
	heart_rate_score      integer,
	meanbp                double precision,
	mbp_score             integer,
	resprate              double precision,
	resp_rate_score       integer,
	temp                  double precision,
	temp_score            integer,
	urineoutput           double precision,
	urineoutput_score     integer,
	mechvent              integer,
	mechvent_score        integer,
	electivesurgery       integer,
	electivesurgery_score integer
);

alter table oasis
	owner to postgres;

create index if not exists idx_oasis_composite
	on oasis (subject_id, hadm_id, stay_id);

create table if not exists sapsii
(
	subject_id          integer,
	hadm_id             integer,
	stay_id             integer,
	starttime           timestamp,
	endtime             timestamp,
	sapsii              integer,
	sapsii_prob         double precision,
	age_score           integer,
	hr_score            integer,
	sysbp_score         integer,
	temp_score          integer,
	pao2fio2_score      integer,
	uo_score            integer,
	bun_score           integer,
	wbc_score           integer,
	potassium_score     integer,
	sodium_score        integer,
	bicarbonate_score   integer,
	bilirubin_score     integer,
	gcs_score           integer,
	comorbidity_score   integer,
	admissiontype_score integer
);

alter table sapsii
	owner to postgres;

create index if not exists idx_sapsii_composite
	on sapsii (subject_id, hadm_id, stay_id);

create table if not exists sofa
(
	stay_id                integer,
	hr                     bigint,
	starttime              timestamp,
	endtime                timestamp,
	pao2fio2ratio_novent   double precision,
	pao2fio2ratio_vent     double precision,
	rate_epinephrine       double precision,
	rate_norepinephrine    double precision,
	rate_dopamine          double precision,
	rate_dobutamine        double precision,
	meanbp_min             double precision,
	gcs_min                double precision,
	uo_24hr                double precision,
	bilirubin_max          double precision,
	creatinine_max         double precision,
	platelet_min           double precision,
	respiration            integer,
	coagulation            integer,
	liver                  integer,
	cardiovascular         integer,
	cns                    integer,
	renal                  integer,
	respiration_24hours    integer,
	coagulation_24hours    integer,
	liver_24hours          integer,
	cardiovascular_24hours integer,
	cns_24hours            integer,
	renal_24hours          integer,
	sofa_24hours           integer
);

alter table sofa
	owner to postgres;

create table if not exists suspicion_of_infection
(
	subject_id               integer,
	stay_id                  integer,
	hadm_id                  integer,
	ab_id                    bigint,
	antibiotic               varchar(255),
	antibiotic_time          timestamp(3),
	suspected_infection      integer,
	suspected_infection_time timestamp,
	culture_time             timestamp,
	specimen                 text,
	positive_culture         integer
);

alter table suspicion_of_infection
	owner to postgres;

create table if not exists kdigo_stages
(
	subject_id          integer,
	hadm_id             integer,
	stay_id             integer,
	charttime           timestamp,
	creat_low_past_7day double precision,
	creat_low_past_48hr double precision,
	creat               double precision,
	aki_stage_creat     integer,
	uo_rt_6hr           numeric,
	uo_rt_12hr          numeric,
	uo_rt_24hr          numeric,
	aki_stage_uo        integer,
	aki_stage_crrt      integer,
	aki_stage           integer,
	aki_stage_smoothed  integer
);

alter table kdigo_stages
	owner to postgres;

create table if not exists sepsis3
(
	subject_id               integer,
	stay_id                  integer,
	antibiotic_time          timestamp(3),
	culture_time             timestamp,
	suspected_infection_time timestamp,
	sofa_time                timestamp,
	sofa_score               integer,
	respiration              integer,
	coagulation              integer,
	liver                    integer,
	cardiovascular           integer,
	cns                      integer,
	renal                    integer,
	sepsis3                  boolean
);

alter table sepsis3
	owner to postgres;

create table if not exists vasoactive_agent
(
	stay_id        integer,
	starttime      timestamp,
	endtime        timestamp,
	dopamine       double precision,
	epinephrine    double precision,
	norepinephrine double precision,
	phenylephrine  double precision,
	vasopressin    double precision,
	dobutamine     double precision,
	milrinone      double precision
);

alter table vasoactive_agent
	owner to postgres;

create table if not exists norepinephrine_equivalent_dose
(
	stay_id                        integer,
	starttime                      timestamp,
	endtime                        timestamp,
	norepinephrine_equivalent_dose numeric
);

alter table norepinephrine_equivalent_dose
	owner to postgres;

create table if not exists first_day_bg
(
	subject_id            integer,
	hadm_id               integer,
	stay_id               integer,
	lactate_min           double precision,
	lactate_max           double precision,
	ph_min                double precision,
	ph_max                double precision,
	so2_min               double precision,
	so2_max               double precision,
	po2_min               double precision,
	po2_max               double precision,
	pco2_min              double precision,
	pco2_max              double precision,
	aado2_min             double precision,
	aado2_max             double precision,
	aado2_calc_min        double precision,
	aado2_calc_max        double precision,
	pao2fio2ratio_min     double precision,
	pao2fio2ratio_max     double precision,
	baseexcess_min        double precision,
	baseexcess_max        double precision,
	bicarbonate_min       double precision,
	bicarbonate_max       double precision,
	totalco2_min          double precision,
	totalco2_max          double precision,
	hematocrit_min        double precision,
	hematocrit_max        double precision,
	hemoglobin_min        double precision,
	hemoglobin_max        double precision,
	carboxyhemoglobin_min double precision,
	carboxyhemoglobin_max double precision,
	methemoglobin_min     double precision,
	methemoglobin_max     double precision,
	temperature_min       double precision,
	temperature_max       double precision,
	chloride_min          double precision,
	chloride_max          double precision,
	calcium_min           double precision,
	calcium_max           double precision,
	glucose_min           double precision,
	glucose_max           double precision,
	potassium_min         double precision,
	potassium_max         double precision,
	sodium_min            double precision,
	sodium_max            double precision
);

alter table first_day_bg
	owner to postgres;

create index if not exists idx_first_day_bg_composite
	on first_day_bg (subject_id, hadm_id, stay_id);

create table if not exists first_day_height
(
	subject_id integer,
	stay_id    integer,
	hadm_id    integer,
	height     numeric
);

alter table first_day_height
	owner to postgres;

create index if not exists idx_first_day_height_composite
	on first_day_height (subject_id, stay_id);

create table if not exists first_day_rrt
(
	subject_id       integer,
	hadm_id          integer,
	stay_id          integer,
	dialysis_present integer,
	dialysis_active  integer,
	dialysis_type    text
);

alter table first_day_rrt
	owner to postgres;

create table if not exists first_day_sofa
(
	subject_id     integer,
	hadm_id        integer,
	stay_id        integer,
	sofa           integer,
	respiration    integer,
	coagulation    integer,
	liver          integer,
	cardiovascular integer,
	cns            integer,
	renal          integer
);

alter table first_day_sofa
	owner to postgres;

create index if not exists first_day_sofa_subject_id_hadm_id_stay_id_index
	on first_day_sofa (subject_id desc, hadm_id desc, stay_id desc);

create index if not exists idx_first_day_sofa_composite
	on first_day_sofa (subject_id, hadm_id, stay_id);

create table if not exists first_day_urine_output
(
	subject_id  integer,
	hadm_id     integer,
	stay_id     integer,
	urineoutput double precision
);

alter table first_day_urine_output
	owner to postgres;

create index if not exists idx_first_day_urine_output_composite
	on first_day_urine_output (subject_id, hadm_id, stay_id);

create table if not exists first_day_vitalsign
(
	subject_id       integer,
	hadm_id          integer,
	stay_id          integer,
	heart_rate_min   double precision,
	heart_rate_max   double precision,
	heart_rate_mean  double precision,
	sbp_min          double precision,
	sbp_max          double precision,
	sbp_mean         double precision,
	dbp_min          double precision,
	dbp_max          double precision,
	dbp_mean         double precision,
	mbp_min          double precision,
	mbp_max          double precision,
	mbp_mean         double precision,
	resp_rate_min    double precision,
	resp_rate_max    double precision,
	resp_rate_mean   double precision,
	temperature_min  numeric,
	temperature_max  numeric,
	temperature_mean numeric,
	spo2_min         double precision,
	spo2_max         double precision,
	spo2_mean        double precision,
	glucose_min      double precision,
	glucose_max      double precision,
	glucose_mean     double precision
);

alter table first_day_vitalsign
	owner to postgres;

create index if not exists idx_first_day_vitalsign_composite
	on first_day_vitalsign (subject_id, hadm_id, stay_id);

create table if not exists first_day_weight
(
	subject_id   integer,
	hadm_id      integer,
	stay_id      integer,
	weight_admit double precision,
	weight       double precision,
	weight_min   double precision,
	weight_max   double precision
);

alter table first_day_weight
	owner to postgres;

create index if not exists idx_first_day_weight_composite
	on first_day_weight (subject_id, hadm_id, stay_id);

create table if not exists first_day_gcs
(
	subject_id integer,
	hadm_id    integer,
	stay_id    integer,
	gcs_min    double precision,
	gcs_motor  double precision,
	gcs_verbal double precision,
	gcs_eyes   double precision,
	gcs_unable integer
);

alter table first_day_gcs
	owner to postgres;

create index if not exists idx_first_day_gcs_composite
	on first_day_gcs (subject_id, hadm_id, stay_id);

create table if not exists urine_output
(
	subject_id  integer,
	hadm_id     integer,
	stay_id     integer,
	charttime   timestamp(3),
	urineoutput double precision
);

alter table urine_output
	owner to postgres;

create table if not exists arb
(
	subject_id integer,
	hadm_id    integer,
	arb        varchar(255),
	starttime  timestamp(3),
	stoptime   timestamp(3)
);

alter table arb
	owner to postgres;

create table if not exists first_day_lab
(
	subject_id             integer,
	hadm_id                integer,
	stay_id                integer,
	hematocrit_min         double precision,
	hematocrit_max         double precision,
	hemoglobin_min         double precision,
	hemoglobin_max         double precision,
	platelets_min          double precision,
	platelets_max          double precision,
	wbc_min                double precision,
	wbc_max                double precision,
	albumin_min            double precision,
	albumin_max            double precision,
	globulin_min           double precision,
	globulin_max           double precision,
	total_protein_min      double precision,
	total_protein_max      double precision,
	aniongap_min           double precision,
	aniongap_max           double precision,
	bicarbonate_min        double precision,
	bicarbonate_max        double precision,
	bun_min                double precision,
	bun_max                double precision,
	calcium_min            double precision,
	calcium_max            double precision,
	chloride_min           double precision,
	chloride_max           double precision,
	creatinine_min         double precision,
	creatinine_max         double precision,
	glucose_min            double precision,
	glucose_max            double precision,
	sodium_min             double precision,
	sodium_max             double precision,
	potassium_min          double precision,
	potassium_max          double precision,
	abs_basophils_min      numeric,
	abs_basophils_max      numeric,
	abs_eosinophils_min    numeric,
	abs_eosinophils_max    numeric,
	abs_lymphocytes_min    numeric,
	abs_lymphocytes_max    numeric,
	abs_monocytes_min      numeric,
	abs_monocytes_max      numeric,
	abs_neutrophils_min    numeric,
	abs_neutrophils_max    numeric,
	atyps_min              double precision,
	atyps_max              double precision,
	bands_min              double precision,
	bands_max              double precision,
	imm_granulocytes_min   double precision,
	imm_granulocytes_max   double precision,
	metas_min              double precision,
	metas_max              double precision,
	nrbc_min               double precision,
	nrbc_max               double precision,
	d_dimer_min            double precision,
	d_dimer_max            double precision,
	fibrinogen_min         double precision,
	fibrinogen_max         double precision,
	thrombin_min           double precision,
	thrombin_max           double precision,
	inr_min                double precision,
	inr_max                double precision,
	pt_min                 double precision,
	pt_max                 double precision,
	ptt_min                double precision,
	ptt_max                double precision,
	alt_min                double precision,
	alt_max                double precision,
	alp_min                double precision,
	alp_max                double precision,
	ast_min                double precision,
	ast_max                double precision,
	amylase_min            double precision,
	amylase_max            double precision,
	bilirubin_total_min    double precision,
	bilirubin_total_max    double precision,
	bilirubin_direct_min   double precision,
	bilirubin_direct_max   double precision,
	bilirubin_indirect_min double precision,
	bilirubin_indirect_max double precision,
	ck_cpk_min             double precision,
	ck_cpk_max             double precision,
	ck_mb_min              double precision,
	ck_mb_max              double precision,
	ggt_min                double precision,
	ggt_max                double precision,
	ld_ldh_min             double precision,
	ld_ldh_max             double precision
);

alter table first_day_lab
	owner to postgres;

create table if not exists first_day_bg_art
(
	subject_id            integer,
	hadm_id               integer,
	stay_id               integer,
	lactate_min           double precision,
	lactate_max           double precision,
	lactate_avg           double precision,
	ph_min                double precision,
	ph_max                double precision,
	ph_avg                double precision,
	so2_min               double precision,
	so2_max               double precision,
	so2_avg               double precision,
	po2_min               double precision,
	po2_max               double precision,
	po2_avg               double precision,
	pco2_min              double precision,
	pco2_max              double precision,
	pco2_avg              double precision,
	aado2_min             double precision,
	aado2_max             double precision,
	aado2_avg             double precision,
	aado2_calc_min        double precision,
	aado2_calc_max        double precision,
	aado2_calc_avg        double precision,
	pao2fio2ratio_min     double precision,
	pao2fio2ratio_max     double precision,
	pao2fio2ratio_avg     double precision,
	baseexcess_min        double precision,
	baseexcess_max        double precision,
	baseexcess_avg        double precision,
	bicarbonate_min       double precision,
	bicarbonate_max       double precision,
	bicarbonate_avg       double precision,
	totalco2_min          double precision,
	totalco2_max          double precision,
	totalco2_avg          double precision,
	hematocrit_min        double precision,
	hematocrit_max        double precision,
	hematocrit_avg        double precision,
	hemoglobin_min        double precision,
	hemoglobin_max        double precision,
	hemoglobin_avg        double precision,
	carboxyhemoglobin_min double precision,
	carboxyhemoglobin_max double precision,
	carboxyhemoglobin_avg double precision,
	methemoglobin_min     double precision,
	methemoglobin_max     double precision,
	methemoglobin_avg     double precision,
	temperature_min       double precision,
	temperature_max       double precision,
	temperature_avg       double precision,
	chloride_min          double precision,
	chloride_max          double precision,
	chloride_avg          double precision,
	calcium_min           double precision,
	calcium_max           double precision,
	calcium_avg           double precision,
	glucose_min           double precision,
	glucose_max           double precision,
	glucose_avg           double precision,
	potassium_min         double precision,
	potassium_max         double precision,
	potassium_avg         double precision,
	sodium_min            double precision,
	sodium_max            double precision,
	sodium_avg            double precision
);

alter table first_day_bg_art
	owner to postgres;

create function regexp_extract(str text, pattern text) returns text
	language plpgsql
as
$$
BEGIN
RETURN substring(str from pattern);
END; $$;

alter function regexp_extract(text, text) owner to postgres;

create function regexp_contains(str text, pattern text) returns boolean
	language plpgsql
as
$$
BEGIN
RETURN str ~ pattern;
END; $$;

alter function regexp_contains(text, text) owner to postgres;

create function generate_array(i integer, j integer) returns SETOF integer
	language sql
as
$$
    SELECT GENERATE_SERIES(i, j)
$$;

alter function generate_array(integer, integer) owner to postgres;

create function datetime(dt date) returns timestamp without time zone
	language plpgsql
as
$$
BEGIN
RETURN CAST(dt AS TIMESTAMP(3));
END; $$;

alter function datetime(date) owner to postgres;

create function datetime(year integer, month integer, day integer, hour integer, minute integer, second integer) returns timestamp without time zone
	language plpgsql
as
$$
BEGIN
RETURN TO_TIMESTAMP(
    TO_CHAR(year, '0000') || TO_CHAR(month, '00') || TO_CHAR(day, '00') || TO_CHAR(hour, '00') || TO_CHAR(minute, '00') || TO_CHAR(second, '00'),
    'yyyymmddHH24MISS'
);
END; $$;

alter function datetime(integer, integer, integer, integer, integer, integer) owner to postgres;

create function datetime_add(datetime_val timestamp without time zone, intvl interval) returns timestamp without time zone
	language plpgsql
as
$$
BEGIN
RETURN datetime_val + intvl;
END; $$;

alter function datetime_add(timestamp, interval) owner to postgres;

create function date_add(dt date, intvl interval) returns timestamp without time zone
	language plpgsql
as
$$
BEGIN
RETURN CAST(dt AS TIMESTAMP(3)) + intvl;
END; $$;

alter function date_add(date, interval) owner to postgres;

create function datetime_sub(datetime_val timestamp without time zone, intvl interval) returns timestamp without time zone
	language plpgsql
as
$$
BEGIN
RETURN datetime_val - intvl;
END; $$;

alter function datetime_sub(timestamp, interval) owner to postgres;

create function date_sub(dt date, intvl interval) returns timestamp without time zone
	language plpgsql
as
$$
BEGIN
RETURN CAST(dt AS TIMESTAMP(3)) - intvl;
END; $$;

alter function date_sub(date, interval) owner to postgres;

create function datetime_diff(endtime timestamp without time zone, starttime timestamp without time zone, datepart text) returns numeric
	language plpgsql
as
$$
BEGIN
RETURN
    EXTRACT(EPOCH FROM endtime - starttime) /
    CASE
        WHEN datepart = 'SECOND' THEN 1.0
        WHEN datepart = 'MINUTE' THEN 60.0
        WHEN datepart = 'HOUR' THEN 3600.0
        WHEN datepart = 'DAY' THEN 24*3600.0
        WHEN datepart = 'YEAR' THEN 365.242*24*3600.0
    ELSE NULL END;
END; $$;

alter function datetime_diff(timestamp, timestamp, text) owner to postgres;

create function bigquery_format_to_psql(format_str character varying) returns text
	language plpgsql
as
$$
BEGIN
RETURN
    -- use replace to convert BigQuery string format to postgres string format
    -- only handles a few cases since we don't extensively use this function
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
        format_str
        , '%S', 'SS'
    )
        , '%M', 'MI'
    )
        , '%H', 'HH24'
    )
        , '%d', 'dd'
    )
        , '%m', 'mm'
    )
        , '%Y', 'yyyy'
    )
;
END; $$;

alter function bigquery_format_to_psql(varchar) owner to postgres;

create function format_date(format_str character varying, datetime_val timestamp without time zone) returns text
	language plpgsql
as
$$
BEGIN
RETURN TO_CHAR(
    datetime_val,
    -- use replace to convert BigQuery string format to postgres string format
    -- only handles a few cases since we don't extensively use this function
    BIGQUERY_FORMAT_TO_PSQL(format_str)
);
END; $$;

alter function format_date(varchar, timestamp) owner to postgres;

create function parse_date(format_str character varying, string_val character varying) returns date
	language plpgsql
as
$$
BEGIN
RETURN TO_DATE(
    string_val,
    -- use replace to convert BigQuery string format to postgres string format
    -- only handles a few cases since we don't extensively use this function
    BIGQUERY_FORMAT_TO_PSQL(format_str)
);
END; $$;

alter function parse_date(varchar, varchar) owner to postgres;

create function format_datetime(format_str character varying, datetime_val timestamp without time zone) returns text
	language plpgsql
as
$$
BEGIN
RETURN TO_CHAR(
    datetime_val,
    -- use replace to convert BigQuery string format to postgres string format
    -- only handles a few cases since we don't extensively use this function
    BIGQUERY_FORMAT_TO_PSQL(format_str)
);
END; $$;

alter function format_datetime(varchar, timestamp) owner to postgres;

create function parse_datetime(format_str character varying, string_val character varying) returns timestamp without time zone
	language plpgsql
as
$$
BEGIN
RETURN TO_TIMESTAMP(
    string_val,
    -- use replace to convert BigQuery string format to postgres string format
    -- only handles a few cases since we don't extensively use this function
    BIGQUERY_FORMAT_TO_PSQL(format_str)
);
END; $$;

alter function parse_datetime(varchar, varchar) owner to postgres;
