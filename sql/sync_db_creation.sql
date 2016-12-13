-- Sync Database Creation Script


Create Table changes_raw
	(
	pkid		Text	Primary Key,
	json_info	Text	,
	pushed		Boolean	
		);

Create Table changes_consolidated
	(
	pkid		Text	Primary Key,
	json_info	Text	,
	pushed		Boolean	
		);