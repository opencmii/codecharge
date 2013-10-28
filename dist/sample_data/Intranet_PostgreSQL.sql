--
-- DROP TABLES
--
DROP TABLE customers CASCADE;
DROP SEQUENCE customers_customer_id_seq;

DROP TABLE departments CASCADE;
DROP SEQUENCE departments_department_id_seq;

DROP TABLE employees CASCADE;
DROP SEQUENCE employees_emp_id_seq;

DROP TABLE groups;
DROP SEQUENCE groups_group_id_seq;

DROP TABLE orders CASCADE;
DROP SEQUENCE orders_order_id_seq;

DROP TABLE order_items;
DROP SEQUENCE order_items_order_item_id_seq;

DROP TABLE priorities CASCADE;
DROP SEQUENCE priorities_priority_id_seq;

DROP TABLE products;
DROP SEQUENCE products_product_id_seq;

DROP TABLE projects CASCADE;
DROP SEQUENCE projects_project_id_seq;

DROP TABLE projects_employees;

DROP TABLE statuses CASCADE;
DROP SEQUENCE statuses_status_id_seq;

DROP TABLE tasks;
DROP SEQUENCE tasks_task_id_seq;

DROP TABLE types;
DROP SEQUENCE types_type_id_seq;

DROP TABLE files;
DROP SEQUENCE files_file_id_seq;

DROP TABLE menu;
DROP SEQUENCE menu_menu_id_seq;

DROP TABLE cache;

DROP TABLE absence_types;
DROP SEQUENCE absence_types_absence_type_id_seq;

DROP TABLE emp_times;
DROP SEQUENCE emp_times_emp_time_id_seq;

DROP TABLE user_events;
DROP SEQUENCE user_events_user_event_id_seq;

--
-- CREATE TABLES
--

-- Customers
CREATE SEQUENCE customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE customers (
    customer_id      INT NOT NULL DEFAULT nextval('customers_customer_id_seq'),
    customer_name    VARCHAR(50),
    customer_phone   VARCHAR(50),
    customer_address VARCHAR(50),
    customer_city    VARCHAR(50),
    customer_state   VARCHAR(50),
    customer_zip     VARCHAR(50),
	PRIMARY KEY (customer_id)
);


-- departments
CREATE SEQUENCE departments_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE departments (
    department_id INT NOT NULL DEFAULT nextval('departments_department_id_seq'),
    department_name VARCHAR(50),
    department_manager_id INT,
	department_is_active SMALLINT NULL DEFAULT 1,
	PRIMARY KEY (department_id)
);


-- employees
CREATE SEQUENCE employees_emp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE employees (
    emp_id         INT NOT NULL DEFAULT nextval('employees_emp_id_seq'),
    emp_login      VARCHAR(50),
    emp_password   VARCHAR(50),
    emp_name       VARCHAR(50),
    title          VARCHAR(50),
    group_id       INT,
    department_id  INT,
    phone_home     VARCHAR(50),
    phone_work     VARCHAR(50),
    phone_cell     VARCHAR(50),
    fax            VARCHAR(50),
    email          VARCHAR(50),
    city           VARCHAR(50),
    zip            VARCHAR(50),
    address        VARCHAR(50),
    picture        VARCHAR(50),
	employee_is_active SMALLINT NULL DEFAULT 1,
	PRIMARY KEY (emp_id)
);


-- groups
CREATE SEQUENCE groups_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE groups (
    group_id       INT NOT NULL DEFAULT nextval('groups_group_id_seq'),
    group_name     VARCHAR(50),
    PRIMARY KEY (group_id)
);


-- orders
CREATE SEQUENCE orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE orders (
    order_id           INT NOT NULL DEFAULT nextval('orders_order_id_seq'),
    order_customer_id  INT,
    order_date         TIMESTAMP,
    order_ship_address VARCHAR(50),
    order_ship_city    VARCHAR(50),
    order_ship_state   VARCHAR(50),
    order_ship_zip     VARCHAR(10),
    PRIMARY KEY (order_id)
);


-- order_items
CREATE SEQUENCE order_items_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE order_items (
    order_item_id     INT NOT NULL DEFAULT nextval('order_items_order_item_id_seq'),
    order_id          INT,
    product_id        INT,
    quantity          INT,
    price             DECIMAL(10,2) NULL,
    PRIMARY KEY (order_item_id)
);


-- priorities
CREATE SEQUENCE priorities_priority_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE priorities (
    priority_id         INT NOT NULL DEFAULT nextval('priorities_priority_id_seq'),
    priority_name       VARCHAR(50),
    PRIMARY KEY (priority_id)
);

-- products
CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE products (
    product_id          INT NOT NULL DEFAULT nextval('products_product_id_seq'),
    product_name        VARCHAR(50),
    price               DECIMAL(10,2) NULL,
    PRIMARY KEY (product_id)
);


-- projects
CREATE SEQUENCE projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE projects (
    project_id          INT NOT NULL DEFAULT nextval('projects_project_id_seq'),
    project_name        VARCHAR(50),
	project_is_active   SMALLINT NULL DEFAULT 1,
    PRIMARY KEY (project_id)
);


-- projects_employees
CREATE TABLE projects_employees (
    project_id          INT,
    emp_id              INT,
    percent_allocation  DECIMAL(10,2) NULL,
    PRIMARY KEY (project_id, emp_id)
);


-- statuses
CREATE SEQUENCE statuses_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE statuses (
    status_id             INT NOT NULL DEFAULT nextval('statuses_status_id_seq'),
    status_name           VARCHAR(50),
    PRIMARY KEY (status_id)
);


-- tasks
CREATE SEQUENCE tasks_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE tasks (
    task_id               INT NOT NULL DEFAULT nextval('tasks_task_id_seq'),
    project_id            INT,
    priority_id           INT,
    status_id             INT,
    type_id               INT,
    task_name             VARCHAR(50),
    task_desc             TEXT,
    user_id_assign_by     INT,
    user_id_assign_to     INT,
    task_start_date       TIMESTAMP,
    task_finish_date      TIMESTAMP,
    PRIMARY KEY (task_id)
);

-- Types
CREATE SEQUENCE types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE types (
    type_id               INT NOT NULL DEFAULT nextval('types_type_id_seq'),
    type_name             VARCHAR(50),
    PRIMARY KEY (type_id)
);

-- Files
CREATE SEQUENCE files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE files (
    file_id             INT NOT NULL DEFAULT nextval('files_file_id_seq'),
    file_name           VARCHAR(50),
    file_owner_id       INT,
    file_uploaded_by    INT,
    file_date_uploaded  TIMESTAMP,
    file_status         INT,
    PRIMARY KEY (file_id)
);


-- menu
CREATE SEQUENCE menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE menu (
    menu_id           INT NOT NULL DEFAULT nextval('menu_menu_id_seq'),
    menu_name         VARCHAR(50)  NULL,
    menu_id_parent    INT         NULL,
    menu_link         VARCHAR(50)  NULL,
    PRIMARY KEY (menu_id)
	
);


-- cache
CREATE TABLE cache (
    cache_key     CHAR(65),
    cache_expiration BIGINT,
    cache_data    TEXT
);


-- absence_types
CREATE SEQUENCE absence_types_absence_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE absence_types (
    absence_type_id      INT NOT NULL DEFAULT nextval('absence_types_absence_type_id_seq'),
    absence_type_name    VARCHAR(50),
    absence_type_is_paid INT,
    PRIMARY KEY (absence_type_id)
);


-- emp_times
CREATE SEQUENCE emp_times_emp_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE emp_times (
    emp_time_id           INT NOT NULL DEFAULT nextval('emp_times_emp_time_id_seq'),
    emp_id                INT,
    emp_time_date         TIMESTAMP,
    emp_time_in           TIMESTAMP default NULL,
    emp_time_out          TIMESTAMP default NULL,
    emp_time_in2          TIMESTAMP default NULL,
    emp_time_out2         TIMESTAMP default NULL,
    emp_time_total        DECIMAL(10,2) default '0',
    emp_time_with_pay     INT,
    emp_time_no_pay       INT,
    absence_type_with_pay INT default NULL,
    absence_type_no_pay   INT default NULL,
    PRIMARY KEY (emp_time_id)
);


-- user_events
CREATE SEQUENCE user_events_user_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE user_events (
    user_event_id         INT NOT NULL DEFAULT nextval('user_events_user_event_id_seq'),
    priority_id           INT default NULL,
    user_event_title      VARCHAR(100),
    user_event_date       TIMESTAMP default NULL,
    user_event_time       TIMESTAMP default NULL,
    user_event_desc       TEXT,
    PRIMARY KEY (user_event_id)
);

-- 
-- TABLE INSERT STATEMENTS
-- 

-- customers
INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (1,'ABC Inc.', '2560 Broadway, Suite 100', 'Denver', 'Colorado', '34574');
INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (2,'Hard&Soft', '35 Corey Way # 135', 'Atlanta', 'Georgia', '46273');
INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (3,'Online Services', '226 A Westborough Blvd. #105', 'San Francisco', 'California', '56789');
INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (4,'Night and Day', '125 South 12th Street', 'San Francisco', 'California', '32456');

SELECT setval('customers_customer_id_seq', 4);
	

INSERT INTO departments (department_id,department_name, department_is_active) VALUES(1, 'C++ Development', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(2, 'Administration', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(3, 'Support', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(4, 'Finance', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(5, 'Web Development', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(6, 'Testing', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(7, 'Design', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(8, 'Documentation', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(9, 'Solutions Development', 1);
INSERT INTO departments (department_id,department_name, department_is_active) VALUES(10,'System Administration', 1);

SELECT setval('departments_department_id_seq', 9);


INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (1,'helen','helen','Helen Deering','Support',1,3,'helen@company.com','images/photos/Helen Deering.jpg','(364) 134-5455','(364) 134-5455','(960) 393-3466',NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (2,'alexander','alexander','Alexander Atkinson','Developer',1,1,'alexander@company.com','images/photos/Alexander Atkinson.jpg','(364) 354-2646','(364) 134-5456','(730) 643-4397',NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (3,'ken','ken','Ken Price','Developer',1,1,'ken@company.com','images/photos/Ken Price.jpg','(264) 823-2367','(364) 134-5456','(960) 423-3466',NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (4,'peter','peter','Peter Larsen','Tester',1,6,'peter@company.com','images/photos/Peter Larsen.jpg','(764) 662-2367','(364) 134-5459',NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (5,'ignace','ignace','Ignace Shaw','Developer',1,5,'ignace@company.com','images/photos/Ignace Shaw.jpg','(564) 343-3367','(364) 134-5411',NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (6,'george','george','George Pennington','Developer',1,1,'george@company.com','images/photos/George Pennington.jpg','(364) 345-5267','(364) 134-5413',NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (7,'andrew','andrew','Andrew Scott','Developer',1,1,'andrew@company.com','images/photos/Andrew Scott.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (8,'serge','serge','Serge Richards','Quality Assurance',1,6,'serge@company.com','images/photos/Serge Richards.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (9,'victor','victor','Victor Tomlin','Developer',1,5,'victor@company.com','images/photos/Victor Tomlin.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (10,'arledge','arledge','Arledge Archer','Technical Writer',1,8,'arledge@company.com','images/photos/Arledge Archer.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (11,'vlad','vlad','Vlad Young','Developer',1,1,'vlad@company.com','images/photos/Vlad Young.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (12,'alexz','alexz','Alex Zanuck','Developer',1,9,'alexz@company.com','images/photos/Alex Zanuck.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (13,'dennis','dennis','Dennis Mansfield','Tester',1,6,'dennis@company.com','images/photos/Dennis Mansfield.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (14,'michael','michael','Michael Koenig','Developer',1,5,'michael@company.com','images/photos/Michael Koenig.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (15,'nick','nick','Nick Bergman','Developer',1,1,'nick@company.com','images/photos/Nick Bergman.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (16,'alex','alex','Alex Antion','Support',1,3,'alex@company.com','images/photos/Alex Antion.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (17,'conrad','conrad','Conrad Murphy','CEO',1,2,'conrad@company.com','images/photos/Conrad Murphy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (18,'vance','vance','Vance Cole','Corporate Development',1,2,'vance@company.com','images/photos/Vance Cole.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (19,'vitas','vitas','Vitas Reynolds','Developer',1,5,'vitas@company.com','images/photos/Vitas Reynolds.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (20,'alexg','alexg','Alex Groth','Designer',1,7,'alexg@company.com','images/photos/Alex Groth.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (21,'michaelb','michaelb','Michael Barrett','Tester',1,6,'michaelb@company.com','images/photos/Michael Barrett.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (22,'ian','ian','Ian Gordon','Developer',1,1,'ian@company.com','images/photos/Ian Gordon.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (23,'alexzi','alexzi','Alex Zimb','Quality Assurance',1,6,'alexzi@company.com','images/photos/Alex Zimb.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (24,'alexandern','alexandern','Alexander Neville','Web Development Manager',1,5,'alexandern@company.com','images/photos/Alexander Neville.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (25,'eugene','eugene','Eugene Zubler','C++ Development Manager',1,1,'eugene@company.com','images/photos/Eugene Zubler.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (26,'oleg','oleg','Oleg Douglas','CTO',1,2,'oleg@company.com','images/photos/Oleg Douglas.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (27,'irina','irian','Irina Douglas','Accountant',1,4,'irina@company.com','images/photos/Irina Douglas.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (28,'helenp','helenp','Helen Palmer','Accountant',1,4,'helenp@company.com','images/photos/Helen Palmer.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (29,'stan','stan','Stan Simon','Developer',1,5,'stan@company.com','images/photos/Stan Simon.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (30,'alexk','alexk','Alex Knievel','Developer',1,5,'alexk@company.com','images/photos/Alex Knievel.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (31,'arty','arty','Arty Blake','Developer',1,5,'arty@company.com','images/photos/Arty Blake.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (32,'admin','admin','George Randall','NT Administrator',2,10,'georger@company.com','images/photos/George Randall.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (33,'olegt','olegt','Oleg Tim','Developer',1,5,'olegt@company.com','images/photos/Oleg Tim.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
INSERT INTO employees(emp_id,emp_login,emp_password,emp_name,title,group_id,department_id,email,picture,phone_home,phone_work,phone_cell,fax,city,zip,address, employee_is_active)
 VALUES (34,'stank','stank','Stan Knight','UNIX Administrator',2,10,'stank@company.com','images/nophoto.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL, 1);
 
SELECT setval('employees_emp_id_seq', 34);


INSERT INTO groups (group_id,group_name) VALUES (1 , 'User' ); 
INSERT INTO groups (group_id,group_name) VALUES (2 , 'Admin' );
SELECT setval('groups_group_id_seq', 2);


INSERT INTO orders(order_id,order_customer_id,order_date) VALUES (1,1,'2003-01-10');
INSERT INTO orders(order_id,order_customer_id,order_date) VALUES (2,2,'2003-01-14');
INSERT INTO orders(order_id,order_customer_id,order_date) VALUES (3,3,'2003-01-16');
INSERT INTO orders(order_id,order_customer_id,order_date) VALUES (4,1,'2003-01-22');

SELECT setval('orders_order_id_seq', 4);


INSERT INTO priorities (priority_id,priority_name) VALUES (1 , 'Highest' ); 
INSERT INTO priorities (priority_id,priority_name) VALUES (2 , 'High' ); 
INSERT INTO priorities (priority_id,priority_name) VALUES (3 , 'Normal' ); 
INSERT INTO priorities (priority_id,priority_name) VALUES (4 , 'Low' ); 
INSERT INTO priorities (priority_id,priority_name) VALUES (5 , 'Lowest' ); 

SELECT setval('priorities_priority_id_seq', 5);


INSERT INTO products(product_id,product_name,price) VALUES(1,'Web Database Development',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(2,'Programming Perl',39.96);
INSERT INTO products(product_id,product_name,price) VALUES(3,'Perl and CGI for the WWW',15.19);
INSERT INTO products(product_id,product_name,price) VALUES(4,'MySQL',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(5,'PHP and MySQL Web Development',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(6,'MySQL & PHP From Scratch',23.99);
INSERT INTO products(product_id,product_name,price) VALUES(7,'MySQL and mSQL',27.96);
INSERT INTO products(product_id,product_name,price) VALUES(8,'Flash 4 Magic',36.00);
INSERT INTO products(product_id,product_name,price) VALUES(9,'Web Application Development with PHP 4.0',36.00);
INSERT INTO products(product_id,product_name,price) VALUES(10,'Beginning ASP Databases',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(11,'Oracle8i Web Development',41.99);
INSERT INTO products(product_id,product_name,price) VALUES(12,'Black Belt Web Programming Methods',27.96);
INSERT INTO products(product_id,product_name,price) VALUES(13,'Web Development with Java Server Pages',35.96);
INSERT INTO products(product_id,product_name,price) VALUES(14,'Professional JSP J2EE Edition',47.99);
INSERT INTO products(product_id,product_name,price) VALUES(15,'Mastering ColdFusion 4.5',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(16,'Teach Yourself ColdFusion in 21 Days',31.99);
INSERT INTO products(product_id,product_name,price) VALUES(17,'ColdFusion Fast & Easy Web Development',19.99);
INSERT INTO products(product_id,product_name,price) VALUES(18,'Beginning Active Server Pages 3.0',31.99);
INSERT INTO products(product_id,product_name,price) VALUES(19,'Web Design in a Nutshell',23.96);
INSERT INTO products(product_id,product_name,price) VALUES(20,'HTML 4 for the WWW Visual Quickstart Guide',15.99);
INSERT INTO products(product_id,product_name,price) VALUES(21,'1001 Web Site Construction Tips and Tricks',39.95);
INSERT INTO products(product_id,product_name,price) VALUES(22,'C# - Programming with the Public Beta',34.99);

SELECT setval('products_product_id_seq', 22);


INSERT INTO projects (project_id,project_name ,project_is_active) VALUES (1 , 'CodeCharge', 1); 
INSERT INTO projects (project_id,project_name ,project_is_active) VALUES (2 , 'My Project', 1); 
INSERT INTO projects (project_id,project_name ,project_is_active) VALUES (3 , 'Test Project', 1); 
INSERT INTO projects (project_id,project_name ,project_is_active) VALUES (4 , 'Great Project', 1); 
INSERT INTO projects (project_id,project_name ,project_is_active) VALUES (5 , 'Super Project', 1); 

SELECT setval('projects_project_id_seq', 5);

INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (1,7,45);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (4,7,55);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (2,2,70);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (2,3,50);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (1,1,30);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (2,1,40);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (3,1,30);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (4,2,30);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (1,8,50);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (2,8,20);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (3,8,15);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (4,8,10);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (5,8,5);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (5,15,100);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (1,24,15);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (2,24,25);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (3,24,55);
INSERT INTO projects_employees (project_id,emp_id,percent_allocation) VALUES (5,24,5);


INSERT INTO statuses (status_id,status_name) VALUES (1 , 'Open' ); 
INSERT INTO statuses (status_id,status_name) VALUES (2 , 'On hold' ); 
INSERT INTO statuses (status_id,status_name) VALUES (3 , 'Closed' ); 
INSERT INTO statuses (status_id,status_name) VALUES (4 , 'In progress' ); 

SELECT setval('statuses_status_id_seq', 4);


INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (1  , 4 , 2 , 1 , 3,'Great Project needs to be greater' , 'Mission Impossible? Get CodeCharge.', 3 , 4 , '2003-02-01','2003-02-02'); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (2  , 1 , 1 , 1 , 4,'Fix ALL bugs' , 'Staying up at night coding? Get CodeCharge, go home, get rest.', 3 , 6 , '2003-02-02','2003-02-03' ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (3  , 1 , 2 , 3 , 1,'Get ready to click' , 'Write CODE by pointing and clicking.\r\nWrite CODE by pointing and clicking. Or clicking and pointing. Or clicking and clicking.' , 3 , 4 , '2003-02-03','2003-02-04'); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (4  , 2 , 1 , 1 , 1,'Finish My Project' , 'Verify Zip Code and other possible errors in XML files. Display full list of errors to the user and \"status=error\" hidden in HTML.', 3 , 5 ,'2003-02-04','2003-02-05'); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (5  , 3 , 2 , 4 , 1,'Test this project.' , 'Programmoholic? Get Help. Get CodeCharge.', 3 , 3 ,'2003-02-05','2003-02-06' ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (6  , 1 , 1 , 1 , 1,'Code with one hand.' , 'Why code with TWO HANDS, when you can do it faster with ONE.', 3 , 2 , '2003-02-06','2003-02-07'); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (7  , 3 , 1 , 2 , 1,'Get armed' , 'Low on ammunition? Get armed. Get CodeCharge.', 3 , 1 , '2003-02-07','2003-02-08'); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (8  , 3 , 1 , 1 , 4,'Write more code' , 'To code or not to code, that is the question', 3 , 5 , '2003-02-08','2003-02-09'); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (9 , 5 , 1 , 4 , 1,'Code, code, code?' , 'CODE. CODE. CODE. CODE. MORE CODE.', 3 , 6 ,'2003-02-09','2003-02-10' ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (10 , 3 , 5 , 2 , 1,'Sleep' , 'Stop coding. Charge your code. Get Sleep.', 3 , 3 , '2003-02-10','2003-02-11'); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (11 , 5 , 1 , 1 , 1,'Have fun' , 'Bored with your programming job? Get CodeCharge. Have Fun.', 3 , 2 , '2003-02-11','2003-02-12'); 

SELECT setval('tasks_task_id_seq', 11);


-- Types
INSERT INTO types (type_id, type_name) VALUES(1,'Task');
INSERT INTO types (type_id, type_name) VALUES(2,'Bug');
INSERT INTO types (type_id, type_name) VALUES(3,'Issue');
INSERT INTO types (type_id, type_name) VALUES(4,'Question');

SELECT setval('types_type_id_seq', 4);

INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (1, 'Products', NULL, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (2, 'Downloads',NULL, NULL); 
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (3, 'Support', NULL, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (4, 'Purchase', NULL, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (5, 'Company', NULL, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (6, 'All', 1, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (7, 'CodeCharge', 1, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (8, 'CodeCharge Studio', 1, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (9, 'DemoCharge Studio', 1, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (10, 'Comparison', 1, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (11, 'CodeCharge Studio', 10, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (12, 'DemoCharge Studio', 10, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (13, 'CodeCharge', 2, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (14, 'CodeCharge Studio', 2, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (15, 'DemoCharge Studio', 2, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (16, 'Support', 3, 'http://support.yessoftware.com');
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (17, 'Forums', 3, 'http://forums.codecharge.com');
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (18, 'KB', 3, 'http://support.yessoftware.com/kb_search.asp');
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (19, 'Store', 4, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (20, 'Resellers', 4, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (21, 'Affiliate', 4, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (22, 'About Us', 5, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (23, 'Contact Us', 5, NULL);
INSERT INTO menu (menu_id, menu_name, menu_id_parent, menu_link) VALUES (24, 'Press Releases', 5, NULL);
SELECT setval('menu_menu_id_seq', 24);


INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (1, 'Business Trip', 1);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (2, 'Bereavement', 0);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (3, 'Comp Time', 0);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (4, 'Doctors Visit', 1);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (5, 'FMLA', 0);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (6, 'Holiday', 1);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (7, 'Illness', 0);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (8, 'Jury Duty', 0);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (9, 'Military Leave', 0);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (10, 'Personal Business', 0);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (11, 'Seminar', 1);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (12, 'Training', 1);
INSERT INTO absence_types (absence_type_id, absence_type_name, absence_type_is_paid) VALUES (13, 'Vacation', 1);
SELECT setval('absence_types_absence_type_id_seq', 13);

INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (100, 2,  '2005-05-25', '2005-05-25 8:31', '2005-05-25 17:01', NULL, NULL, 8.5,  0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (101, 16, '2005-05-25', '2005-05-25 8:35', '2005-05-25 12:30', '2005-05-25 12:50', '2005-05-25 19:10', 10.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (102, 20, '2005-05-25', '2005-05-25 7:10','2005-05-25 13:00', '2005-05-25 13:15', '2005-05-25 17:00', 9.58, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (103, 16, '2005-05-26', NULL,  NULL,  NULL,  NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (104, 2,  '2005-05-26', '2005-05-26 8:18', '2005-05-26 18:05', '2005-05-26 19:14', '2005-05-26 20:33', 11.09, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (105, 20, '2005-05-26', '2005-05-26 6:45', NULL, NULL, '2005-05-26 16:30', 9.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (106, 16, '2005-05-27', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (107, 2,  '2005-05-27', '2005-05-27 7:59', '2005-05-27 18:14', '2005-05-27 19:29', '2005-05-27 21:00', 11.76, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (108, 20, '2005-05-27', '2005-05-27 6:20', NULL, NULL, '2005-05-27 17:00', 10.66, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (109, 16, '2005-05-30',  NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (110, 2, '2005-05-30', '2005-05-30 7:17', '2005-05-30 18:47', NULL, NULL, 11.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (111, 20, '2005-05-30', NULL, NULL, NULL, NULL, 0, 8, 0, 7, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (112, 16, '2005-05-31', '2005-05-31 8:45', '2005-05-31 18:00', NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (113, 2,  '2005-05-31', '2005-05-31 8:00', '2005-05-31 18:20', NULL, NULL, 8.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (114, 20, '2005-05-31', '2005-05-31 6:00', '2005-05-31 17:00', NULL, NULL, 11, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (115, 2,  '2005-06-01', '2005-06-01 8:12', '2005-06-01 11:20', '2005-06-01 12:36', '2005-06-01 20:40', 11.19, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (116, 20, '2005-06-01', '2005-06-01 6:30', '2005-06-01 10:15', NULL, NULL, 3.75, 4.25, 0, 7, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (117, 16, '2005-06-01', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (118, 16, '2005-06-02', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (119, 2,  '2005-06-02', '2005-06-02 7:59', '2005-06-02 11:32', NULL, NULL, 3.54, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (120, 20, '2005-06-02', '2005-06-02 6:00', '2005-06-02 11:00', '2005-06-02 11:15', '2005-06-02 16:30', 10.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (121, 16, '2005-06-03', '2005-06-03 7:00', NULL, NULL, '2005-06-03 16:30', 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (122, 20, '2005-06-03', '2005-06-03 6:00', NULL, NULL, '2005-06-03 17:30', 11.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (123, 2,  '2005-06-03', '2005-06-03 7:45', '2005-06-03 18:45', NULL, NULL, 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (124, 20, '2005-06-05', '2005-06-06 6:20', '2005-06-05 14:00', '2005-06-05 14:10', '2005-06-05 16:30', 10, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (125, 16, '2005-06-05', '2005-06-06 8:35', '2005-06-05 14:55', '2005-06-05 15:25', '2005-06-05 19:20', 10.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (126, 2,  '2005-06-05', '2005-06-06 8:07', '2005-06-05 18:14', '2005-06-05 19:22', '2005-06-05 21:02', 11.78,  0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (127, 16, '2005-06-07', '2005-06-07 8:35', '2005-06-07 17:50', NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (128, 2,  '2005-06-07', '2005-06-07 8:20', '2005-06-07 18:11', '2005-06-07 19:36', '2005-06-07 21:25', 11.66, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (129, 20, '2005-06-07', '2005-06-07 7:10', '2005-06-07 12:00', '2005-06-07 12:10', '2005-06-07 16:30', 9.16, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (130, 2,  '2005-06-08', '2005-06-08 8:23', '2005-06-08 18:45', '2005-06-08 21:16', '2005-06-08 22:00', 11.09,0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (131, 16, '2005-06-08', '2005-06-08 8:25', '2005-06-08 17:40', NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (132, 20, '2005-06-08', '2005-06-08 7:15', NULL, NULL, '2005-06-08 16:45', 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (133, 2,  '2005-06-09', '2005-06-09 7:57', '2005-06-09 18:08', '2005-06-09 19:32', '2005-06-09 22:05', 12.73, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (134, 16, '2005-06-09', '2005-06-09 8:40', '2005-06-09 12:55', '2005-06-09 13:55', '2005-06-09 18:40', 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (135, 20, '2005-06-09', '2005-06-09 6:10', '2005-06-09 12:25', '2005-06-09 12:40', '2005-06-09 16:30', 10.08, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (136, 2,  '2005-06-10', '2005-06-10 8:05', '2005-06-10 11:30', NULL, NULL, 3.41, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (137, 16, '2005-06-10', '2005-06-10 8:35', '2005-06-10 17:20', NULL, NULL, 8.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (138, 20, '2005-06-10', '2005-06-10 6:15', NULL, NULL, '2005-06-10 16:45', 10.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (139, 2,  '2005-06-13', '2005-06-13 8:03', '2005-06-13 18:19', '2005-06-13 20:04', '2005-06-13 21:21', 11.54, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (140, 20, '2005-06-13', '2005-06-13 7:15', '2005-06-13 12:20', '2005-06-13 12:30', '2005-06-13 16:30', 9.08, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (141, 16, '2005-06-13', '2005-06-13 9:20', '2005-06-13 12:40', '2005-06-13 13:40', '2005-06-13 18:35', 8.25, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (142, 2,  '2005-06-14', '2005-06-14 7:57', '2005-06-14 19:00', NULL, NULL, 11.05, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (143, 16, '2005-06-14', '2005-06-14 8:15', '2005-06-14 18:45', NULL, NULL, 10.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (144, 20, '2005-06-14', '2005-06-14 7:05', NULL, NULL, '2005-06-14 17:00', 9.91, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (145, 20, '2005-06-15', '2005-06-15 7:00', '2005-06-15 12:30', '2005-06-15 12:45', '2005-06-15 16:30', 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (146, 2,  '2005-06-15', '2005-06-15 8:04', '2005-06-15 20:34', NULL, NULL, 12.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (147, 16, '2005-06-15', '2005-06-15 8:45', '2005-06-15 13:15', '2005-06-15 14:00', '2005-06-15 18:30', 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (148, 20, '2005-06-16', '2005-06-16 7:00', NULL, NULL, '2005-06-16 16:30', 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (149, 16, '2005-06-16', '2005-06-16 8:35', '2005-06-16 11:30', '2005-06-16 12:30', '2005-06-16 14:05', 4.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (150, 2,  '2005-06-16', '2005-06-16 7:30', '2005-06-16 11:31', NULL, NULL, 4.01, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (151, 20, '2005-06-17', '2005-06-17 7:15', '2005-06-17 12:35', '2005-06-17 12:50', '2005-06-17 17:00', 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (152, 16, '2005-06-17', '2005-06-17 12:00', '2005-06-17 20:15', NULL, NULL, 8.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (153, 2,  '2005-06-17', '2005-06-17 16:48', '2005-06-17 18:28', '2005-06-17 20:14', '2005-06-17 21:40', 3.09, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (154, 16, '2005-06-20', '2005-06-20 8:45', '2005-06-20 18:00', NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (155, 20, '2005-06-20', '2005-06-20 7:15', NULL, NULL, '2005-06-20 18:00', 10.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (156, 2,  '2005-06-20', '2005-06-20 7:47', '2005-06-20 18:06', '2005-06-20 18:53', '2005-06-20 21:48', 13.23, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (157, 16, '2005-06-21', '2005-06-21 8:40', '2005-06-21 18:40', NULL, NULL, 10, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (158, 2,  '2005-06-21', '2005-06-21 8:08', '2005-06-21 18:45', '2005-06-21 21:28', '2005-06-21 22:07', 11.26, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (159, 20, '2005-06-21', '2005-06-21 7:00', NULL, NULL, '2005-06-21 16:30', 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (160, 16, '2005-06-22',  NULL, NULL, NULL, NULL, 0, 7, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (161, 2,  '2005-06-22', '2005-06-22 7:25', '2005-06-22 18:05', '2005-06-22 19:14', '2005-06-22 21:21', 12.78, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (162, 20, '2005-06-22', '2005-06-22 7:00', NULL, NULL, '2005-06-22 11:00', 4, 4, 0, 3, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (163, 16, '2005-06-23', '2005-06-23 9:00', '2005-06-23 14:15', NULL, NULL, 5.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (164, 2,  '2005-06-23', '2005-06-23 7:28', '2005-06-23 11:29', NULL, NULL, 4.01, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (165, 20, '2005-06-23',  NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (166, 2,  '2005-06-24', '2005-06-24 8:14', '2005-06-24 18:10', '2005-06-24 19:22', '2005-06-24 21:08', 11.7, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (167, 20, '2005-06-24', '2005-06-24 7:15', NULL, NULL, '2005-06-24 16:30', 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (168, 16, '2005-06-24', '2005-06-24 8:40', '2005-06-24 12:25', '2005-06-24 13:35', '2005-06-24 18:20', 8.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (169, 2,  '2005-06-25', '2005-06-25 18:44', '2005-06-25 21:44', NULL, NULL, 3, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (170, 20, '2005-06-27', '2005-06-27 7:00', NULL, NULL, '2005-06-27 16:30', 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (171, 2,  '2005-06-27',  NULL, NULL, NULL, NULL, 16, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (172, 16, '2005-06-27', '2005-06-27 8:20', '2005-06-27 18:20', NULL, NULL, 10, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (173, 2,  '2005-06-28',  NULL, NULL, NULL, NULL, 10.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (174, 20, '2005-06-28', '2005-06-28 7:10', NULL, NULL, '2005-06-28 15:30', 8.33, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (175, 16, '2005-06-28', '2005-06-28 8:35', '2005-06-28 17:35', NULL, NULL, 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (176, 2,  '2005-06-29',  NULL, NULL, NULL, NULL, 7.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (178, 20, '2005-06-29', '2005-06-29 7:00', NULL, NULL, '2005-06-29 16:30', 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (179, 16, '2005-06-29', '2005-06-29 8:40', '2005-06-29 13:40', '2005-06-29 13:55', '2005-06-29 18:10', 9.25, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (180, 2,  '2005-06-30', '2005-06-30 7:22', '2005-06-30 11:31', NULL, NULL, 4.15, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (181, 16, '2005-06-30', '2005-06-30 8:35', '2005-06-30 14:05', NULL, NULL, 5.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (182, 20, '2005-06-30', '2005-06-30 7:10', '2005-06-30 16:30', NULL, NULL, 9.33, 0, 0, NULL, NULL);
SELECT setval('emp_times_emp_time_id_seq', 183);


INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (1, 3, 'Staff Briefing', '2005-11-20 00:00:00', '2005-11-20 10:00:00', 'Briefing in the Conference Hall for the staff');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (2, 3, 'Discussion on New Features', '2005-11-20 00:00:00', '2005-11-20 14:00:00', 'Managers responsible for new features should be present');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (3, 3, 'Staff Briefing', '2005-11-26 00:00:00', '2005-11-26 10:00:00', 'Briefing in the Conference Hall for the staff');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (4, 3, 'Result Discussion', '2005-12-07 00:00:00', '2005-12-07 16:00:00', 'Meeting to discuss results and the future plan for the Project');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (5, 3, 'Staff Briefing', '2005-12-18 00:00:00', '2005-12-18 09:00:00', 'Briefing in the Conference Hall for the staff');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (6, 3, 'Discussion on New Features', '2005-12-18 00:00:00', '2005-12-18 14:00:00', 'Managers responsible for new features should be present');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (7, 3, 'Staff Briefing', '2005-12-24 00:00:00', '2005-12-24 10:00:00', 'Briefing in the Conference Hall for the staff');
SELECT setval('user_events_user_event_id_seq', 8);


--
-- Definition for foreign keys : 
--

ALTER TABLE "employees"
ADD CONSTRAINT "employees_fk" FOREIGN KEY ("group_id") 
  REFERENCES "groups" ("group_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "employees"
ADD CONSTRAINT "employees_fk2" FOREIGN KEY ("department_id") 
  REFERENCES "departments" ("department_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "orders"
ADD CONSTRAINT "orders_fk" FOREIGN KEY ("order_customer_id") 
  REFERENCES "customers" ("customer_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "order_items"
ADD CONSTRAINT "order_items_fk" FOREIGN KEY ("order_id") 
  REFERENCES "orders" ("order_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "order_items"
ADD CONSTRAINT "order_items_fk2" FOREIGN KEY ("product_id") 
  REFERENCES "products" ("product_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "projects_employees"
ADD CONSTRAINT "projects_employees_fk" FOREIGN KEY ("emp_id") 
  REFERENCES "employees" ("emp_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "projects_employees"
ADD CONSTRAINT "projects_employees_fk2" FOREIGN KEY ("project_id") 
  REFERENCES "projects" ("project_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "tasks"
ADD CONSTRAINT "tasks_fk" FOREIGN KEY ("user_id_assign_to") 
  REFERENCES "employees" ("emp_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "tasks"
ADD CONSTRAINT "tasks_fk2" FOREIGN KEY ("user_id_assign_by") 
  REFERENCES "employees" ("emp_id") 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
  NOT DEFERRABLE;

ALTER TABLE "tasks"
ADD CONSTRAINT "tasks_fk3" FOREIGN KEY ("project_id") 
  REFERENCES "projects" ("project_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "tasks"
ADD CONSTRAINT "tasks_fk4" FOREIGN KEY ("type_id") 
  REFERENCES "types" ("type_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;

ALTER TABLE "tasks"
ADD CONSTRAINT "tasks_fk5" FOREIGN KEY ("status_id") 
  REFERENCES "statuses" ("status_id") 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
  NOT DEFERRABLE;

ALTER TABLE "tasks"
ADD CONSTRAINT "tasks_fk6" FOREIGN KEY ("priority_id") 
  REFERENCES "priorities" ("priority_id") 
  ON UPDATE CASCADE
  ON DELETE CASCADE
  NOT DEFERRABLE;
