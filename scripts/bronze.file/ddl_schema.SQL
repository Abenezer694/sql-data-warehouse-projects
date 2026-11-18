
/*
================================================================================
DDL Script: Create bronze layer
===============================================================================
Script purpose:
This script creates tables in 'bronze' schema, dropping exisiting tables if they already existed
Run this script to redefine the ddl Structure of the 'bronze' table
==========================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME , @start_batch_time DATETIME, @end_batch_time DATETIME
BEGIN TRY
SET @start_batch_time = GETDATE()
PRINT '=================================================================================================';
PRINT 'Loading Bronze layer';
PRINT '=================================================================================================';


PRINT '==================================================================================================';
PRINT 'Loading CRM Tables';
PRINT '==================================================================================================';


SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.crm_cust_info'
PRINT '>> Inserting the data into: bronze.crm_cust_info'
SELECT
*
FROM cust_info
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
PRINT '----------------------------'

SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.crm_prd_info'
PRINT '>> Inserting the data into: bronze.crm_prd_info'

SELECT
*
FROM prd_info
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
PRINT '----------------------------'


SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.crm_salesdetails_info'
PRINT '>> Inserting the data into: bronze.crm_salesdetails_info'

SELECT
*
FROM sales_details
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
PRINT '----------------------------'




SET @start_time = GETDATE();
PRINT '==================================================================================================';
PRINT 'Loading ERP tables';
PRINT '==================================================================================================';

SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.crm_CUST_AZ12'
PRINT '>> Inserting the data into: bronze.crm_CUST_AZ12'

SELECT
*
FROM CUST_AZ12
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
PRINT '----------------------------'


SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.crm_LOC_A101'
PRINT '>> Inserting the data into: bronze.crm_LOC_A101'

SELECT
*
FROM LOC_A101
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
PRINT '----------------------------'

SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.crm_PX_CAT_G1V2'
PRINT '>> Inserting the data into: bronze.crm_CAT_G1V2'

SELECT
*
FROM PX_CAT_G1V2
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
PRINT '----------------------------'

SET @end_batch_time = GETDATE();
PRINT '====================================================================================='
PRINT '>>>>>>> Loading bronze layer is completed';
PRINT ' TotalLoad Duration: ' + CAST (DATEDIFF(second,@start_batch_time,@end_batch_time) AS NVARCHAR) + ' seconds'
PRINT '======================================================================================'

END TRY
BEGIN CATCH
PRINT '==========================================================================================';
PRINT 'ERROR OCCURED DURING THE BRONZE LAYER';
PRINT 'Error Message' + ERROR_Message();
PRINT 'Error Message' + CAST(Error_number() AS NVARCHAR);
PRINT 'Error Message' + CAST(Error_state() AS NVARCHAR);
PRINT '============================================================================================';

END CATCH
END
  
END
