CREATE PROCEDURE [dbo].[iface_dataupdate]
	@Statement nvarchar(50),
	@ServerId int = 0,
	@IPAddress nvarchar(15) = '',
	@VersionId int = 0,
	@BuildNoId int = 0,
	@EditionId int = 0,
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
	IF @Statement = 'Update Server'
	BEGIN
		UPDATE
			[dbo].[Server]
		SET
			[IPAddress] = @IPAddress,
			[EnvironmentId] = @EnvironmentId,
			[LocationId] = @LocationId,
			[BusinessUnitId] = @BusinessUnitId,
			[CPUCores] = @CPUCores,
			[CPUCoreSpeed] = @CPUSpeed,
			[InstallationDate] = @InstallationDate,
			[ServerStatusId] = @StatusId
		WHERE
		[ServerId] = @ServerId
	END
GO
