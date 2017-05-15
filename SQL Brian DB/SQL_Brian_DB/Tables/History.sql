CREATE TABLE [dbo].[History]
(
	[HistoryId] INT IDENTITY(1,1), 
    [ServerId] INT NOT NULL, 
    [History] NVARCHAR(2000) NOT NULL, 
    [HistoryDateTime] DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT pk_History PRIMARY KEY (HistoryId)
)
GO

ALTER TABLE [dbo].[History]
	ADD CONSTRAINT fk_History_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
GO