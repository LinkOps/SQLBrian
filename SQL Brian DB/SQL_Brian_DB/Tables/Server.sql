CREATE TABLE [dbo].[Server]
(
	[ServerId] INT IDENTITY(1,1), 
    [ServerName] NVARCHAR(16) NOT NULL,
	[IPAddress] NVARCHAR(15) NULL, 
    [InstanceName] NVARCHAR(50) NOT NULL DEFAULT 'MSSQLSERVER', 
    [VersionId] INT NULL, 
    [EditionId] INT NULL, 
    [BuildNoId] INT NULL, 
    [EnvironmentId] INT NOT NULL, 
    [LocationId] INT NOT NULL, 
    [BusinessUnitId] INT NOT NULL, 
    [CPUCores] INT NULL, 
    [CPUCoreSpeed] NVARCHAR(10) NULL, 
    [ServerRAM] NVARCHAR(10) NULL, 
    [InstanceRAM] NVARCHAR(10) NULL, 
    [InstallationDate] DATETIME2(0) NULL,
	[ServerStatusId] INT NOT NULL, 
    [LastUpdated] DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT pk_Server PRIMARY KEY (ServerId),
	CONSTRAINT ck_Server UNIQUE (ServerName,InstanceName)
)
GO

ALTER TABLE [dbo].[Server]
	ADD CONSTRAINT fk_Server_Version
	FOREIGN KEY (VersionId)
	REFERENCES [Version] (VersionId)
GO

ALTER TABLE [dbo].[Server]
	ADD CONSTRAINT fk_Server_Edition
	FOREIGN KEY (EditionId)
	REFERENCES [Edition] (EditionId)
GO

ALTER TABLE [dbo].[Server]
	ADD CONSTRAINT fk_Server_Environment
	FOREIGN KEY (EnvironmentId)
	REFERENCES [Environment] (EnvironmentId)
GO

ALTER TABLE [dbo].[Server]
	ADD CONSTRAINT fk_Server_Location
	FOREIGN KEY (LocationId)
	REFERENCES [Location] (LocationId)
GO

ALTER TABLE [dbo].[Server]
	ADD CONSTRAINT fk_Server_BusinessUnit
	FOREIGN KEY (BusinessUnitId)
	REFERENCES [BusinessUnit] (BusinessUnitId)
GO

ALTER TABLE [dbo].[Server]
	ADD CONSTRAINT fk_Server_ServerStatus
	FOREIGN KEY (ServerStatusId)
	REFERENCES [ServerStatus] (ServerStatusId)
GO
