# SQL Data Warehouse Project

A complete end-to-end Data Warehouse solution built with Microsoft SQL Server using the Medallion Architecture (Bronze → Silver → Gold). This project demonstrates how raw CRM and ERP data can be transformed into a reliable, analytics-ready data platform that supports business intelligence and reporting.

---

## Project Overview

Organizations often store data across multiple systems, making it difficult to generate accurate business insights. The goal of this project was to consolidate customer, product, and sales data from CRM and ERP sources into a centralized Data Warehouse.

Using industry-standard data warehousing practices, the solution processes data through multiple layers:

* **Bronze Layer** – Stores raw source data as received.
* **Silver Layer** – Cleanses, standardizes, and validates data.
* **Gold Layer** – Delivers business-ready data models optimized for analytics and reporting.

The final result is a scalable and structured warehouse that enables efficient reporting, data analysis, and decision-making.

---

## Architecture

```text
Source Systems (CRM & ERP)
          │
          ▼
     Bronze Layer
   (Raw Data Storage)
          │
          ▼
     Silver Layer
 (Data Cleansing & Quality)
          │
          ▼
      Gold Layer
 (Dimensional Modeling)
          │
          ▼
    Analytics & BI
```

---

## Technologies Used

* Microsoft SQL Server
* T-SQL
* ETL Development
* Data Warehousing
* Star Schema Modeling
* Data Quality Validation
* Business Analytics

---

## Project Structure

```text
SQL_DATA_WAREHOUSE_PROJECT/
│
├── datasets/
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
├── tests/
├── docs/
└── README.md
```

---

## Data Warehouse Layers

### Bronze Layer – Raw Data Ingestion

The Bronze layer acts as the landing zone for source data. Data from CRM and ERP systems is loaded without modification, preserving the original structure for traceability and auditing purposes.

**Tables**

* bronze.crm_cust_info
* bronze.crm_prd_info
* bronze.crm_sales_details
* bronze.erp_cust_az12
* bronze.erp_loc_a101
* bronze.erp_px_cat_g1v2

---

### Silver Layer – Data Cleansing & Standardization

The Silver layer improves data quality by applying business rules and transformations.

Key activities include:

* Removing duplicate records
* Handling missing values
* Standardizing data formats
* Validating business rules
* Improving overall data consistency

**Tables**

* silver.crm_cust_info
* silver.crm_prd_info
* silver.crm_sales_details
* silver.erp_cust_az12
* silver.erp_loc_a101
* silver.erp_px_cat_g1v2

---

### Gold Layer – Analytics-Ready Data Model

The Gold layer provides a dimensional model designed for reporting and business analysis. Data is organized using a Star Schema to simplify querying and improve analytical performance.

#### Dimension Tables

**gold.dim_customers**

* Customer Key
* Customer ID
* First Name
* Last Name
* Country
* Gender
* Marital Status
* Birth Date

**gold.dim_products**

* Product Key
* Product ID
* Product Name
* Category
* Subcategory
* Maintenance Type

#### Fact Table

**gold.fact_sales**

* Sales Transactions
* Customer References
* Product References
* Order Information
* Quantity
* Revenue Metrics
* Pricing Details

---

## ETL Workflow

The warehouse is built through a structured ETL process:

### 1. Database Initialization

Creates the database and required schemas.

```sql
scripts/init_database.sql
```

### 2. Bronze Layer Setup

Creates raw ingestion tables and loads source data.

```sql
scripts/bronze/ddl_bronze.sql
scripts/bronze/proc_load_bronze.sql
```

### 3. Silver Layer Processing

Creates cleansed tables and applies transformation logic.

```sql
scripts/silver/ddl_silver.sql
scripts/silver/proc_load_silver.sql
```

### 4. Gold Layer Modeling

Creates analytical views and dimensional models.

```sql
scripts/gold/ddl_gold.sql
```

---

## Data Quality Validation

To ensure reliable reporting, automated validation scripts are included.

### Silver Layer Checks

* Duplicate record detection
* Missing value validation
* Invalid date checks
* Data consistency verification

```sql
tests/quality_checks_silver.sql
```

### Gold Layer Checks

* Referential integrity validation
* Fact-to-dimension relationship checks
* Business rule verification

```sql
tests/quality_checks_gold.sql
```

---

## Business Insights Enabled

The Data Warehouse supports a variety of analytical use cases, including:

* Identifying top customers by revenue
* Analyzing product sales performance
* Tracking monthly sales trends
* Comparing category-level performance
* Evaluating revenue contribution by country
* Understanding customer behavior across regions

---

## What I Learned

Through this project, I strengthened my skills in:

* Data Warehouse Design
* Medallion Architecture
* ETL Pipeline Development
* SQL Server Administration
* Dimensional Modeling
* Star Schema Design
* Data Quality Management
* Business Analytics

More importantly, this project provided hands-on experience in building a real-world data warehouse from raw source files to an analytics-ready reporting layer.

---

## Future Enhancements

Planned improvements include:

* Incremental Data Loading
* Slowly Changing Dimensions (SCD Type 2)
* SQL Server Agent Automation
* Power BI Dashboard Integration
* Data Lineage and Metadata Tracking
* Query Performance Optimization

---

## Author

**Bhargav S**

GitHub: https://github.com/Bhargav-s-dev

---

## License

This project is licensed under the MIT License.

Feel free to explore, fork, and contribute to the project. Feedback and suggestions are always welcome.
