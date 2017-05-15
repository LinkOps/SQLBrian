CREATE TABLE [dbo].[Reliance]
(
	[RelianceId] INT IDENTITY(1,1), 
    [ParentServerId] INT NOT NULL, 
    [ChildServerId] INT NOT NULL,
	CONSTRAINT pk_Reliance PRIMARY KEY (RelianceId),
	CONSTRAINT ck_Reliance UNIQUE (ParentServerId, ChildServerId)
)
GO

ALTER TABLE [dbo].[Reliance]
	ADD CONSTRAINT fk_Reliance_Server_Parent
	FOREIGN KEY (ParentServerId)
	REFERENCES [Server] (ServerId)
GO

ALTER TABLE [dbo].[Reliance]
	ADD CONSTRAINT fk_Reliance_Server_Chiled
	FOREIGN KEY (ChildServerId)
	REFERENCES [Server] (ServerId)
GO
