CREATE TABLE [dbo].[ServerStatus]
(
	[ServerStatusId] INT IDENTITY(1,1), 
    [ServerStatus] NVARCHAR(20) NOT NULL,
	[SortOrder] INT NULL,
	CONSTRAINT pk_ServerStatus PRIMARY KEY (ServerStatusId),
	CONSTRAINT ck_ServerStatus UNIQUE (ServerStatus)
)
