CREATE TABLE [dbo].[Edition]
(
	[EditionId] INT IDENTITY(1,1),
    [Edition] NVARCHAR(50) NOT NULL,
	[MSEditionId] BIGINT NULL,
	[SortOrder] INT NULL,
	CONSTRAINT pk_Edition PRIMARY KEY (EditionId),
	CONSTRAINT ck_Edition UNIQUE (Edition)
)
