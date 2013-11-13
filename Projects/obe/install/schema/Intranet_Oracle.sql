--
-- Drop sequences
--

DROP SEQUENCE USER_EVENTS_SEQ;
DROP SEQUENCE EMP_TIMES_SEQ;
DROP SEQUENCE TASKS_SEQ;
DROP SEQUENCE EMPLOYEES_SEQ;
DROP SEQUENCE ORDER_ITEMS_SEQ;
DROP SEQUENCE PRIORITIES_SEQ;
DROP SEQUENCE STATUSES_SEQ;
DROP SEQUENCE ORDERS_SEQ;
DROP SEQUENCE ABSENCE_TYPES_SEQ;
DROP SEQUENCE CUSTOMERS_SEQ;
DROP SEQUENCE DEPARTMENTS_SEQ;
DROP SEQUENCE GROUPS_SEQ;
DROP SEQUENCE FILES_SEQ;
DROP SEQUENCE MENU_SEQ;
DROP SEQUENCE PRODUCTS_SEQ;
DROP SEQUENCE PROJECTS_SEQ;
DROP SEQUENCE TYPES_SEQ;

--
-- Drop tables
--

BEGIN EXECUTE immediate 'DROP TABLE user_events'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE emp_times'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE tasks'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE projects_employees'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE employees'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE order_items'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE priorities'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE statuses'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE orders'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE absence_types'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE cache'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE customers'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE departments'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE groups'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE files'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE menu'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE products'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE projects'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE immediate 'DROP TABLE types'; EXCEPTION WHEN others THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/

--
-- CREATE TABLES 
--

/*** ABSENCE_TYPES ***/
CREATE TABLE ABSENCE_TYPES (
  ABSENCE_TYPE_ID      INT NOT NULL,
  ABSENCE_TYPE_NAME    VARCHAR(50) NULL,
  ABSENCE_TYPE_IS_PAID INT,
  CONSTRAINT PK_ABSENCE_TYPES PRIMARY KEY ( ABSENCE_TYPE_ID )
);

CREATE SEQUENCE ABSENCE_TYPES_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER ABSENCE_TYPES_TRIGGER
BEFORE INSERT
ON ABSENCE_TYPES
FOR EACH ROW
BEGIN
  SELECT ABSENCE_TYPES_SEQ.NEXTVAL INTO :NEW.ABSENCE_TYPE_ID FROM DUAL;
END;
/

/*** CACHE ***/
CREATE TABLE CACHE (
  CACHE_KEY       CHAR(65) NULL,
  CACHE_EXPIRATION INT  NULL,
  CACHE_DATA      NCLOB
);

/*** CUSTOMERS ***/
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID      INT NOT NULL,
    CUSTOMER_NAME    VARCHAR(50) NULL,
    CUSTOMER_PHONE   VARCHAR(50) NULL,
    CUSTOMER_ADDRESS VARCHAR(50) NULL,
    CUSTOMER_CITY    VARCHAR(50) NULL,
    CUSTOMER_STATE   VARCHAR(50) NULL,
    CUSTOMER_ZIP     VARCHAR(50) NULL,
    CONSTRAINT PK_CUSTOMERS PRIMARY KEY (CUSTOMER_ID)
);

CREATE SEQUENCE CUSTOMERS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE NOCYCLE NOORDER ;

CREATE OR REPLACE TRIGGER CUSTOMERS_TRIGGER
BEFORE INSERT
ON CUSTOMERS
FOR EACH ROW
BEGIN
  SELECT CUSTOMERS_SEQ.NEXTVAL INTO :NEW.CUSTOMER_ID FROM DUAL;
END;
/

/*** DEPARTMENTS ***/
CREATE TABLE DEPARTMENTS (
  DEPARTMENT_ID          INT NOT NULL,
  DEPARTMENT_NAME        VARCHAR(50),
  DEPARTMENT_MANAGER_ID  INT NULL,
  DEPARTMENT_IS_ACTIVE   SMALLINT DEFAULT 1 NOT NULL,
  CONSTRAINT PK_DEPARTMENTS PRIMARY KEY (DEPARTMENT_ID)
);

CREATE SEQUENCE DEPARTMENTS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER DEPARTMENTS_TRIGGER
BEFORE INSERT
ON DEPARTMENTS
FOR EACH ROW
BEGIN
  SELECT DEPARTMENTS_SEQ.NEXTVAL INTO :NEW.DEPARTMENT_ID FROM DUAL;
END;
/

/*** EMP_TIMES ***/
CREATE TABLE EMP_TIMES (
    EMP_TIME_ID           INT NOT NULL,
    EMP_ID                INT,
    EMP_TIME_DATE         DATE,
    EMP_TIME_IN           DATE NULL,
    EMP_TIME_OUT          DATE NULL,
    EMP_TIME_IN2          DATE NULL,
    EMP_TIME_OUT2         DATE NULL,
    EMP_TIME_TOTAL        NUMBER NULL,
    EMP_TIME_WITH_PAY     INT NULL,
    EMP_TIME_NO_PAY       INT NULL,
    ABSENCE_TYPE_WITH_PAY INT NULL,
    ABSENCE_TYPE_NO_PAY   INT NULL,
  CONSTRAINT PK_EMP_TIMES PRIMARY KEY ( EMP_TIME_ID )
);

CREATE SEQUENCE EMP_TIMES_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER EMP_TIMES_TRIGGER
BEFORE INSERT
ON EMP_TIMES
FOR EACH ROW
BEGIN
  SELECT EMP_TIMES_SEQ.NEXTVAL INTO :NEW.EMP_TIME_ID FROM DUAL;
END;
/

/*** GROUPS ***/
CREATE TABLE GROUPS (
  GROUP_ID   INT NOT NULL,
  GROUP_NAME VARCHAR(50),
  CONSTRAINT PK_GROUPS PRIMARY KEY (GROUP_ID)
);

CREATE SEQUENCE GROUPS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER GROUPS_TRIGGER
BEFORE INSERT
ON GROUPS
FOR EACH ROW
BEGIN
  SELECT GROUPS_SEQ.NEXTVAL INTO :NEW.GROUP_ID FROM DUAL;
END;
/

/*** EMPLOYEES ***/
CREATE TABLE EMPLOYEES (
  EMP_ID           INT  NOT NULL,
  EMP_LOGIN        VARCHAR(50),
  EMP_PASSWORD     VARCHAR(50),  
  EMP_NAME         VARCHAR(50),
  TITLE            VARCHAR(50),
  GROUP_ID         INT,
  DEPARTMENT_ID    INT,
  PHONE_HOME       VARCHAR(50),
  PHONE_WORK       VARCHAR(50),
  PHONE_CELL       VARCHAR(50),
  FAX              VARCHAR(50),
  EMAIL            VARCHAR(50),
  CITY             VARCHAR(50),
  ZIP              VARCHAR(50),
  ADDRESS          VARCHAR(50),
  PICTURE          VARCHAR(50),
  EMPLOYEE_IS_ACTIVE SMALLINT DEFAULT 1 NOT NULL,
  CONSTRAINT PK_EMPLOYEES  PRIMARY KEY (EMP_ID )
);

CREATE SEQUENCE EMPLOYEES_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER EMPLOYEES_TRIGGER
BEFORE INSERT
ON EMPLOYEES
FOR EACH ROW
BEGIN
  SELECT EMPLOYEES_SEQ.NEXTVAL INTO :NEW.EMP_ID FROM DUAL;
END;
/

/*** FILES ***/
CREATE TABLE FILES (
  FILE_ID              INT NOT NULL,
  FILE_NAME            VARCHAR(50) NULL,
  FILE_OWNER_ID        INT  NULL,
  FILE_UPLOADED_BY     INT  NULL,
  FILE_date_uploaded   DATE NULL,
  FILE_STATUS          INT  NULL,
  CONSTRAINT PK_FILES  PRIMARY KEY ( FILE_ID )
);

CREATE SEQUENCE FILES_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER FILES_TRIGGER
BEFORE INSERT
ON FILES
FOR EACH ROW
BEGIN
  SELECT FILES_SEQ.NEXTVAL INTO :NEW.FILE_ID FROM DUAL;
END;
/

/*** MENU ***/
CREATE TABLE MENU
(
    MENU_ID         INT NOT NULL,
    MENU_NAME       VARCHAR(50) NULL,
    MENU_ID_PARENT  INT         NULL,
    MENU_LINK       VARCHAR(50) NULL,
    CONSTRAINT PK_MENU PRIMARY KEY ( MENU_ID )
);

CREATE SEQUENCE MENU_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER MENU_TRIGGER
BEFORE INSERT
ON FILES
FOR EACH ROW
BEGIN
  SELECT MENU_SEQ.NEXTVAL INTO :NEW.MENU_ID FROM DUAL;
END;
/

/*** PRODUCTS ***/ 
CREATE TABLE PRODUCTS (
  PRODUCT_ID    INT NOT NULL,
  PRODUCT_NAME  VARCHAR(255) NULL,
  PRICE         NUMBER  NULL,
  CONSTRAINT PK_PRODUCTS PRIMARY KEY (PRODUCT_ID)
);

CREATE SEQUENCE PRODUCTS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER PRODUCTS_TRIGGER
BEFORE INSERT
ON PRODUCTS
FOR EACH ROW
BEGIN
  SELECT PRODUCTS_SEQ.NEXTVAL INTO :NEW.PRODUCT_ID FROM DUAL;
END;
/

/*** ORDERS ***/
CREATE TABLE ORDERS (
  ORDER_ID           INT NOT NULL,
  ORDER_CUSTOMER_ID  INT   NULL,
  ORDER_DATE         DATE  NULL,
  ORDER_SHIP_ADDRESS VARCHAR(50) NULL,
  ORDER_SHIP_CITY    VARCHAR(50) NULL,
  ORDER_SHIP_STATE   VARCHAR(50) NULL,
  ORDER_SHIP_ZIP     VARCHAR(10) NULL,
  CONSTRAINT PK_ORDERS  PRIMARY KEY (ORDER_ID)
);

CREATE SEQUENCE ORDERS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER ORDERS_TRIGGER
BEFORE INSERT
ON ORDERS
FOR EACH ROW
BEGIN
  SELECT ORDERS_SEQ.NEXTVAL INTO :NEW.ORDER_ID FROM DUAL;
END;
/

/*** ORDER_ITEMS ***/
CREATE TABLE ORDER_ITEMS (
  ORDER_ITEM_ID     INT NOT NULL,
  ORDER_ID          INT    NULL,
  product_id        INT    NULL,
  quantity          INT    NULL,
  price             NUMBER NULL,
  CONSTRAINT PK_ORDER_ITEMS  PRIMARY KEY (ORDER_ITEM_ID)
);

CREATE SEQUENCE ORDER_ITEMS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER ORDER_ITEMS_TRIGGER
BEFORE INSERT
ON ORDER_ITEMS
FOR EACH ROW
BEGIN
  SELECT ORDER_ITEMS_SEQ.NEXTVAL INTO :NEW.ORDER_ITEM_ID FROM DUAL;
END;
/

/*** PRIORITIES ***/ 
CREATE TABLE PRIORITIES (
  PRIORITY_ID               INT NOT NULL,
  PRIORITY_NAME             VARCHAR(15) NULL,
  CONSTRAINT PK_PRIORITIES  PRIMARY KEY (PRIORITY_ID)
);

CREATE SEQUENCE PRIORITIES_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER PRIORITIES_TRIGGER
BEFORE INSERT
ON PRIORITIES
FOR EACH ROW
BEGIN
  SELECT PRIORITIES_SEQ.NEXTVAL INTO :NEW.PRIORITY_ID FROM DUAL;
END;
/

/*** PROJECTS ***/
CREATE TABLE PROJECTS (
  PROJECT_ID    INT NOT NULL,
  PROJECT_NAME  VARCHAR(50)  NULL,
  PROJECT_IS_ACTIVE SMALLINT DEFAULT 1 NOT NULL,
  CONSTRAINT    PK_PROJECTS  PRIMARY KEY (PROJECT_ID)
);

CREATE SEQUENCE PROJECTS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER PROJECTS_TRIGGER
BEFORE INSERT
ON PROJECTS
FOR EACH ROW
BEGIN
  SELECT PROJECTS_SEQ.NEXTVAL INTO :NEW.PROJECT_ID FROM DUAL;
END;
/

/*** PROJECTS_EMPLOYEES ***/
CREATE TABLE PROJECTS_EMPLOYEES (
    PROJECT_ID          INT NOT NULL,
    EMP_ID              INT NOT NULL,
    PERCENT_ALLOCATION  NUMBER  NULL,
    CONSTRAINT PK_PROJECTS_EMPLOYEES PRIMARY KEY (PROJECT_ID,EMP_ID)
);

/*** TYPES ***/
CREATE TABLE TYPES (
  TYPE_ID              INT NOT NULL,
  TYPE_NAME            VARCHAR(50) NULL,
  CONSTRAINT PK_TYPES  PRIMARY KEY ( TYPE_ID )
);

CREATE SEQUENCE TYPES_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER TYPES_TRIGGER
BEFORE INSERT
ON TYPES
FOR EACH ROW
BEGIN
  SELECT TYPES_SEQ.NEXTVAL INTO :NEW.TYPE_ID FROM DUAL;
END;
/

/*** TASKS ***/
CREATE TABLE TASKS (
  TASK_ID              INT NOT NULL,
  PROJECT_ID           INT NOT NULL,
  PRIORITY_ID          INT NOT NULL,
  STATUS_ID            INT NOT NULL,
  TYPE_ID              INT NOT NULL,
  TASK_NAME            VARCHAR2(100)  NULL,
  TASK_DESC            VARCHAR2(2000) NULL,
  USER_ID_ASSIGN_BY    INT DEFAULT 0  NULL,
  USER_ID_ASSIGN_TO    INT     NOT NULL,
  TASK_START_DATE      DATE        NULL,
  TASK_FINISH_DATE     DATE        NULL,
  CONSTRAINT PK_TASKS  PRIMARY KEY (TASK_ID)
);

CREATE SEQUENCE TASKS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER TASKS_TRIGGER
BEFORE INSERT
ON TASKS
FOR EACH ROW
BEGIN
  SELECT TASKS_SEQ.NEXTVAL INTO :NEW.TASK_ID FROM DUAL;
END;
/

/*** STATUSES ***/
CREATE TABLE STATUSES (
  STATUS_ID    INT NOT NULL,
  STATUS_NAME  VARCHAR(50)    NULL,
  CONSTRAINT   PK_STATUSES  PRIMARY KEY (STATUS_ID )
);

CREATE SEQUENCE STATUSES_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER STATUSES_TRIGGER
BEFORE INSERT
ON STATUSES
FOR EACH ROW
BEGIN
  SELECT STATUSES_SEQ.NEXTVAL INTO :NEW.STATUS_ID FROM DUAL;
END;
/

/*** USER_EVENTS ***/
CREATE TABLE USER_EVENTS (
    USER_EVENT_ID         INT NOT NULL,
    PRIORITY_ID           INT NULL,
    USER_EVENT_TITLE      VARCHAR(100),
    USER_EVENT_DATE       DATE NULL,
    USER_EVENT_TIME       DATE NULL,
    USER_EVENT_DESC       NCLOB,
  CONSTRAINT PK_USER_EVENT_ID PRIMARY KEY ( USER_EVENT_ID )
);

CREATE SEQUENCE USER_EVENTS_SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ;

CREATE OR REPLACE TRIGGER USER_EVENTS_TRIGGER
BEFORE INSERT
ON USER_EVENTS
FOR EACH ROW
BEGIN
  SELECT USER_EVENTS_SEQ.NEXTVAL INTO :NEW.USER_EVENT_ID FROM DUAL;
END;
/




/*** TABLE INSERT STATEMENTS ***/


INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (1,'ABC Inc.', '2560 Broadway, Suite 100', 'Denver', 'Colorado', '34574');
INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (2,'Hard'||'&'||'Soft', '35 Corey Way # 135', 'Atlanta', 'Georgia', '46273');
INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (3,'Online Services', '226 A Westborough Blvd. #105', 'San Francisco', 'California', '56789');
INSERT INTO customers(customer_id,customer_name, customer_address, customer_city, customer_state, customer_zip) VALUES (4,'Night and Day', '125 South 12th Street', 'San Francisco', 'California', '32456');

INSERT INTO departments (department_id,department_name) VALUES (1,'C++ Development');
INSERT INTO departments (department_id,department_name) VALUES (2,'Administration');
INSERT INTO departments (department_id,department_name) VALUES (3,'Support');
INSERT INTO departments (department_id,department_name) VALUES (4,'Finance');
INSERT INTO departments (department_id,department_name) VALUES (5,'Web Development');
INSERT INTO departments (department_id,department_name) VALUES (6,'Testing');
INSERT INTO departments (department_id,department_name) VALUES (7,'Design');
INSERT INTO departments (department_id,department_name) VALUES (8,'Documentation');
INSERT INTO departments (department_id,department_name) VALUES (9,'Solutions Development');


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



INSERT INTO groups (group_id,group_name) VALUES (1 , 'User' ); 
INSERT INTO groups (group_id,group_name) VALUES (2 , 'Admin' ); 

INSERT INTO orders(order_customer_id,order_date) VALUES (1,to_date('2003-01-10','YYYY-MM-DD'));
INSERT INTO orders(order_customer_id,order_date) VALUES (2,to_date('2003-01-14','YYYY-MM-DD'));
INSERT INTO orders(order_customer_id,order_date) VALUES (3,to_date('2003-01-16','YYYY-MM-DD'));
INSERT INTO orders(order_customer_id,order_date) VALUES (1,to_date('2003-01-22','YYYY-MM-DD'));

INSERT INTO priorities (priority_name) VALUES ('Highest'); 
INSERT INTO priorities (priority_name) VALUES ('High'); 
INSERT INTO priorities (priority_name) VALUES ('Normal'); 
INSERT INTO priorities (priority_name) VALUES ('Low'); 
INSERT INTO priorities (priority_name) VALUES ('Lowest'); 

INSERT INTO products(product_id,product_name,price) VALUES(1,'Web Database Development',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(2,'Programming Perl',39.96);
INSERT INTO products(product_id,product_name,price) VALUES(3,'Perl and CGI for the WWW',15.19);
INSERT INTO products(product_id,product_name,price) VALUES(4,'MySQL',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(5,'PHP and MySQL Web Development',39.99);
INSERT INTO products(product_id,product_name,price) VALUES(6,'MySQL'||' & '||'PHP From Scratch',23.99);
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
INSERT INTO products(product_id,product_name,price) VALUES(17,'ColdFusion Fast '||'&'||' Easy Web Development',19.99);
INSERT INTO products(product_id,product_name,price) VALUES(18,'Beginning Active Server Pages 3.0',31.99);
INSERT INTO products(product_id,product_name,price) VALUES(19,'Web Design in a Nutshell',23.96);
INSERT INTO products(product_id,product_name,price) VALUES(20,'HTML 4 for the WWW Visual Quickstart Guide',15.99);
INSERT INTO products(product_id,product_name,price) VALUES(21,'1001 Web Site Construction Tips and Tricks',39.95);
INSERT INTO products(product_id,product_name,price) VALUES(22,'C# - Programming with the Public Beta',34.99);

INSERT INTO projects (project_name, project_is_active) VALUES ( 'CodeCharge' , 1); 
INSERT INTO projects (project_name, project_is_active) VALUES ( 'My Project' , 1); 
INSERT INTO projects (project_name, project_is_active) VALUES ( 'Test Project' , 1); 
INSERT INTO projects (project_name, project_is_active) VALUES ( 'Great Project' , 1); 
INSERT INTO projects (project_name, project_is_active) VALUES ( 'Super Project' , 1); 

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



INSERT INTO statuses (status_id,status_name) VALUES (1,'Open'); 
INSERT INTO statuses (status_id,status_name) VALUES (2,'On hold'); 
INSERT INTO statuses (status_id,status_name) VALUES (3,'Closed'); 
INSERT INTO statuses (status_id,status_name) VALUES (4,'In progress'); 

INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (1 ,1 , 2 , 1 , 3 ,'Great Project needs to be greater' , 'Mission Impossible? Get CodeCharge.' , 3 , 4 , to_date('2003-02-01','YYYY-MM-DD') , to_date('2003-02-02','YYYY-MM-DD')); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (2 ,1 , 1 , 1 , 4 ,'Fix ALL bugs' , 'Staying up at night coding? Get CodeCharge, go home, get rest.' , 3 , 6 , to_date('2003-02-02','YYYY-MM-DD') , to_date('2003-02-03','YYYY-MM-DD') ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (3 ,1 , 2 , 3 , 1 ,'Get ready to click' , 'Write CODE by pointing and clicking.\r\nWrite CODE by pointing and clicking. Or clicking and pointing. Or clicking and clicking.' , 3 , 4 , to_date('2003-02-03' ,'YYYY-MM-DD'), to_date('2003-02-04','YYYY-MM-DD') ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (4 ,2 , 1 , 1 , 1 ,'Finish My Project' , 'Verify Zip Code and other possible errors in XML files. Display full list of errors to the user and \"status=error\" hidden in HTML.' , 3 , 5 , to_date('2003-02-04','YYYY-MM-DD') , to_date('2003-02-05','YYYY-MM-DD') ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (5 ,3 , 2 , 4 , 1 ,'Test this project.' , 'Programmoholic? Get Help. Get CodeCharge.' , 3 , 3 , to_date('2002-02-05','YYYY-MM-DD') , to_date('2003-02-06','YYYY-MM-DD') ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (6 ,1 , 1 , 1 , 1 ,'Code with one hand.' , 'Why code with TWO HANDS, when you can do it faster with ONE.' , 3 , 2 , to_date('2003-02-06','YYYY-MM-DD') , to_date('2003-02-07','YYYY-MM-DD')); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (7 ,3 , 1 , 2 , 1 ,'Get armed' , 'Low on ammunition? Get armed. Get CodeCharge.' , 3 , 1 , to_date('2003-02-07','YYYY-MM-DD') , to_date('2003-02-08','YYYY-MM-DD') ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (8 ,3 , 1 , 1 , 4 ,'Write more code' , 'To code or not to code, that is the question' , 3 , 5 , to_date('2003-02-08','YYYY-MM-DD') , to_date('2003-02-09','YYYY-MM-DD')); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (9 ,5 , 1 , 4 , 1 ,'Code, code, code…' , 'CODE. CODE. CODE. CODE. MORE CODE.' , 3 , 6 , to_date('2003-02-09','YYYY-MM-DD') , to_date('2003-02-10','YYYY-MM-DD')); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (10,3 , 5 , 2 , 1 ,'Sleep' , 'Stop coding. Charge your code. Get Sleep.' , 3 , 3 , to_date('2003-02-10','YYYY-MM-DD') , to_date('2003-02-11','YYYY-MM-DD') ); 
INSERT INTO tasks (task_id,project_id,priority_id,status_id,type_id,task_name,task_desc,user_id_assign_by,user_id_assign_to,task_start_date,task_finish_date) VALUES (11,5 , 1 , 1 , 1 ,'Have fun' , 'Bored with your programming job? Get CodeCharge. Have Fun.' , 3 , 2 , to_date('2003-02-11','YYYY-MM-DD') , to_date('2003-02-12','YYYY-MM-DD')); 

INSERT INTO types (type_id, type_name) VALUES(1,'Task');
INSERT INTO types (type_id, type_name) VALUES(2,'Bug');
INSERT INTO types (type_id, type_name) VALUES(3,'Issue');
INSERT INTO types (type_id, type_name) VALUES(4,'Question');

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


INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (100, 2,  to_date('2005-05-25', 'YYYY-MM-DD'), to_date('2005-05-25 8:31', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-25 17:01', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 8.5,  0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (101, 16, to_date('2005-05-25', 'YYYY-MM-DD'), to_date('2005-05-25 8:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-25 12:30', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-25 12:50', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-25 19:10', 'YYYY-MM-DD HH24:MI'), 10.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (102, 20, to_date('2005-05-25', 'YYYY-MM-DD'), to_date('2005-05-25 7:10', 'YYYY-MM-DD HH24:MI'),to_date('2005-05-25 13:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-25 13:15', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-25 17:00', 'YYYY-MM-DD HH24:MI'), 9.58, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (103, 16, to_date('2005-05-26', 'YYYY-MM-DD'), NULL,  NULL,  NULL,  NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (104, 2,  to_date('2005-05-26', 'YYYY-MM-DD'), to_date('2005-05-26 8:18', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-26 18:05', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-26 19:14', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-26 20:33', 'YYYY-MM-DD HH24:MI'), 11.09, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (105, 20, to_date('2005-05-26', 'YYYY-MM-DD'), to_date('2005-05-26 6:45', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-05-26 16:30', 'YYYY-MM-DD HH24:MI'), 9.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (106, 16, to_date('2005-05-27', 'YYYY-MM-DD'), NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (107, 2,  to_date('2005-05-27', 'YYYY-MM-DD'), to_date('2005-05-27 7:59', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-27 18:14', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-27 19:29', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-27 21:00', 'YYYY-MM-DD HH24:MI'), 11.76, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (108, 20, to_date('2005-05-27', 'YYYY-MM-DD'), to_date('2005-05-27 6:20', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-05-27 17:00', 'YYYY-MM-DD HH24:MI'), 10.66, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (109, 16, to_date('2005-05-30', 'YYYY-MM-DD'),  NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (110, 2, to_date('2005-05-30', 'YYYY-MM-DD'), to_date('2005-05-30 7:17', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-30 18:47', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 11.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (111, 20, to_date('2005-05-30', 'YYYY-MM-DD'), NULL, NULL, NULL, NULL, 0, 8, 0, 7, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (112, 16, to_date('2005-05-31', 'YYYY-MM-DD'), to_date('2005-05-31 8:45', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-31 18:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (113, 2,  to_date('2005-05-31', 'YYYY-MM-DD'), to_date('2005-05-31 8:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-31 18:20', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 8.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (114, 20, to_date('2005-05-31', 'YYYY-MM-DD'), to_date('2005-05-31 6:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-05-31 17:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 11, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (115, 2,  to_date('2005-06-01', 'YYYY-MM-DD'), to_date('2005-06-01 8:12', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-01 11:20', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-01 12:36', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-01 20:40', 'YYYY-MM-DD HH24:MI'), 11.19, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (116, 20, to_date('2005-06-01', 'YYYY-MM-DD'), to_date('2005-06-01 6:30', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-01 10:15', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 3.75, 4.25, 0, 7, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (117, 16, to_date('2005-06-01', 'YYYY-MM-DD'), NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (118, 16, to_date('2005-06-02', 'YYYY-MM-DD'), NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (119, 2,  to_date('2005-06-02', 'YYYY-MM-DD'), to_date('2005-06-02 7:59', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-02 11:32', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 3.54, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (120, 20, to_date('2005-06-02', 'YYYY-MM-DD'), to_date('2005-06-02 6:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-02 11:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-02 11:15', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-02 16:30', 'YYYY-MM-DD HH24:MI'), 10.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (121, 16, to_date('2005-06-03', 'YYYY-MM-DD'), to_date('2005-06-03 7:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-03 16:30', 'YYYY-MM-DD HH24:MI'), 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (122, 20, to_date('2005-06-03', 'YYYY-MM-DD'), to_date('2005-06-03 6:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-03 17:30', 'YYYY-MM-DD HH24:MI'), 11.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (123, 2,  to_date('2005-06-03', 'YYYY-MM-DD'), to_date('2005-06-03 7:45', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-03 18:45', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (124, 20, to_date('2005-06-06', 'YYYY-MM-DD'), to_date('2005-06-05 6:20', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 14:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 14:10', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 16:30', 'YYYY-MM-DD HH24:MI'), 10, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (125, 16, to_date('2005-06-06', 'YYYY-MM-DD'), to_date('2005-06-05 8:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 14:55', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 15:25', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 19:20', 'YYYY-MM-DD HH24:MI'), 10.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (126, 2,  to_date('2005-06-06', 'YYYY-MM-DD'), to_date('2005-06-05 8:07', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 18:14', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 19:22', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-05 21:02', 'YYYY-MM-DD HH24:MI'), 11.78,  0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (127, 16, to_date('2005-06-07', 'YYYY-MM-DD'), to_date('2005-06-07 8:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-07 17:50', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (128, 2,  to_date('2005-06-07', 'YYYY-MM-DD'), to_date('2005-06-07 8:20', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-07 18:11', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-07 19:36', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-07 21:25', 'YYYY-MM-DD HH24:MI'), 11.66, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (129, 20, to_date('2005-06-07', 'YYYY-MM-DD'), to_date('2005-06-07 7:10', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-07 12:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-07 12:10', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-07 16:30', 'YYYY-MM-DD HH24:MI'), 9.16, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (130, 2,  to_date('2005-06-08', 'YYYY-MM-DD'), to_date('2005-06-08 8:23', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-08 18:45', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-08 21:16', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-08 22:00', 'YYYY-MM-DD HH24:MI'), 11.09,0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (131, 16, to_date('2005-06-08', 'YYYY-MM-DD'), to_date('2005-06-08 8:25', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-08 17:40', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (132, 20, to_date('2005-06-08', 'YYYY-MM-DD'), to_date('2005-06-08 7:15', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-08 16:45', 'YYYY-MM-DD HH24:MI'), 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (133, 2,  to_date('2005-06-09', 'YYYY-MM-DD'), to_date('2005-06-09 7:57', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 18:08', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 19:32', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 22:05', 'YYYY-MM-DD HH24:MI'), 12.73, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (134, 16, to_date('2005-06-09', 'YYYY-MM-DD'), to_date('2005-06-09 8:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 12:55', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 13:55', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 18:40', 'YYYY-MM-DD HH24:MI'), 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (135, 20, to_date('2005-06-09', 'YYYY-MM-DD'), to_date('2005-06-09 6:10', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 12:25', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 12:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-09 16:30', 'YYYY-MM-DD HH24:MI'), 10.08, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (136, 2,  to_date('2005-06-10', 'YYYY-MM-DD'), to_date('2005-06-10 8:05', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-10 11:30', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 3.41, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (137, 16, to_date('2005-06-10', 'YYYY-MM-DD'), to_date('2005-06-10 8:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-10 17:20', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 8.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (138, 20, to_date('2005-06-10', 'YYYY-MM-DD'), to_date('2005-06-10 6:15', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-10 16:45', 'YYYY-MM-DD HH24:MI'), 10.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (139, 2,  to_date('2005-06-13', 'YYYY-MM-DD'), to_date('2005-06-13 8:03', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 18:19', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 20:04', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 21:21', 'YYYY-MM-DD HH24:MI'), 11.54, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (140, 20, to_date('2005-06-13', 'YYYY-MM-DD'), to_date('2005-06-13 7:15', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 12:20', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 12:30', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 16:30', 'YYYY-MM-DD HH24:MI'), 9.08, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (141, 16, to_date('2005-06-13', 'YYYY-MM-DD'), to_date('2005-06-13 9:20', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 12:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 13:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-13 18:35', 'YYYY-MM-DD HH24:MI'), 8.25, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (142, 2,  to_date('2005-06-14', 'YYYY-MM-DD'), to_date('2005-06-14 7:57', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-14 19:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 11.05, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (143, 16, to_date('2005-06-14', 'YYYY-MM-DD'), to_date('2005-06-14 8:15', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-14 18:45', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 10.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (144, 20, to_date('2005-06-14', 'YYYY-MM-DD'), to_date('2005-06-14 7:05', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-14 17:00', 'YYYY-MM-DD HH24:MI'), 9.91, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (145, 20, to_date('2005-06-15', 'YYYY-MM-DD'), to_date('2005-06-15 7:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-15 12:30', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-15 12:45', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-15 16:30', 'YYYY-MM-DD HH24:MI'), 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (146, 2,  to_date('2005-06-15', 'YYYY-MM-DD'), to_date('2005-06-15 8:04', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-15 20:34', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 12.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (147, 16, to_date('2005-06-15', 'YYYY-MM-DD'), to_date('2005-06-15 8:45', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-15 13:15', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-15 14:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-15 18:30', 'YYYY-MM-DD HH24:MI'), 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (148, 20, to_date('2005-06-16', 'YYYY-MM-DD'), to_date('2005-06-16 7:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-16 16:30', 'YYYY-MM-DD HH24:MI'), 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (149, 16, to_date('2005-06-16', 'YYYY-MM-DD'), to_date('2005-06-16 8:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-16 11:30', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-16 12:30', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-16 14:05', 'YYYY-MM-DD HH24:MI'), 4.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (150, 2,  to_date('2005-06-16', 'YYYY-MM-DD'), to_date('2005-06-16 7:30', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-16 11:31', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 4.01, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (151, 20, to_date('2005-06-17', 'YYYY-MM-DD'), to_date('2005-06-17 7:15', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-17 12:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-17 12:50', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-17 17:00', 'YYYY-MM-DD HH24:MI'), 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (152, 16, to_date('2005-06-17', 'YYYY-MM-DD'), to_date('2005-06-17 12:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-17 20:15', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 8.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (153, 2,  to_date('2005-06-17', 'YYYY-MM-DD'), to_date('2005-06-17 16:48', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-17 18:28', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-17 20:14', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-17 21:40', 'YYYY-MM-DD HH24:MI'), 3.09, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (154, 16, to_date('2005-06-20', 'YYYY-MM-DD'), to_date('2005-06-20 8:45', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-20 18:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (155, 20, to_date('2005-06-20', 'YYYY-MM-DD'), to_date('2005-06-20 7:15', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-20 18:00', 'YYYY-MM-DD HH24:MI'), 10.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (156, 2,  to_date('2005-06-20', 'YYYY-MM-DD'), to_date('2005-06-20 7:47', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-20 18:06', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-20 18:53', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-20 21:48', 'YYYY-MM-DD HH24:MI'), 13.23, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (157, 16, to_date('2005-06-21', 'YYYY-MM-DD'), to_date('2005-06-21 8:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-21 18:40', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 10, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (158, 2,  to_date('2005-06-21', 'YYYY-MM-DD'), to_date('2005-06-21 8:08', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-21 18:45', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-21 21:28', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-21 22:07', 'YYYY-MM-DD HH24:MI'), 11.26, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (159, 20, to_date('2005-06-21', 'YYYY-MM-DD'), to_date('2005-06-21 7:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-21 16:30', 'YYYY-MM-DD HH24:MI'), 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (160, 16, to_date('2005-06-22', 'YYYY-MM-DD'),  NULL, NULL, NULL, NULL, 0, 7, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (161, 2,  to_date('2005-06-22', 'YYYY-MM-DD'), to_date('2005-06-22 7:25', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-22 18:05', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-22 19:14', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-22 21:21', 'YYYY-MM-DD HH24:MI'), 12.78, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (162, 20, to_date('2005-06-22', 'YYYY-MM-DD'), to_date('2005-06-22 7:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-22 11:00', 'YYYY-MM-DD HH24:MI'), 4, 4, 0, 3, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (163, 16, to_date('2005-06-23', 'YYYY-MM-DD'), to_date('2005-06-23 9:00', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-23 14:15', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 5.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (164, 2,  to_date('2005-06-23', 'YYYY-MM-DD'), to_date('2005-06-23 7:28', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-23 11:29', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 4.01, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (165, 20, to_date('2005-06-23', 'YYYY-MM-DD'),  NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (166, 2,  to_date('2005-06-24', 'YYYY-MM-DD'), to_date('2005-06-24 8:14', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-24 18:10', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-24 19:22', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-24 21:08', 'YYYY-MM-DD HH24:MI'), 11.7, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (167, 20, to_date('2005-06-24', 'YYYY-MM-DD'), to_date('2005-06-24 7:15', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-24 16:30', 'YYYY-MM-DD HH24:MI'), 9.25, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (168, 16, to_date('2005-06-24', 'YYYY-MM-DD'), to_date('2005-06-24 8:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-24 12:25', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-24 13:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-24 18:20', 'YYYY-MM-DD HH24:MI'), 8.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (169, 2,  to_date('2005-06-25', 'YYYY-MM-DD'), to_date('2005-06-25 18:44', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-25 21:44', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 3, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (170, 20, to_date('2005-06-27', 'YYYY-MM-DD'), to_date('2005-06-27 7:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-27 16:30', 'YYYY-MM-DD HH24:MI'), 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (171, 2,  to_date('2005-06-27', 'YYYY-MM-DD'),  NULL, NULL, NULL, NULL, 16, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (172, 16, to_date('2005-06-27', 'YYYY-MM-DD'), to_date('2005-06-27 8:20', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-27 18:20', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 10, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (173, 2,  to_date('2005-06-28', 'YYYY-MM-DD'),  NULL, NULL, NULL, NULL, 10.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (174, 20, to_date('2005-06-28', 'YYYY-MM-DD'), to_date('2005-06-28 7:10', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-28 15:30', 'YYYY-MM-DD HH24:MI'), 8.33, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (175, 16, to_date('2005-06-28', 'YYYY-MM-DD'), to_date('2005-06-28 8:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-28 17:35', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 9, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (176, 2,  to_date('2005-06-29', 'YYYY-MM-DD'),  NULL, NULL, NULL, NULL, 7.75, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (178, 20, to_date('2005-06-29', 'YYYY-MM-DD'), to_date('2005-06-29 7:00', 'YYYY-MM-DD HH24:MI'), NULL, NULL, to_date('2005-06-29 16:30', 'YYYY-MM-DD HH24:MI'), 9.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (179, 16, to_date('2005-06-29', 'YYYY-MM-DD'), to_date('2005-06-29 8:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-29 13:40', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-29 13:55', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-29 18:10', 'YYYY-MM-DD HH24:MI'), 9.25, 0, 0, NULL, NULL);
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (180, 2,  to_date('2005-06-30', 'YYYY-MM-DD'), to_date('2005-06-30 7:22', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-30 11:31', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 4.15, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (181, 16, to_date('2005-06-30', 'YYYY-MM-DD'), to_date('2005-06-30 8:35', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-30 14:05', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 5.5, 0, 0, NULL, NULL); 
INSERT INTO emp_times (emp_time_id, emp_id, emp_time_date, emp_time_in, emp_time_out, emp_time_in2, emp_time_out2, emp_time_total, emp_time_with_pay, emp_time_no_pay, absence_type_with_pay, absence_type_no_pay) 
  VALUES (182, 20, to_date('2005-06-30', 'YYYY-MM-DD'), to_date('2005-06-30 7:10', 'YYYY-MM-DD HH24:MI'), to_date('2005-06-30 16:30', 'YYYY-MM-DD HH24:MI'), NULL, NULL, 9.33, 0, 0, NULL, NULL);


INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (1, 3, 'Staff Briefing', to_date('2005-11-20', 'YYYY-MM-DD'), to_date('2005-11-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Briefing in the Conference Hall for the staff');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (2, 3, 'Discussion on New Features', to_date('2005-11-20', 'YYYY-MM-DD'), to_date('2005-11-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Managers responsible for new features should be present');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (3, 3, 'Staff Briefing', to_date('2005-11-26', 'YYYY-MM-DD'), to_date('2005-11-26 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Briefing in the Conference Hall for the staff');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (4, 3, 'Result Discussion', to_date('2005-12-07', 'YYYY-MM-DD'), to_date('2005-12-07 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Meeting to discuss results and the future plan for the Project');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (5, 3, 'Staff Briefing', to_date('2005-12-18', 'YYYY-MM-DD'), to_date('2005-12-18 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Briefing in the Conference Hall for the staff');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (6, 3, 'Discussion on New Features', to_date('2005-12-18', 'YYYY-MM-DD'), to_date('2005-12-18 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Managers responsible for new features should be present');
INSERT INTO user_events (user_event_id, priority_id, user_event_title, user_event_date, user_event_time, user_event_desc) 
  VALUES (7, 3, 'Staff Briefing', to_date('2005-12-24', 'YYYY-MM-DD'), to_date('2005-12-24 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Briefing in the Conference Hall for the staff');

