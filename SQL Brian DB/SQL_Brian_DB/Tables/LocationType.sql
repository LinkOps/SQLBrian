CREATE TABLE [dbo].[LocationType]
(
	[LocationTypeId] INT IDENTITY(1,1), 
    [LocationType] NVARCHAR(20) NOT NULL,
	CONSTRAINT pk_LocationType PRIMARY KEY (LocationTypeId),
	CONSTRAINT ck_LocationType UNIQUE (LocationType)
)
