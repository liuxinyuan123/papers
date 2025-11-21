# MIMIC 数据提取代码说明文档

 [For English Version Click here](./README.md)

本项目包含从 [MIMIC-IV 3.1 版本](https://physionet.org/content/mimiciv/3.1/) 
中所需数据，并生成相应的数据集。 数据库中提取研究所需数据的 SQL 脚本，支持论文 **_Relationship Between the Duration of Early Vital 
Sign Abnormalities in Acute Cardiovascular Diseases and 120-Day Mortality 
Risk: Determination of Clinically Relevant Thresholds_** 中的数据分析需求。

---

## 📌 研究概述

本代码旨在从 MIMIC 数据库中提取与文章 **_Relationship Between the Duration of Early Vital 
Sign Abnormalities in Acute Cardiovascular Diseases and 120-Day Mortality Risk: Determination of Clinically Relevant Thresholds_** 相关的关键变量，包括患者基本信息、住院记录、生命体征、实验室检查、诊断信息等。

---

## 🧩 数据来源

- **数据库版本**：MIMIC-IV v3.1
- **访问方式**：通过 PostgreSQL 数据库连接（需申请权限）
- **官方文档**：https://physionet.org/content/mimiciv/3.1/ 

---

## 🛠️ 使用方法

### 1. 环境准备

确保已安装以下工具：
- PostgreSQL 客户端（如 `psql` 或 DBeaver）
- DataGrip
- Python 3
- Navicat Premium

### 物化视图修改和自定义后的文件
[mimic-code-main-revised](./mimic-code-main-revised)


[Mimic database custom materialized view](./Mimic_database_custom_materialized_view)


### 数据提取方案
- 首先运行 `mimic-code-main-revised/mimic-code-main-revised`下的sql
  脚本重构数据集，在官方物化视图种增加`hadm_id`列。
- 然后运行 `Mimic_database_custom_materialized_view
/Mimic_database_custom_materialized_view`下的sql，自定义各项指标的纵向数据。
- 最后按需提取需要的指标。
