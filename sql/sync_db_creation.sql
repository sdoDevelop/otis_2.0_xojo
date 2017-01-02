Create Table changes_raw
	(
	pkid		Integer	Primary Key,
	json_info	Text	,
	pushed		Boolean	
		);

Create Table changes_consolidated
	(
	pkid		Integer	Primary Key,
	json_info	Text	,
	pushed		Boolean	
		);