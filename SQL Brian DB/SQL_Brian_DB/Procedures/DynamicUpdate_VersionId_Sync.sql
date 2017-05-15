CREATE PROCEDURE [dbo].[DynamicUpdate_VersionId_Sync]
AS
	UPDATE
		[Server]
	SET
		[VersionId] = [BuildNo].[VersionId]
	FROM
		[Server]
	LEFT  JOIN
		[BuildNo]
		ON
			[BuildNo].[BuildNoId] = [Server].[BuildNoId]
	WHERE
		[BuildNo].[VersionId] <> [Server].[VersionId]
		OR
		[Server].[VersionId] IS NULL
RETURN 0
