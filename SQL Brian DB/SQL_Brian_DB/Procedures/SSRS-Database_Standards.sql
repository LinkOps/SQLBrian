CREATE PROCEDURE [dbo].[SSRS-Database_Standards]
	@Statement NVARCHAR(20)
AS
	IF @Statement='Page Verify'
	BEGIN
		SELECT
			CASE
				WHEN [InstanceName] <> 'MSSQLSERVER' THEN [ServerName] + '\' + [InstanceName]
				ELSE [ServerName]
			END AS [ServerName],
			DatabaseName 
		FROM
			[Database]
		LEFT JOIN
			[Server]
			ON
				[Server].[ServerId] = [Database].[ServerId]
		WHERE
			[ServerStatusId] in (1,2)
			AND
			[State] = 'ONLINE'
			AND
			[Page_Verify] <> 'CHECKSUM'
		ORDER BY
			CASE
				WHEN [InstanceName] <> 'MSSQLSERVER' THEN [ServerName] + '\' + [InstanceName]
				ELSE [ServerName]
			END,
			DatabaseName
	END
	
	IF @Statement='Bad State'
	BEGIN
		SELECT
			CASE
				WHEN [InstanceName] <> 'MSSQLSERVER' THEN [ServerName] + '\' + [InstanceName]
				ELSE [ServerName]
			END AS [ServerName],
			DatabaseName 
		FROM
			[Database]
		LEFT JOIN
			[Server]
			ON
				[Server].[ServerId] = [Database].[ServerId]
		WHERE
			[ServerStatusId] in (1,2)
			AND
			[State] NOT IN ('ONLINE','RESTORING','DELETED')
		ORDER BY
			CASE
				WHEN [InstanceName] <> 'MSSQLSERVER' THEN [ServerName] + '\' + [InstanceName]
				ELSE [ServerName]
			END,
			DatabaseName
	END
RETURN 0
