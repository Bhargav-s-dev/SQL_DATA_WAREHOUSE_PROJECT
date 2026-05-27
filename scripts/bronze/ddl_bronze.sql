/*
====================================================================
Script Name : bronze_table_creation.sql
Layer       : Bronze
Technology  : SQL Server
Purpose:
This script creates raw ingestion tables in the Bronze schema for
CRM and ERP source systems. Table names follow the naming standard
<source_system>_<table_name> to maintain source identification and
support downstream Silver and Gold processing.
Naming Convention:
bronze.<source_system>_<table_name>
Source Systems:
CRM:
- cust_info.csv
- prd_info.csv
- sales_details.csv

ERP:
- CUST_AZ12.csv
- LOC_A101.csv
- PX_CAT_G1V2.csv

Notes:
- Raw source structures are preserved with minimal transformation
- Business rules and standardization are handled in downstream layers
- Existing tables are dropped and recreated for deployment consistency
====================================================================
*/


-- ==========================================
-- Table: crm_cust_info
-- ==========================================

DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info
(
    cst_id             INT,
    cst_key            VARCHAR(50),
    cst_firstname      VARCHAR(100),
    cst_lastname       VARCHAR(100),
    cst_marital_status VARCHAR(20),
    cst_gndr           VARCHAR(10),
    cst_create_date    DATE
);
-- ==========================================
-- Table: crm_prd_info
-- ==========================================

DROP TABLE IF EXISTS bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info
(
    prd_id         INT,
    prd_key        VARCHAR(50),
    prd_nm         VARCHAR(255),
    prd_cost       DECIMAL(10,2),
    prd_line       VARCHAR(50),
    prd_start_dt   DATE,
    prd_end_dt     DATE
);
-- ==========================================
-- Table: crm_sales_details
-- ==========================================

DROP TABLE IF EXISTS bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num     VARCHAR(50),
    sls_prd_key     VARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    INT,
    sls_ship_dt     INT,
    sls_due_dt      INT,
    sls_sales       DECIMAL(18,2),
    sls_quantity    INT,
    sls_price       DECIMAL(18,2)
);


-- ==========================================
-- Table: erp_CUST_AZ12
-- ==========================================

DROP TABLE IF EXISTS bronze.erp_cust_az12; 

CREATE TABLE bronze.erp_cust_az12 
(
    CID        VARCHAR(50),
    BDATE      DATE,
    GEN        VARCHAR(10)
);


-- ==========================================
-- Table: erp_LOC_A101
-- ==========================================

DROP TABLE IF EXISTS bronze.erp_loc_a101; 

CREATE TABLE bronze.erp_loc_a101 
(
    CID        VARCHAR(50),
    CNTRY      VARCHAR(100)
);
-- ==========================================
-- Table: erp_PX_CAT_G1V2
-- ==========================================

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2; 

CREATE TABLE bronze.erp_px_cat_g1v2 
(
    ID            VARCHAR(50),
    CAT           VARCHAR(100),
    SUBCAT        VARCHAR(100),
    MAINTENANCE   VARCHAR(100)
);
