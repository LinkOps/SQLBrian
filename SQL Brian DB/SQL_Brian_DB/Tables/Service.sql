CREATE TABLE [dbo].[Service]
(
	[ServiceId] INT IDENTITY(1,1),
    [Service] NVARCHAR(20) NULL,
	CONSTRAINT pk_Service PRIMARY KEY (ServiceId),
	CONSTRAINT ck_Service UNIQUE (Service)
)
