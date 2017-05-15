CREATE TABLE [dbo].[Log_Configuration]
(
	[ServerId] INT NOT NULL,
	[ConfigurationId] INT NOT NULL,
	[LogDate] DATETIME2(0) NOT NULL,
	[ConfigName] NVarChar(35) NOT NULL,
	[Original_Value] SQL_Variant NULL, 
	[Original_Value_in_Use] SQL_Variant NULL,
	[New_Value] SQL_Variant NULL, 
	[New_Value_in_Use] SQL_Variant NULL,
    CONSTRAINT [PK_Log_Configuration] PRIMARY KEY ([ServerId],[ConfigurationId],[LogDate])
)
GO

ALTER TABLE [dbo].[Log_Configuration]
	ADD CONSTRAINT fk_Log_Configuration_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
