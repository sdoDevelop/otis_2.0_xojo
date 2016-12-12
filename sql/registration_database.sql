-- registration_database.sql

Create Table tbl_users
	(
	pkid				Serial 		Primary Key,
	row_created			Timestamp 	Default clock_timestamp(),
	row_modified		Timestamp 	Default clock_timestamp(),
	name_first			Text,
	name_last			Text
		);

--
Create Table tbl_otis_client_reg
	(
	pkid 				Serial 		Primary Key,
	row_created			Timestamp 	Default clock_timestamp(),
	row_modified 		Timestamp 	Default clock_timestamp(),
	fkusers				Integer,
	client_id			Serial
		);

--
CREATE FUNCTION public.tgfnc_tbl_users_change()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    NOT LEAKPROOF 
AS $BODY$
Declare
Begin

Update tbl_users
	Set 
   		row_modified = clock_timestamp()
    Where pkid = New.pkid;

Return New;
End;
$BODY$;

ALTER FUNCTION public.tgfnc_tbl_users_change()
    OWNER TO postgres;


--
CREATE FUNCTION public.tgfnc_tbl_otis_client_reg_change()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    NOT LEAKPROOF 
AS $BODY$
Declare
Begin

Update tbl_otis_client_reg
	Set 
    	row_modified = clock_timestamp()
    Where pkid = New.pkid;

Return New;
End;

$BODY$;

ALTER FUNCTION public.tgfnc_tbl_otis_client_reg_change()
    OWNER TO postgres;



--
CREATE TRIGGER tg_tbl_users_change
    AFTER UPDATE OF name_last, name_first
    ON public.tbl_users
    FOR EACH ROW
    EXECUTE PROCEDURE public.tgfnc_tbl_users_change();

--
CREATE TRIGGER tg_tbl_otis_client_reg
    AFTER UPDATE OF fkusers, client_id
    ON public.tbl_otis_client_reg
    FOR EACH ROW
    EXECUTE PROCEDURE public.tgfnc_tbl_otis_client_reg_change();


--
CREATE FUNCTION public.fnc_get_new_client_id()
    RETURNS integer
    LANGUAGE 'plpgsql'
    NOT LEAKPROOF 
AS $function$
Declare
clientid integer;
Begin

Insert Into tbl_otis_client_reg
  	Default Values
  	Returning client_id Into clientid;

Return clientid;
  
End;
$function$;

ALTER FUNCTION public.fnc_get_new_client_id()
    OWNER TO postgres;