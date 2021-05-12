/* here are two options to insert the data

1. Dislable all the constraints and insert tables in any order
2. Insert all parent tables first and then child tables

So, I am going with both the combinations, 
	a. Disable the constraints
	b. Load all the tables in sequence
	c. Enable all the constraints again after data load is completed.

*/

ALTER TABLE countries DISABLE CONSTRAINT fk_cntry_region_id;
ALTER TABLE locations DISABLE CONSTRAINT fk_loc_region_id;
ALTER TABLE warehouses DISABLE CONSTRAINT fk_loc_whs_id;
ALTER TABLE departments DISABLE CONSTRAINT fk_loc_dept_id;
ALTER TABLE employees DISABLE CONSTRAINT fk_employees_mgr;
ALTER TABLE products DISABLE CONSTRAINT fk_prod_cat_id;
ALTER TABLE contacts DISABLE CONSTRAINT fk_cust_contact_id;
ALTER TABLE orders DISABLE CONSTRAINT fk_cust_ord_id;
ALTER TABLE orders DISABLE CONSTRAINT fk_cust_ord_saleman_id;
ALTER TABLE order_items DISABLE CONSTRAINT fk_orditems_item_id;
ALTER TABLE order_items DISABLE CONSTRAINT fk_orditems_prod_id;
ALTER TABLE order_items DISABLE CONSTRAINT fk_orditems_whs_id;
ALTER TABLE inventories DISABLE CONSTRAINT fk_invt_prdcts;
ALTER TABLE inventories DISABLE CONSTRAINT fk_invt_whs;

-- insert into regions
INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Asia');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Western Europe');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Central and Eastern Europe');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Africa');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Mediterranean');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'North America');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'South America');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Central America');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Caribbean');

INSERT INTO regions (region_id,region_name)
VALUES (seq_region_id.nextval, 'Middle East');

-- insert into countries
INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Turkey',(select region_id from regions where region_name = 'Middle East'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Syria',(select region_id from regions where region_name = 'Middle East'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'India',(select region_id from regions where region_name = 'Asia'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Indonesia',(select region_id from regions where region_name = 'Asia'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Germany',(select region_id from regions where region_name = 'Western Europe'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Spain',(select region_id from regions where region_name = 'Western Europe'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'UK',(select region_id from regions where region_name = 'Western Europe'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Switzerland',(select region_id from regions where region_name = 'Western Europe'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Egypt',(select region_id from regions where region_name = 'Africa'));

INSERT INTO countries (country_id, country_name,region_id)
VALUES (seq_country_id.nextval, 'Nigeria',(select region_id from regions where region_name = 'Africa'));

-- insert into locations

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'Home Address XXX 1','58550','Akıncılar','Sivas Province',(select country_id from countries where country_name = 'Turkey'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'Home Address YYY 2','65570','Saray','Van Province',(select country_id from countries where country_name = 'Turkey'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'DLF Aakritu Adheri East','400047','Mumbai','Maharashtra',(select country_id from countries where country_name = 'India'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'EONT IT Park Kharadi','411014','Pune','Maharashtra',(select country_id from countries where country_name = 'India'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'Home address 345','530068','Banglore','Karnataka',(select country_id from countries where country_name = 'India'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'Home address 456 xxx','110006','Delhi','Delhi',(select country_id from countries where country_name = 'India'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'Chennai Address YYY ','600001','Chennai','TamilNadu',(select country_id from countries where country_name = 'India'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'Some address 12345','641001','Coimbatore','TamilNadu',(select country_id from countries where country_name = 'India'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'Home address test','451010','Indore','MadhyaPradesh',(select country_id from countries where country_name = 'India'));

INSERT INTO locations (location_id,address,postal_code,city,state,country_id)
VALUES (seq_location_id.nextval, 'test address for Bhoapl','462001','Bhoapl','MadhyaPradesh',(select country_id from countries where country_name = 'India'));

-- insert into warehouses
INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Pune Warehouse', (select location_id from locations where city = 'Pune'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Mumbai Warehouse', (select location_id from locations where city = 'Mumbai'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Delhi Warehouse', (select location_id from locations where city = 'Delhi'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Banglore Warehouse', (select location_id from locations where city = 'Banglore'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Chennai Warehouse', (select location_id from locations where city = 'Chennai'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Bhoapl Warehouse', (select location_id from locations where city = 'Bhoapl'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Indore Warehouse', (select location_id from locations where city = 'Indore'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Saray Warehouse', (select location_id from locations where city = 'Saray'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Akıncılar Warehouse', (select location_id from locations where city = 'Akıncılar'));

INSERT INTO warehouses (warehouse_id,warehouse_name,location_id)
VALUES (seq_warehouse_id.nextval,'Coimbatore Warehouse', (select location_id from locations where city = 'Coimbatore'));


--- insert into departments
INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Purchase', (select location_id from locations where city = 'Pune'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Sales', (select location_id from locations where city = 'Pune'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Inventory', (select location_id from locations where city = 'Pune'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Administration', (select location_id from locations where city = 'Pune'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Research', (select location_id from locations where city = 'Mumbai'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'IT Department', (select location_id from locations where city = 'Mumbai'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Human Resource', (select location_id from locations where city = 'Mumbai'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Customer Care', (select location_id from locations where city = 'Mumbai'));

INSERT INTO departments  (dept_id,department_name,location_id)	
VALUES(seq_department_id.nextval, 'Legal', (select location_id from locations where city = 'Mumbai'));

-- insert into employees

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Smith','Clerk','smith.clerk@gmail.com','1234567890',to_date('03/06/2006','dd-mm-yyyy'),to_date('05/04/1980','dd-mm-yyyy'),1000,null,'Cleark', (select dept_id from departments where department_name = 'Sales'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Allen',null,'Allen@gmail.com','4561239852',to_date('08/06/2008','dd-mm-yyyy'),to_date('06/05/1982','dd-mm-yyyy'),2000,1,'Salesman', (select dept_id from departments where department_name = 'Sales'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Ward','Kochhar','ward@gmail.com','1245878625',to_date('09/07/2009','dd-mm-yyyy'),to_date('06/05/1982','dd-mm-yyyy'),3000,1,'Salesman', (select dept_id from departments where department_name = 'Sales'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Blake','Melon','blake@gmail.com','8731112114',to_date('11/09/1985','dd-mm-yyyy'),to_date('08/07/1970','dd-mm-yyyy'),4000,null,'Manager', (select dept_id from departments where department_name = 'Purchase'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Jones','Bezos','jones@gmail.com','5464512312',to_date('10/08/2010','dd-mm-yyyy'),to_date('07/06/1983','dd-mm-yyyy'),5000,4,'Analyst', (select dept_id from departments where department_name = 'Purchase'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Scott','Cooper','stuart@gmail.com','1212312312',to_date('11/09/2011','dd-mm-yyyy'),to_date('08/07/1984','dd-mm-yyyy'),6000,4,'Analyst', (select dept_id from departments where department_name = 'Purchase'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Turner','Smith','turner@gmail.com','5454123231',to_date('12/09/2011','dd-mm-yyyy'),to_date('08/07/1984','dd-mm-yyyy'),700,4,'Analyst', (select dept_id from departments where department_name = 'Purchase'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Miller','John','miller@gmail.com','4546543264',to_date('10/09/2011','dd-mm-yyyy'),to_date('08/04/1975','dd-mm-yyyy'),800,4,'Analyst', (select dept_id from departments where department_name = 'Purchase'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'James','Bond','james@gmail.com','1510310021',to_date('11/11/2004','dd-mm-yyyy'),to_date('08/08/1977','dd-mm-yyyy'),9000,4,'Analyst', (select dept_id from departments where department_name = 'Purchase'));

INSERT INTO employees (employee_id,first_name,last_name,email,phone,hire_date,dob,salary,manager_id,designation,dept_id)
VALUES (seq_employee_id.nextval, 'Mike','Weinguard','mike@gmail.com','4210024321',to_date('01/01/2000','dd-mm-yyyy'),to_date('08/11/1983','dd-mm-yyyy'),10000,4,'Analyst', (select dept_id from departments where department_name = 'Purchase'));

-- insert into product_categories

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Food Retailers');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Health and Beauty Products');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Clothing');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Home Furniture and Household Goods');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Durable Goods');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Leisure and Personal Goods');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Electronic');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Books and Stationery');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Toys');

INSERT INTO product_categories (category_id,category_name)
VALUES (seq_category_id.nextval, 'Car Accessories');

-- insert into prodcuts

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'Toy Car', 'Majorette Die Cast Free Wheel Car','USD',50,51,(select category_id from product_categories where category_name = 'Toys' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'Python Crash Course', 'Python Crash Course, 2nd Edition','USD',79,77,(select category_id from product_categories where category_name = 'Books and Stationery' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'Car Charger', 'boAt Dual Port Rapid Car Charger','USD',5,5,(select category_id from product_categories where category_name = 'Car Accessories' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'iPhone', 'iPhone 11 Series','USD',1100,1080,(select category_id from product_categories where category_name = 'Electronic' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'Note8 Pro', 'MI Note 8 pro new edition','USD',289,280,(select category_id from product_categories where category_name = 'Electronic' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'LG Washing Machine', 'LG 6.5 Kg 5 Star Inverter Fully-Automatic Front Loading Washing Machine','USD',450,420,(select category_id from product_categories where category_name = 'Home Furniture and Household Goods' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'LG Refrigerator', 'LG 215 L 4 Star Inverter Direct Cool Single Door Refrigerator','USD',570,550,(select category_id from product_categories where category_name = 'Home Furniture and Household Goods' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'Sony Bravia TV', 'Sony Bravia 108 cm (43 inches) Full HD Smart','USD',1050,1000,(select category_id from product_categories where category_name = 'Electronic' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'C++ Prog Book', 'Basics of C++ programming','USD',48,40,(select category_id from product_categories where category_name = 'Books and Stationery' ));

INSERT INTO products (product_id,product_name,description,cost_currency,standard_cost,list_price,category_id)
VALUES (seq_product_id.nextval, 'AWS Cloud', 'What is AWS Colud','USD',25,20,(select category_id from product_categories where category_name = 'Books and Stationery' ));

-- insert into customers

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'Oliver Jake', 'Jake home address 1', null,null,null,1245401121);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'Jack Connor', 'Connor home address xx', null,null,null,1211230011);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'Harry Callum', 'Harry Address XYZ', null,null,null,5400221212);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'Jacob', 'Jacob home address ABC street', null,null,null,8988222012);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'Charlie Kyle', 'Charlie Near ABC build Street 1', null,null,null,7841541211);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'Thomas Joe', 'Joe House, near Pizza hut, E square', null,null,null,9898221212);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'George Reece', 'Reece home', null,null,null,8941112111);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'Oscar Rhys', 'house no 50, King arm yard', null,null,null,4114123011);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'James Charlie', 'James home address 1234', null,null,null,7454054561);

INSERT INTO customers (customers_id,customer_name,address,website,facebook,twitter,whatsapp)
VALUES (seq_customer_id.nextval, 'William Damian', 'Damian house no xx, YY Tube station', null,null,null,9854421212);

-- insert into contacts
INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 1,'Smith','Murphy','smithm@gmail.com',4556545114);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 2,'Jones','Kelly','jonesk@gmail.com',2000112112);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 3,'Williams','Sullivan','williamss@gmail.com',7902865132);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 4,'Brown','Walsh','brownw@gmail.com',9898561231);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 5,'Taylor','Smith','taylors@gmail.com',1231123121);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 6,'Davies','Brien','daviesb@gmail.com',7878465465);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 7,'Wilson','Byrne','wilsonb@gmail.com',4551506651);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 8,'Roberts','Neill','robertsn@gmail.com',5545451021);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 9,'Evans','Connor','evansc@gmail.com',8845551212);

INSERT INTO contacts (contact_id,customers_id,first_name,last_name,email,phone) 
VALUES (seq_contact_id.nextval, 10,'Thomas','Smith','thomass@gmail.com',5410210212);

-- insert into orders
INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,1,'Pending',1,to_date('17-NOV-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,1,'Shipped',2,to_date('14-OCT-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,2,'Pending',3,to_date('15-OCT-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,2,'Canceled',4,to_date('14-OCT-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,2,'Shipped',5,to_date('14-OCT-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,2,'Shipped',6,to_date('11-SEP-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,3,'Shipped',6,to_date('10-AUG-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,4,'Shipped',6,to_date('07-SEP-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,5,'Shipped',7,to_date('07-JUL-20','DD-MON-RR'));

INSERT INTO orders (order_id,customers_id,status,salesman_id,order_date)
VALUES (seq_order_id.nextval,6,'Shipped',8,to_date('06-JUN-20','DD-MON-RR'));

-- insert into order_items

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,1,1,5,25,1);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,2,2,1,25,1);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,3,1,5,25,1);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,4,5,100,250,5);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,4,7,1,450,7);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,4,8,2,110,7);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,5,4,12,75,8);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,5,8,2,225,8);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,7,7,49,490,8);

INSERT INTO order_items (item_id,order_id,product_id,quantity,unit_price,warehouse_id) 
VALUES (seq_item_id.nextval,10,10,15,1014,8);


-- insert into inventories

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (1,1,122);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (1,2,500);

INSERT INTO inventories (product_id,warehouse_id,quantity)  
VALUES (2,1,451);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (2,2,15);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (3,3,50);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (3,4,150);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (4,5,180);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (5,6,185);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (6,7,101);

INSERT INTO inventories (product_id,warehouse_id,quantity) 
VALUES (7,8,251);

ALTER TABLE countries ENABLE CONSTRAINT fk_cntry_region_id;
ALTER TABLE locations ENABLE CONSTRAINT fk_loc_region_id;
ALTER TABLE warehouses ENABLE CONSTRAINT fk_loc_whs_id;
ALTER TABLE departments ENABLE CONSTRAINT fk_loc_dept_id;
ALTER TABLE employees ENABLE CONSTRAINT fk_employees_mgr;
ALTER TABLE products ENABLE CONSTRAINT fk_prod_cat_id;
ALTER TABLE contacts ENABLE CONSTRAINT fk_cust_contact_id;
ALTER TABLE orders ENABLE CONSTRAINT fk_cust_ord_id;
ALTER TABLE orders ENABLE CONSTRAINT fk_cust_ord_saleman_id;
ALTER TABLE order_items ENABLE CONSTRAINT fk_orditems_item_id;
ALTER TABLE order_items ENABLE CONSTRAINT fk_orditems_prod_id;
ALTER TABLE order_items ENABLE CONSTRAINT fk_orditems_whs_id;
ALTER TABLE inventories ENABLE CONSTRAINT fk_invt_prdcts;
ALTER TABLE inventories ENABLE CONSTRAINT fk_invt_whs;
