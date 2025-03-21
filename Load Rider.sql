--Loading the riders data from Azure Blob Storage into an external table in the data warehouse.

CREATE EXTERNAL TABLE STAGING_RIDER (
	[RIDER_ID] NVARCHAR(4000),
	[FIRST_NAME] NVARCHAR(4000),
	[LAST_NAME] VARCHAR(50),
	[ADDRESS] NVARCHAR(4000),
	[BIRTHDAY] NVARCHAR(4000)
	[ACCOUNT_START_DATE] NVARCHAR(4000),
	[ACCOUNT_END_DATE] NVARCHAR(4000),
	[IS_MEMBER] NVARCHAR(10)
	)
	WITH (
	LOCATION = 'Source/publicrider.csv',
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
	)
GO

-- Select the top 100 rows from the STAGING_RIDER within the DBO schema.
SELECT 
	TOP 100 * 
FROM 
	DBO.STAGING_RIDER
GO
