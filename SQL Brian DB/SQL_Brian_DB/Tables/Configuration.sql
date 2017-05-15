CREATE TABLE [dbo].[Configuration]
(
	[ServerId] INT NOT NULL,
	[ConfigurationId] INT NOT NULL,
	[ConfigName] NVarChar(35) NOT NULL,
	[Value] SQL_Variant NULL, 
	[Value_in_Use] SQL_Variant NULL,
    [IgnoreCompliance] NCHAR(1) NULL DEFAULT 'N', 
    CONSTRAINT [PK_Configuration] PRIMARY KEY ([ServerId],ConfigurationId)
)
GO

ALTER TABLE [dbo].[Configuration]
	ADD CONSTRAINT fk_Configuration_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
