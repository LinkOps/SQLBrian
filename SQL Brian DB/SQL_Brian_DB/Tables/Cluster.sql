CREATE TABLE [dbo].[Cluster]
(
	[ClusterId] INT IDENTITY(1,1),
    [ServerId] INT NOT NULL, 
    [ClusteredServerId] INT NOT NULL,
	CONSTRAINT pk_Cluster PRIMARY KEY (ClusterId),
	CONSTRAINT ck_Cluster UNIQUE (ServerId, ClusteredServerId)
)
GO

ALTER TABLE [dbo].[Cluster]
	ADD CONSTRAINT fk_Cluster_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
GO

ALTER TABLE [dbo].[Cluster]
	ADD CONSTRAINT fk_Cluster_ClusterServer
	FOREIGN KEY (ClusteredServerId)
	REFERENCES [ClusteredServer] (ClusteredServerId)
GO