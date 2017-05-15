CREATE TABLE [dbo].[Database]
(
	[ServerId] INT NOT NULL,
	[DatabaseId] INT NOT NULL, 
	[DatabaseName] SYSNAME NOT NULL, 
	[Create_Date] DATETIME2(0) NOT NULL DEFAULT '19000101', 
	[Compatibility_Level] TINYINT NOT NULL, 
	[Collation_Name] SYSNAME NULL, 
	[User_Access] NVARCHAR(60) NULL, 
	[Read_Only] BIT NULL, 
	[Auto_Close] BIT NULL, 
	[Auto_Shrink] BIT NULL, 
	[State] NVARCHAR(60) NULL, 
	[Snapshot_Isolation] NVARCHAR(60) NULL, 
	[Recovery_Model] NVARCHAR(60) NULL, 
	[Page_Verify] NVARCHAR(60) NULL, 
    CONSTRAINT [PK_Database] PRIMARY KEY ([ServerId],[DatabaseId])
)
GO

ALTER TABLE [dbo].[Database]
	ADD CONSTRAINT fk_Database_Server
	FOREIGN KEY ([ServerId])
	REFERENCES [Server] ([ServerId])