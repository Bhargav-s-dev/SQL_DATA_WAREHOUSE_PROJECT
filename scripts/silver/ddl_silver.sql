/*
Script Name : ddl_silver.sql
Layer       : Silver
Technology  : SQL Server

Purpose:
This script creates cleansed and standardized tables in the Silver
schema. Data loaded into these tables has undergone basic validation,
data type standardization, and cleansing from the Bronze layer.
  */

-- ==========================================
-- Table: crm_cust_info
-- ==========================================

DROP TABLE IF EXISTS silver.crm_cust_info;

CREATE TABLE silver.crm_cust_info
(
cst_id             INT,
cst_key            VARCHAR(50),
cst_firstname      VARCHAR(100),
cst_lastname       VARCHAR(100),
cst_marital_status VARCHAR(20),
cst_gndr           VARCHAR(10),
cst_create_date    DATE,
dwh_create_date    DATETIME2(7) DEFAULT GETDATE()
);

-- ==========================================
-- Table: crm_prd_info
-- ==========================================

DROP TABLE IF EXISTS silver.crm_prd_info;

CREATE TABLE silver.crm_prd_info
(
prd_id             INT,
cat_id             VARCHAR(50),
prd_key            VARCHAR(50),
prd_nm             VARCHAR(255),
prd_cost           DECIMAL(10,2),
prd_line           VARCHAR(50),
prd_start_dt       DATE,
prd_end_dt         DATE,
dwh_create_date    DATETIME2(7) DEFAULT GETDATE()
);

-- ==========================================
-- Table: crm_sales_details
-- ==========================================

DROP TABLE IF EXISTS silver.crm_sales_details;

CREATE TABLE silver.crm_sales_details
(
sls_ord_num        VARCHAR(50),
sls_prd_key        VARCHAR(50),
sls_cust_id        INT,
sls_order_dt       DATE,
sls_ship_dt        DATE,
sls_due_dt         DATE,
sls_sales          DECIMAL(18,2),
sls_quantity       INT,
sls_price          DECIMAL(18,2),
dwh_create_date    DATETIME2(7) DEFAULT GETDATE()
);

-- ==========================================
-- Table: erp_cust_az12
-- ==========================================

DROP TABLE IF EXISTS silver.erp_cust_az12;

CREATE TABLE silver.erp_cust_az12
(
cid                VARCHAR(50),
bdate              DATE,
gen                VARCHAR(10),
dwh_create_date    DATETIME2(7) DEFAULT GETDATE()
);

-- ==========================================
-- Table: erp_loc_a101
-- ==========================================

DROP TABLE IF EXISTS silver.erp_loc_a101;

CREATE TABLE silver.erp_loc_a101
(
cid                VARCHAR(50),
cntry              VARCHAR(100),
dwh_create_date    DATETIME2(7) DEFAULT GETDATE()
);

-- ==========================================
-- Table: erp_px_cat_g1v2
-- ==========================================

DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;

CREATE TABLE silver.erp_px_cat_g1v2
(
id                 VARCHAR(50),
cat                VARCHAR(100),
subcat             VARCHAR(100),
maintenance        VARCHAR(100),
dwh_create_date    DATETIME2(7) DEFAULT GETDATE()
);
