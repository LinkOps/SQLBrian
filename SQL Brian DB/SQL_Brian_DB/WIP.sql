select 
	Version.*,
	BuildNo.*,
	SERVERPROPERTY('EditionID')
from
	SQL_Brian..BuildNo 
left join
	SQL_Brian..Version
	on
		Version.VersionId = BuildNo.VersionId
where 
	BuildNo = SERVERPROPERTY('productversion')