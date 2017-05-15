CREATE TABLE [dbo].[ServerConfiguration]
(
	[ServerConfigurationId] INT IDENTITY(1,1) NOT NULL,
	[ServerId] INT NOT NULL,
	[ConfigName] NVarChar(35) NOT NULL,
	[Value] SQL_Variant NULL,
	[Running_Value] SQL_Variant NULL,
	[ConfigDescription]	NVarChar(255),
	CONSTRAINT pk_ServerConfiguration PRIMARY KEY (ServerConfigurationId),
	CONSTRAINT ck_ServerConfiguration UNIQUE (ServerId, ConfigName)
)
GO

ALTER TABLE [dbo].[ServerConfiguration]
	ADD CONSTRAINT fk_ServerConfiguration_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
GO