-- Assumptions
--	1. All required tablespaces are created already and data tablespace name is USER_DATA, if not mentioned it will take from what DBA has configured.
--  2. Temporary tablespace - TEMP, if not mentioned it will take from what DBA has configured.

CREATE USER admin
  IDENTIFIED BY admin
  DEFAULT TABLESPACE USER_DATA
  TEMPORARY TABLESPACE TEMP ;

-- Privilges required to connect with datbase and create basic obejct types, list can be expanded on need basis.  
GRANT CREATE SESSION TO admin; 
GRANT CREATE CONNECT TO admin;
GRANT DBA TO admin;


CREATE USER app_user
  IDENTIFIED BY app_user
  DEFAULT TABLESPACE USER_DATA
  TEMPORARY TABLESPACE TEMP ;

-- Privilges required to connect with datbase and create basic obejct types, list can be expanded on need basis.  
GRANT CREATE SESSION TO app_user; 
GRANT CREATE CONNECT TO app_user;


-- Admin user will have all access as DBA role is given to that user, so that admin can access the objects using schema prefix.

-- Grant privileges for the app_user on ONLINESTOREDB schema

/*  login with user - onlinestoredb  */ 
DECLARE
v_from_user VARCHAR2(20) := 'onlinestoredb';
v_to_user VARCHAR2(20) := 'app_user';
v_error_message VARCHAR2(500);

BEGIN
   FOR i IN (SELECT object_name,object_type FROM user_objects WHERE object_type in ('TABLE','VIEW')) LOOP
		BEGIN    
			  EXECUTE IMMEDIATE 'grant SELECT,INSERT,UPDAT,DELETE on '||v_from_user||'.'||i.object_name||' to ' || 
			  ;
		EXCEPTION
			  WHEN OTHERS THEN
				v_error_message := sqlerrm;
				DBMS_OUTPUT.PUT_LINE('Failed while giving permission on '|| i.object_name || ' due to '||  l_error_message);
		END;   
	END LOOP;	
END;
/
