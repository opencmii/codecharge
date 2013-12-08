--
-- DROP Foreign Key supported from SQL Server 2005+
--
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[tasks_fk]') AND parent_object_id = OBJECT_ID(N'[tasks]'))
ALTER TABLE [tasks] DROP CONSTRAINT [tasks_fk]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[tasks_fk2]') AND parent_object_id = OBJECT_ID(N'[tasks]'))
ALTER TABLE [tasks] DROP CONSTRAINT [tasks_fk2]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[tasks_fk3]') AND parent_object_id = OBJECT_ID(N'[tasks]'))
ALTER TABLE [tasks] DROP CONSTRAINT [tasks_fk3]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[tasks_fk4]') AND parent_object_id = OBJECT_ID(N'[tasks]'))
ALTER TABLE [tasks] DROP CONSTRAINT [tasks_fk4]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[tasks_fk5]') AND parent_object_id = OBJECT_ID(N'[tasks]'))
ALTER TABLE [tasks] DROP CONSTRAINT [tasks_fk5]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[tasks_fk6]') AND parent_object_id = OBJECT_ID(N'[tasks]'))
ALTER TABLE [tasks] DROP CONSTRAINT [tasks_fk6]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[projects_employees_fk]') AND parent_object_id = OBJECT_ID(N'[projects_employees]'))
ALTER TABLE [projects_employees] DROP CONSTRAINT [projects_employees_fk]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[projects_employees_fk2]') AND parent_object_id = OBJECT_ID(N'[projects_employees]'))
ALTER TABLE [projects_employees] DROP CONSTRAINT [projects_employees_fk2]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[employees_fk]') AND parent_object_id = OBJECT_ID(N'[employees]'))
ALTER TABLE [employees] DROP CONSTRAINT [employees_fk]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[employees_fk2]') AND parent_object_id = OBJECT_ID(N'[employees]'))
ALTER TABLE [employees] DROP CONSTRAINT [employees_fk2]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[order_items_fk]') AND parent_object_id = OBJECT_ID(N'[order_items]'))
ALTER TABLE [order_items] DROP CONSTRAINT [order_items_fk]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[order_items_fk2]') AND parent_object_id = OBJECT_ID(N'[order_items]'))
ALTER TABLE [order_items] DROP CONSTRAINT [order_items_fk2]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[orders_fk]') AND parent_object_id = OBJECT_ID(N'[orders]'))
ALTER TABLE [orders] DROP CONSTRAINT [orders_fk]
GO

--
-- Drop tables
--
if exists (select * from sysobjects where id = object_id(N'order_items') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE order_items
GO

if exists (select * from sysobjects where id = object_id(N'projects_employees') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE projects_employees
GO

if exists (select * from sysobjects where id = object_id(N'employees') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE employees
GO

if exists (select * from sysobjects where id = object_id(N'statuses') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE [statuses]
GO

if exists (select * from sysobjects where id = object_id(N'orders') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE [orders]
GO

if exists (select * from sysobjects where id = object_id(N'tasks') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE tasks
GO

if exists (select * from sysobjects where id = object_id(N'emp_times') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE emp_times
GO

if exists (select * from sysobjects where id = object_id(N'departments') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE departments
GO

if exists (select * from sysobjects where id = object_id(N'customers') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE customers
GO

if exists (select * from sysobjects where id = object_id(N'cache') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE cache
GO

if exists (select * from sysobjects where id = object_id(N'absence_types') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE absence_types
GO

if exists (select * from sysobjects where id = object_id(N'user_events') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE user_events
GO

if exists (select * from sysobjects where id = object_id(N'types') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE types
GO

if exists (select * from sysobjects where id = object_id(N'projects') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE projects
GO

if exists (select * from sysobjects where id = object_id(N'products') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE products
GO

if exists (select * from sysobjects where id = object_id(N'priorities') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE [priorities]
GO

if exists (select * from sysobjects where id = object_id(N'menu') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE [menu]
GO

if exists (select * from sysobjects where id = object_id(N'groups') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE [groups]
GO

if exists (select * from sysobjects where id = object_id(N'files') and OBJECTPROPERTY(id, N'IsUserTable') = 1) DROP TABLE [files]
GO

--
-- Definition for table absence_types : 
--

CREATE TABLE [dbo].[absence_types] (
  [absence_type_id] int IDENTITY PRIMARY KEY,
  [absence_type_name] nvarchar(50) NULL,
  [absence_type_is_paid] tinyint NULL
)
ON [PRIMARY]
GO

--
-- Definition for table cache : 
--

CREATE TABLE [dbo].[cache] (
  [cache_key] nvarchar(65) NULL,
  [cache_expiration] int NULL,
  [cache_data] ntext NULL
)
ON [PRIMARY]
GO

--
-- Definition for table customers : 
--

CREATE TABLE [dbo].[customers] (
  [customer_id] int IDENTITY PRIMARY KEY,
  [customer_name] nvarchar(50) NULL,
  [customer_phone] nvarchar(50) NULL,
  [customer_address] nvarchar(50) NULL,
  [customer_city] nvarchar(50) NULL,
  [customer_state] nvarchar(50) NULL,
  [customer_zip] nvarchar(50) NULL
)
ON [PRIMARY]
GO

--
-- Definition for table departments : 
--

CREATE TABLE [dbo].[departments] (
  [department_id] int IDENTITY PRIMARY KEY,
  [department_name] nvarchar(50) NULL,
  [department_manager_id] int NULL,
  [department_is_active] bit DEFAULT 1 NOT NULL
)
ON [PRIMARY]
GO

--
-- Definition for table emp_times : 
--

CREATE TABLE [dbo].[emp_times] (
  [emp_time_id] int IDENTITY PRIMARY KEY,
  [emp_id] int NULL,
  [emp_time_date] datetime NULL,
  [emp_time_in] datetime NULL,
  [emp_time_out] datetime NULL,
  [emp_time_in2] datetime NULL,
  [emp_time_out2] datetime NULL,
  [emp_time_total] float NULL,
  [emp_time_with_pay] float NULL,
  [emp_time_no_pay] float NULL,
  [absence_type_with_pay] smallint NULL,
  [absence_type_no_pay] smallint NULL
)
ON [PRIMARY]
GO

--
-- Definition for table groups : 
--

CREATE TABLE [dbo].[groups] (
  [group_id] int IDENTITY PRIMARY KEY,
  [group_name] nvarchar(50) NULL
)
ON [PRIMARY]
GO

--
-- Definition for table employees : 
--

CREATE TABLE [dbo].[employees] (
  [emp_id] int IDENTITY PRIMARY KEY,
  [emp_login] nvarchar(20) NULL,
  [emp_password] nvarchar(20) NULL,
  [emp_name] nvarchar(50) NULL,
  [title] nvarchar(50) NULL,
  [group_id] int NULL,
  [department_id] int NULL,
  [email] nvarchar(50) NULL,
  [picture] nvarchar(50) NULL,
  [phone_home] nvarchar(50) NULL,
  [phone_work] nvarchar(50) NULL,
  [phone_cell] nvarchar(50) NULL,
  [fax] nvarchar(50) NULL,
  [city] nvarchar(50) NULL,
  [zip] nvarchar(20) NULL,
  [address] nvarchar(50) NULL,
  [employee_is_active] bit DEFAULT 1 NOT NULL
)
ON [PRIMARY]
GO

--
-- Definition for table files : 
--

CREATE TABLE [dbo].[files] (
  [file_id] int IDENTITY PRIMARY KEY,
  [file_name] nvarchar(100) NULL,
  [file_owner_id] int NULL,
  [file_uploaded_by] int NULL,
  [file_date_uploaded] datetime NULL,
  [file_status] tinyint NULL
)
ON [PRIMARY]
GO

--
-- Definition for table menu : 
--

CREATE TABLE [dbo].[menu] (
  [menu_id] int IDENTITY PRIMARY KEY,
  [menu_name] nvarchar(50) NULL,
  [menu_id_parent] int NULL,
  [menu_link] nvarchar(50) NULL
)
ON [PRIMARY]
GO

--
-- Definition for table products : 
--

CREATE TABLE [dbo].[products] (
  [product_id] int IDENTITY PRIMARY KEY,
  [product_name] nvarchar(255) NOT NULL,
  [price] float NOT NULL
)
ON [PRIMARY]
GO

--
-- Definition for table orders : 
--

CREATE TABLE [dbo].[orders] (
  [order_id] int IDENTITY PRIMARY KEY,
  [order_customer_id] int NULL,
  [order_date] datetime NULL,
  [order_ship_address] nvarchar(50) NULL,
  [order_ship_city] nvarchar(50) NULL,
  [order_ship_state] nvarchar(50) NULL,
  [order_ship_zip] nvarchar(50) NULL
)
ON [PRIMARY]
GO

--
-- Definition for table order_items : 
--

CREATE TABLE [dbo].[order_items] (
  [order_item_id] int IDENTITY PRIMARY KEY,
  [order_id] int NOT NULL,
  [product_id] int NULL,
  [quantity] int NULL,
  [price] real NULL
)
ON [PRIMARY]
GO

--
-- Definition for table priorities : 
--

CREATE TABLE [dbo].[priorities] (
  [priority_id] int IDENTITY PRIMARY KEY,
  [priority_name] nvarchar(30) NULL
)
ON [PRIMARY]
GO

--
-- Definition for table projects : 
--

CREATE TABLE [dbo].[projects] (
  [project_id] int IDENTITY PRIMARY KEY,
  [project_name] nvarchar(50) NULL,
  [project_is_active] bit DEFAULT 1 NOT NULL
)
ON [PRIMARY]
GO

--
-- Definition for table projects_employees : 
--

CREATE TABLE [dbo].[projects_employees] (
  [project_id] int NOT NULL,
  [emp_id] int NOT NULL,
  [percent_allocation] float NULL,
  PRIMARY KEY (project_id, emp_id)
)
ON [PRIMARY]
GO

--
-- Definition for table types : 
--

CREATE TABLE [dbo].[types] (
  [type_id] int IDENTITY PRIMARY KEY,
  [type_name] nvarchar(50) NULL
)
ON [PRIMARY]
GO

--
-- Definition for table tasks : 
--

CREATE TABLE [dbo].[tasks] (
  [task_id] int IDENTITY PRIMARY KEY,
  [project_id] int NOT NULL,
  [priority_id] int NOT NULL,
  [status_id] int NOT NULL,
  [type_id] int NULL,
  [task_name] nvarchar(100) NULL,
  [task_desc] ntext NULL,
  [user_id_assign_by] int NULL,
  [user_id_assign_to] int NOT NULL,
  [task_start_date] datetime NULL,
  [task_finish_date] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table statuses : 
--

CREATE TABLE [dbo].[statuses] (
  [status_id] int IDENTITY PRIMARY KEY,
  [status_name] nvarchar(30) NULL
)
ON [PRIMARY]
GO

--
-- Definition for table user_events : 
--

CREATE TABLE [dbo].[user_events] (
  [user_event_id] int IDENTITY PRIMARY KEY,
  [priority_id] int NULL,
  [user_event_title] nvarchar(100) NULL,
  [user_event_date] datetime NULL,
  [user_event_time] datetime NULL,
  [user_event_desc] ntext NULL
)
ON [PRIMARY]
GO

--
-- Data for table dbo.absence_types  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[absence_types] ON
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (1, N'Business Trip', 1)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (2, N'Bereavement', 0)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (3, N'Comp Time', 0)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (4, N'Doctors Visit', 1)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (5, N'FMLA', 0)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (6, N'Holiday', 1)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (7, N'Illness', 0)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (8, N'Jury Duty', 0)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (9, N'Military Leave', 0)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (10, N'Personal Business', 0)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (11, N'Seminar', 1)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (12, N'Training', 1)
GO

INSERT INTO [dbo].[absence_types] ([absence_type_id], [absence_type_name], [absence_type_is_paid])
VALUES 
  (13, N'Vacation', 1)
GO

SET IDENTITY_INSERT [dbo].[absence_types] OFF
GO
--
-- Data for table dbo.customers  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[customers] ON
GO

INSERT INTO [dbo].[customers] ([customer_id], [customer_name], [customer_phone], [customer_address], [customer_city], [customer_state], [customer_zip])
VALUES 
  (1, N'ABC Inc.', NULL, N'2560 Broadway, Suite 100', N'Denver', N'Colorado', N'34574')
GO

INSERT INTO [dbo].[customers] ([customer_id], [customer_name], [customer_phone], [customer_address], [customer_city], [customer_state], [customer_zip])
VALUES 
  (2, N'Hard&Soft', NULL, N'35 Corey Way # 135', N'Atlanta', N'Georgia', N'46273')
GO

INSERT INTO [dbo].[customers] ([customer_id], [customer_name], [customer_phone], [customer_address], [customer_city], [customer_state], [customer_zip])
VALUES 
  (3, N'Online Services', NULL, N'226 A Westborough Blvd. #105', N'San Francisco', N'California', N'56789')
GO

INSERT INTO [dbo].[customers] ([customer_id], [customer_name], [customer_phone], [customer_address], [customer_city], [customer_state], [customer_zip])
VALUES 
  (4, N'Night and Day', NULL, N'125 South 12th Street', N'San Francisco', N'California', N'32456')
GO

SET IDENTITY_INSERT [dbo].[customers] OFF
GO

--
-- Data for table dbo.departments  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[departments] ON
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (1, N'C++ Development', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (2, N'Administration', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (3, N'Support', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (4, N'Finance', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (5, N'Web Development', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (6, N'Testing', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (7, N'Design', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (8, N'Documentation', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (9, N'Solutions Development', NULL, 1)
GO

INSERT INTO [dbo].[departments] ([department_id], [department_name], [department_manager_id], [department_is_active])
VALUES 
  (10, N'System Administration', NULL, 1)
GO

SET IDENTITY_INSERT [dbo].[departments] OFF
GO

--
-- Data for table dbo.emp_times  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[emp_times] ON
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (100, 2, '20050525', '18991230 08:31:00', '18991230 17:01:00', NULL, NULL, 8.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (101, 16, '20050525', '18991230 08:35:00', '18991230 12:30:00', '18991230 12:50:00', '18991230 19:10:00', 10.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (102, 20, '20050525', '18991230 07:10:00', '18991230 13:00:00', '18991230 13:15:00', '18991230 17:00:00', 9.58, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (103, 16, '20050526', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (104, 2, '20050526', '18991230 08:18:00', '18991230 18:05:00', '18991230 19:14:00', '18991230 20:33:00', 11.09, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (105, 20, '20050526', '18991230 06:45:00', NULL, NULL, '18991230 16:30:00', 9.75, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (106, 16, '20050527', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (107, 2, '20050527', '18991230 07:59:00', '18991230 18:14:00', '18991230 19:29:00', '18991230 21:00:00', 11.76, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (108, 20, '20050527', '18991230 06:20:00', NULL, NULL, '18991230 17:00:00', 10.66, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (109, 16, '20050530', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (110, 2, '20050530', '18991230 07:17:00', '18991230 18:47:00', NULL, NULL, 11.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (111, 20, '20050530', NULL, NULL, NULL, NULL, 0, 8, 0, 7, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (112, 16, '20050531', '18991230 08:45:00', '18991230 18:00:00', NULL, NULL, 9.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (113, 2, '20050531', '18991230 08:00:00', '18991230 18:20:00', NULL, NULL, 8.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (114, 20, '20050531', '18991230 06:00:00', '18991230 17:00:00', NULL, NULL, 11, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (115, 2, '20050601', '18991230 08:12:00', '18991230 11:20:00', '18991230 12:36:00', '18991230 20:40:00', 11.19, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (116, 20, '20050601', '18991230 06:30:00', '18991230 10:15:00', NULL, NULL, 3.75, 4.25, 0, 7, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (117, 16, '20050601', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (118, 16, '20050602', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (119, 2, '20050602', '18991230 07:59:00', '18991230 11:32:00', NULL, NULL, 3.54, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (120, 20, '20050602', '18991230 06:00:00', '18991230 11:00:00', '18991230 11:15:00', '18991230 16:30:00', 10.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (121, 16, '20050603', '18991230 07:00:00', NULL, NULL, '18991230 16:30:00', 9.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (122, 20, '20050603', '18991230 06:00:00', NULL, NULL, '18991230 17:30:00', 11.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (123, 2, '20050603', '18991230 07:45:00', '18991230 18:45:00', NULL, NULL, 9, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (124, 20, '20050606', '18991230 06:20:00', '18991230 14:00:00', '18991230 14:10:00', '18991230 16:30:00', 10, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (125, 16, '20050606', '18991230 08:35:00', '18991230 14:55:00', '18991230 15:25:00', '18991230 19:20:00', 10.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (126, 2, '20050606', '18991230 08:07:00', '18991230 18:14:00', '18991230 19:22:00', '18991230 21:02:00', 11.78, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (127, 16, '20050607', '18991230 08:35:00', '18991230 17:50:00', NULL, NULL, 9.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (128, 2, '20050607', '18991230 08:20:00', '18991230 18:11:00', '18991230 19:36:00', '18991230 21:25:00', 11.66, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (129, 20, '20050607', '18991230 07:10:00', '18991230 12:00:00', '18991230 12:10:00', '18991230 16:30:00', 9.16, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (130, 2, '20050608', '18991230 08:23:00', '18991230 18:45:00', '18991230 21:16:00', '18991230 22:00:00', 11.09, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (131, 16, '20050608', '18991230 08:25:00', '18991230 17:40:00', NULL, NULL, 9.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (132, 20, '20050608', '18991230 07:15:00', NULL, NULL, '18991230 16:45:00', 9.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (133, 2, '20050609', '18991230 07:57:00', '18991230 18:08:00', '18991230 19:32:00', '18991230 22:05:00', 12.73, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (134, 16, '20050609', '18991230 08:40:00', '18991230 12:55:00', '18991230 13:55:00', '18991230 18:40:00', 9, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (135, 20, '20050609', '18991230 06:10:00', '18991230 12:25:00', '18991230 12:40:00', '18991230 16:30:00', 10.08, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (136, 2, '20050610', '18991230 08:05:00', '18991230 11:30:00', NULL, NULL, 3.41, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (137, 16, '20050610', '18991230 08:35:00', '18991230 17:20:00', NULL, NULL, 8.75, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (138, 20, '20050610', '18991230 06:15:00', NULL, NULL, '18991230 16:45:00', 10.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (139, 2, '20050613', '18991230 08:03:00', '18991230 18:19:00', '18991230 20:04:00', '18991230 21:21:00', 11.54, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (140, 20, '20050613', '18991230 07:15:00', '18991230 12:20:00', '18991230 12:30:00', '18991230 16:30:00', 9.08, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (141, 16, '20050613', '18991230 09:20:00', '18991230 12:40:00', '18991230 13:40:00', '18991230 18:35:00', 8.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (142, 2, '20050614', '18991230 07:57:00', '18991230 19:00:00', NULL, NULL, 11.05, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (143, 16, '20050614', '18991230 08:15:00', '18991230 18:45:00', NULL, NULL, 10.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (144, 20, '20050614', '18991230 07:05:00', NULL, NULL, '18991230 17:00:00', 9.91, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (145, 20, '20050615', '18991230 07:00:00', '18991230 12:30:00', '18991230 12:45:00', '18991230 16:30:00', 9.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (146, 2, '20050615', '18991230 08:04:00', '18991230 20:34:00', NULL, NULL, 12.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (147, 16, '20050615', '18991230 08:45:00', '18991230 13:15:00', '18991230 14:00:00', '18991230 18:30:00', 9, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (148, 20, '20050616', '18991230 07:00:00', NULL, NULL, '18991230 16:30:00', 9.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (149, 16, '20050616', '18991230 08:35:00', '18991230 11:30:00', '18991230 12:30:00', '18991230 14:05:00', 4.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (150, 2, '20050616', '18991230 07:30:00', '18991230 11:31:00', NULL, NULL, 4.01, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (151, 20, '20050617', '18991230 07:15:00', '18991230 12:35:00', '18991230 12:50:00', '18991230 17:00:00', 9.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (152, 16, '20050617', '18991230 12:00:00', '18991230 20:15:00', NULL, NULL, 8.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (153, 2, '20050617', '18991230 16:48:00', '18991230 18:28:00', '18991230 20:14:00', '18991230 21:40:00', 3.09, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (154, 16, '20050620', '18991230 08:45:00', '18991230 18:00:00', NULL, NULL, 9.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (155, 20, '20050620', '18991230 07:15:00', NULL, NULL, '18991230 18:00:00', 10.75, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (156, 2, '20050620', '18991230 07:47:00', '18991230 18:06:00', '18991230 18:53:00', '18991230 21:48:00', 13.23, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (157, 16, '20050621', '18991230 08:40:00', '18991230 18:40:00', NULL, NULL, 10, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (158, 2, '20050621', '18991230 08:08:00', '18991230 18:45:00', '18991230 21:28:00', '18991230 22:07:00', 11.26, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (159, 20, '20050621', '18991230 07:00:00', NULL, NULL, '18991230 16:30:00', 9.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (160, 16, '20050622', NULL, NULL, NULL, NULL, 0, 7, 0, 1, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (161, 2, '20050622', '18991230 07:25:00', '18991230 18:05:00', '18991230 19:14:00', '18991230 21:21:00', 12.78, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (162, 20, '20050622', '18991230 07:00:00', NULL, NULL, '18991230 11:00:00', 4, 4, 0, 3, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (163, 16, '20050623', '18991230 09:00:00', '18991230 14:15:00', NULL, NULL, 5.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (164, 2, '20050623', '18991230 07:28:00', '18991230 11:29:00', NULL, NULL, 4.01, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (165, 20, '20050623', NULL, NULL, NULL, NULL, 0, 8, 0, 1, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (166, 2, '20050624', '18991230 08:14:00', '18991230 18:10:00', '18991230 19:22:00', '18991230 21:08:00', 11.7, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (167, 20, '20050624', '18991230 07:15:00', NULL, NULL, '18991230 16:30:00', 9.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (168, 16, '20050624', '18991230 08:40:00', '18991230 12:25:00', '18991230 13:35:00', '18991230 18:20:00', 8.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (169, 2, '20050625', '18991230 18:44:00', '18991230 21:44:00', NULL, NULL, 3, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (170, 20, '20050627', '18991230 07:00:00', NULL, NULL, '18991230 16:30:00', 9.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (171, 2, '20050627', NULL, NULL, NULL, NULL, 16, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (172, 16, '20050627', '18991230 08:20:00', '18991230 18:20:00', NULL, NULL, 10, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (173, 2, '20050628', NULL, NULL, NULL, NULL, 10.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (174, 20, '20050628', '18991230 07:10:00', NULL, NULL, '18991230 15:30:00', 8.33, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (175, 16, '20050628', '18991230 08:35:00', '18991230 17:35:00', NULL, NULL, 9, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (176, 2, '20050629', NULL, NULL, NULL, NULL, 7.75, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (178, 20, '20050629', '18991230 07:00:00', NULL, NULL, '18991230 16:30:00', 9.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (179, 16, '20050629', '18991230 08:40:00', '18991230 13:40:00', '18991230 13:55:00', '18991230 18:10:00', 9.25, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (180, 2, '20050630', '18991230 07:22:00', '18991230 11:31:00', NULL, NULL, 4.15, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (181, 16, '20050630', '18991230 08:35:00', '18991230 14:05:00', NULL, NULL, 5.5, 0, 0, NULL, NULL)
GO

INSERT INTO [dbo].[emp_times] ([emp_time_id], [emp_id], [emp_time_date], [emp_time_in], [emp_time_out], [emp_time_in2], [emp_time_out2], [emp_time_total], [emp_time_with_pay], [emp_time_no_pay], [absence_type_with_pay], [absence_type_no_pay])
VALUES 
  (182, 20, '20050630', '18991230 07:10:00', '18991230 16:30:00', NULL, NULL, 9.33, 0, 0, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[emp_times] OFF
GO

--
-- Data for table dbo.employees  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[employees] ON
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (1, N'helen', N'helen', N'Helen Deering', N'Support', 1, 3, N'helen@company.com', N'images/photos/Helen Deering.jpg', N'(364) 134-5455', N'(364) 134-5455', N'(960) 393-3466', NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (2, N'alexander', N'alexander', N'Alexander Atkinson', N'Developer', 1, 1, N'alexander@company.com', N'images/photos/Alexander Atkinson.jpg', N'(364) 354-2646', N'(364) 134-5456', N'(730) 643-4397', NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (3, N'ken', N'ken', N'Ken Price', N'Developer', 1, 1, N'ken@company.com', N'images/photos/Ken Price.jpg', N'(264) 823-2367', N'(364) 134-5456', N'(960) 423-3466', NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (4, N'peter', N'peter', N'Peter Larsen', N'Tester', 1, 6, N'peter@company.com', N'images/photos/Peter Larsen.jpg', N'(764) 662-2367', N'(364) 134-5459', NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (5, N'ignace', N'ignace', N'Ignace Shaw', N'Developer', 1, 5, N'ignace@company.com', N'images/photos/Ignace Shaw.jpg', N'(564) 343-3367', N'(364) 134-5411', NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (6, N'george', N'george', N'George Pennington', N'Developer', 1, 1, N'george@company.com', N'images/photos/George Pennington.jpg', N'(364) 345-5267', N'(364) 134-5413', NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (7, N'andrew', N'andrew', N'Andrew Scott', N'Developer', 1, 1, N'andrew@company.com', N'images/photos/Andrew Scott.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (8, N'serge', N'serge', N'Serge Richards', N'Quality Assurance', 1, 6, N'serge@company.com', N'images/photos/Serge Richards.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (9, N'victor', N'victor', N'Victor Tomlin', N'Developer', 1, 5, N'victor@company.com', N'images/photos/Victor Tomlin.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (10, N'arledge', N'arledge', N'Arledge Archer', N'Technical Writer', 1, 8, N'arledge@company.com', N'images/photos/Arledge Archer.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (11, N'vlad', N'vlad', N'Vlad Young', N'Developer', 1, 1, N'vlad@company.com', N'images/photos/Vlad Young.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (12, N'alexz', N'alexz', N'Alex Zanuck', N'Developer', 1, 9, N'alexz@company.com', N'images/photos/Alex Zanuck.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (13, N'dennis', N'dennis', N'Dennis Mansfield', N'Tester', 1, 6, N'dennis@company.com', N'images/photos/Dennis Mansfield.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (14, N'michael', N'michael', N'Michael Koenig', N'Developer', 1, 5, N'michael@company.com', N'images/photos/Michael Koenig.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (15, N'nick', N'nick', N'Nick Bergman', N'Developer', 1, 1, N'nick@company.com', N'images/photos/Nick Bergman.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (16, N'alex', N'alex', N'Alex Antion', N'Support', 1, 3, N'alex@company.com', N'images/photos/Alex Antion.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (17, N'conrad', N'conrad', N'Conrad Murphy', N'CEO', 1, 2, N'conrad@company.com', N'images/photos/Conrad Murphy.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (18, N'vance', N'vance', N'Vance Cole', N'Corporate Development', 1, 2, N'vance@company.com', N'images/photos/Vance Cole.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (19, N'vitas', N'vitas', N'Vitas Reynolds', N'Developer', 1, 5, N'vitas@company.com', N'images/photos/Vitas Reynolds.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (20, N'alexg', N'alexg', N'Alex Groth', N'Designer', 1, 7, N'alexg@company.com', N'images/photos/Alex Groth.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (21, N'michaelb', N'michaelb', N'Michael Barrett', N'Tester', 1, 6, N'michaelb@company.com', N'images/photos/Michael Barrett.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (22, N'ian', N'ian', N'Ian Gordon', N'Developer', 1, 1, N'ian@company.com', N'images/photos/Ian Gordon.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (23, N'alexzi', N'alexzi', N'Alex Zimb', N'Quality Assurance', 1, 6, N'alexzi@company.com', N'images/photos/Alex Zimb.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (24, N'alexandern', N'alexandern', N'Alexander Neville', N'Web Development Manager', 1, 5, N'alexandern@company.com', N'images/photos/Alexander Neville.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (25, N'eugene', N'eugene', N'Eugene Zubler', N'C++ Development Manager', 1, 1, N'eugene@company.com', N'images/photos/Eugene Zubler.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (26, N'oleg', N'oleg', N'Oleg Douglas', N'CTO', 1, 2, N'oleg@company.com', N'images/photos/Oleg Douglas.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (27, N'irina', N'irian', N'Irina Douglas', N'Accountant', 1, 4, N'irina@company.com', N'images/photos/Irina Douglas.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (28, N'helenp', N'helenp', N'Helen Palmer', N'Accountant', 1, 4, N'helenp@company.com', N'images/photos/Helen Palmer.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (29, N'stan', N'stan', N'Stan Simon', N'Developer', 1, 5, N'stan@company.com', N'images/photos/Stan Simon.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (30, N'alexk', N'alexk', N'Alex Knievel', N'Developer', 1, 5, N'alexk@company.com', N'images/photos/Alex Knievel.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (31, N'arty', N'arty', N'Arty Blake', N'Developer', 1, 5, N'arty@company.com', N'images/photos/Arty Blake.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (32, N'admin', N'admin', N'George Randall', N'NT Administrator', 2, 10, N'georger@company.com', N'images/photos/George Randall.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (33, N'olegt', N'olegt', N'Oleg Tim', N'Developer', 1, 5, N'olegt@company.com', N'images/photos/Oleg Tim.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

INSERT INTO [dbo].[employees] ([emp_id], [emp_login], [emp_password], [emp_name], [title], [group_id], [department_id], [email], [picture], [phone_home], [phone_work], [phone_cell], [fax], [city], [zip], [address], [employee_is_active])
VALUES 
  (34, N'stank', N'stank', N'Stan Knight', N'UNIX Administrator', 2, 10, N'stank@company.com', N'images/nophoto.gif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO

SET IDENTITY_INSERT [dbo].[employees] OFF
GO

--
-- Data for table dbo.groups  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[groups] ON
GO

INSERT INTO [dbo].[groups] ([group_id], [group_name])
VALUES 
  (1, N'User')
GO

INSERT INTO [dbo].[groups] ([group_id], [group_name])
VALUES 
  (2, N'Admin')
GO

SET IDENTITY_INSERT [dbo].[groups] OFF
GO

--
-- Data for table dbo.menu  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[menu] ON
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (1, N'Products', NULL, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (2, N'Downloads', NULL, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (3, N'Support', NULL, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (4, N'Purchase', NULL, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (5, N'Company', NULL, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (6, N'All', 1, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (7, N'CodeCharge', 1, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (8, N'CodeCharge Studio', 1, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (9, N'DemoCharge Studio', 1, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (10, N'Comparison', 1, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (11, N'CodeCharge Studio', 10, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (12, N'DemoCharge Studio', 10, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (13, N'CodeCharge', 2, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (14, N'CodeCharge Studio', 2, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (15, N'DemoCharge Studio', 2, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (16, N'Support', 3, N'http://support.yessoftware.com')
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (17, N'Forums', 3, N'http://forums.codecharge.com')
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (18, N'KB', 3, N'http://support.yessoftware.com/kb_search.asp')
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (19, N'Store', 4, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (20, N'Resellers', 4, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (21, N'Affiliate', 4, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (22, N'About Us', 5, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (23, N'Contact Us', 5, NULL)
GO

INSERT INTO [dbo].[menu] ([menu_id], [menu_name], [menu_id_parent], [menu_link])
VALUES 
  (24, N'Press Releases', 5, NULL)
GO

SET IDENTITY_INSERT [dbo].[menu] OFF
GO

--
-- Data for table dbo.orders  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[orders] ON
GO

INSERT INTO [dbo].[orders] ([order_id], [order_customer_id], [order_date], [order_ship_address], [order_ship_city], [order_ship_state], [order_ship_zip])
VALUES 
  (1, 1, '20030110', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[orders] ([order_id], [order_customer_id], [order_date], [order_ship_address], [order_ship_city], [order_ship_state], [order_ship_zip])
VALUES 
  (2, 2, '20030114', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[orders] ([order_id], [order_customer_id], [order_date], [order_ship_address], [order_ship_city], [order_ship_state], [order_ship_zip])
VALUES 
  (3, 3, '20030116', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[orders] ([order_id], [order_customer_id], [order_date], [order_ship_address], [order_ship_city], [order_ship_state], [order_ship_zip])
VALUES 
  (4, 1, '20030122', NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[orders] OFF
GO

--
-- Data for table dbo.priorities  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[priorities] ON
GO

INSERT INTO [dbo].[priorities] ([priority_id], [priority_name])
VALUES 
  (1, N'Highest')
GO

INSERT INTO [dbo].[priorities] ([priority_id], [priority_name])
VALUES 
  (2, N'High')
GO

INSERT INTO [dbo].[priorities] ([priority_id], [priority_name])
VALUES 
  (3, N'Normal')
GO

INSERT INTO [dbo].[priorities] ([priority_id], [priority_name])
VALUES 
  (4, N'Low')
GO

INSERT INTO [dbo].[priorities] ([priority_id], [priority_name])
VALUES 
  (5, N'Lowest')
GO

SET IDENTITY_INSERT [dbo].[priorities] OFF
GO

--
-- Data for table dbo.products  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[products] ON
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (1, N'Web Database Development', 39.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (2, N'Programming Perl', 39.96)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (3, N'Perl and CGI for the WWW', 15.19)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (4, N'MySQL', 39.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (5, N'PHP and MySQL Web Development', 39.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (6, N'MySQL & PHP From Scratch', 23.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (7, N'MySQL and mSQL', 27.96)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (8, N'Flash 4 Magic', 36)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (9, N'Web Application Development with PHP 4.0', 36)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (10, N'Beginning ASP Databases', 39.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (11, N'Oracle8i Web Development', 41.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (12, N'Black Belt Web Programming Methods', 27.96)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (13, N'Web Development with Java Server Pages', 35.96)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (14, N'Professional JSP J2EE Edition', 47.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (15, N'Mastering ColdFusion 4.5', 39.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (16, N'Teach Yourself ColdFusion in 21 Days', 31.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (17, N'ColdFusion Fast & Easy Web Development', 19.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (18, N'Beginning Active Server Pages 3.0', 31.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (19, N'Web Design in a Nutshell', 23.96)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (20, N'HTML 4 for the WWW Visual Quickstart Guide', 15.99)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (21, N'1001 Web Site Construction Tips and Tricks', 39.95)
GO

INSERT INTO [dbo].[products] ([product_id], [product_name], [price])
VALUES 
  (22, N'C# - Programming with the Public Beta', 34.99)
GO

SET IDENTITY_INSERT [dbo].[products] OFF
GO

--
-- Data for table dbo.projects  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[projects] ON
GO

INSERT INTO [dbo].[projects] ([project_id], [project_name], [project_is_active])
VALUES 
  (1, N'CodeCharge', 1)
GO

INSERT INTO [dbo].[projects] ([project_id], [project_name], [project_is_active])
VALUES 
  (2, N'My Project', 1)
GO

INSERT INTO [dbo].[projects] ([project_id], [project_name], [project_is_active])
VALUES 
  (3, N'Test Project', 1)
GO

INSERT INTO [dbo].[projects] ([project_id], [project_name], [project_is_active])
VALUES 
  (4, N'Great Project', 1)
GO

INSERT INTO [dbo].[projects] ([project_id], [project_name], [project_is_active])
VALUES 
  (5, N'Super Project', 1)
GO

SET IDENTITY_INSERT [dbo].[projects] OFF
GO

--
-- Data for table dbo.projects_employees  (LIMIT 0,500)
--

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (1, 1, 30)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (1, 7, 45)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (1, 8, 50)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (1, 24, 15)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (2, 1, 40)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (2, 2, 70)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (2, 3, 50)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (2, 8, 20)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (2, 24, 25)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (3, 1, 30)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (3, 8, 15)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (3, 24, 55)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (4, 2, 30)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (4, 7, 55)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (4, 8, 10)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (5, 8, 5)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (5, 15, 100)
GO

INSERT INTO [dbo].[projects_employees] ([project_id], [emp_id], [percent_allocation])
VALUES 
  (5, 24, 5)
GO

--
-- Data for table dbo.statuses  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[statuses] ON
GO

INSERT INTO [dbo].[statuses] ([status_id], [status_name])
VALUES 
  (1, N'Open')
GO

INSERT INTO [dbo].[statuses] ([status_id], [status_name])
VALUES 
  (2, N'On hold')
GO

INSERT INTO [dbo].[statuses] ([status_id], [status_name])
VALUES 
  (3, N'Closed')
GO

INSERT INTO [dbo].[statuses] ([status_id], [status_name])
VALUES 
  (4, N'In progress')
GO

SET IDENTITY_INSERT [dbo].[statuses] OFF
GO

--
-- Data for table dbo.tasks  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[tasks] ON
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (1, 1, 2, 2, 3, N'Great Project needs to be greater', N'Mission Impossible? Get CodeCharge.', 3, 1, '20030201', '20030202')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (2, 1, 1, 3, 4, N'Fix ALL bugs', N'Staying up at night coding? Get CodeCharge, go home, get rest.', 3, 6, '20030202', '20030203')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (3, 1, 2, 3, 1, N'Get ready to click', N'Write CODE by pointing and clicking.
Write CODE by pointing and clicking. Or clicking and pointing. Or clicking and clicking.', 3, 4, '20030203', '20030204')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (4, 2, 1, 1, 1, N'Finish My Project', N'Verify Zip Code and other possible errors in XML files. Display full list of errors to the user and "status=error" hidden in HTML.', 3, 5, '20030204', '20030205')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (5, 3, 2, 4, 1, N'Test this project.', N'Programmoholic? Get Help. Get CodeCharge.', 3, 3, '20030205', '20030206')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (6, 1, 1, 1, 1, N'Code with one hand.', N'Why code with TWO HANDS, when you can do it faster with ONE.', 3, 2, '20030206', '20030207')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (7, 3, 1, 2, 1, N'Get armed', N'Low on ammunition? Get armed. Get CodeCharge.', 3, 1, '20030207', '20030208')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (8, 3, 1, 1, 4, N'Write more code', N'To code or not to code, that is the question', 3, 5, '20030208', '20030209')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (9, 5, 1, 4, 1, N'Code, code, code…', N'CODE. CODE. CODE. CODE. MORE CODE.', 3, 6, '20030209', '20030210')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (10, 3, 5, 2, 1, N'Sleep', N'Stop coding. Charge your code. Get Sleep.', 3, 3, '20030210', '20030211')
GO

INSERT INTO [dbo].[tasks] ([task_id], [project_id], [priority_id], [status_id], [type_id], [task_name], [task_desc], [user_id_assign_by], [user_id_assign_to], [task_start_date], [task_finish_date])
VALUES 
  (11, 5, 1, 1, 1, N'Have fun', N'Bored with your programming job? Get CodeCharge. Have Fun.', 3, 2, '20030211', '20030212')
GO

SET IDENTITY_INSERT [dbo].[tasks] OFF
GO

--
-- Data for table dbo.types  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[types] ON
GO

INSERT INTO [dbo].[types] ([type_id], [type_name])
VALUES 
  (1, N'Task')
GO

INSERT INTO [dbo].[types] ([type_id], [type_name])
VALUES 
  (2, N'Bug')
GO

INSERT INTO [dbo].[types] ([type_id], [type_name])
VALUES 
  (3, N'Issue')
GO

INSERT INTO [dbo].[types] ([type_id], [type_name])
VALUES 
  (4, N'Question')
GO

SET IDENTITY_INSERT [dbo].[types] OFF
GO

--
-- Data for table dbo.user_events  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[user_events] ON
GO

INSERT INTO [dbo].[user_events] ([user_event_id], [priority_id], [user_event_title], [user_event_date], [user_event_time], [user_event_desc])
VALUES 
  (1, 3, N'Staff Briefing', '20051120', '18991230 10:00:00', N'Briefing in the Conference Hall for the staff')
GO

INSERT INTO [dbo].[user_events] ([user_event_id], [priority_id], [user_event_title], [user_event_date], [user_event_time], [user_event_desc])
VALUES 
  (2, 3, N'Discussion on New Features', '20051120', '18991230 14:00:00', N'Managers responsible for new features should be present')
GO

INSERT INTO [dbo].[user_events] ([user_event_id], [priority_id], [user_event_title], [user_event_date], [user_event_time], [user_event_desc])
VALUES 
  (3, 3, N'Staff Briefing', '20051126', '18991230 10:00:00', N'Briefing in the Conference Hall for the staff')
GO

INSERT INTO [dbo].[user_events] ([user_event_id], [priority_id], [user_event_title], [user_event_date], [user_event_time], [user_event_desc])
VALUES 
  (4, 3, N'Result Discussion', '20051207', '18991230 16:00:00', N'Meeting to discuss results and the future plan for the Project')
GO

INSERT INTO [dbo].[user_events] ([user_event_id], [priority_id], [user_event_title], [user_event_date], [user_event_time], [user_event_desc])
VALUES 
  (5, 3, N'Staff Briefing', '20051218', '18991230 09:00:00', N'Briefing in the Conference Hall for the staff')
GO

INSERT INTO [dbo].[user_events] ([user_event_id], [priority_id], [user_event_title], [user_event_date], [user_event_time], [user_event_desc])
VALUES 
  (6, 3, N'Discussion on New Features', '20051218', '18991230 14:00:00', N'Managers responsible for new features should be present')
GO

INSERT INTO [dbo].[user_events] ([user_event_id], [priority_id], [user_event_title], [user_event_date], [user_event_time], [user_event_desc])
VALUES 
  (7, 3, N'Staff Briefing', '20051224', '18991230 10:00:00', N'Briefing in the Conference Hall for the staff')
GO

SET IDENTITY_INSERT [dbo].[user_events] OFF
GO

--
-- Definition for foreign keys : 
--

ALTER TABLE [dbo].[employees]
ADD CONSTRAINT [employees_fk] FOREIGN KEY ([group_id]) 
  REFERENCES [dbo].[groups] ([group_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[employees]
ADD CONSTRAINT [employees_fk2] FOREIGN KEY ([department_id]) 
  REFERENCES [dbo].[departments] ([department_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[orders]
ADD CONSTRAINT [orders_fk] FOREIGN KEY ([order_customer_id]) 
  REFERENCES [dbo].[customers] ([customer_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[order_items]
ADD CONSTRAINT [order_items_fk] FOREIGN KEY ([order_id]) 
  REFERENCES [dbo].[orders] ([order_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[order_items]
ADD CONSTRAINT [order_items_fk2] FOREIGN KEY ([product_id]) 
  REFERENCES [dbo].[products] ([product_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[projects_employees]
ADD CONSTRAINT [projects_employees_fk] FOREIGN KEY ([emp_id]) 
  REFERENCES [dbo].[employees] ([emp_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[projects_employees]
ADD CONSTRAINT [projects_employees_fk2] FOREIGN KEY ([project_id]) 
  REFERENCES [dbo].[projects] ([project_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tasks]
ADD CONSTRAINT [tasks_fk] FOREIGN KEY ([user_id_assign_to]) 
  REFERENCES [dbo].[employees] ([emp_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tasks]
ADD CONSTRAINT [tasks_fk2] FOREIGN KEY ([user_id_assign_by]) 
  REFERENCES [dbo].[employees] ([emp_id]) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[tasks]
ADD CONSTRAINT [tasks_fk3] FOREIGN KEY ([project_id]) 
  REFERENCES [dbo].[projects] ([project_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tasks]
ADD CONSTRAINT [tasks_fk4] FOREIGN KEY ([type_id]) 
  REFERENCES [dbo].[types] ([type_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tasks]
ADD CONSTRAINT [tasks_fk5] FOREIGN KEY ([status_id]) 
  REFERENCES [dbo].[statuses] ([status_id]) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[tasks]
ADD CONSTRAINT [tasks_fk6] FOREIGN KEY ([priority_id]) 
  REFERENCES [dbo].[priorities] ([priority_id]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
GO
