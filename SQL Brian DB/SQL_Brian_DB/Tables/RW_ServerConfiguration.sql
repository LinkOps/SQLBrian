CREATE TABLE [dbo].[RW_ServerConfiguration]
(
	[ServerConfigurationId] INT IDENTITY(1,1) NOT NULL,
	[ServerId] INT NOT NULL,
	[ConfigName] NVarChar(35) NOT NULL,
	[Value] SQL_Variant NULL,
	[Running_Value] SQL_Variant NULL,
	[ConfigDescription]	NVarChar(255),
	CONSTRAINT pk_RW_ServerConfiguration PRIMARY KEY (ServerConfigurationId),
	CONSTRAINT ck_RW_ServerConfiguration UNIQUE (ServerId, ConfigName)
)
GO
