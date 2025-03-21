--Loading the trips data from Azure Blob Storage into an external table in the data warehouse.


CREATE EXTERNAL TABLE STAGING_TRIP (
	[TRIP_ID] NVARCHAR(4000),
	[RIDEABLE_TYPE] NVARCHAR(4000),
	[STARTED_AT] VARCHAR(50),
	[ENDED_AT] VARCHAR(50)
	[START_STATION_ID] NVARCHAR(4000),
	[END_STATION_ID] NVARCHAR (4000),
	[RIDER_ID] BIGINT
	)
	WITH (
	LOCATION = 'Source/publictrip.csv',
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
	)
GO

-- Select the top 100 rows from the STAGING_TRIP within the DBO schema.
SELECT 
	TOP 100 * 
FROM 
	DBO.STAGING_TRIP
GO