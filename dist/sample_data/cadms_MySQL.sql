-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2013 at 06:48 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cadms`
--
CREATE DATABASE IF NOT EXISTS `cadms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cadms`;

-- --------------------------------------------------------

--
-- Table structure for table `app_cache`
--

CREATE TABLE IF NOT EXISTS `app_cache` (
  `cache_key` varchar(65) DEFAULT NULL,
  `cache_expiration` int(11) DEFAULT '0',
  `cache_data` longtext,
  KEY `key` (`cache_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='query cache for faster response';

-- --------------------------------------------------------

--
-- Table structure for table `app_clf`
--

CREATE TABLE IF NOT EXISTS `app_clf` (
  `design_id` int(11) NOT NULL AUTO_INCREMENT,
  `design_acronym` varchar(15) NOT NULL,
  `design_name` varchar(50) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`design_id`),
  KEY `app_design_acronym` (`design_acronym`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of Common Look and Feel for the app' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_clf`
--

INSERT INTO `app_clf` (`design_id`, `design_acronym`, `design_name`, `is_default`) VALUES
(1, 'boew-intranet', 'boew intranet theme', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_group`
--

CREATE TABLE IF NOT EXISTS `app_group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `groupy_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Application framework Access Level (see doc)';

--
-- Dumping data for table `app_group`
--

INSERT INTO `app_group` (`group_id`, `group_name`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `app_language`
--

CREATE TABLE IF NOT EXISTS `app_language` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_name2` varchar(2) NOT NULL,
  `lang_name3` varchar(3) NOT NULL,
  `lang_name` varchar(35) NOT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Application Language reference information' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `app_language`
--

INSERT INTO `app_language` (`lang_id`, `lang_name2`, `lang_name3`, `lang_name`) VALUES
(1, 'en', 'eng', 'English'),
(2, 'fr', 'fra', 'Français');

-- --------------------------------------------------------

--
-- Table structure for table `app_menu`
--

CREATE TABLE IF NOT EXISTS `app_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_id_parent` int(11) DEFAULT NULL,
  `menu_object_name` varchar(50) DEFAULT NULL,
  `menu_link` varchar(50) DEFAULT NULL,
  `menu_is_root` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`menu_id`),
  KEY `category_id_parent` (`menu_id_parent`),
  KEY `menu_object_name` (`menu_object_name`),
  KEY `project_id` (`project_id`),
  KEY `menu_is_root` (`menu_is_root`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Consolidated application  menus. Each menu has a root value' AUTO_INCREMENT=601 ;

--
-- Dumping data for table `app_menu`
--

INSERT INTO `app_menu` (`menu_id`, `project_id`, `menu_name`, `menu_id_parent`, `menu_object_name`, `menu_link`, `menu_is_root`) VALUES
(1, NULL, 'Projects', NULL, NULL, NULL, NULL),
(2, NULL, 'B', NULL, NULL, NULL, NULL),
(3, NULL, 'C', NULL, NULL, NULL, NULL),
(4, NULL, 'D', NULL, NULL, NULL, NULL),
(5, NULL, 'E', NULL, NULL, NULL, NULL),
(6, NULL, 'RCM', 1, NULL, NULL, NULL),
(7, NULL, 'NEOSSat', 1, NULL, NULL, NULL),
(8, NULL, 'CADMS', 1, NULL, NULL, NULL),
(11, NULL, 'A5A Thencer', 10, NULL, NULL, NULL),
(12, NULL, 'A5B', 10, NULL, NULL, NULL),
(13, NULL, 'B1', 2, NULL, NULL, NULL),
(14, NULL, 'B2', 2, NULL, NULL, NULL),
(15, NULL, 'B3', 2, NULL, NULL, NULL),
(16, NULL, 'C1', 3, NULL, 'http://support.yessoftware.com', NULL),
(17, NULL, 'C2', 3, NULL, 'http://forums.codecharge.com', NULL),
(18, NULL, 'C3', 3, NULL, 'http://support.yessoftware.com/kb_search.asp', NULL),
(19, NULL, 'Store', 4, NULL, NULL, NULL),
(20, NULL, 'Resellers', 4, NULL, NULL, NULL),
(21, NULL, 'Affiliate', 4, NULL, NULL, NULL),
(22, NULL, 'About Us', 5, NULL, NULL, NULL),
(23, NULL, 'Contact Us', 5, NULL, NULL, NULL),
(24, NULL, 'Press Releases', 23, NULL, NULL, NULL),
(25, NULL, 'Press Releases', 24, NULL, NULL, NULL),
(26, NULL, 'Press Releases', 25, NULL, NULL, NULL),
(27, NULL, 'Press Releases', 26, NULL, NULL, NULL),
(28, NULL, 'Press Releases', 27, NULL, NULL, NULL),
(29, NULL, 'Press Releases', 28, NULL, NULL, NULL),
(31, NULL, 'Documents', 6, NULL, NULL, NULL),
(32, NULL, 'Documents', 7, NULL, NULL, NULL),
(33, NULL, 'Documents', 8, NULL, NULL, NULL),
(34, NULL, 'Product', 6, NULL, NULL, NULL),
(35, NULL, 'Product', 7, NULL, NULL, NULL),
(36, NULL, 'Product', 8, NULL, NULL, NULL),
(37, NULL, 'contract', 6, NULL, NULL, NULL),
(38, NULL, 'contract', 7, NULL, NULL, NULL),
(39, NULL, 'Contract', 8, NULL, NULL, NULL),
(40, NULL, 'CDRL', 6, NULL, NULL, NULL),
(41, NULL, 'CDRL', 7, NULL, NULL, NULL),
(42, NULL, 'CDRL', 8, NULL, NULL, NULL),
(43, NULL, 'Staff', 6, NULL, NULL, NULL),
(44, NULL, 'Staff', 7, NULL, NULL, NULL),
(45, NULL, 'Staff', 8, NULL, NULL, NULL),
(46, NULL, 'RID', 6, NULL, NULL, NULL),
(47, NULL, 'RID', 7, NULL, NULL, NULL),
(48, NULL, 'RID', 8, NULL, NULL, NULL),
(49, NULL, 'CCB', 6, NULL, NULL, NULL),
(50, NULL, 'CCB', 7, NULL, NULL, NULL),
(51, NULL, 'CCB', 8, NULL, NULL, NULL),
(52, NULL, 'Events', 6, NULL, NULL, NULL),
(53, NULL, 'Events', 7, NULL, NULL, NULL),
(54, NULL, 'Events', 8, NULL, NULL, NULL),
(100, NULL, 'HEADER_MENU', NULL, NULL, NULL, NULL),
(200, NULL, 'SECONDARY_MENU', NULL, NULL, NULL, NULL),
(300, NULL, 'NAVIGATION_MENU', NULL, NULL, NULL, NULL),
(600, NULL, 'FOOTER_MENU', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_product`
--

CREATE TABLE IF NOT EXISTS `app_product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_parent_id` int(11) DEFAULT NULL,
  `prod_acronym` varchar(15) NOT NULL,
  `prod_name` varchar(50) NOT NULL,
  `prod_prefix` varchar(15) NOT NULL,
  `prod_description` text NOT NULL,
  `prod_type_id` int(11) NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `app_prod_type_id` (`prod_type_id`),
  KEY `prod_parent_id` (`prod_parent_id`),
  KEY `prod_acronym` (`prod_acronym`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Application Product Tree' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `app_product`
--

INSERT INTO `app_product` (`prod_id`, `prod_parent_id`, `prod_acronym`, `prod_name`, `prod_prefix`, `prod_description`, `prod_type_id`) VALUES
(1, 17, '', 'app_cache', 'cache', '', 2),
(2, 17, '', 'app_design', 'design', '', 2),
(3, 17, '', 'app_group', 'group', '', 2),
(4, 17, '', 'language', 'lang', '', 2),
(5, 17, '', 'app_menu', 'menu', '', 2),
(6, 17, '', 'app_resource', 'res', '', 2),
(7, 17, '', 'app_resource_type', 'res_type', '', 2),
(8, 17, '', 'app_site', 'site', '', 2),
(9, 17, '', 'app_site', 'site', '', 2),
(10, 17, '', 'app_table', 'table', '', 2),
(11, 17, '', 'app_test', 'test', '', 2),
(12, 17, '', 'app_test_log', 'test_log', '', 2),
(13, 17, '', 'department', 'dept', '', 2),
(14, 17, '', 'person', 'pers', '', 2),
(15, 17, '', 'project', 'proj', '', 2),
(16, 17, '', 'app_req', 'req', '', 2),
(17, NULL, 'table', 'table', 'table', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_product_type`
--

CREATE TABLE IF NOT EXISTS `app_product_type` (
  `prod_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_type_name` varchar(25) NOT NULL,
  `prod_type_description` text NOT NULL,
  PRIMARY KEY (`prod_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Specialisation classes of app_resource' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `app_product_type`
--

INSERT INTO `app_product_type` (`prod_type_id`, `prod_type_name`, `prod_type_description`) VALUES
(1, 'Node', 'Sub-element'),
(2, 'table', 'This resource describe an element of the user Interface Component (UIC)');

-- --------------------------------------------------------

--
-- Table structure for table `app_req`
--

CREATE TABLE IF NOT EXISTS `app_req` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_no` int(15) DEFAULT NULL,
  `req_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `req_description` text CHARACTER SET latin1,
  `req_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`req_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `app_req`
--

INSERT INTO `app_req` (`req_id`, `req_no`, `req_name`, `req_description`, `req_type_id`) VALUES
(1, 0, '', 'The application shall have login or logout link, (depending of logged state) within the header', 0),
(2, NULL, '', 'The UIC shall be in french or english.', NULL),
(3, NULL, '', 'The DMC shall manage the following domain classes: person, contract, cdrl, deliverables, product, service, procedure, work_instruction, work_task, ad-hoc task, event, issue, organisation, review_allocation_matrix, ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_resource`
--

CREATE TABLE IF NOT EXISTS `app_resource` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_site_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Site or instance id of the UIC',
  `res_clf_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Applicable clf theme',
  `res_lang_id` int(11) NOT NULL,
  `res_name` varchar(255) NOT NULL,
  `res_value` varchar(255) NOT NULL,
  `res_name_description` text NOT NULL,
  `res_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`res_id`),
  KEY `res_type_id` (`res_type_id`),
  KEY `res_lang2` (`res_lang_id`),
  KEY `res_site_id` (`res_site_id`),
  KEY `res_design_id` (`res_clf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='UIC Multi-language resources' AUTO_INCREMENT=217 ;

--
-- Dumping data for table `app_resource`
--

INSERT INTO `app_resource` (`res_id`, `res_site_id`, `res_clf_id`, `res_lang_id`, `res_name`, `res_value`, `res_name_description`, `res_type_id`) VALUES
(1, 1, 1, 1, 'gcwu_cmblang_href', '/langselect/lang.php', 'Site or keep the default language script', 1),
(2, 1, 1, 1, 'gcwu_terms_text', 'Terms and conditions', 'Terms and conditions and transparency text', 1),
(3, 1, 1, 2, 'gcwu_terms_text', 'Avis', 'Terms and conditions and transparency text', 1),
(4, 1, 1, 1, 'gcwu_terms_href', '#', 'Modify Terms and conditions and Transparency links', 1),
(5, 1, 1, 1, 'gcwu_trans_href', '#', 'Modify Terms and conditions and Transparency links', 1),
(6, 1, 1, 1, 'gcwu_trans_text', 'Transparency', 'Modify Terms and conditions and Transparency links', 1),
(7, 1, 1, 2, 'gcwu_trans_text', 'Transparence', 'Modify Terms and conditions and Transparency links', 1),
(8, 1, 1, 1, 'gcwu_sig_image', 'sig', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(9, 1, 1, 1, 'gcwu_sig', 'Government of Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(10, 1, 1, 2, 'gcwu_sig', 'Gouvernement du Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(11, 1, 1, 1, 'gcwu_wmms', 'Symbol of the Government of Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(12, 1, 1, 2, 'gcwu_wmms', 'Symbole du gouvernement du Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(13, 1, 1, 1, 'gcwu_gcnavbar', 'Government of Canada navigation bar', 'hidden text used for accessibility', 1),
(14, 1, 1, 2, 'gcwu_gcnavbar', 'Barre de navigation de la gouvernement de Canada', 'hidden text used for accessibility', 1),
(15, 1, 1, 1, 'gcwu_cmblang_href', '/langselect/lang.php', 'Site or keep the default language script', 1),
(16, 1, 1, 1, 'gcwu_terms_text', 'Terms and conditions', 'Terms and conditions and transparency text', 1),
(17, 1, 1, 2, 'gcwu_terms_text', 'Avis', 'Terms and conditions and transparency text', 1),
(18, 1, 1, 1, 'gcwu_terms_href', '#', 'Modify Terms and conditions and Transparency links', 1),
(19, 1, 1, 1, 'gcwu_trans_href', '#', 'Modify Terms and conditions and Transparency links', 1),
(20, 1, 1, 1, 'gcwu_trans_text', 'Transparency', 'Modify Terms and conditions and Transparency links', 1),
(21, 1, 1, 2, 'gcwu_trans_text', 'Transparence', 'Modify Terms and conditions and Transparency links', 1),
(22, 1, 1, 1, 'gcwu_sig_image', 'sig', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(23, 1, 1, 1, 'gcwu_sig', 'Government of Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(24, 1, 1, 2, 'gcwu_sig', 'Gouvernement du Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(25, 1, 1, 1, 'gcwu_wmms', 'Symbol of the Government of Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(26, 1, 1, 2, 'gcwu_wmms', 'Symbole du gouvernement du Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(27, 1, 1, 1, 'gcwu_gcnavbar', 'Government of Canada navigation bar', 'hidden text used for accessibility', 1),
(28, 1, 1, 2, 'gcwu_gcnavbar', 'Barre de navigation de la gouvernement de Canada', 'hidden text used for accessibility', 1),
(29, 1, 1, 1, 'gcwu_gcfooter', 'Government of Canada footer', 'hidden text used for accessibility', 1),
(30, 1, 1, 2, 'gcwu_gcfooter', 'Pied de page du gouvernement du Canada', 'hidden text used for accessibility', 1),
(31, 1, 1, 1, 'gcwu_gcnb1_href', '#', 'links that appear at the very top of the page for this theme', 1),
(32, 1, 1, 2, 'gcwu_gcnb1_href', '#', 'links that appear at the very top of the page for this theme', 1),
(33, 1, 1, 1, 'gcwu_gcnb1_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(34, 1, 1, 2, 'gcwu_gcnb1_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(35, 1, 1, 1, 'gcwu_gcnb2_href', '#', 'links that appear at the very top of the page for this theme', 1),
(36, 1, 1, 2, 'gcwu_gcnb2_href', '#', 'links that appear at the very top of the page for this theme', 1),
(37, 1, 1, 1, 'gcwu_gcnb2_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(38, 1, 1, 2, 'gcwu_gcnb2_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(39, 1, 1, 1, 'gcwu_gcnb3_href', '#', 'links that appear at the very top of the page for this theme', 1),
(40, 1, 1, 2, 'gcwu_gcnb3_href', '#', 'links that appear at the very top of the page for this theme', 1),
(41, 1, 1, 1, 'gcwu_gcnb3_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(42, 1, 1, 2, 'gcwu_gcnb3_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(43, 1, 1, 1, 'gcwu_cmblang_text', 'English', 'button and language swap text', 1),
(44, 1, 1, 2, 'gcwu_cmblang_text', 'Français', 'button and language swap text', 1),
(45, 1, 1, 1, 'gcwu_cmblang_title', 'English - English version of the Web page', 'button and language swap text', 1),
(46, 1, 1, 2, 'gcwu_cmblang_title', 'Français - Version française de cette page', 'button and language swap text', 1),
(47, 1, 1, 1, 'gcwu_trail1_href', 'http://healthycanadians.gc.ca/index-eng.php', 'links that appear at the very bottom of the page for this theme', 1),
(48, 1, 1, 2, 'gcwu_trail1_href', 'http://healthycanadians.gc.ca/index-fra.php', 'links that appear at the very bottom of the page for this theme', 1),
(49, 1, 1, 1, 'gcwu_trail1_text', 'Health', 'links that appear at the very bottom of the page for this theme', 1),
(50, 1, 1, 2, 'gcwu_trail1_text', 'Santé', 'links that appear at the very bottom of the page for this theme', 1),
(51, 1, 1, 1, 'gcwu_trail1_textsub', 'healthycanadians.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(52, 1, 1, 2, 'gcwu_trail1_textsub', 'canadiensensante.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(53, 1, 1, 1, 'gcwu_trail_href', 'http://www.voyage.gc.ca/index-eng.asp', 'links that appear at the very bottom of the page for this theme', 1),
(54, 1, 1, 2, 'gcwu_trail2_href', 'http://www.voyage.gc.ca/index-fra.asp', 'links that appear at the very bottom of the page for this theme', 1),
(55, 1, 1, 1, 'gcwu_trail2_text', 'Travel', 'links that appear at the very bottom of the page for this theme', 1),
(56, 1, 1, 2, 'gcwu_trail2_text', 'Voyage', 'links that appear at the very bottom of the page for this theme', 1),
(57, 1, 1, 1, 'gcwu_trail2_textsub', 'travel.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(58, 1, 1, 2, 'gcwu_trail2_textsub', 'voyage.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(59, 1, 1, 1, 'gcwu_trail3_href', 'http://www.servicecanada.gc.ca/eng/home.shtml', 'links that appear at the very bottom of the page for this theme', 1),
(60, 1, 1, 2, 'gcwu_trail3_href', 'http://www.servicecanada.gc.ca/fra/accueil.shtml', 'links that appear at the very bottom of the page for this theme', 1),
(61, 1, 1, 1, 'gcwu_trail3_text', 'Service Canada', 'links that appear at the very bottom of the page for this theme', 1),
(62, 1, 1, 2, 'gcwu_trail3_text', 'Service Canada', 'links that appear at the very bottom of the page for this theme', 1),
(63, 1, 1, 1, 'gcwu_trail3_textsub', 'servicecanada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(64, 1, 1, 2, 'gcwu_trail3_textsub', 'servicecanada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(65, 1, 1, 1, 'gcwu_trail4_href', 'http://www.jobbank.gc.ca/intro-eng.aspx', 'links that appear at the very bottom of the page for this theme', 1),
(66, 1, 1, 2, 'gcwu_trail4_href', 'http://www.guichetemplois.gc.ca/Intro-fra.aspx', 'links that appear at the very bottom of the page for this theme', 1),
(67, 1, 1, 1, 'gcwu_trail4_text', 'Jobs', 'links that appear at the very bottom of the page for this theme', 1),
(68, 1, 1, 2, 'gcwu_trail4_text', 'Emplois', 'links that appear at the very bottom of the page for this theme', 1),
(69, 1, 1, 1, 'gcwu_trail4_textsub', 'jobbank.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(70, 1, 1, 2, 'gcwu_trail4_textsub', 'guichetemplois.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(71, 1, 1, 1, 'gcwu_trail5_href', 'Economy', 'links that appear at the very bottom of the page for this theme', 1),
(72, 1, 1, 2, 'gcwu_trail5_href', 'http://plandaction.gc.ca/fr', 'links that appear at the very bottom of the page for this theme', 1),
(73, 1, 1, 1, 'gcwu_trail5_text', 'Economy', 'links that appear at the very bottom of the page for this theme', 1),
(74, 1, 1, 2, 'gcwu_trail5_text', 'Économie', 'links that appear at the very bottom of the page for this theme', 1),
(75, 1, 1, 1, 'gcwu_trail5_textsub', 'actionplan.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(76, 1, 1, 2, 'gcwu_trail5_textsub', 'plandaction.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(77, 1, 1, 1, 'gcwu_trail_canada_href', 'http://www.canada.gc.ca/menu-eng.html', 'links that appear at the very bottom of the page for this theme', 1),
(78, 1, 1, 2, 'gcwu_trail_canada_href', 'http://www.canada.gc.ca/menu-fra.html', 'links that appear at the very bottom of the page for this theme', 1),
(79, 1, 1, 1, 'gcwu_trail_canada_text', 'Canada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(80, 1, 1, 2, 'gcwu_trail_canada_text', 'Canada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(81, 1, 1, 1, 'gcwu_cmblang_href', '/langselect/lang.php', 'Site or keep the default language script', 1),
(82, 1, 1, 1, 'gcwu_terms_text', 'Terms and conditions', 'Terms and conditions and transparency text', 1),
(83, 1, 1, 2, 'gcwu_terms_text', 'Avis', 'Terms and conditions and transparency text', 1),
(84, 1, 1, 1, 'gcwu_terms_href', '', 'Modify Terms and conditions and Transparency links', 1),
(85, 1, 1, 1, 'gcwu_trans_href', '', 'Modify Terms and conditions and Transparency links', 1),
(86, 1, 1, 1, 'gcwu_trans_text', 'Transparency', 'Modify Terms and conditions and Transparency links', 1),
(87, 1, 1, 2, 'gcwu_trans_text', 'Transparence', 'Modify Terms and conditions and Transparency links', 1),
(88, 1, 1, 1, 'gcwu_sig_image', 'sig', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(89, 1, 1, 1, 'gcwu_sig', 'Government of Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(90, 1, 1, 2, 'gcwu_sig', 'Gouvernement du Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(91, 1, 1, 1, 'gcwu_wmms', 'Symbol of the Government of Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(92, 1, 1, 2, 'gcwu_wmms', 'Symbole du gouvernement du Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(93, 1, 1, 1, 'gcwu_gcnavbar', 'Government of Canada navigation bar', 'hidden text used for accessibility', 1),
(94, 1, 1, 2, 'gcwu_gcnavbar', 'Barre de navigation de la gouvernement de Canada', 'hidden text used for accessibility', 1),
(95, 1, 1, 1, 'gcwu_gcfooter', 'Government of Canada footer', 'hidden text used for accessibility', 1),
(96, 1, 1, 2, 'gcwu_gcfooter', 'Pied de page du gouvernement du Canada', 'hidden text used for accessibility', 1),
(97, 1, 1, 1, 'gcwu_gcnb1_href', '#', 'links that appear at the very top of the page for this theme', 1),
(98, 1, 1, 2, 'gcwu_gcnb1_href', '#', 'links that appear at the very top of the page for this theme', 1),
(99, 1, 1, 1, 'gcwu_gcnb1_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(100, 1, 1, 2, 'gcwu_gcnb1_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(101, 1, 1, 1, 'gcwu_gcnb2_href', '#', 'links that appear at the very top of the page for this theme', 1),
(102, 1, 1, 2, 'gcwu_gcnb2_href', '#', 'links that appear at the very top of the page for this theme', 1),
(103, 1, 1, 1, 'gcwu_gcnb2_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(104, 1, 1, 2, 'gcwu_gcnb2_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(105, 1, 1, 1, 'gcwu_gcnb3_href', '#', 'links that appear at the very top of the page for this theme', 1),
(106, 1, 1, 2, 'gcwu_gcnb3_href', '#', 'links that appear at the very top of the page for this theme', 1),
(107, 1, 1, 1, 'gcwu_gcnb3_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(108, 1, 1, 2, 'gcwu_gcnb3_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(109, 1, 1, 1, 'gcwu_cmblang_text', 'English', 'button and language swap text', 1),
(110, 1, 1, 2, 'gcwu_cmblang_text', 'Français', 'button and language swap text', 1),
(111, 1, 1, 1, 'gcwu_cmblang_title', 'English - English version of the Web page', 'button and language swap text', 1),
(112, 1, 1, 2, 'gcwu_cmblang_title', 'Français - Version française de cette page', 'button and language swap text', 1),
(113, 1, 1, 1, 'gcwu_trail1_href', 'http://healthycanadians.gc.ca/index-eng.php', 'links that appear at the very bottom of the page for this theme', 1),
(114, 1, 1, 2, 'gcwu_trail1_href', 'http://healthycanadians.gc.ca/index-fra.php', 'links that appear at the very bottom of the page for this theme', 1),
(115, 1, 1, 1, 'gcwu_trail1_text', 'Health', 'links that appear at the very bottom of the page for this theme', 1),
(116, 1, 1, 2, 'gcwu_trail1_text', 'Santé', 'links that appear at the very bottom of the page for this theme', 1),
(117, 1, 1, 1, 'gcwu_trail1_textsub', 'healthycanadians.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(118, 1, 1, 2, 'gcwu_trail1_textsub', 'canadiensensante.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(119, 1, 1, 1, 'gcwu_trail_href', 'http://www.voyage.gc.ca/index-eng.asp', 'links that appear at the very bottom of the page for this theme', 1),
(120, 1, 1, 2, 'gcwu_trail2_href', 'http://www.voyage.gc.ca/index-fra.asp', 'links that appear at the very bottom of the page for this theme', 1),
(121, 1, 1, 1, 'gcwu_trail2_text', 'Travel', 'links that appear at the very bottom of the page for this theme', 1),
(122, 1, 1, 2, 'gcwu_trail2_text', 'Voyage', 'links that appear at the very bottom of the page for this theme', 1),
(123, 1, 1, 1, 'gcwu_trail2_textsub', 'travel.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(124, 1, 1, 2, 'gcwu_trail2_textsub', 'voyage.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(125, 1, 1, 1, 'gcwu_trail3_href', 'http://www.servicecanada.gc.ca/eng/home.shtml', 'links that appear at the very bottom of the page for this theme', 1),
(126, 1, 1, 2, 'gcwu_trail3_href', 'http://www.servicecanada.gc.ca/fra/accueil.shtml', 'links that appear at the very bottom of the page for this theme', 1),
(127, 1, 1, 1, 'gcwu_trail3_text', 'Service Canada', 'links that appear at the very bottom of the page for this theme', 1),
(128, 1, 1, 2, 'gcwu_trail3_text', 'Service Canada', 'links that appear at the very bottom of the page for this theme', 1),
(129, 1, 1, 1, 'gcwu_trail3_textsub', 'servicecanada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(130, 1, 1, 2, 'gcwu_trail3_textsub', 'servicecanada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(131, 1, 1, 1, 'gcwu_trail4_href', 'http://www.jobbank.gc.ca/intro-eng.aspx', 'links that appear at the very bottom of the page for this theme', 1),
(132, 1, 1, 2, 'gcwu_trail4_href', 'http://www.guichetemplois.gc.ca/Intro-fra.aspx', 'links that appear at the very bottom of the page for this theme', 1),
(133, 1, 1, 1, 'gcwu_trail4_text', 'Jobs', 'links that appear at the very bottom of the page for this theme', 1),
(134, 1, 1, 2, 'gcwu_trail4_text', 'Emplois', 'links that appear at the very bottom of the page for this theme', 1),
(135, 1, 1, 1, 'gcwu_trail4_textsub', 'jobbank.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(136, 1, 1, 2, 'gcwu_trail4_textsub', 'guichetemplois.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(137, 1, 1, 1, 'gcwu_trail5_href', 'Economy', 'links that appear at the very bottom of the page for this theme', 1),
(138, 1, 1, 2, 'gcwu_trail5_href', 'http://plandaction.gc.ca/fr', 'links that appear at the very bottom of the page for this theme', 1),
(139, 1, 1, 1, 'gcwu_trail5_text', 'Economy', 'links that appear at the very bottom of the page for this theme', 1),
(140, 1, 1, 2, 'gcwu_trail5_text', 'Économie', 'links that appear at the very bottom of the page for this theme', 1),
(141, 1, 1, 1, 'gcwu_trail5_textsub', 'actionplan.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(142, 1, 1, 2, 'gcwu_trail5_textsub', 'plandaction.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(143, 1, 1, 1, 'gcwu_trail_canada_href', 'http://www.canada.gc.ca/menu-eng.html', 'links that appear at the very bottom of the page for this theme', 1),
(144, 1, 1, 2, 'gcwu_trail_canada_href', 'http://www.canada.gc.ca/menu-fra.html', 'links that appear at the very bottom of the page for this theme', 1),
(145, 1, 1, 1, 'gcwu_trail_canada_text', 'Canada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(146, 1, 1, 2, 'gcwu_trail_canada_text', 'Canada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(147, 1, 1, 1, 'gcwu_langselect', 'Language selection links', 'links that appear at the very bottom of the page for this theme', 1),
(148, 1, 1, 2, 'gcwu_langselect', 'Liens de sélection de langue', 'links that appear at the very bottom of the page for this theme', 1),
(149, 1, 1, 1, 'gcwu_cmblang_href', '/langselect/lang.php', 'Site or keep the default language script', 1),
(150, 1, 1, 1, 'gcwu_terms_text', 'Terms and conditions', 'Terms and conditions and transparency text', 1),
(151, 1, 1, 2, 'gcwu_terms_text', 'Avis', 'Terms and conditions and transparency text', 1),
(152, 1, 1, 1, 'gcwu_terms_href', '', 'Modify Terms and conditions and Transparency links', 1),
(153, 1, 1, 1, 'gcwu_trans_href', '', 'Modify Terms and conditions and Transparency links', 1),
(154, 1, 1, 1, 'gcwu_trans_text', 'Transparency', 'Modify Terms and conditions and Transparency links', 1),
(155, 1, 1, 2, 'gcwu_trans_text', 'Transparence', 'Modify Terms and conditions and Transparency links', 1),
(156, 1, 1, 1, 'gcwu_sig_image', 'sig', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(157, 1, 1, 1, 'gcwu_sig', 'Government of Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(158, 1, 1, 2, 'gcwu_sig', 'Gouvernement du Canada', 'sets the name of the signature image and alt text used in the top left of the theme', 1),
(159, 1, 1, 1, 'gcwu_wmms', 'Symbol of the Government of Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(160, 1, 1, 2, 'gcwu_wmms', 'Symbole du gouvernement du Canada', 'alt text used for the Canada logo that appears about the search tool', 1),
(161, 1, 1, 1, 'gcwu_gcnavbar', 'Government of Canada navigation bar', 'hidden text used for accessibility', 1),
(162, 1, 1, 2, 'gcwu_gcnavbar', 'Barre de navigation de la gouvernement de Canada', 'hidden text used for accessibility', 1),
(163, 1, 1, 1, 'gcwu_gcfooter', 'Government of Canada footer', 'hidden text used for accessibility', 1),
(164, 1, 1, 2, 'gcwu_gcfooter', 'Pied de page du gouvernement du Canada', 'hidden text used for accessibility', 1),
(165, 1, 1, 1, 'gcwu_gcnb1_href', '#', 'links that appear at the very top of the page for this theme', 1),
(166, 1, 1, 2, 'gcwu_gcnb1_href', '#', 'links that appear at the very top of the page for this theme', 1),
(167, 1, 1, 1, 'gcwu_gcnb1_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(168, 1, 1, 2, 'gcwu_gcnb1_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(169, 1, 1, 1, 'gcwu_gcnb2_href', '#', 'links that appear at the very top of the page for this theme', 1),
(170, 1, 1, 2, 'gcwu_gcnb2_href', '#', 'links that appear at the very top of the page for this theme', 1),
(171, 1, 1, 1, 'gcwu_gcnb2_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(172, 1, 1, 2, 'gcwu_gcnb2_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(173, 1, 1, 1, 'gcwu_gcnb3_href', '#', 'links that appear at the very top of the page for this theme', 1),
(174, 1, 1, 2, 'gcwu_gcnb3_href', '#', 'links that appear at the very top of the page for this theme', 1),
(175, 1, 1, 1, 'gcwu_gcnb3_text', 'Custom link', 'links that appear at the very top of the page for this theme', 1),
(176, 1, 1, 2, 'gcwu_gcnb3_text', 'Lien personnalisé', 'links that appear at the very top of the page for this theme', 1),
(177, 1, 1, 1, 'gcwu_cmblang_text', 'English', 'button and language swap text', 1),
(178, 1, 1, 2, 'gcwu_cmblang_text', 'Français', 'button and language swap text', 1),
(179, 1, 1, 1, 'gcwu_cmblang_title', 'English - English version of the Web page', 'button and language swap text', 1),
(180, 1, 1, 2, 'gcwu_cmblang_title', 'Français - Version française de cette page', 'button and language swap text', 1),
(181, 1, 1, 1, 'gcwu_trail1_href', 'http://healthycanadians.gc.ca/index-eng.php', 'links that appear at the very bottom of the page for this theme', 1),
(182, 1, 1, 2, 'gcwu_trail1_href', 'http://healthycanadians.gc.ca/index-fra.php', 'links that appear at the very bottom of the page for this theme', 1),
(183, 1, 1, 1, 'gcwu_trail1_text', 'Health', 'links that appear at the very bottom of the page for this theme', 1),
(184, 1, 1, 2, 'gcwu_trail1_text', 'Santé', 'links that appear at the very bottom of the page for this theme', 1),
(185, 1, 1, 1, 'gcwu_trail1_textsub', 'healthycanadians.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(186, 1, 1, 2, 'gcwu_trail1_textsub', 'canadiensensante.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(187, 1, 1, 1, 'gcwu_trail_href', 'http://www.voyage.gc.ca/index-eng.asp', 'links that appear at the very bottom of the page for this theme', 1),
(188, 1, 1, 2, 'gcwu_trail2_href', 'http://www.voyage.gc.ca/index-fra.asp', 'links that appear at the very bottom of the page for this theme', 1),
(189, 1, 1, 1, 'gcwu_trail2_text', 'Travel', 'links that appear at the very bottom of the page for this theme', 1),
(190, 1, 1, 2, 'gcwu_trail2_text', 'Voyage', 'links that appear at the very bottom of the page for this theme', 1),
(191, 1, 1, 1, 'gcwu_trail2_textsub', 'travel.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(192, 1, 1, 2, 'gcwu_trail2_textsub', 'voyage.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(193, 1, 1, 1, 'gcwu_trail3_href', 'http://www.servicecanada.gc.ca/eng/home.shtml', 'links that appear at the very bottom of the page for this theme', 1),
(194, 1, 1, 2, 'gcwu_trail3_href', 'http://www.servicecanada.gc.ca/fra/accueil.shtml', 'links that appear at the very bottom of the page for this theme', 1),
(195, 1, 1, 1, 'gcwu_trail3_text', 'Service Canada', 'links that appear at the very bottom of the page for this theme', 1),
(196, 1, 1, 2, 'gcwu_trail3_text', 'Service Canada', 'links that appear at the very bottom of the page for this theme', 1),
(197, 1, 1, 1, 'gcwu_trail3_textsub', 'servicecanada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(198, 1, 1, 2, 'gcwu_trail3_textsub', 'servicecanada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(199, 1, 1, 1, 'gcwu_trail4_href', 'http://www.jobbank.gc.ca/intro-eng.aspx', 'links that appear at the very bottom of the page for this theme', 1),
(200, 1, 1, 2, 'gcwu_trail4_href', 'http://www.guichetemplois.gc.ca/Intro-fra.aspx', 'links that appear at the very bottom of the page for this theme', 1),
(201, 1, 1, 1, 'gcwu_trail4_text', 'Jobs', 'links that appear at the very bottom of the page for this theme', 1),
(202, 1, 1, 2, 'gcwu_trail4_text', 'Emplois', 'links that appear at the very bottom of the page for this theme', 1),
(203, 1, 1, 1, 'gcwu_trail4_textsub', 'jobbank.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(204, 1, 1, 2, 'gcwu_trail4_textsub', 'guichetemplois.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(205, 1, 1, 1, 'gcwu_trail5_href', 'Economy', 'links that appear at the very bottom of the page for this theme', 1),
(206, 1, 1, 2, 'gcwu_trail5_href', 'http://plandaction.gc.ca/fr', 'links that appear at the very bottom of the page for this theme', 1),
(207, 1, 1, 1, 'gcwu_trail5_text', 'Economy', 'links that appear at the very bottom of the page for this theme', 1),
(208, 1, 1, 2, 'gcwu_trail5_text', 'Économie', 'links that appear at the very bottom of the page for this theme', 1),
(209, 1, 1, 1, 'gcwu_trail5_textsub', 'actionplan.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(210, 1, 1, 2, 'gcwu_trail5_textsub', 'plandaction.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(211, 1, 1, 1, 'gcwu_trail_canada_href', 'http://www.canada.gc.ca/menu-eng.html', 'links that appear at the very bottom of the page for this theme', 1),
(212, 1, 1, 2, 'gcwu_trail_canada_href', 'http://www.canada.gc.ca/menu-fra.html', 'links that appear at the very bottom of the page for this theme', 1),
(213, 1, 1, 1, 'gcwu_trail_canada_text', 'Canada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(214, 1, 1, 2, 'gcwu_trail_canada_text', 'Canada.gc.ca', 'links that appear at the very bottom of the page for this theme', 1),
(215, 1, 1, 1, 'gcwu_langselect', 'Language selection links', 'links that appear at the very bottom of the page for this theme', 1),
(216, 1, 1, 2, 'gcwu_langselect', 'Liens de sélection de langue', 'links that appear at the very bottom of the page for this theme', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_resource_type`
--

CREATE TABLE IF NOT EXISTS `app_resource_type` (
  `res_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_type_name` varchar(25) NOT NULL,
  `res_type_description` text NOT NULL,
  PRIMARY KEY (`res_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Specialisation classes of app_resource' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_resource_type`
--

INSERT INTO `app_resource_type` (`res_type_id`, `res_type_name`, `res_type_description`) VALUES
(1, 'UIC', 'This resource describe an element of the user Interface Component (UIC)');

-- --------------------------------------------------------

--
-- Table structure for table `app_site`
--

CREATE TABLE IF NOT EXISTS `app_site` (
  `app_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_site_acronym` varchar(50) NOT NULL,
  `app_site_name` varchar(50) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`app_site_id`),
  KEY `app_design_acronym` (`app_site_acronym`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='App may have zero or many Design template' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_site`
--

INSERT INTO `app_site` (`app_site_id`, `app_site_acronym`, `app_site_name`, `is_default`) VALUES
(1, 'boew-intranet-demo', 'Demo resources for boew intranet theme Design', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_test`
--

CREATE TABLE IF NOT EXISTS `app_test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_no` varchar(15) NOT NULL,
  `test_title` varchar(255) NOT NULL,
  `test_description` text,
  `test_execution` text,
  PRIMARY KEY (`test_id`),
  UNIQUE KEY `test_no` (`test_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_test`
--

INSERT INTO `app_test` (`test_id`, `test_no`, `test_title`, `test_description`, `test_execution`) VALUES
(1, '', 'Table field start with prefix', 'Each table has a prefix defined for starting the name of each table field, for consistency and to support maintainability.\r\n\r\ntest should be a query checking for field in application tables where start of fieldname does not match prefix as defined in app_product for product_type table', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_test_log`
--

CREATE TABLE IF NOT EXISTS `app_test_log` (
  `app_test_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_test_id` int(11) NOT NULL,
  `app_test_success` tinyint(1) NOT NULL,
  KEY `app_test_batch_id` (`app_test_batch_id`),
  KEY `app_test_id` (`app_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cdrl`
--

CREATE TABLE IF NOT EXISTS `cdrl` (
  `cdrl_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `did_id` int(11) DEFAULT NULL,
  `cdrl_no` varchar(15) NOT NULL,
  PRIMARY KEY (`cdrl_id`),
  KEY `project_id` (`project_id`,`contract_id`),
  KEY `cdrl_no` (`cdrl_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `contract_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `contract_no` varchar(50) NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deliverable`
--

CREATE TABLE IF NOT EXISTS `deliverable` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `cdrl_id` int(11) NOT NULL,
  `originator_id` int(11) NOT NULL COMMENT 'originator org_id',
  `doc_no` varchar(50) NOT NULL,
  `doc_title` varchar(255) NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `project_id` (`project_id`,`cdrl_id`,`originator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='org->project->cdrl->deliverable' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) DEFAULT NULL,
  `dept_mgr_id` int(11) DEFAULT NULL,
  `dept_is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`dept_id`),
  KEY `dep_id` (`dept_id`),
  KEY `department_manager_id` (`dept_mgr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_mgr_id`, `dept_is_active`) VALUES
(1, 'C++ Development', NULL, b'1'),
(2, 'Administration', NULL, b'1'),
(3, 'Support', NULL, b'1'),
(4, 'Finance', NULL, b'1'),
(5, 'Web Development', NULL, b'1'),
(6, 'Testing', NULL, b'1'),
(7, 'Design', NULL, b'1'),
(8, 'Documentation', NULL, b'1'),
(9, 'Solutions Development', NULL, b'1'),
(10, 'System Administration', NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `did`
--

CREATE TABLE IF NOT EXISTS `did` (
  `did_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `did_no` varchar(35) NOT NULL,
  `did_name` varchar(255) NOT NULL,
  `did_description` text NOT NULL,
  `did_content` longtext NOT NULL,
  PRIMARY KEY (`did_id`),
  KEY `project_id` (`project_id`),
  KEY `did_no` (`did_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index of Data item Description (DID)' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `event_no` varchar(15) NOT NULL,
  `event_name` varchar(50) NOT NULL,
  `event_description` text NOT NULL,
  `event_start_date` date NOT NULL,
  `event_end_date` date NOT NULL,
  `event_start_time` time NOT NULL,
  `event_end_time` time NOT NULL,
  `event_type_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `event_type_id` (`event_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE IF NOT EXISTS `event_type` (
  `event_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_acronym` varchar(15) NOT NULL,
  `event_type_name` varchar(25) NOT NULL,
  `event_type_description` text NOT NULL,
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Specialisation classes of app_resource' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`event_type_id`, `event_acronym`, `event_type_name`, `event_type_description`) VALUES
(1, 'MTG', 'Meeting', 'A meeting is the reunion of 2 or more person discussing project issues related or not ta specific work task.');

-- --------------------------------------------------------

--
-- Table structure for table `event_type_role`
--

CREATE TABLE IF NOT EXISTS `event_type_role` (
  `event_type_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type_id` int(11) NOT NULL COMMENT 'Related event type ',
  `event_type_role_name` varchar(25) NOT NULL,
  `event_type_role_description` text NOT NULL,
  PRIMARY KEY (`event_type_role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Specialisation classes of app_resource' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `event_type_role`
--

INSERT INTO `event_type_role` (`event_type_role_id`, `event_type_id`, `event_type_role_name`, `event_type_role_description`) VALUES
(1, 1, 'chairperson', 'Manage the good conduct of the meeting. usually the person calling the meeting'),
(2, 1, 'participants', 'Generic meeting attendee role.');

-- --------------------------------------------------------

--
-- Table structure for table `event_x_pers`
--

CREATE TABLE IF NOT EXISTS `event_x_pers` (
  `event_id` int(11) NOT NULL,
  `pers_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`pers_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Who where at an event, and in what role';

-- --------------------------------------------------------

--
-- Stand-in structure for view `menu`
--
CREATE TABLE IF NOT EXISTS `menu` (
`menu_id` int(11)
,`menu_name` varchar(50)
,`menu_id_parent` int(11)
,`menu_link` varchar(50)
);
-- --------------------------------------------------------

--
-- Table structure for table `org`
--

CREATE TABLE IF NOT EXISTS `org` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_acronym` varchar(15) DEFAULT NULL,
  `org_name` varchar(50) NOT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `pers_id` int(11) NOT NULL AUTO_INCREMENT,
  `pers_login` varchar(20) DEFAULT NULL,
  `pers_password` varchar(20) DEFAULT NULL,
  `pers_firstname` varchar(50) DEFAULT NULL,
  `pers_lastname` varchar(50) DEFAULT NULL,
  `pers_title` varchar(50) DEFAULT NULL,
  `pers_group_id` int(11) NOT NULL,
  `pers_position_id` int(11) NOT NULL,
  `pers_email_work` varchar(50) DEFAULT '@asc-csa.gc.ca',
  `pers_email_home` varchar(50) DEFAULT '@gmail.com',
  `pers_picture` varchar(50) DEFAULT 'images/photos/',
  `pers_pic_link` varchar(50) DEFAULT 'http://intranet/',
  `pers_phone_home` varchar(50) DEFAULT NULL,
  `pers_phone_work` varchar(50) DEFAULT NULL,
  `pers_phone_cell` varchar(50) DEFAULT NULL,
  `pers_fax_work` varchar(50) DEFAULT NULL,
  `pers_fax_home` varchar(50) DEFAULT NULL,
  `pers_city` varchar(50) DEFAULT NULL,
  `pers_postalcode` varchar(20) DEFAULT NULL,
  `pers_address` varchar(50) DEFAULT NULL,
  `pers_is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`pers_id`),
  UNIQUE KEY `pers_login` (`pers_login`),
  KEY `pers_group_id` (`pers_group_id`),
  KEY `pers_pos_id` (`pers_position_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`pers_id`, `pers_login`, `pers_password`, `pers_firstname`, `pers_lastname`, `pers_title`, `pers_group_id`, `pers_position_id`, `pers_email_work`, `pers_email_home`, `pers_picture`, `pers_pic_link`, `pers_phone_home`, `pers_phone_work`, `pers_phone_cell`, `pers_fax_work`, `pers_fax_home`, `pers_city`, `pers_postalcode`, `pers_address`, `pers_is_active`) VALUES
(1, 'helen', 'helen', 'Helen', 'eering', 'Support', 1, 3, 'helen@company.com', '@gmail.com', 'images/photos/Helen Deering.jpg', 'http://localhost/cadms', '(364) 134-5455', '(364) 134-5455', '(960) 393-3466', NULL, NULL, NULL, NULL, NULL, b'1'),
(2, 'alexander', 'alexander', 'Alexander', 'r Atkinson', 'Developer', 1, 1, 'alexander@company.com', '@gmail.com', 'images/photos/Alexander Atkinson.jpg', 'http://localhost/cadms', '(364) 354-2646', '(364) 134-5456', '(730) 643-4397', NULL, NULL, NULL, NULL, NULL, b'1'),
(3, 'ken', 'ken', 'Ken', 'rice', 'Developer', 1, 1, 'ken@company.com', '@gmail.com', 'images/photos/Ken Price.jpg', 'http://localhost/cadms', '(264) 823-2367', '(364) 134-5456', '(960) 423-3466', NULL, NULL, NULL, NULL, NULL, b'1'),
(4, 'peter', 'peter', 'Peter', 'Larsen', 'Tester', 1, 6, 'peter@company.com', '@gmail.com', 'images/photos/Peter Larsen.jpg', 'http://localhost/cadms', '(764) 662-2367', '(364) 134-5459', NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(5, 'ignace', 'ignace', 'Ignace', 'ce Shaw', 'Developer', 1, 5, 'ignace@company.com', '@gmail.com', 'images/photos/Ignace Shaw.jpg', 'http://localhost/cadms', '(564) 343-3367', '(364) 134-5411', NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(6, 'george', 'george', 'George', 'nington', 'Developer', 1, 1, 'george@company.com', '@gmail.com', 'images/photos/George Pennington.jpg', 'http://localhost/cadms', '(364) 345-5267', '(364) 134-5413', NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(7, 'andrew', 'andrew', 'Andrew', 'w Scott', 'Developer', 1, 1, 'andrew@company.com', '@gmail.com', 'images/photos/Andrew Scott.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(8, 'serge', 'serge', 'Serge', 'chards', 'Quality Assurance', 1, 6, 'serge@company.com', '@gmail.com', 'images/photos/Serge Richards.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(9, 'victor', 'victor', 'Victor', ' Tomlin', 'Developer', 1, 5, 'victor@company.com', '@gmail.com', 'images/photos/Victor Tomlin.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(10, 'arledge', 'arledge', 'Arledge', 'e Archer', 'Technical Writer', 1, 8, 'arledge@company.com', '@gmail.com', 'images/photos/Arledge Archer.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(11, 'vlad', 'vlad', 'Vlad', 'Young', 'Developer', 1, 1, 'vlad@company.com', '@gmail.com', 'images/photos/Vlad Young.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(12, 'alexz', 'alexz', 'Alex', 'anuck', 'Developer', 1, 9, 'alexz@company.com', '@gmail.com', 'images/photos/Alex Zanuck.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(13, 'dennis', 'dennis', 'Dennis', 'nsfield', 'Tester', 1, 6, 'dennis@company.com', '@gmail.com', 'images/photos/Dennis Mansfield.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(14, 'michael', 'michael', 'Michael', 'l Koenig', 'Developer', 1, 5, 'michael@company.com', '@gmail.com', 'images/photos/Michael Koenig.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(15, 'nick', 'nick', 'Nick', 'rgman', 'Developer', 1, 1, 'nick@company.com', '@gmail.com', 'images/photos/Nick Bergman.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(16, 'alex', 'alex', 'Alex', 'ntion', 'Support', 1, 3, 'alex@company.com', '@gmail.com', 'images/photos/Alex Antion.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(17, 'conrad', 'conrad', 'Conrad', ' Murphy', 'CEO', 1, 2, 'conrad@company.com', '@gmail.com', 'images/photos/Conrad Murphy.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(18, 'vance', 'vance', 'Vance', 'e Cole', 'Corporate Development', 1, 2, 'vance@company.com', '@gmail.com', 'images/photos/Vance Cole.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(19, 'vitas', 'vitas', 'Vitas', 'ynolds', 'Developer', 1, 5, 'vitas@company.com', '@gmail.com', 'images/photos/Vitas Reynolds.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(20, 'alexg', 'alexg', 'Alex', 'Groth', 'Designer', 1, 7, 'alexg@company.com', '@gmail.com', 'images/photos/Alex Groth.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(21, 'michaelb', 'michaelb', 'Michael', ' Barrett', 'Tester', 1, 6, 'michaelb@company.com', '@gmail.com', 'images/photos/Michael Barrett.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(22, 'ian', 'ian', 'Ian', 'rdon', 'Developer', 1, 1, 'ian@company.com', '@gmail.com', 'images/photos/Ian Gordon.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(23, 'alexzi', 'alexzi', 'Alex', ' Zimb', 'Quality Assurance', 1, 6, 'alexzi@company.com', '@gmail.com', 'images/photos/Alex Zimb.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(24, 'alexandern', 'alexandern', 'Alexander', 'er Neville', 'Web Development Manager', 1, 5, 'alexandern@company.com', '@gmail.com', 'images/photos/Alexander Neville.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(25, 'eugene', 'eugene', 'Eugene', ' Zubler', 'C++ Development Manager', 1, 1, 'eugene@company.com', '@gmail.com', 'images/photos/Eugene Zubler.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(26, 'oleg', 'oleg', 'Oleg', 'uglas', 'CTO', 1, 2, 'oleg@company.com', '@gmail.com', 'images/photos/Oleg Douglas.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(27, 'irina', 'irian', 'Irina', 'ouglas', 'Accountant', 1, 4, 'irina@company.com', '@gmail.com', 'images/photos/Irina Douglas.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(28, 'helenp', 'helenp', 'Helen', 'Palmer', 'Accountant', 1, 4, 'helenp@company.com', '@gmail.com', 'images/photos/Helen Palmer.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(29, 'stan', 'stan', 'Stan', 'Simon', 'Developer', 1, 5, 'stan@company.com', '@gmail.com', 'images/photos/Stan Simon.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(30, 'alexk', 'alexk', 'Alex', 'ievel', 'Developer', 1, 5, 'alexk@company.com', '@gmail.com', 'images/photos/Alex Knievel.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(31, 'arty', 'arty', 'Arty', 'Blake', 'Developer', 1, 5, 'arty@company.com', '@gmail.com', 'images/photos/Arty Blake.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(32, 'admin', 'admin', 'George', 'Randall', 'NT Administrator', 2, 10, 'georger@company.com', '@gmail.com', 'images/photos/George Randall.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(33, 'olegt', 'olegt', 'Oleg', 'g Tim', 'Developer', 1, 5, 'olegt@company.com', '@gmail.com', 'images/photos/Oleg Tim.jpg', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1'),
(34, 'stank', 'stank', 'Stan', 'night', 'UNIX Administrator', 2, 10, 'stank@company.com', '@gmail.com', 'images/nophoto.gif', 'http://localhost/cadms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `pos_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `pos_no` varchar(25) NOT NULL,
  `pos_name` varchar(255) NOT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `org_id` (`org_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) DEFAULT NULL,
  `project_is_active` bit(1) DEFAULT b'1',
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `project_id` (`project_id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `project_is_active`, `org_id`) VALUES
(1, 'Radarsat Constellation', b'1', 0),
(2, 'NEOSSat', b'1', 0),
(3, 'International Space Station', b'1', 0),
(4, 'Scisat', b'1', 0),
(5, 'APXS', b'1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_no` varchar(15) NOT NULL,
  `work_name` varchar(255) NOT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `menu`
--
DROP TABLE IF EXISTS `menu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu` AS select `app_menu`.`menu_id` AS `menu_id`,`app_menu`.`menu_name` AS `menu_name`,`app_menu`.`menu_id_parent` AS `menu_id_parent`,`app_menu`.`menu_link` AS `menu_link` from `app_menu`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
