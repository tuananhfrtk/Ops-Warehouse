--Generate dimension rider table (CETAS) from staging table.

--first check if the external table exists and drop it if it does.
IF OBJECT_ID ('DBO.RIDER_DIM', 'ET') IS NOT NULL 
BEGIN 
	DROP EXTERNAL TABLE DBO.RIDER_DIM;
END


-- create the external table RIDER_DIM with the specified properties from the designed star schema
CREATE EXTERNAL TABLE [DBO].[RIDER_DIM] WITH (
	LOCATION = 'Star_Schema/RIDER_DIM',
	DATA_SOURCE = [AzureStorage]
	FILE_FORMAT = [TextFileFormat]
	


) AS (
	SELECT 
		[RIDER_ID],
		[FIRST_NAME],
		[LAST_NAME],
		[ADDRESS],
		[RIDER_AGE_ACCOUNT]
		[BIRTHDAY],
		[ACCOUNT_START_DATE],
		[ACCOUNT_END_DATE],
		[IS_MEMBER]
		
	FROM
		STAGING_RIDER;
		
);
GO 

--select the top 10 rows from the RIDER_DIM external table within the DBO schema
SELECT	
	TOP 10*
FROM
	[DBO].[RIDER_DIM];

GO	