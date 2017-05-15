CREATE TABLE [dbo].[BusinessUnit]
(
	[BusinessUnitId] INT IDENTITY(1,1), 
    [BusinessUnit] NVARCHAR(20) NOT NULL,
	[SortOrder] INT NULL,
	CONSTRAINT pk_BusinessUnit PRIMARY KEY (BusinessUnitId),
	CONSTRAINT ck_BusinessUnit UNIQUE (BusinessUnit)
)
