--	Loading the station data from Azure Blob Storage into an external table in the data warehouse.

CREATE EXTERNAL TABLE STAGING_STATION (
	[STATION_ID] NVARCHAR(4000),
	[NAME] NVARCHAR(4000),
	[LATITUDE] FLOAT,
	[LONGTITUDE] FLOAT
	)
	WITH (
	LOCATION = 'Source/publicstation.csv',
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
	)
GO

-- Select the top 100 rows from the STAGING_STATION within the DBO schema.
SELECT 
	TOP 100 * 
FROM 
	DBO.STAGING_STATION
GO