-- basic-linux-mysql-php 
-- Mostly  CodeCharge Studio 5.x schema examples 
-- version 1.0
--
-- CREATE DATABASE
--

CREATE DATABASE IF NOT EXISTS demo-ccs;
USE demo-ccs;

-- 
-- DROP TABLES
--

DROP TABLE IF EXISTS user_events;
DROP TABLE IF EXISTS emp_times;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS projects_employees;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS priorities;
DROP TABLE IF EXISTS statuses;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS absence_types;
DROP TABLE IF EXISTS cache;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS files;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS types;

--
-- CREATE TABLES
--

-- Table structure for table `absence_types`
CREATE TABLE `absence_types` (
  `absence_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `absence_type_name` varchar(50) DEFAULT NULL,
  `absence_type_is_paid` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`absence_type_id`),
  KEY `Time_Off_ID` (`absence_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Table structure for table `cache`
CREATE TABLE `cache` (
  `cache_key` varchar(65) DEFAULT NULL,
  `cache_expiration` int(11) DEFAULT '0',
  `cache_data` longtext,
  KEY `key` (`cache_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `customers`
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_state` varchar(50) DEFAULT NULL,
  `customer_zip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `user_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Table structure for table `departments`
CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `department_manager_id` int(11) DEFAULT NULL,
  `department_is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`department_id`),
  KEY `dep_id` (`department_id`),
  KEY `department_manager_id` (`department_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Table structure for table `emp_times`
CREATE TABLE `emp_times` (
  `emp_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT '0',
  `emp_time_date` datetime DEFAULT NULL,
  `emp_time_in` datetime DEFAULT NULL,
  `emp_time_out` datetime DEFAULT NULL,
  `emp_time_in2` datetime DEFAULT NULL,
  `emp_time_out2` datetime DEFAULT NULL,
  `emp_time_total` double DEFAULT '0',
  `emp_time_with_pay` double DEFAULT '0',
  `emp_time_no_pay` double DEFAULT '0',
  `absence_type_with_pay` smallint(6) DEFAULT NULL,
  `absence_type_no_pay` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`emp_time_id`),
  KEY `CODE-ABSENT` (`absence_type_no_pay`),
  KEY `CODE-ABSENT-WITH-PAY` (`absence_type_with_pay`),
  KEY `RECXORD-ID` (`emp_time_id`),
  KEY `RESOURCE-ID` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- Table structure for table `groups`
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `groupy_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `employees`
CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_login` varchar(20) DEFAULT NULL,
  `emp_password` varchar(20) DEFAULT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT '@company.com',
  `picture` varchar(50) DEFAULT 'images/photos/',
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_cell` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `employee_is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_login` (`emp_login`),
  KEY `department_id` (`department_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `employees_fk2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `employees_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Table structure for table `files`
CREATE TABLE `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL,
  `file_owner_id` int(11) DEFAULT '0',
  `file_uploaded_by` int(11) DEFAULT '0',
  `file_date_uploaded` datetime DEFAULT NULL,
  `file_status` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `file_id` (`file_id`),
  KEY `issue_id` (`file_owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `menu`
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_id_parent` int(11) DEFAULT NULL,
  `menu_link` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `category_id_parent` (`menu_id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Table structure for table `orders`
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_customer_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_ship_address` varchar(50) DEFAULT NULL,
  `order_ship_city` varchar(50) DEFAULT NULL,
  `order_ship_state` varchar(50) DEFAULT NULL,
  `order_ship_zip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`order_customer_id`),
  KEY `Order_ID` (`order_id`),
  CONSTRAINT `orders_fk` FOREIGN KEY (`order_customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Table structure for table `products`
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Table structure for table `order_items`
CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  `price` double DEFAULT '0',
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_fk2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `priorities`
CREATE TABLE `priorities` (
  `priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `priority_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`priority_id`),
  KEY `priority_id` (`priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Table structure for table `projects`
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) DEFAULT NULL,
  `project_is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`project_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Table structure for table `projects_employees`
CREATE TABLE `projects_employees` (
  `project_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `percent_allocation` double DEFAULT NULL,
  PRIMARY KEY (`project_id`,`emp_id`),
  KEY `employee_id` (`emp_id`),
  KEY `manager_id` (`project_id`),
  CONSTRAINT `projects_employees_fk2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_employees_fk` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `statuses`
CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Table structure for table `types`
CREATE TABLE `types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Table structure for table `tasks`
CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `priority_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) DEFAULT NULL,
  `task_name` varchar(100) DEFAULT NULL,
  `task_desc` longtext,
  `user_id_assign_by` int(11) DEFAULT '0',
  `user_id_assign_to` int(11) NOT NULL DEFAULT '0',
  `task_start_date` datetime DEFAULT NULL,
  `task_finish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `priority_id` (`priority_id`),
  KEY `project_id` (`project_id`),
  KEY `task_id` (`task_id`),
  KEY `tasksstatus_id` (`status_id`),
  KEY `user_id_assign_by` (`user_id_assign_by`),
  KEY `user_id_assign_to` (`user_id_assign_to`),
  KEY `tasks_fk4` (`type_id`),
  CONSTRAINT `tasks_fk` FOREIGN KEY (`user_id_assign_to`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_fk2` FOREIGN KEY (`user_id_assign_by`) REFERENCES `employees` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tasks_fk3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_fk4` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_fk5` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tasks_fk6` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`priority_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Table structure for table `user_events`
CREATE TABLE `user_events` (
  `user_event_id` int(11) NOT NULL AUTO_INCREMENT,
  `priority_id` int(11) DEFAULT '0',
  `user_event_title` varchar(100) DEFAULT NULL,
  `user_event_date` datetime DEFAULT NULL,
  `user_event_time` datetime DEFAULT NULL,
  `user_event_desc` longtext,
  PRIMARY KEY (`user_event_id`),
  KEY `priority_id` (`priority_id`),
  KEY `user_id` (`user_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- TABLE INSERT STATEMENTS
--

-- Dumping data for table `absence_types`
INSERT INTO `absence_types` (`absence_type_id`, `absence_type_name`, `absence_type_is_paid`) VALUES 
  (1,'Business Trip',1),
  (2,'Bereavement',0),
  (3,'Comp Time',0),
  (4,'Doctors Visit',1),
  (5,'FMLA',0),
  (6,'Holiday',1),
  (7,'Illness',0),
  (8,'Jury Duty',0),
  (9,'Military Leave',0),
  (10,'Personal Business',0),
  (11,'Seminar',1),
  (12,'Training',1),
  (13,'Vacation',1);
COMMIT;

-- Dumping data for table `customers`
INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_address`, `customer_city`, `customer_state`, `customer_zip`) VALUES 
  (1,'ABC Inc.',NULL,'2560 Broadway, Suite 100','Denver','Colorado','34574'),
  (2,'Hard&Soft',NULL,'35 Corey Way # 135','Atlanta','Georgia','46273'),
  (3,'Online Services',NULL,'226 A Westborough Blvd. #105','San Francisco','California','56789'),
  (4,'Night and Day',NULL,'125 South 12th Street','San Francisco','California','32456');
COMMIT;

-- Dumping data for table `departments`
INSERT INTO `departments` (`department_id`, `department_name`, `department_manager_id`, `department_is_active`) VALUES 
  (1,'C++ Development',NULL,1),
  (2,'Administration',NULL,1),
  (3,'Support',NULL,1),
  (4,'Finance',NULL,1),
  (5,'Web Development',NULL,1),
  (6,'Testing',NULL,1),
  (7,'Design',NULL,1),
  (8,'Documentation',NULL,1),
  (9,'Solutions Development',NULL,1),
  (10,'System Administration',NULL,1);
COMMIT;

-- Dumping data for table `emp_times`
INSERT INTO `emp_times` (`emp_time_id`, `emp_id`, `emp_time_date`, `emp_time_in`, `emp_time_out`, `emp_time_in2`, `emp_time_out2`, `emp_time_total`, `emp_time_with_pay`, `emp_time_no_pay`, `absence_type_with_pay`, `absence_type_no_pay`) VALUES 
  (100,2,'2005-05-25 00:00:00','1899-12-30 08:31:00','1899-12-30 17:01:00',NULL,NULL,8.5,0,0,NULL,NULL),
  (101,16,'2005-05-25 00:00:00','1899-12-30 08:35:00','1899-12-30 12:30:00','1899-12-30 12:50:00','1899-12-30 19:10:00',10.25,0,0,NULL,NULL),
  (102,20,'2005-05-25 00:00:00','1899-12-30 07:10:00','1899-12-30 13:00:00','1899-12-30 13:15:00','1899-12-30 17:00:00',9.58,0,0,NULL,NULL),
  (103,16,'2005-05-26 00:00:00',NULL,NULL,NULL,NULL,0,8,0,1,NULL),
  (104,2,'2005-05-26 00:00:00','1899-12-30 08:18:00','1899-12-30 18:05:00','1899-12-30 19:14:00','1899-12-30 20:33:00',11.09,0,0,NULL,NULL),
  (105,20,'2005-05-26 00:00:00','1899-12-30 06:45:00',NULL,NULL,'1899-12-30 16:30:00',9.75,0,0,NULL,NULL),
  (106,16,'2005-05-27 00:00:00',NULL,NULL,NULL,NULL,0,8,0,1,NULL),
  (107,2,'2005-05-27 00:00:00','1899-12-30 07:59:00','1899-12-30 18:14:00','1899-12-30 19:29:00','1899-12-30 21:00:00',11.76,0,0,NULL,NULL),
  (108,20,'2005-05-27 00:00:00','1899-12-30 06:20:00',NULL,NULL,'1899-12-30 17:00:00',10.66,0,0,NULL,NULL),
  (109,16,'2005-05-30 00:00:00',NULL,NULL,NULL,NULL,0,8,0,1,NULL),
  (110,2,'2005-05-30 00:00:00','1899-12-30 07:17:00','1899-12-30 18:47:00',NULL,NULL,11.5,0,0,NULL,NULL),
  (111,20,'2005-05-30 00:00:00',NULL,NULL,NULL,NULL,0,8,0,7,NULL),
  (112,16,'2005-05-31 00:00:00','1899-12-30 08:45:00','1899-12-30 18:00:00',NULL,NULL,9.25,0,0,NULL,NULL),
  (113,2,'2005-05-31 00:00:00','1899-12-30 08:00:00','1899-12-30 18:20:00',NULL,NULL,8.25,0,0,NULL,NULL),
  (114,20,'2005-05-31 00:00:00','1899-12-30 06:00:00','1899-12-30 17:00:00',NULL,NULL,11,0,0,NULL,NULL),
  (115,2,'2005-06-01 00:00:00','1899-12-30 08:12:00','1899-12-30 11:20:00','1899-12-30 12:36:00','1899-12-30 20:40:00',11.19,0,0,NULL,NULL),
  (116,20,'2005-06-01 00:00:00','1899-12-30 06:30:00','1899-12-30 10:15:00',NULL,NULL,3.75,4.25,0,7,NULL),
  (117,16,'2005-06-01 00:00:00',NULL,NULL,NULL,NULL,0,8,0,1,NULL),
  (118,16,'2005-06-02 00:00:00',NULL,NULL,NULL,NULL,0,8,0,1,NULL),
  (119,2,'2005-06-02 00:00:00','1899-12-30 07:59:00','1899-12-30 11:32:00',NULL,NULL,3.54,0,0,NULL,NULL),
  (120,20,'2005-06-02 00:00:00','1899-12-30 06:00:00','1899-12-30 11:00:00','1899-12-30 11:15:00','1899-12-30 16:30:00',10.25,0,0,NULL,NULL),
  (121,16,'2005-06-03 00:00:00','1899-12-30 07:00:00',NULL,NULL,'1899-12-30 16:30:00',9.5,0,0,NULL,NULL),
  (122,20,'2005-06-03 00:00:00','1899-12-30 06:00:00',NULL,NULL,'1899-12-30 17:30:00',11.5,0,0,NULL,NULL),
  (123,2,'2005-06-03 00:00:00','1899-12-30 07:45:00','1899-12-30 18:45:00',NULL,NULL,9,0,0,NULL,NULL),
  (124,20,'2005-06-06 00:00:00','1899-12-30 06:20:00','1899-12-30 14:00:00','1899-12-30 14:10:00','1899-12-30 16:30:00',10,0,0,NULL,NULL),
  (125,16,'2005-06-06 00:00:00','1899-12-30 08:35:00','1899-12-30 14:55:00','1899-12-30 15:25:00','1899-12-30 19:20:00',10.25,0,0,NULL,NULL),
  (126,2,'2005-06-06 00:00:00','1899-12-30 08:07:00','1899-12-30 18:14:00','1899-12-30 19:22:00','1899-12-30 21:02:00',11.78,0,0,NULL,NULL),
  (127,16,'2005-06-07 00:00:00','1899-12-30 08:35:00','1899-12-30 17:50:00',NULL,NULL,9.25,0,0,NULL,NULL),
  (128,2,'2005-06-07 00:00:00','1899-12-30 08:20:00','1899-12-30 18:11:00','1899-12-30 19:36:00','1899-12-30 21:25:00',11.66,0,0,NULL,NULL),
  (129,20,'2005-06-07 00:00:00','1899-12-30 07:10:00','1899-12-30 12:00:00','1899-12-30 12:10:00','1899-12-30 16:30:00',9.16,0,0,NULL,NULL),
  (130,2,'2005-06-08 00:00:00','1899-12-30 08:23:00','1899-12-30 18:45:00','1899-12-30 21:16:00','1899-12-30 22:00:00',11.09,0,0,NULL,NULL),
  (131,16,'2005-06-08 00:00:00','1899-12-30 08:25:00','1899-12-30 17:40:00',NULL,NULL,9.25,0,0,NULL,NULL),
  (132,20,'2005-06-08 00:00:00','1899-12-30 07:15:00',NULL,NULL,'1899-12-30 16:45:00',9.5,0,0,NULL,NULL),
  (133,2,'2005-06-09 00:00:00','1899-12-30 07:57:00','1899-12-30 18:08:00','1899-12-30 19:32:00','1899-12-30 22:05:00',12.73,0,0,NULL,NULL),
  (134,16,'2005-06-09 00:00:00','1899-12-30 08:40:00','1899-12-30 12:55:00','1899-12-30 13:55:00','1899-12-30 18:40:00',9,0,0,NULL,NULL),
  (135,20,'2005-06-09 00:00:00','1899-12-30 06:10:00','1899-12-30 12:25:00','1899-12-30 12:40:00','1899-12-30 16:30:00',10.08,0,0,NULL,NULL),
  (136,2,'2005-06-10 00:00:00','1899-12-30 08:05:00','1899-12-30 11:30:00',NULL,NULL,3.41,0,0,NULL,NULL),
  (137,16,'2005-06-10 00:00:00','1899-12-30 08:35:00','1899-12-30 17:20:00',NULL,NULL,8.75,0,0,NULL,NULL),
  (138,20,'2005-06-10 00:00:00','1899-12-30 06:15:00',NULL,NULL,'1899-12-30 16:45:00',10.5,0,0,NULL,NULL),
  (139,2,'2005-06-13 00:00:00','1899-12-30 08:03:00','1899-12-30 18:19:00','1899-12-30 20:04:00','1899-12-30 21:21:00',11.54,0,0,NULL,NULL),
  (140,20,'2005-06-13 00:00:00','1899-12-30 07:15:00','1899-12-30 12:20:00','1899-12-30 12:30:00','1899-12-30 16:30:00',9.08,0,0,NULL,NULL),
  (141,16,'2005-06-13 00:00:00','1899-12-30 09:20:00','1899-12-30 12:40:00','1899-12-30 13:40:00','1899-12-30 18:35:00',8.25,0,0,NULL,NULL),
  (142,2,'2005-06-14 00:00:00','1899-12-30 07:57:00','1899-12-30 19:00:00',NULL,NULL,11.05,0,0,NULL,NULL),
  (143,16,'2005-06-14 00:00:00','1899-12-30 08:15:00','1899-12-30 18:45:00',NULL,NULL,10.5,0,0,NULL,NULL),
  (144,20,'2005-06-14 00:00:00','1899-12-30 07:05:00',NULL,NULL,'1899-12-30 17:00:00',9.91,0,0,NULL,NULL),
  (145,20,'2005-06-15 00:00:00','1899-12-30 07:00:00','1899-12-30 12:30:00','1899-12-30 12:45:00','1899-12-30 16:30:00',9.25,0,0,NULL,NULL),
  (146,2,'2005-06-15 00:00:00','1899-12-30 08:04:00','1899-12-30 20:34:00',NULL,NULL,12.5,0,0,NULL,NULL),
  (147,16,'2005-06-15 00:00:00','1899-12-30 08:45:00','1899-12-30 13:15:00','1899-12-30 14:00:00','1899-12-30 18:30:00',9,0,0,NULL,NULL),
  (148,20,'2005-06-16 00:00:00','1899-12-30 07:00:00',NULL,NULL,'1899-12-30 16:30:00',9.5,0,0,NULL,NULL),
  (149,16,'2005-06-16 00:00:00','1899-12-30 08:35:00','1899-12-30 11:30:00','1899-12-30 12:30:00','1899-12-30 14:05:00',4.5,0,0,NULL,NULL),
  (150,2,'2005-06-16 00:00:00','1899-12-30 07:30:00','1899-12-30 11:31:00',NULL,NULL,4.01,0,0,NULL,NULL),
  (151,20,'2005-06-17 00:00:00','1899-12-30 07:15:00','1899-12-30 12:35:00','1899-12-30 12:50:00','1899-12-30 17:00:00',9.5,0,0,NULL,NULL),
  (152,16,'2005-06-17 00:00:00','1899-12-30 12:00:00','1899-12-30 20:15:00',NULL,NULL,8.25,0,0,NULL,NULL),
  (153,2,'2005-06-17 00:00:00','1899-12-30 16:48:00','1899-12-30 18:28:00','1899-12-30 20:14:00','1899-12-30 21:40:00',3.09,0,0,NULL,NULL),
  (154,16,'2005-06-20 00:00:00','1899-12-30 08:45:00','1899-12-30 18:00:00',NULL,NULL,9.25,0,0,NULL,NULL),
  (155,20,'2005-06-20 00:00:00','1899-12-30 07:15:00',NULL,NULL,'1899-12-30 18:00:00',10.75,0,0,NULL,NULL),
  (156,2,'2005-06-20 00:00:00','1899-12-30 07:47:00','1899-12-30 18:06:00','1899-12-30 18:53:00','1899-12-30 21:48:00',13.23,0,0,NULL,NULL),
  (157,16,'2005-06-21 00:00:00','1899-12-30 08:40:00','1899-12-30 18:40:00',NULL,NULL,10,0,0,NULL,NULL),
  (158,2,'2005-06-21 00:00:00','1899-12-30 08:08:00','1899-12-30 18:45:00','1899-12-30 21:28:00','1899-12-30 22:07:00',11.26,0,0,NULL,NULL),
  (159,20,'2005-06-21 00:00:00','1899-12-30 07:00:00',NULL,NULL,'1899-12-30 16:30:00',9.5,0,0,NULL,NULL),
  (160,16,'2005-06-22 00:00:00',NULL,NULL,NULL,NULL,0,7,0,1,NULL),
  (161,2,'2005-06-22 00:00:00','1899-12-30 07:25:00','1899-12-30 18:05:00','1899-12-30 19:14:00','1899-12-30 21:21:00',12.78,0,0,NULL,NULL),
  (162,20,'2005-06-22 00:00:00','1899-12-30 07:00:00',NULL,NULL,'1899-12-30 11:00:00',4,4,0,3,NULL),
  (163,16,'2005-06-23 00:00:00','1899-12-30 09:00:00','1899-12-30 14:15:00',NULL,NULL,5.25,0,0,NULL,NULL),
  (164,2,'2005-06-23 00:00:00','1899-12-30 07:28:00','1899-12-30 11:29:00',NULL,NULL,4.01,0,0,NULL,NULL),
  (165,20,'2005-06-23 00:00:00',NULL,NULL,NULL,NULL,0,8,0,1,NULL),
  (166,2,'2005-06-24 00:00:00','1899-12-30 08:14:00','1899-12-30 18:10:00','1899-12-30 19:22:00','1899-12-30 21:08:00',11.7,0,0,NULL,NULL),
  (167,20,'2005-06-24 00:00:00','1899-12-30 07:15:00',NULL,NULL,'1899-12-30 16:30:00',9.25,0,0,NULL,NULL),
  (168,16,'2005-06-24 00:00:00','1899-12-30 08:40:00','1899-12-30 12:25:00','1899-12-30 13:35:00','1899-12-30 18:20:00',8.5,0,0,NULL,NULL),
  (169,2,'2005-06-25 00:00:00','1899-12-30 18:44:00','1899-12-30 21:44:00',NULL,NULL,3,0,0,NULL,NULL),
  (170,20,'2005-06-27 00:00:00','1899-12-30 07:00:00',NULL,NULL,'1899-12-30 16:30:00',9.5,0,0,NULL,NULL),
  (171,2,'2005-06-27 00:00:00',NULL,NULL,NULL,NULL,16,0,0,NULL,NULL),
  (172,16,'2005-06-27 00:00:00','1899-12-30 08:20:00','1899-12-30 18:20:00',NULL,NULL,10,0,0,NULL,NULL),
  (173,2,'2005-06-28 00:00:00',NULL,NULL,NULL,NULL,10.5,0,0,NULL,NULL),
  (174,20,'2005-06-28 00:00:00','1899-12-30 07:10:00',NULL,NULL,'1899-12-30 15:30:00',8.33,0,0,NULL,NULL),
  (175,16,'2005-06-28 00:00:00','1899-12-30 08:35:00','1899-12-30 17:35:00',NULL,NULL,9,0,0,NULL,NULL),
  (176,2,'2005-06-29 00:00:00',NULL,NULL,NULL,NULL,7.75,0,0,NULL,NULL),
  (178,20,'2005-06-29 00:00:00','1899-12-30 07:00:00',NULL,NULL,'1899-12-30 16:30:00',9.5,0,0,NULL,NULL),
  (179,16,'2005-06-29 00:00:00','1899-12-30 08:40:00','1899-12-30 13:40:00','1899-12-30 13:55:00','1899-12-30 18:10:00',9.25,0,0,NULL,NULL),
  (180,2,'2005-06-30 00:00:00','1899-12-30 07:22:00','1899-12-30 11:31:00',NULL,NULL,4.15,0,0,NULL,NULL),
  (181,16,'2005-06-30 00:00:00','1899-12-30 08:35:00','1899-12-30 14:05:00',NULL,NULL,5.5,0,0,NULL,NULL),
  (182,20,'2005-06-30 00:00:00','1899-12-30 07:10:00','1899-12-30 16:30:00',NULL,NULL,9.33,0,0,NULL,NULL);
COMMIT;

-- Dumping data for table `groups`
INSERT INTO `groups` (`group_id`, `group_name`) VALUES 
  (1,'User'),
  (2,'Admin');
COMMIT;

-- Dumping data for table `employees`
INSERT INTO `employees` (`emp_id`, `emp_login`, `emp_password`, `emp_name`, `title`, `group_id`, `department_id`, `email`, `picture`, `phone_home`, `phone_work`, `phone_cell`, `fax`, `city`, `zip`, `address`, `employee_is_active`) VALUES 
  (1,'helen','helen','Helen Deering','Support',1,3,'helen@company.com','images/photos/Helen Deering.jpg','(364) 134-5455','(364) 134-5455','(960) 393-3466',NULL,NULL,NULL,NULL,1),
  (2,'alexander','alexander','Alexander Atkinson','Developer',1,1,'alexander@company.com','images/photos/Alexander Atkinson.jpg','(364) 354-2646','(364) 134-5456','(730) 643-4397',NULL,NULL,NULL,NULL,1),
  (3,'ken','ken','Ken Price','Developer',1,1,'ken@company.com','images/photos/Ken Price.jpg','(264) 823-2367','(364) 134-5456','(960) 423-3466',NULL,NULL,NULL,NULL,1),
  (4,'peter','peter','Peter Larsen','Tester',1,6,'peter@company.com','images/photos/Peter Larsen.jpg','(764) 662-2367','(364) 134-5459',NULL,NULL,NULL,NULL,NULL,1),
  (5,'ignace','ignace','Ignace Shaw','Developer',1,5,'ignace@company.com','images/photos/Ignace Shaw.jpg','(564) 343-3367','(364) 134-5411',NULL,NULL,NULL,NULL,NULL,1),
  (6,'george','george','George Pennington','Developer',1,1,'george@company.com','images/photos/George Pennington.jpg','(364) 345-5267','(364) 134-5413',NULL,NULL,NULL,NULL,NULL,1),
  (7,'andrew','andrew','Andrew Scott','Developer',1,1,'andrew@company.com','images/photos/Andrew Scott.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (8,'serge','serge','Serge Richards','Quality Assurance',1,6,'serge@company.com','images/photos/Serge Richards.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (9,'victor','victor','Victor Tomlin','Developer',1,5,'victor@company.com','images/photos/Victor Tomlin.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (10,'arledge','arledge','Arledge Archer','Technical Writer',1,8,'arledge@company.com','images/photos/Arledge Archer.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (11,'vlad','vlad','Vlad Young','Developer',1,1,'vlad@company.com','images/photos/Vlad Young.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (12,'alexz','alexz','Alex Zanuck','Developer',1,9,'alexz@company.com','images/photos/Alex Zanuck.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (13,'dennis','dennis','Dennis Mansfield','Tester',1,6,'dennis@company.com','images/photos/Dennis Mansfield.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (14,'michael','michael','Michael Koenig','Developer',1,5,'michael@company.com','images/photos/Michael Koenig.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (15,'nick','nick','Nick Bergman','Developer',1,1,'nick@company.com','images/photos/Nick Bergman.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (16,'alex','alex','Alex Antion','Support',1,3,'alex@company.com','images/photos/Alex Antion.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (17,'conrad','conrad','Conrad Murphy','CEO',1,2,'conrad@company.com','images/photos/Conrad Murphy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (18,'vance','vance','Vance Cole','Corporate Development',1,2,'vance@company.com','images/photos/Vance Cole.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (19,'vitas','vitas','Vitas Reynolds','Developer',1,5,'vitas@company.com','images/photos/Vitas Reynolds.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (20,'alexg','alexg','Alex Groth','Designer',1,7,'alexg@company.com','images/photos/Alex Groth.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (21,'michaelb','michaelb','Michael Barrett','Tester',1,6,'michaelb@company.com','images/photos/Michael Barrett.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (22,'ian','ian','Ian Gordon','Developer',1,1,'ian@company.com','images/photos/Ian Gordon.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (23,'alexzi','alexzi','Alex Zimb','Quality Assurance',1,6,'alexzi@company.com','images/photos/Alex Zimb.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (24,'alexandern','alexandern','Alexander Neville','Web Development Manager',1,5,'alexandern@company.com','images/photos/Alexander Neville.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (25,'eugene','eugene','Eugene Zubler','C++ Development Manager',1,1,'eugene@company.com','images/photos/Eugene Zubler.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (26,'oleg','oleg','Oleg Douglas','CTO',1,2,'oleg@company.com','images/photos/Oleg Douglas.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (27,'irina','irian','Irina Douglas','Accountant',1,4,'irina@company.com','images/photos/Irina Douglas.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (28,'helenp','helenp','Helen Palmer','Accountant',1,4,'helenp@company.com','images/photos/Helen Palmer.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (29,'stan','stan','Stan Simon','Developer',1,5,'stan@company.com','images/photos/Stan Simon.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (30,'alexk','alexk','Alex Knievel','Developer',1,5,'alexk@company.com','images/photos/Alex Knievel.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (31,'arty','arty','Arty Blake','Developer',1,5,'arty@company.com','images/photos/Arty Blake.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (32,'admin','admin','George Randall','NT Administrator',2,10,'georger@company.com','images/photos/George Randall.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (33,'olegt','olegt','Oleg Tim','Developer',1,5,'olegt@company.com','images/photos/Oleg Tim.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (34,'stank','stank','Stan Knight','UNIX Administrator',2,10,'stank@company.com','images/nophoto.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
COMMIT;

-- Dumping data for table `menu`
INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_id_parent`, `menu_link`) VALUES 
  (1,'Products',NULL,NULL),
  (2,'Downloads',NULL,NULL),
  (3,'Support',NULL,NULL),
  (4,'Purchase',NULL,NULL),
  (5,'Company',NULL,NULL),
  (6,'All',1,NULL),
  (7,'CodeCharge',1,NULL),
  (8,'CodeCharge Studio',1,NULL),
  (9,'DemoCharge Studio',1,NULL),
  (10,'Comparison',1,NULL),
  (11,'CodeCharge Studio',10,NULL),
  (12,'DemoCharge Studio',10,NULL),
  (13,'CodeCharge',2,NULL),
  (14,'CodeCharge Studio',2,NULL),
  (15,'DemoCharge Studio',2,NULL),
  (16,'Support',3,'http://support.yessoftware.com'),
  (17,'Forums',3,'http://forums.codecharge.com'),
  (18,'KB',3,'http://support.yessoftware.com/kb_search.asp'),
  (19,'Store',4,NULL),
  (20,'Resellers',4,NULL),
  (21,'Affiliate',4,NULL),
  (22,'About Us',5,NULL),
  (23,'Contact Us',5,NULL),
  (24,'Press Releases',5,NULL);
COMMIT;

-- Dumping data for table `products`
INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES 
  (1,'Web Database Development',39.99),
  (2,'Programming Perl',39.96),
  (3,'Perl and CGI for the WWW',15.19),
  (4,'MySQL',39.99),
  (5,'PHP and MySQL Web Development',39.99),
  (6,'MySQL & PHP From Scratch',23.99),
  (7,'MySQL and mSQL',27.96),
  (8,'Flash 4 Magic',36),
  (9,'Web Application Development with PHP 4.0',36),
  (10,'Beginning ASP Databases',39.99),
  (11,'Oracle8i Web Development',41.99),
  (12,'Black Belt Web Programming Methods',27.96),
  (13,'Web Development with Java Server Pages',35.96),
  (14,'Professional JSP J2EE Edition',47.99),
  (15,'Mastering ColdFusion 4.5',39.99),
  (16,'Teach Yourself ColdFusion in 21 Days',31.99),
  (17,'ColdFusion Fast & Easy Web Development',19.99),
  (18,'Beginning Active Server Pages 3.0',31.99),
  (19,'Web Design in a Nutshell',23.96),
  (20,'HTML 4 for the WWW Visual Quickstart Guide',15.99),
  (21,'1001 Web Site Construction Tips and Tricks',39.95),
  (22,'C# - Programming with the Public Beta',34.99);
COMMIT;

-- Dumping data for table `orders`
INSERT INTO `orders` (`order_id`, `order_customer_id`, `order_date`, `order_ship_address`, `order_ship_city`, `order_ship_state`, `order_ship_zip`) VALUES 
  (1,1,'2003-01-10 00:00:00',NULL,NULL,NULL,NULL),
  (2,2,'2003-01-14 00:00:00',NULL,NULL,NULL,NULL),
  (3,3,'2003-01-16 00:00:00',NULL,NULL,NULL,NULL),
  (4,1,'2003-01-22 00:00:00',NULL,NULL,NULL,NULL);
COMMIT;

-- Dumping data for table `priorities`
INSERT INTO `priorities` (`priority_id`, `priority_name`) VALUES 
  (1,'Highest'),
  (2,'High'),
  (3,'Normal'),
  (4,'Low'),
  (5,'Lowest');
COMMIT;

-- Dumping data for table `projects`
INSERT INTO `projects` (`project_id`, `project_name`, `project_is_active`) VALUES 
  (1,'CodeCharge',1),
  (2,'My Project',1),
  (3,'Test Project',1),
  (4,'Great Project',1),
  (5,'Super Project',1);
COMMIT;

-- Dumping data for table `projects_employees`
INSERT INTO `projects_employees` (`project_id`, `emp_id`, `percent_allocation`) VALUES 
  (1,1,30),
  (1,7,45),
  (1,8,50),
  (1,24,15),
  (2,1,40),
  (2,2,70),
  (2,3,50),
  (2,8,20),
  (2,24,25),
  (3,1,30),
  (3,8,15),
  (3,24,55),
  (4,2,30),
  (4,7,55),
  (4,8,10),
  (5,8,5),
  (5,15,100),
  (5,24,5);
COMMIT;

-- Dumping data for table `statuses`
INSERT INTO `statuses` (`status_id`, `status_name`) VALUES 
  (1,'Open'),
  (2,'On hold'),
  (3,'Closed'),
  (4,'In progress');
COMMIT;

-- Dumping data for table `types`
INSERT INTO `types` (`type_id`, `type_name`) VALUES 
  (1,'Task'),
  (2,'Bug'),
  (3,'Issue'),
  (4,'Question');
COMMIT;

-- Dumping data for table `tasks`
INSERT INTO `tasks` (`task_id`, `project_id`, `priority_id`, `status_id`, `type_id`, `task_name`, `task_desc`, `user_id_assign_by`, `user_id_assign_to`, `task_start_date`, `task_finish_date`) VALUES 
  (1,1,2,2,3,'Great Project needs to be greater','Mission Impossible? Get CodeCharge.',3,1,'2003-02-01 00:00:00','2003-02-02 00:00:00'),
  (2,1,1,3,4,'Fix ALL bugs','Staying up at night coding? Get CodeCharge, go home, get rest.',3,6,'2003-02-02 00:00:00','2003-02-03 00:00:00'),
  (3,1,2,3,1,'Get ready to click','Write CODE by pointing and clicking.\r\nWrite CODE by pointing and clicking. Or clicking and pointing. Or clicking and clicking.',3,4,'2003-02-03 00:00:00','2003-02-04 00:00:00'),
  (4,2,1,1,1,'Finish My Project','Verify Zip Code and other possible errors in XML files. Display full list of errors to the user and \"status=error\" hidden in HTML.',3,5,'2003-02-04 00:00:00','2003-02-05 00:00:00'),
  (5,3,2,4,1,'Test this project.','Programmoholic? Get Help. Get CodeCharge.',3,3,'2003-02-05 00:00:00','2003-02-06 00:00:00'),
  (6,1,1,1,1,'Code with one hand.','Why code with TWO HANDS, when you can do it faster with ONE.',3,2,'2003-02-06 00:00:00','2003-02-07 00:00:00'),
  (7,3,1,2,1,'Get armed','Low on ammunition? Get armed. Get CodeCharge.',3,1,'2003-02-07 00:00:00','2003-02-08 00:00:00'),
  (8,3,1,1,4,'Write more code','To code or not to code, that is the question',3,5,'2003-02-08 00:00:00','2003-02-09 00:00:00'),
  (9,5,1,4,1,'Code, code, code?','CODE. CODE. CODE. CODE. MORE CODE.',3,6,'2003-02-09 00:00:00','2003-02-10 00:00:00'),
  (10,3,5,2,1,'Sleep','Stop coding. Charge your code. Get Sleep.',3,3,'2003-02-10 00:00:00','2003-02-11 00:00:00'),
  (11,5,1,1,1,'Have fun','Bored with your programming job? Get CodeCharge. Have Fun.',3,2,'2003-02-11 00:00:00','2003-02-12 00:00:00');
COMMIT;

-- Dumping data for table `user_events`
INSERT INTO `user_events` (`user_event_id`, `priority_id`, `user_event_title`, `user_event_date`, `user_event_time`, `user_event_desc`) VALUES 
  (1,3,'Staff Briefing','2005-11-20 00:00:00','1899-12-30 10:00:00','Briefing in the Conference Hall for the staff'),
  (2,3,'Discussion on New Features','2005-11-20 00:00:00','1899-12-30 14:00:00','Managers responsible for new features should be present'),
  (3,3,'Staff Briefing','2005-11-26 00:00:00','1899-12-30 10:00:00','Briefing in the Conference Hall for the staff'),
  (4,3,'Result Discussion','2005-12-07 00:00:00','1899-12-30 16:00:00','Meeting to discuss results and the future plan for the Project'),
  (5,3,'Staff Briefing','2005-12-18 00:00:00','1899-12-30 09:00:00','Briefing in the Conference Hall for the staff'),
  (6,3,'Discussion on New Features','2005-12-18 00:00:00','1899-12-30 14:00:00','Managers responsible for new features should be present'),
  (7,3,'Staff Briefing','2005-12-24 00:00:00','1899-12-30 10:00:00','Briefing in the Conference Hall for the staff');
COMMIT;
