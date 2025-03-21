--Generate fact trip table (CETAS) from staging table.

--first check if the external table exists and drop it if it does.
IF OBJECT_ID ('DBO.TRIP_FACT', 'ET') IS NOT NULL 
BEGIN 
	DROP EXTERNAL TABLE DBO.TRIP_FACT;
END


-- create the external table TRIP_FACT with the specified properties from the designed star schema
CREATE EXTERNAL TABLE [DBO].[TRIP_FACT] WITH (
	LOCATION = 'Star_Schema/TRIP_FACT',
	DATA_SOURCE = [AzureStorage]
	FILE_FORMAT = [TextFileFormat]



) AS 
	SELECT 
		ST.TRIP_ID,
		ST.RIDER_ID,
		ST.STARTED_AT,
		ST.ENDED_AT,
		ST.RIDEABLE_TYPE,
		DATEDIFF(HOUR, ST.START_AT, ST.ENDED_AT) AS DURATION,
		DATEDIFF(YEAR, SR.BIRTHDAY, ST.START_AT) AS RIDER_AGE_ACCOUNT,
		ST.START_STATION_ID
		ST.END_STATION_ID

	FROM
		STAGING_TRIP AS ST
		JOIN STAGING_RIDER SR ON SR.RIDER_ID

GO


--select the top 10 rows from the TRIP_FACT external table within the DBO schema
SELECT
	TOP 10*
FROM
	DBO.TRIP_FACT;
	
GO