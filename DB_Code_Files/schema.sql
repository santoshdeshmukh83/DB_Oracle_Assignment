--create a new user onlinestoredb

-- Assumptions
--	1. All required tablespaces are created already and data tablespace name is USER_DATA, if not mentioned it will take from what DBA has configured.
--  2. Temporary tablespace - TEMP, if not mentioned it will take from what DBA has configured.

CREATE USER onlinestoredb
  IDENTIFIED BY onlinestoredb
  DEFAULT TABLESPACE USER_DATA
  TEMPORARY TABLESPACE TEMP ;

-- Privilges required to connect with datbase and create basic obejct types, list can be expanded on need basis.  
GRANT CREATE SESSION TO USER_DATA; 
GRANT CREATE CONNECT TO USER_DATA; 
GRANT CREATE RESOURCE TO USER_DATA; 
GRANT UNLIMITED TABLESPACE TO USER_DATA;
