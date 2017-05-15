CREATE PROCEDURE [dbo].[iface_ddl]
	@Statement nvarchar(50),
	@VersionId int = 0
AS

	IF @Statement = 'ddl Server'
	BEGIN
		SELECT
			[ServerId],
			[ServerName] + ' (' + [InstanceName] + ')' AS [ServerName]
		FROM
			[dbo].[Server]
		ORDER BY
			[ServerName] + ' (' + [InstanceName] + ')'
	END

	IF @Statement = 'ddl Version'
	BEGIN
		SELECT
			[VersionId],
			[Version]
		FROM	
			[dbo].[Version]
		ORDER BY 
			[Version] ASC
	END

	IF @Statement = 'ddl Edition'
	BEGIN
		SELECT
			[EditionId],
			[Edition]
		FROM
			[dbo].[Edition]
		ORDER BY 
			[SortOrder]
	END

	IF @Statement = 'ddl Environment'
	BEGIN
		SELECT
			[EnvironmentId],
			[Environment]
		FROM
			[dbo].[Environment]
		ORDER BY
			[SortOrder]
	END

	IF @Statement = 'ddl Location'
	BEGIN
		SELECT
			[LocationId],
			[Location]
		FROM
			[dbo].[Location]
		ORDER BY
			[SortOrder]
	END

	IF @Statement = 'ddl BusinessUnit'
	BEGIN
		SELECT
			[BusinessUnitId],
			[BusinessUnit]
		FROM
			[dbo].[BusinessUnit]
		ORDER BY
			[SortOrder]
	END

	IF @Statement = 'ddl Status'
	BEGIN
		SELECT
			[ServerStatusId],
			[ServerStatus]
		FROM
			[dbo].[ServerStatus]
		ORDER BY
			[SortOrder]
	END

	IF @Statement = 'ddl BuildNo'
	BEGIN
		IF @VersionId = 0
		BEGIN
			SELECT
				[BuildNoId],
				[BuildName] + ' (' + [BuildNo] + ')' as [BuildNo]
			FROM
				[dbo].[BuildNo]
			ORDER BY 
				ReleaseDate ASC, 
				REPLACE(BuildNo,'.','') ASC
		END

		IF @VersionId <> 0
		BEGIN
			SELECT
				[BuildNoId],
				[BuildName] + ' (' + [BuildNo] + ')' as [BuildNo]
			FROM
				[dbo].[BuildNo]
			WHERE
				VersionId = @VersionId
			ORDER BY 
				ReleaseDate ASC, 
				REPLACE(BuildNo,'.','') ASC
		END
	END

GO
