CREATE TABLE [dbo].[Environment]
(
	[EnvironmentId] INT IDENTITY(1,1),
    [Environment] NVARCHAR(20) NULL,
	[SortOrder] INT NULL,
	CONSTRAINT pk_Environment PRIMARY KEY (EnvironmentId),
	CONSTRAINT ck_Environment UNIQUE (Environment)
)
