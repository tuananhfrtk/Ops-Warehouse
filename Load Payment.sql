--Loading the payments data from Azure Blob Storage into an external table in the data warehouse.

CREATE EXTERNAL TABLE STAGING_PAYMENT (
	[PAYMENT_ID] BIGINT,
	[DATE] VARCHAR(50),
	[AMOUNT] FLOAT,
	[ACCOUNT_NUMBER] BIGINT,
	)
	
	WITH (
	LOCATION = 'Source/publicpayment.csv',
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
	)
GO


-- Select the top 100 rows from the STAGING_PAYMENT within the DBO schema.
SELECT 
	TOP 100 * 
FROM 
	DBO.STAGING_PAYMENT
GO