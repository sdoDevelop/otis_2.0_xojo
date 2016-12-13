-- Sync Database Check Script

Select 
	pkid		,
	json_info	,
	pushed		
From
	changes_raw
	;

Select 
	pkid		,
	json_info	,
	pushed 		
From
	changes_consolidated
	;