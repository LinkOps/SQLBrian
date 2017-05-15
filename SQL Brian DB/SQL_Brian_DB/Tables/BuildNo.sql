CREATE TABLE [dbo].[BuildNo]
(
	[BuildNoId] INT IDENTITY(1,1), 
    [VersionId] INT NOT NULL, 
    [BuildNo] NVARCHAR(20) NOT NULL,
	[MinorBuild] INT NOT NULL,
	[BuildName] NVARCHAR(400) NULL,
	[ReleaseDate] DATE NOT NULL,
	CONSTRAINT pk_BuildNo PRIMARY KEY (BuildNoId), 
)
GO

ALTER TABLE [dbo].[BuildNo]
	ADD CONSTRAINT fk_BuildNo_Version
	FOREIGN KEY (VersionId)
	REFERENCES [Version] (VersionId)
GO

CREATE UNIQUE INDEX [IX_BuildNo_BuildNo_Unique] ON [dbo].[BuildNo] ([BuildNo])
