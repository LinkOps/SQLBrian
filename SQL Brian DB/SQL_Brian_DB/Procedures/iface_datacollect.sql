CREATE PROCEDURE [dbo].[iface_datacollect]
	@Statement nvarchar(50),
	@ServerId int = 0
AS
	IF @Statement = 'Get Server Info'
	BEGIN
		SELECT
			[ServerName],
			[InstanceName],
			[IPAddress],
			[Version].[Version],
			[BuildNo].[BuildName],
			[Edition].[Edition],
			[EnvironmentId],
			[LocationId],
			[BusinessUnitId],
			[CPUCores],
			[CPUCoreSpeed],
			[ServerRAM],
			[InstanceRAM],
			[InstallationDate],
			[ServerStatusId]
		FROM
			[dbo].[Server]
		LEFT JOIN
			[dbo].[BuildNo]
			ON
				[BuildNo].[BuildNoId] = [Server].[BuildNoId]
		LEFT JOIN
			[dbo].[Version]
			ON
				[Version].[VersionId] = [Server].[VersionId]
		LEFT JOIN
			[dbo].[Edition]
			ON
				[Edition].[EditionId] = [Server].[EditionId]
		WHERE
			[ServerId] = @ServerId
	END
GO
