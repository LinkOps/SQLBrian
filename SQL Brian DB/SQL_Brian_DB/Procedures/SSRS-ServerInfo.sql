CREATE PROCEDURE [dbo].[SSRS-ServerInfo]
	@Statement NVARCHAR(20),
	@ServerId NVARCHAR(3)
AS
	IF @Statement = 'Configuration'
	BEGIN
		SELECT 
			[ConfigName],
			[value_in_use],
			CASE
				WHEN [ConfigurationId] = '1538' AND CAST([value_in_use] AS NVARCHAR(20)) < '60' THEN '1'
				WHEN [ConfigurationId] = '1539' AND CAST([value_in_use] AS NVARCHAR(20)) > CAST([Server].[CPUCores]/2 AS NVARCHAR(3)) THEN '1'
				WHEN [ConfigurationId] = '1543' AND CAST([value_in_use] AS NVARCHAR(20)) < '16' THEN '1'
				WHEN [ConfigurationId] = '1544' AND CAST(Value_in_Use AS DECIMAL)/1024 > CAST(ServerRAM AS DECIMAL)  THEN '1'
				WHEN [ConfigurationId] = '117' AND CAST([value_in_use] AS NVARCHAR(20)) = '1' THEN '1'
				WHEN [ConfigurationId] = '518' AND CAST([value_in_use] AS NVARCHAR(20)) = '1' THEN '1'
				WHEN [ConfigurationId] = '1576' AND CAST([value_in_use] AS NVARCHAR(20)) = '0' THEN '1'
				WHEN [ConfigurationId] = '1581' AND CAST([value_in_use] AS NVARCHAR(20)) = '0' THEN '1'
				ELSE '0'
			END AS BadConfig
		FROM
			[Configuration]
		LEFT JOIN
			[Server]
			ON
				[Server].[ServerId] = [Configuration].[ServerId]
		WHERE
			[Configuration].[ServerId] = @ServerId
		ORDER BY
			[ConfigName]
	END

	IF @Statement = 'Database'
	BEGIN
		SELECT 
			[DatabaseName],
			[State],
			[Recovery_Model],
			[Compatibility_Level],
			[Collation_Name],
			[User_Access],
			[Read_Only],
			[Auto_Close],
			[Auto_Shrink],
			[Snapshot_Isolation],
			[Page_Verify],
			[Create_Date],
			CASE
				WHEN [State] NOT IN ('ONLINE','RESTORING') THEN '1'
				WHEN [Read_Only] = 1 THEN '2'
				WHEN [User_Access] <> 'MULTI_USER' THEN '1'
				WHEN [Auto_Close] = 1 THEN '1'
				WHEN [Auto_Shrink] = 1 THEN '1'
				WHEN [Page_Verify] NOT IN ('CHECKSUM') THEN '1'
				WHEN [Create_Date] > CURRENT_TIMESTAMP-7 THEN '3'
				ELSE '0'
			END AS BadConfig
		FROM
			[Database]
		WHERE
			[ServerId] = @ServerId
			AND
			[State] NOT IN ('DELETED')
		ORDER BY
			[DatabaseName]
	END
RETURN 0
