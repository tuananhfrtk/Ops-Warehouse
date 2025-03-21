--Generate fact payment table (CETAS) from staging table.

--first check if the external table exists and drop it if it does.
IF OBJECT_ID ('DBO.PAYMENT_FACT', 'ET') IS NOT NULL 
BEGIN 
	DROP EXTERNAL TABLE DBO.PAYMENT_FACT;
END


-- create the external table PAYMENT_FACT with the specified properties from the designed star schema
CREATE EXTERNAL TABLE [DBO].[PAYMENT_FACT] WITH (
	LOCATION = 'Star_Schema/PAYMENT_FACT',
	DATA_SOURCE = [AzureStorage],
	FILE_FORMAT = [TextFileFormat]



) AS (
	SELECT 
		PAYMENT_ID,
		AMOUNT,
		DAY,
		ACCOUNT_NUMBER,
		
	FROM
		dbo.STAGING_PAYMENT;
		
);


--select the top 10 rows from the PAYMENT_FACT external table within the DBO schema

GO 
SELECT
	TOP 10*
FROM
	[DBO].[PAYMENT_FACT];
	
GO

