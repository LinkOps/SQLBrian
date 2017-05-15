CREATE TABLE [dbo].[rw_Configuration]
(
	[ServerId] INT NOT NULL,
	[ConfigurationId] INT NOT NULL,
	[ConfigName] NVarChar(35) NOT NULL,
	[Value] SQL_Variant NULL, 
	[Value_in_Use] SQL_Variant NULL,
    CONSTRAINT [PK_rw_Configuration] PRIMARY KEY ([ServerId],ConfigurationId)
)
GO

ALTER TABLE [dbo].[rw_Configuration]
	ADD CONSTRAINT fk_rw_Configuration_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
GO
