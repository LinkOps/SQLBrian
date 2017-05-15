CREATE PROCEDURE [dbo].[DynamicUpdate_ConfigurationChanges]
AS
	INSERT INTO
		[Log_Configuration]
	SELECT
		[rw_Configuration].[ServerId],
		ISNULL([Configuration].[ConfigurationId],[rw_Configuration].[ConfigurationId]),
		Current_Timestamp,
		isnull([Configuration].[ConfigName],[rw_Configuration].[ConfigName]),
		[Configuration].[Value],
		[Configuration].[Value_in_Use],
		[rw_Configuration].[Value],
		[rw_Configuration].[Value_in_Use]
	FROM
		[rw_Configuration]
	LEFT JOIN
		[Configuration]
		ON
			[rw_Configuration].[ServerId] = [Configuration].[ServerId]
			AND
			[rw_Configuration].[ConfigurationId] = [Configuration].[ConfigurationId]
	WHERE
		[rw_Configuration].[ConfigName] <> ISNULL([Configuration].[ConfigName],'')
		OR
		[rw_Configuration].[Value] <> ISNULL([Configuration].[Value],'')
		OR
		[rw_Configuration].[Value_in_Use] <> ISNULL([Configuration].[Value_in_Use],'')

	INSERT INTO
		[Configuration]
	SELECT
		[rw_Configuration].[ServerId],
		[rw_Configuration].[ConfigurationId],
		[rw_Configuration].[ConfigName],
		[rw_Configuration].[Value],
		[rw_Configuration].[Value_in_Use],
		'N'
	FROM
		rw_Configuration
	WHERE
		CAST([rw_Configuration].[ServerId] AS VARCHAR(3)) + '-' + CAST([rw_Configuration].[ConfigurationId] AS VARCHAR(10)) NOT IN (SELECT CAST([ServerId] AS VARCHAR(3)) + '-' + CAST([ConfigurationId] AS VARCHAR(10)) FROM [Configuration])

	UPDATE
		[Configuration]
	SET
		[ConfigName] = [rw_Configuration].[ConfigName],
		[Value] = [rw_Configuration].[Value],
		[Value_in_Use] = [rw_Configuration].[Value_in_Use]
	FROM
		[rw_Configuration]
	LEFT JOIN
		[Configuration]
		ON
			[rw_Configuration].[ServerId] = [Configuration].[ServerId]
			AND
			[rw_Configuration].[ConfigurationId] = [Configuration].[ConfigurationId]
	WHERE
		[rw_Configuration].[ConfigName] <> ISNULL([Configuration].[ConfigName],'')
		OR
		[rw_Configuration].[Value] <> ISNULL([Configuration].[Value],'')
		OR
		[rw_Configuration].[Value_in_Use] <> ISNULL([Configuration].[Value_in_Use],'')
RETURN 0
