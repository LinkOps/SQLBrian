CREATE PROCEDURE [dbo].[iface_datainsert]
	@Statement nvarchar(50),
	@ServerName nvarchar(16) = '',
	@IPAddress nvarchar(15) = '',
	@InstanceName nvarchar(50) = 'MSSQLSERVER',
	@VersionId int = 0,
	@EditionId int = 0,
	@BuildNoId int = 0,
	@EnvironmentId int = 0,
	@LocationId int = 0,
	@BusinessUnitId int = 0,
	@CPUCores int = 0,
	@CPUSpeed nvarchar(10) = '',
	@ServerRAM nvarchar(10) = '',
	@InstanceRAM nvarchar(10) = '',
	@InstallationDate datetime2(0) = '19000101',
	@StatusId int = 0
AS
	IF @Statement = 'Add Inventory'
	BEGIN
		INSERT INTO
			Server
				(ServerName, InstanceName, EnvironmentId, LocationId, BusinessUnitId, CPUCores, CPUCoreSpeed, InstallationDate, ServerStatusId, LastUpdated)
			VALUES
				(@ServerName, @InstanceName, @EnvironmentId, @LocationId, @BusinessUnitId, @CPUCores, @CPUSpeed, CURRENT_TIMESTAMP, @StatusId, CURRENT_TIMESTAMP)
	END
GO
