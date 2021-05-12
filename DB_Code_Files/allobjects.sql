--list down all the object types present in a schema
BEGIN
	FOR i IN (SELECT object_name, object_type FROM user_objects) LOOP
		DBMS_OPUTPUT.PUT_LINE('You have ' || object_type || '-' ||object_name ||' present in your shcema.');
	END LOOP;	
END;
/