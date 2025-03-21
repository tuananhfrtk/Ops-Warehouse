CREATE DATABASE divvy_project;
USE divvy_project;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '@Aviskywise1993'

CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
WITH 
    IDENTITY = 'SHARED ACCESS SIGNATURE',
    SECRET ='?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2023-08-05T11:48:07Z&st=2023-08-05T03:48:07Z&spr=https,http&sig=Xiy3RNU%2BCSxGJJ%2BTnZTkISc7mI%2BFfRABT8PMQvaLLNQ%3D';

CREATE USER Test FOR LOGIN sqladminuser
GRANT REFERENCES ON DATABASE SCOPED CREDENTIAL::AzureStorageCredential TO Test

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'AzureStorage')
	CREATE EXTERNAL DATA SOURCE AzureStorage with (
		LOCATION ='https://dacityproj2storageacc.blob.core.windows.net/udacityproject2container',
		CREDENTIAL = AzureStorageCredential
		);
GO

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat')
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat]
	WITH (FORMAT_TYPE = Parquet)
GO 

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'TextFileFormat')
	CREATE EXTERNAL FILE FORMAT TextFileFormat
	WITH (FORMAT_TYPE = DELIMITEDTEXT,
			FORMAT_OPTIONS (
				FIELD_TERMINATOR = ',',
				STRING_DELIMITER = '"',
				USE_TYPE_DEFAULT = FALSE
				)
)
GO