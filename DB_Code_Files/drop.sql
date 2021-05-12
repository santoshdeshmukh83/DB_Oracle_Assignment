-- This script is used to drop all the tables from the schema. Cascade constraints will help to remove all parent/child tables in any given order,
-- otherwise, drop all the child tables first and then parent tables.  
DECLARE
	v_error_message VARCHAR2(500);
BEGIN
  FOR i in (SELECT 'DROP TABLE ' ||table_name||' CASCADE CONSTRAINTS' drop_all_tbl_stmt, table_name FROM user_tables) 
  LOOP
	BEGIN
		EXECUTE IMMEDIATE i.drop_all_tbl_stmt;
	EXCEPTION WHEN OTHERS THEN	
		v_error_message := sqlerrm;
		DBMS_OUTPUT.PUT_LINE('Failed while dropping table '|| i.table_name || ' due to '||  v_error_message);
	END;	
  END LOOP;
END;
/