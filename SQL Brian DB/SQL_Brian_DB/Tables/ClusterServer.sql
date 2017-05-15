CREATE TABLE [dbo].[ClusteredServer]
(
	[ClusteredServerId] INT IDENTITY(1,1),
    [ClusterServerName] NVARCHAR(16) NOT NULL, 
    [ClusterServerIP] NVARCHAR(15) NOT NULL, 
    [ServerStatusId] INT NOT NULL,
	CONSTRAINT pk_ClusteredServer PRIMARY KEY (ClusteredServerId),
	CONSTRAINT ck_ClusteredServer UNIQUE (ClusterServerName)
)
