--Generate dimension station table (CETAS) from staging table.

--first check if the external table exists and drop it if it does.
IF OBJECT_ID ('DBO.STATION_DIM', 'ET') IS NOT NULL 
BEGIN 
	DROP EXTERNAL TABLE DBO.STATION_DIM;
END


-- create the external table STATION_DIM with the specified properties from the designed star schema
CREATE EXTERNAL TABLE [DBO].[STATION_DIM] WITH (
	LOCATION = 'Star_Schema/STATION_DIM',
	DATA_SOURCE = [AzureStorage]
	FILE_FORMAT = [TextFileFormat]
	
) AS (
	SELECT 
		[STATION_ID],
		[NAME],
		[LATITUDE],
		[LONGTITUDE],
					
	FROM
		STAGING_STATION;
);
GO

--select the top 10 rows from the STATION_DIM external table within the DBO schema

SELECT
	TOP 10*
FROM
	DBO.STATION_DIM;
GO