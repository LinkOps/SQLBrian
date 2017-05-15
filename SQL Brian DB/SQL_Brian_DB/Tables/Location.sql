CREATE TABLE [dbo].[Location]
(
	[LocationId] INT IDENTITY(1,1),
    [LocationTypeId] INT NOT NULL,
	[Location] NVARCHAR(20) NOT NULL, 
    [Address] NVARCHAR(200) NULL, 
    [LocationPrefix] NVARCHAR(3) NOT NULL,
	[SortOrder] INT NULL,
	CONSTRAINT pk_Location PRIMARY KEY (LocationId),
	CONSTRAINT ck_Location UNIQUE (Location)
)
GO

ALTER TABLE [dbo].[Location]
	ADD CONSTRAINT fk_Location_LocationType
	FOREIGN KEY (LocationTypeId)
	REFERENCES [LocationType] (LocationTypeId)
GO