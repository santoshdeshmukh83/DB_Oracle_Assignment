--create back up tables for all the tables present in schema
DECLARE
v_error_message VARCHAR2(500);
v_backup_tbl_extn VARCHAR2(20);

BEGIN

   v_backup_tbl_extn := TO_CHAR('YYYYMMDD');
   FOR i IN (SELECT object_name FROM user_objects WHERE object_type in ('TABLE') LOOP
		BEGIN    
			  EXECUTE IMMEDIATE 'CREATE TABLE ' || i.object_name||'_'|| v_backup_tbl_extn ||' AS SELECT * FROM ' ||i.object_name ;
			  ;
		EXCEPTION
			  WHEN OTHERS THEN
				v_error_message := sqlerrm;
				DBMS_OUTPUT.PUT_LINE('Failed while creating a back up table for '|| i.object_name || ' due to '||  l_error_message);
		END;   
	END LOOP;	
END;
/