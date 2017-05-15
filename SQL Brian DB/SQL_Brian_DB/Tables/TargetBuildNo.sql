CREATE TABLE [dbo].[TargetBuildNo]
(
	[TargetBuildNoId] INT IDENTITY(1,1),
	[VersionId] INT NOT NULL,
	[BuildNoId] INT NOT NULL,
	CONSTRAINT pk_TargetBuildNo PRIMARY KEY (TargetBuildNoId),
	CONSTRAINT ck_TargetBuildNo UNIQUE (VersionId)
)
GO

ALTER TABLE [dbo].[TargetBuildNo]
	ADD CONSTRAINT fk_TargetBuildNo_Version
	FOREIGN KEY (VersionId)
	REFERENCES [Version] (VersionId)
GO

ALTER TABLE [dbo].[TargetBuildNo]
	ADD CONSTRAINT fk_TargetBuildNo_BuildNo
	FOREIGN KEY (BuildNoId)
	REFERENCES [BuildNo] (BuildNoId)
GO