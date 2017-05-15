CREATE TABLE [dbo].[InternalDBs]
(
	[ServerId] INT NOT NULL, 
    [DatabaseId] INT NOT NULL,
	CONSTRAINT [PK_InternalDBs] PRIMARY KEY ([ServerId],[DatabaseId])
)
GO

ALTER TABLE [dbo].[InternalDBs]
	ADD CONSTRAINT fk_InternalBds_Database
	FOREIGN KEY ([ServerId], [DatabaseId])
	REFERENCES [Database] ([ServerId], [DatabaseId])
