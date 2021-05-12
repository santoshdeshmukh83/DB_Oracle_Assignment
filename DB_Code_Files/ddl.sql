--Create table regions
CREATE TABLE regions (
		region_id NUMBER(4), 
		region_name VARCHAR2(50) NOT NULL,
		CONSTRAINT pk_region_id PRIMARY KEY (region_id)
		);

--Create table countries 		 
CREATE TABLE countries (
		country_id NUMBER(4), 
		country_name VARCHAR2(100) NOT NULL,
		region_id NUMBER,
		CONSTRAINT pk_country_id PRIMARY KEY (country_id),
		CONSTRAINT fk_cntry_region_id FOREIGN KEY (region_id)REFERENCES regions(region_id) ON DELETE CASCADE
		);		
		
--Create table locations
CREATE TABLE locations (
		location_id NUMBER(4),
		address      VARCHAR2(500),
		postal_code  VARCHAR2(20),
		city         VARCHAR2(200) NOT NULL,
		state        VARCHAR2(200),
		country_id   NUMBER,
		CONSTRAINT pk_location_id PRIMARY KEY (location_id),
		CONSTRAINT fk_loc_region_id FOREIGN KEY (country_id)REFERENCES countries(country_id) ON DELETE CASCADE
		);		
--Create table warehouses
CREATE TABLE warehouses (
		warehouse_id 	NUMBER(4),
		warehouse_name VARCHAR2(500),
		location_id    NUMBER,
		CONSTRAINT pk_warehouse_id PRIMARY KEY (warehouse_id),
		CONSTRAINT fk_loc_whs_id FOREIGN KEY (location_id)REFERENCES locations(location_id) ON DELETE CASCADE
		);				 

--Create table departments
CREATE TABLE departments  (
		dept_id  	NUMBER(4),
		department_name  VARCHAR2(50) NOT NULL,
		location_id    NUMBER,
		CONSTRAINT pk_dept_id PRIMARY KEY (dept_id),
		CONSTRAINT fk_loc_dept_id FOREIGN KEY (location_id)REFERENCES locations(location_id) ON DELETE CASCADE
		);	
		
--Create table employees
CREATE TABLE employees (
		employee_id    NUMBER,
		first_name     VARCHAR2(50) NOT NULL,
		last_name      VARCHAR2(50) ,
		email      VARCHAR2(100) NOT NULL,
		phone      VARCHAR2(25),
		hire_date	DATE NOT NULL,
		dob         DATE NOT NULL,
		salary      NUMBER,
		manager_id NUMBER,
		designation VARCHAR2(25)  NOT NULL,
		dept_id  NUMBER,
		CONSTRAINT pk_employees_id PRIMARY KEY (employee_id),
		CONSTRAINT fk_employees_mgr FOREIGN KEY( manager_id ) REFERENCES employees( employee_id ) ON DELETE CASCADE
		);			
--Create table product_category
CREATE TABLE product_categories (
		category_id  	NUMBER(4),
		category_name   VARCHAR2(50) NOT NULL,
		CONSTRAINT pk_prod_cat_id PRIMARY KEY (category_id)
		);			
--Create table products
CREATE TABLE products (
		product_id  NUMBER(4),
		product_name  VARCHAR2(100) NOT NULL,
		description   VARCHAR2(4000),
		cost_currency VARCHAR2(3) DEFAULT 'USD' NOT NULL,	
		standard_cost NUMBER NOT NULL,
		list_price NUMBER NOT NULL,
		category_id  	NUMBER(4) NOT NULL,
		CONSTRAINT pk_product_id PRIMARY KEY (product_id),
		CONSTRAINT fk_prod_cat_id FOREIGN KEY (category_id)REFERENCES product_categories (category_id) ON DELETE CASCADE
		);			
--Create table customers
CREATE TABLE customers (
		customers_id  NUMBER,
		customer_name VARCHAR2(100) NOT NULL,
		address       VARCHAR2(500) NOT NULL,
		website       VARCHAR2(500),
		facebook      VARCHAR2(500),
		twitter       VARCHAR2(500),
		whatsapp      VARCHAR2(500),
		CONSTRAINT pk_customers_id PRIMARY KEY (customers_id)
		);			
--Create table contacts
CREATE TABLE contacts (
		contact_id  NUMBER,
		customers_id  NUMBER,
		first_name     VARCHAR2(50) NOT NULL,
		last_name      VARCHAR2(50) ,
		email      VARCHAR2(100) NOT NULL,
		phone      VARCHAR2(25),
		CONSTRAINT pk_contact_id PRIMARY KEY (contact_id),
		CONSTRAINT fk_cust_contact_id FOREIGN KEY (customers_id)REFERENCES customers(customers_id) ON DELETE CASCADE
		);			
		
--Create table orders
CREATE TABLE orders (
		order_id  NUMBER,
		customers_id NUMBER,
		status VARCHAR2(50) NOT NULL,
		salesman_id NUMBER,
		order_date TIMESTAMP(6) DEFAULT SYSTIMESTAMP,
		CONSTRAINT pk_cust_ord_contact_id PRIMARY KEY (order_id),
		CONSTRAINT fk_cust_ord_id FOREIGN KEY (customers_id)REFERENCES customers(customers_id) ON DELETE CASCADE,
		CONSTRAINT fk_cust_ord_saleman_id FOREIGN KEY( salesman_id ) REFERENCES employees( employee_id ) ON DELETE CASCADE
		);		
--Create table order items
CREATE TABLE order_items (
		item_id  NUMBER,
		order_id  NUMBER,
		product_id  NUMBER,
		quantity	  NUMBER NOT NULL,
		unit_price NUMBER,
		warehouse_id NUMBER,
		CONSTRAINT pk_item_id PRIMARY KEY (item_id, order_id),
		CONSTRAINT fk_orditems_item_id FOREIGN KEY (order_id)REFERENCES orders(order_id) ON DELETE CASCADE,
		CONSTRAINT fk_orditems_prod_id FOREIGN KEY (product_id)REFERENCES products(product_id) ON DELETE CASCADE,
		CONSTRAINT fk_orditems_whs_id FOREIGN KEY (warehouse_id)REFERENCES warehouses(warehouse_id) ON DELETE CASCADE
		);			

		--Create table inventories
CREATE TABLE inventories
  (
    product_id   NUMBER,
    warehouse_id NUMBER,
    quantity     NUMBER NOT NULL,
    CONSTRAINT pk_inventories PRIMARY KEY( product_id, warehouse_id ),
    CONSTRAINT fk_invt_prdcts FOREIGN KEY( product_id ) REFERENCES products( product_id ) ON DELETE CASCADE,
    CONSTRAINT fk_invt_whs FOREIGN KEY( warehouse_id ) REFERENCES warehouses( warehouse_id ) ON DELETE CASCADE
  );
 
		
--create indexes for table order_items
CREATE INDEX idx_ord_itms_warehouse_id ON order_items (warehouse_id);

--create indexes for table contacts
CREATE INDEX idx_cntct_customers_id ON contacts (customers_id);

--create indexes for table customers
CREATE INDEX idx_cust_name ON customers (customer_name);
--create indexes for table orders
CREATE INDEX idx_ordr_cust_id ON orders (customers_id); 
CREATE INDEX idx_ordr_status ON orders (status); 
CREATE INDEX idx_ordr_salesman_id ON orders (salesman_id); 
CREATE INDEX idx_ord_order_dt ON orders (order_date); 

--create indexes for table products
CREATE INDEX idx_prodct_prodt_name ON products (product_name); 

--create indexes for table product_categories
CREATE INDEX idx_prodct_ctgory_name ON product_categories (category_name); 

--create indexes for table employees
CREATE INDEX idx_employs_mgr_id ON employees (manager_id); 
CREATE INDEX idx_employs_hire_dt ON employees (hire_date); 
CREATE INDEX idx_employs_desgins ON employees (designation); 
CREATE INDEX idx_employs_dept_id ON employees (dept_id); 

--create indexes for table employees
CREATE INDEX idx_depts_dept_name ON departments (department_name); 

--create indexes for table regions
CREATE INDEX idx_regns_dept_region_name ON regions (region_name); 


--create indexes for table countries
CREATE INDEX idx_cntries_cntry_name ON countries (country_name); 


--create indexes for table locations
CREATE INDEX idx_locn_country_id ON locations (country_id); 
CREATE INDEX idx_locn_state ON locations (state); 
CREATE INDEX idx_locn_city ON locations (city); 
CREATE INDEX idx_locn_postal_code ON locations (postal_code); 

--create indexes for table warehouses
CREATE INDEX idx_whs_name ON warehouses (warehouse_name); 



--creating sequnces to generate all the numeric primary keys--
--regions
CREATE SEQUENCE seq_region_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;		
--countries
CREATE SEQUENCE seq_country_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1; 
--locations  
CREATE SEQUENCE seq_location_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;  
--warehouses  
CREATE SEQUENCE seq_warehouse_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;  
--departments  
CREATE SEQUENCE seq_department_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;  	

--employees  
CREATE SEQUENCE seq_employee_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;  	

--product_categories  
CREATE SEQUENCE seq_category_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;  	  
  
-- products  
CREATE SEQUENCE seq_product_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;  	  
  
 -- customers  
CREATE SEQUENCE seq_customer_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;    

-- contacts 
CREATE SEQUENCE seq_contact_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;      
  
  -- orders
CREATE SEQUENCE seq_order_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;      

-- order_items
CREATE SEQUENCE seq_item_id
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1;      

  
-- Below is sample given on how to create audit tables and triggers to records these audtig details, same can be repeteated for all other tables.
-- so, please make a note that I won't be creating all the audit tables and I hope this should be ok as far this assignment is concerned.
			
--Create audit table regions
CREATE TABLE aud_regions (
		region_id NUMBER(4), 
		region_name VARCHAR2(25),
		user_name varchar2(30),  -- User who has done the operation 
		audit_date TIMESTAMP(6) DEFAULT SYSTIMESTAMP, -- Timestamp on operation
        audit_operation  varchar2(30) -- What kind of DML operation
		);		
--trigger for region auditing
CREATE OR REPLACE trigger trg_aud_regions
BEFORE INSERT OR DELETE OR UPDATE ON regions
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_audit_date  varchar2(30);
BEGIN
	SELECT user, sysdate INTO v_user, v_audit_date  FROM dual;

  IF INSERTING THEN
    INSERT INTO aud_regions (region_id,region_name, user_name, audit_date, audit_operation) 
    VALUES(:NEW.region_id, :NEW.region_name , v_user, v_audit_date, 'INSERT');  
  ELSIF DELETING THEN
    INSERT INTO aud_regions (region_id,region_name, user_name, audit_date, audit_operation) 
    VALUES(:OLD.region_id,:OLD.region_name, v_user, v_audit_date, 'DELETE');
  ELSIF UPDATING THEN
    INSERT INTO aud_regions (region_id,region_name, user_name, audit_date, audit_operation) 
    VALUES(:OLD.region_id, :OLD.region_name, v_user, v_audit_date,'UPDATE');
  END IF;
END;
/		

--sample procedure to udpate data in region table

/* This is sample procedure and can can created similar for others tables*/ 

CREATE OR REPLACE PROCEDURE upt_regions(p_in_region_id IN regions.region_id%TYPE,
									    p_in_region_name IN regions.region_name%TYPE ) 
IS
BEGIN
   -- update region table
   UPDATE regions
   SET region_name = p_in_region_name
   WHERE region_id = p_in_region_id;
END;
/

CREATE OR REPLACE PROCEDURE del_regions(p_in_region_id IN regions.region_id%TYPE) 
IS
BEGIN
   --delete form childs table first
   delete from countries where region_id = p_in_region_id;
   --delete from parent table
   delete from regions where region_id = p_in_region_id;
END;
/

/*  login with user - app_user to create synonyms  */ 
DECLARE
v_error_message VARCHAR2(4000);

BEGIN
		
	FOR i IN (SELECT owner, object_name FROM all_objects WHERE object_type in ('TABLE','VIEW') and owner = 'ONLINESTOREDB') LOOP
		BEGIN
			  EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM '||i.object_name||' FOR '||i.owner||'.' || i.object_name;
		EXCEPTION  
		  WHEN OTHERS THEN
				v_error_message := sqlerrm;
				DBMS_OUTPUT.PUT_LINE('Failed while creating synonym for '|| i.owner || '-' ||i.object_name|| ' due to '||  v_error_message);
		END;  
	END LOOP;
END;
/