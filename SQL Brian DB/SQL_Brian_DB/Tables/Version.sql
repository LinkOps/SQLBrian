CREATE TABLE [dbo].[Version]
(
	[VersionId] INT IDENTITY(1,1),
    [Version] NCHAR(10) NOT NULL,
	[SupportExpiryDate] DATE NULL,
	[MaxCompatLevel] TINYINT NULL, 
    [MinCompatLevel] TINYINT NULL, 
    CONSTRAINT pk_Version PRIMARY KEY (VersionId),
	CONSTRAINT ck_Version UNIQUE (Version)
)
