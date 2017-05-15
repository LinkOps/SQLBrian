CREATE PROCEDURE [dbo].[DynamicUpdate_DatabaseChanges]
AS
	INSERT INTO
		[Log_Database]
	SELECT
		[rw_Database].[ServerId],
		ISNULL([Database].[DatabaseId],[rw_Database].[DatabaseId]),
		Current_Timestamp,
		[Database].[DatabaseName],
		[rw_Database].[DatabaseName],
		[Database].[Compatibility_Level],
		[rw_Database].[Compatibility_Level],
		[Database].[Collation_Name],
		[rw_Database].[Collation_Name],
		[Database].[User_Access],
		[rw_Database].[User_Access],
		[Database].[Read_Only],
		[rw_Database].[Read_Only],
		[Database].[Auto_Close],
		[rw_Database].[Auto_Close],
		[Database].[Auto_Shrink],
		[rw_Database].[Auto_Shrink],
		[Database].[State],
		[rw_Database].[State],
		[Database].[Snapshot_Isolation],
		[rw_Database].[Snapshot_Isolation],
		[Database].[Recovery_Model],
		[rw_Database].[Recovery_Model],
		[Database].[Page_Verify],
		[rw_Database].[Page_Verify]
	FROM
		[rw_Database]
	LEFT JOIN
		[Database]
		ON
			[rw_Database].[ServerId] = [Database].[ServerId]
			AND
			[rw_Database].[DatabaseId] = [Database].[DatabaseId]
	WHERE
		ISNULL([Database].[DatabaseName],'') <> ISNULL([rw_Database].[DatabaseName],'')
		OR
		ISNULL([Database].[Compatibility_Level],'') <> ISNULL([rw_Database].[Compatibility_Level],'')
		OR
		ISNULL([Database].[Collation_Name],'') <> ISNULL([rw_Database].[Collation_Name],'')
		OR
		ISNULL([Database].[User_Access],'') <> ISNULL([rw_Database].[User_Access],'')
		OR
		ISNULL([Database].[Read_Only],'') <> ISNULL([rw_Database].[Read_Only],'')
		OR
		ISNULL([Database].[Auto_Close],'') <> ISNULL([rw_Database].[Auto_Close],'')
		OR
		ISNULL([Database].[Auto_Shrink],'') <> ISNULL([rw_Database].[Auto_Shrink],'')
		OR
		ISNULL([Database].[State],'') <> ISNULL([rw_Database].[State],'')
		OR
		ISNULL([Database].[Snapshot_Isolation],'') <> ISNULL([rw_Database].[Snapshot_Isolation],'')
		OR
		ISNULL([Database].[Recovery_Model],'') <> ISNULL([rw_Database].[Recovery_Model],'')
		OR
		ISNULL([Database].[Page_Verify],'') <> ISNULL([rw_Database].[Page_Verify],'')


	INSERT INTO
		[Database]
	SELECT
		[rw_Database].[ServerId],
		[rw_Database].[DatabaseId],
		[rw_Database].[DatabaseName],
		[rw_Database].[Create_Date],
		[rw_Database].[Compatibility_Level],
		[rw_Database].[Collation_Name],
		[rw_Database].[User_Access],
		[rw_Database].[Read_Only],
		[rw_Database].[Auto_Close],
		[rw_Database].[Auto_Shrink],
		[rw_Database].[State],
		[rw_Database].[Snapshot_Isolation],
		[rw_Database].[Recovery_Model],
		[rw_Database].[Page_Verify]
	FROM
		[rw_Database]
	WHERE
		CAST([rw_Database].[ServerId] AS VARCHAR(3)) + '-' + CAST([rw_Database].[DatabaseId] AS VARCHAR(10)) NOT IN (SELECT CAST([ServerId] AS VARCHAR(3)) + '-' + CAST([DatabaseId] AS VARCHAR(10)) FROM [Database])

	UPDATE
		[Database]
	SET
		[DatabaseName] = [rw_Database].[DatabaseName],
		[Compatibility_Level] = [rw_Database].[Compatibility_Level],
		[Collation_Name] = [rw_Database].[Collation_Name],
		[User_Access] = [rw_Database].[User_Access],
		[Read_Only] = [rw_Database].[Read_Only],
		[Auto_Close] = [rw_Database].[Auto_Close],
		[Auto_Shrink] = [rw_Database].[Auto_Shrink],
		[State] = [rw_Database].[State],
		[Snapshot_Isolation] = [rw_Database].[Snapshot_Isolation],
		[Recovery_Model] = [rw_Database].[Recovery_Model],
		[Page_Verify] = [rw_Database].[Page_Verify]
	FROM
		[rw_Database]
	LEFT JOIN
		[Database]
		ON
			[rw_Database].[ServerId] = [Database].[ServerId]
			AND
			[rw_Database].[DatabaseId] = [Database].[DatabaseId]
	WHERE
		ISNULL([Database].[DatabaseName],'') <> ISNULL([rw_Database].[DatabaseName],'')
		OR
		ISNULL([Database].[Compatibility_Level],'') <> ISNULL([rw_Database].[Compatibility_Level],'')
		OR
		ISNULL([Database].[Collation_Name],'') <> ISNULL([rw_Database].[Collation_Name],'')
		OR
		ISNULL([Database].[User_Access],'') <> ISNULL([rw_Database].[User_Access],'')
		OR
		ISNULL([Database].[Read_Only],'') <> ISNULL([rw_Database].[Read_Only],'')
		OR
		ISNULL([Database].[Auto_Close],'') <> ISNULL([rw_Database].[Auto_Close],'')
		OR
		ISNULL([Database].[Auto_Shrink],'') <> ISNULL([rw_Database].[Auto_Shrink],'')
		OR
		ISNULL([Database].[State],'') <> ISNULL([rw_Database].[State],'')
		OR
		ISNULL([Database].[Snapshot_Isolation],'') <> ISNULL([rw_Database].[Snapshot_Isolation],'')
		OR
		ISNULL([Database].[Recovery_Model],'') <> ISNULL([rw_Database].[Recovery_Model],'')
		OR
		ISNULL([Database].[Page_Verify],'') <> ISNULL([rw_Database].[Page_Verify],'')

	INSERT INTO
		[Log_Database]
	SELECT
		[Database].[ServerId],
		[Database].[DatabaseId],
		Current_Timestamp,
		[Database].[DatabaseName],
		NULL,
		[Database].[Compatibility_Level],
		NULL,
		[Database].[Collation_Name],
		NULL,
		[Database].[User_Access],
		NULL,
		[Database].[Read_Only],
		NULL,
		[Database].[Auto_Close],
		NULL,
		[Database].[Auto_Shrink],
		NULL,
		[Database].[State],
		'DELETED',
		[Database].[Snapshot_Isolation],
		NULL,
		[Database].[Recovery_Model],
		NULL,
		[Database].[Page_Verify],
		NULL
	FROM
		[Database]
	WHERE
		CAST([ServerId] AS NVARCHAR(3)) + '-' + CAST([DatabaseId] AS NVARCHAR(3)) NOT IN (SELECT CAST([ServerId] AS NVARCHAR(3)) + '-' + CAST([DatabaseId] AS NVARCHAR(3)) FROM [rw_Database])
		AND
		[State] <> 'DELETED'

		
	
	UPDATE
		[Database]
	SET
		[State] = 'DELETED'
	WHERE
		CAST([ServerId] AS NVARCHAR(3)) + '-' + CAST([DatabaseId] AS NVARCHAR(3)) NOT IN (SELECT CAST([ServerId] AS NVARCHAR(3)) + '-' + CAST([DatabaseId] AS NVARCHAR(3)) FROM [rw_Database])
		AND
		[State] <> 'DELETED'
RETURN 0
