--Generate dimension dates table (CETAS)


--first check if the external table exists and drop it if it does.
IF OBJECT_ID ('DBO.DATES_DIM', 'ET') IS NOT NULL 
BEGIN 
	DROP EXTERNAL TABLE DBO.DATES_DIM;
END

-- create the external table DATES_DIM with the specified properties from the designed star schema
CREATE EXTERNAL TABLE [DBO].[DATES_DIM] WITH (
	LOCATION = 'Star_Schema/DATES_DIM',
	DATA_SOURCE = [AzureStorage],
	FILE_FORMAT = [TextFileFormat]


-- 
) AS (
	SELECT 
		TIME_ID,
		DATEPART(DAY, CONVERT(DATE, DATE)) AS DAY,
		DATEPART(WEEKDAY, CONVERT(DATE, DATE)) AS DAY_OF_WEEK
		DATEPART(DAYOFYEAR, CONVERT(DATE, DATE)) AS DAY_OF_YEAR,
		DATEPART(MONTH, CONVERT(DATE, DATE)) AS MONTH,
		DATEPART(QUARTER, CONVERT(DATE, DATE)) AS QUARTER,
		DATEPART(YEAR, CONVERT(DATE, DATE)) AS YEAR
		
		

	FROM
		dbo.STAGING_PAYMENT;
		
);
GO

--select the top 10 rows from the PAYMENT_DIM external table within the DBO schema

SELECT
	TOP 10*
FROM
	[DBO].[DATES_DIM];

GO
	