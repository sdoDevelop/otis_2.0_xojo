Create Table login_info
	(
	pkid		Integer	Primary Key,
	fkuser_info	Integer ,
	username	Text	,
	password	Text	,
	auto_login	Boolean 
		);

Create Table user_info
	(
	pkid		Integer	Primary Key,
	name_first	Text	,
	name_last	Text	
		);