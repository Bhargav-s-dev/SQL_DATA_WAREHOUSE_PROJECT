/*
===============================================================================
Script Name : Create_DataWarehouseDB.sql

Purpose :
    This script initializes a SQL Server Data Warehouse database named
    'DataWarehouseDB'. The script performs the following actions:

    1. Checks whether the database already exists.
    2. Drops the existing database if found.
    3. Creates a new database named 'DataWarehouseDB'.
    4. Switches context to the new database.
    5. Creates the schemas:
          - bronze : Raw ingestion layer
          - silver : Cleansed and transformed data layer
          - gold   : Business-ready curated layer

    The schema structure follows the Medallion Architecture pattern used
    in modern data warehouse implementations.

Warning :
    WARNING: This script permanently deletes the existing
    'DataWarehouseDB' database if it exists.

    Running this script will:
    - Remove all tables
    - Delete all stored procedures
    - Remove views, functions, and data
    - Cause permanent data loss
===============================================================================
*/
--=========================================================
-- Check whether database exists and drop if found
--=========================================================
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouseDB'
)
BEGIN
    ALTER DATABASE DataWarehouseDB
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouseDB;
END
GO
--=========================================================
-- Create Database
--=========================================================
CREATE DATABASE DataWarehouseDB;
GO
-- Switch Database Context
USE DataWarehouseDB;
GO
-- Create Bronze Schema
CREATE SCHEMA bronze;
GO
-- Create Silver Schema
CREATE SCHEMA silver;
GO
-- Create Gold Schema
CREATE SCHEMA gold;
GO
