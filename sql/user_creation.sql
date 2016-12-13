

-- Role: admin_user
-- DROP ROLE admin_user;

CREATE ROLE admin_user WITH
  NOLOGIN
  SUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

-- Role: admin_user
-- DROP ROLE admin_user;

CREATE ROLE general_user WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

Create User serveradmin
	With Password '3agle5f0rL!fe'
	Inherit admin_user
	;