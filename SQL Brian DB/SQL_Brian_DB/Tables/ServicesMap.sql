CREATE TABLE [dbo].[ServiceMap]
(
	[ServiceMapId] INT IDENTITY(1,1), 
    [ServerId] INT NOT NULL, 
    [ServiceId] INT NOT NULL, 
    [ServiceUserAccount] NVARCHAR(30) NOT NULL,
	CONSTRAINT pk_ServiceMap PRIMARY KEY (ServiceMapId),
	CONSTRAINT ck_ServiceMap UNIQUE (ServerId, ServiceId)
)
GO

ALTER TABLE [dbo].[ServiceMap]
	ADD CONSTRAINT fk_ServiceMap_Server
	FOREIGN KEY (ServerId)
	REFERENCES [Server] (ServerId)
GO

ALTER TABLE [dbo].[ServiceMap]
	ADD CONSTRAINT fk_ServiceMap_Services
	FOREIGN KEY (ServiceId)
	REFERENCES [Service] (ServiceId)
GO
