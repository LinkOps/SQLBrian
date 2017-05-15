CREATE TABLE [dbo].[Log_Database]
(
	[ServerId] INT NOT NULL,
	[DatabaseId] INT NOT NULL,
	[LogDate] DATETIME2(0) NOT NULL,
	[OldDatabaseName] SYSNAME NULL,
	[NewDatabbaseName] SYSNAME NULL,
	[OldCompatibility_Level] TINYINT NULL,
	[NewCompatibility_Level] TINYINT NULL,
	[OldCollation_Name] SYSNAME NULL,
	[NewCollation_Name] SYSNAME NULL,
	[OldUser_Access] NVARCHAR(60) NULL,
	[NewUser_Access] NVARCHAR(60) NULL,
	[OldRead_Only] BIT NULL,
	[NewRead_Only] BIT NULL,
	[OldAuto_Close] BIT NULL,
	[NewAuto_Close] BIT NULL,
	[OldAuto_Shrink] BIT NULL,
	[NewAuto_Shrink] BIT NULL,
	[OldState] NVARCHAR(60) NULL,
	[NewState] NVARCHAR(60) NULL,
	[OldSnapshot_Isolation] NVARCHAR(60) NULL,
	[NewSnapshot_Isolation] NVARCHAR(60) NULL,
	[OldRecovery_Model] NVARCHAR(60) NULL,
	[NewRecovery_Model] NVARCHAR(60) NULL,
	[OldPage_Verify] NVARCHAR(60) NULL,
	[NewPage_Verify] NVARCHAR(60) NULL,
	CONSTRAINT [PK_Log_Database] PRIMARY KEY ([ServerId],[DatabaseId],[LogDate])
)
GO

ALTER TABLE [dbo].[Log_Database]
	ADD CONSTRAINT fk_Log_Database_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
