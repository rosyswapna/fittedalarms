-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 21, 2013 at 09:26 AM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fitted_alarms`
--

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflows`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflows` (
  `workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) DEFAULT NULL,
  `summary` varchar(400) NOT NULL,
  `test` text,
  `execution_condition` int(11) NOT NULL,
  `defaultworkflow` int(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workflow_id`),
  UNIQUE KEY `com_vtiger_workflows_idx` (`workflow_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `com_vtiger_workflows`
--

INSERT INTO `com_vtiger_workflows` (`workflow_id`, `module_name`, `summary`, `test`, `execution_condition`, `defaultworkflow`, `type`) VALUES
(1, 'Invoice', 'UpdateInventoryProducts On Every Save', '[{"fieldname":"subject","operation":"does not contain","value":"`!`"}]', 3, 1, 'basic'),
(2, 'Accounts', 'Send Email to user when Notifyowner is True', '[{"fieldname":"notify_owner","operation":"is","value":"true:boolean"}]', 2, 1, 'basic'),
(3, 'Contacts', 'Send Email to user when Notifyowner is True', '[{"fieldname":"notify_owner","operation":"is","value":"true:boolean"}]', 2, 1, 'basic'),
(4, 'Contacts', 'Send Email to user when Portal User is True', '[{"fieldname":"portal","operation":"is","value":"true:boolean"}]', 2, 1, 'basic'),
(5, 'Potentials', 'Send Email to users on Potential creation', NULL, 1, 1, 'basic'),
(6, 'Contacts', 'Workflow for Contact Creation or Modification', '', 3, 1, 'basic'),
(7, 'HelpDesk', 'Workflow for Ticket Created from Portal', '[{"fieldname":"from_portal","operation":"is","value":"true:boolean"}]', 1, 1, 'basic'),
(8, 'HelpDesk', 'Workflow for Ticket Updated from Portal', '[{"fieldname":"from_portal","operation":"is","value":"true:boolean"}]', 4, 1, 'basic'),
(9, 'HelpDesk', 'Workflow for Ticket Change, not from the Portal', '[{"fieldname":"from_portal","operation":"is","value":"false:boolean"}]', 3, 1, 'basic'),
(10, 'Events', 'Workflow for Events when Send Notification is True', '[{"fieldname":"sendnotification","operation":"is","value":"true:boolean"}]', 3, 1, 'basic'),
(11, 'Calendar', 'Workflow for Calendar Todos when Send Notification is True', '[{"fieldname":"sendnotification","operation":"is","value":"true:boolean"}]', 3, 1, 'basic');

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflows_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflows_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflows_seq`
--

INSERT INTO `com_vtiger_workflows_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) DEFAULT NULL,
  `summary` varchar(400) NOT NULL,
  `task` text,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `com_vtiger_workflowtasks_idx` (`task_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `com_vtiger_workflowtasks`
--

INSERT INTO `com_vtiger_workflowtasks` (`task_id`, `workflow_id`, `summary`, `task`) VALUES
(1, 1, '', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:1;s:7:"summary";s:0:"";s:6:"active";b:1;s:10:"methodName";s:15:"UpdateInventory";s:2:"id";i:1;}'),
(2, 2, 'An account has been created ', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";b:0;s:10:"workflowId";i:2;s:7:"summary";s:28:"An account has been created ";s:6:"active";b:1;s:10:"methodName";s:11:"NotifyOwner";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:26:"Regarding Account Creation";s:7:"content";s:301:"An Account has been assigned to you on vtigerCRM<br>Details of account are :<br><br>AccountId:<b>$account_no</b><br>AccountName:<b>$accountname</b><br>Rating:<b>$rating</b><br>Industry:<b>$industry</b><br>AccountType:<b>$accounttype</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin";s:2:"id";i:2;}'),
(3, 3, 'An contact has been created ', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";b:0;s:10:"workflowId";i:3;s:7:"summary";s:28:"An contact has been created ";s:6:"active";b:1;s:10:"methodName";s:11:"NotifyOwner";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:26:"Regarding Contact Creation";s:7:"content";s:305:"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin";s:2:"id";i:3;}'),
(4, 4, 'An contact has been created ', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";b:0;s:10:"workflowId";i:4;s:7:"summary";s:28:"An contact has been created ";s:6:"active";b:1;s:10:"methodName";s:11:"NotifyOwner";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:28:"Regarding Contact Assignment";s:7:"content";s:384:"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>And <b>CustomerPortal Login Details</b> is sent to the EmailID :-$email<br><br>Thank You<br>Admin";s:2:"id";i:4;}'),
(5, 5, 'An Potential has been created ', 'O:11:"VTEmailTask":8:{s:18:"executeImmediately";b:0;s:10:"workflowId";i:5;s:7:"summary";s:30:"An Potential has been created ";s:6:"active";b:1;s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:30:"Regarding Potential Assignment";s:7:"content";s:325:"An Potential has been assigned to you on vtigerCRM<br>Details of Potential are :<br><br>Potential No:<b>$potential_no</b><br>Potential Name:<b>$potentialname</b><br>Amount:<b>$amount</b><br>Expected Close Date:<b>$closingdate</b><br>Type:<b>$opportunity_type</b><br><br><br>Description :$description<br><br>Thank You<br>Admin";s:2:"id";i:5;}'),
(6, 6, 'Email Customer Portal Login Details', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:6;s:7:"summary";s:35:"Email Customer Portal Login Details";s:6:"active";b:1;s:10:"methodName";s:22:"SendPortalLoginDetails";s:2:"id";i:6;}'),
(7, 7, 'Notify Record Owner and the Related Contact when Ticket is created from Portal', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:7;s:7:"summary";s:78:"Notify Record Owner and the Related Contact when Ticket is created from Portal";s:6:"active";b:1;s:10:"methodName";s:28:"NotifyOnPortalTicketCreation";s:2:"id";i:7;}'),
(8, 8, 'Notify Record Owner when Comment is added to a Ticket from Customer Portal', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:8;s:7:"summary";s:74:"Notify Record Owner when Comment is added to a Ticket from Customer Portal";s:6:"active";b:1;s:10:"methodName";s:27:"NotifyOnPortalTicketComment";s:2:"id";i:8;}'),
(9, 9, 'Notify Record Owner on Ticket Change, which is not done from Portal', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:9;s:7:"summary";s:67:"Notify Record Owner on Ticket Change, which is not done from Portal";s:6:"active";b:1;s:10:"methodName";s:25:"NotifyOwnerOnTicketChange";s:2:"id";i:9;}'),
(10, 9, 'Notify Related Customer on Ticket Change, which is not done from Portal', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:9;s:7:"summary";s:71:"Notify Related Customer on Ticket Change, which is not done from Portal";s:6:"active";b:1;s:10:"methodName";s:26:"NotifyParentOnTicketChange";s:2:"id";i:10;}'),
(11, 10, 'Send Notification Email to Record Owner', 'O:11:"VTEmailTask":8:{s:18:"executeImmediately";b:0;s:10:"workflowId";i:10;s:7:"summary";s:39:"Send Notification Email to Record Owner";s:6:"active";b:1;s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:17:"Event :  $subject";s:7:"content";s:817:"$(assigned_user_id : (Users) first_name) $(assigned_user_id : (Users) last_name) ,<br/><b>Activity Notification Details:</b><br/>Subject             : $subject<br/>Start date and time : $date_start  $time_start ( $(general : (__VtigerMeta__) dbtimezone) ) <br/>End date and time   : $due_date  $time_end ( $(general : (__VtigerMeta__) dbtimezone) ) <br/>Status              : $eventstatus <br/>Priority            : $taskpriority <br/>Related To          : $(parent_id : (Leads) lastname) $(parent_id : (Leads) firstname) $(parent_id : (Accounts) accountname) $(parent_id : (Potentials) potentialname) $(parent_id : (HelpDesk) ticket_title) <br/>Contacts List       : $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname) <br/>Location            : $location <br/>Description         : $description";s:2:"id";i:11;}'),
(12, 11, 'Send Notification Email to Record Owner', 'O:11:"VTEmailTask":8:{s:18:"executeImmediately";b:0;s:10:"workflowId";i:11;s:7:"summary";s:39:"Send Notification Email to Record Owner";s:6:"active";b:1;s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:16:"Task :  $subject";s:7:"content";s:797:"$(assigned_user_id : (Users) first_name) $(assigned_user_id : (Users) last_name) ,<br/><b>Task Notification Details:</b><br/>Subject : $subject<br/>Start date and time : $date_start  $time_start ( $(general : (__VtigerMeta__) dbtimezone) ) <br/>End date and time   : $due_date ( $(general : (__VtigerMeta__) dbtimezone) ) <br/>Status              : $taskstatus <br/>Priority            : $taskpriority <br/>Related To          : $(parent_id : (Leads) lastname) $(parent_id : (Leads) firstname) $(parent_id : (Accounts) accountname) $(parent_id         : (Potentials) potentialname) $(parent_id : (HelpDesk) ticket_title) <br/>Contacts List       : $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname) <br/>Location            : $location <br/>Description         : $description";s:2:"id";i:12;}');

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks_entitymethod`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_entitymethod` (
  `workflowtasks_entitymethod_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `function_path` varchar(400) DEFAULT NULL,
  `function_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workflowtasks_entitymethod_id`),
  UNIQUE KEY `com_vtiger_workflowtasks_entitymethod_idx` (`workflowtasks_entitymethod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflowtasks_entitymethod`
--

INSERT INTO `com_vtiger_workflowtasks_entitymethod` (`workflowtasks_entitymethod_id`, `module_name`, `method_name`, `function_path`, `function_name`) VALUES
(1, 'SalesOrder', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel'),
(2, 'Invoice', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel'),
(3, 'Contacts', 'SendPortalLoginDetails', 'modules/Contacts/ContactsHandler.php', 'Contacts_sendCustomerPortalLoginDetails'),
(4, 'HelpDesk', 'NotifyOnPortalTicketCreation', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_nofifyOnPortalTicketCreation'),
(5, 'HelpDesk', 'NotifyOnPortalTicketComment', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyOnPortalTicketComment'),
(6, 'HelpDesk', 'NotifyOwnerOnTicketChange', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyOwnerOnTicketChange'),
(7, 'HelpDesk', 'NotifyParentOnTicketChange', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyParentOnTicketChange');

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks_entitymethod_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_entitymethod_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflowtasks_entitymethod_seq`
--

INSERT INTO `com_vtiger_workflowtasks_entitymethod_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflowtasks_seq`
--

INSERT INTO `com_vtiger_workflowtasks_seq` (`id`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtask_queue`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtask_queue` (
  `task_id` int(11) DEFAULT NULL,
  `entity_id` varchar(100) DEFAULT NULL,
  `do_after` int(11) DEFAULT NULL,
  UNIQUE KEY `com_vtiger_workflowtask_queue_idx` (`task_id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtemplates`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtemplates` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) DEFAULT NULL,
  `title` varchar(400) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflow_activatedonce`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflow_activatedonce` (
  `workflow_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`workflow_id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_address`
--

CREATE TABLE IF NOT EXISTS `ft_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ft_address`
--

INSERT INTO `ft_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'abc', 'abc', '', '', '', 'abc', 'abc', 'abc', 'hgjgh', 224, 3679);

-- --------------------------------------------------------

--
-- Table structure for table `ft_affiliate`
--

CREATE TABLE IF NOT EXISTS `ft_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `ft_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_attribute`
--

CREATE TABLE IF NOT EXISTS `ft_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ft_attribute`
--

INSERT INTO `ft_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ft_attribute_description`
--

CREATE TABLE IF NOT EXISTS `ft_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_attribute_description`
--

INSERT INTO `ft_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `ft_attribute_group`
--

CREATE TABLE IF NOT EXISTS `ft_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ft_attribute_group`
--

INSERT INTO `ft_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ft_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `ft_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_attribute_group_description`
--

INSERT INTO `ft_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `ft_banner`
--

CREATE TABLE IF NOT EXISTS `ft_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ft_banner`
--

INSERT INTO `ft_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Fitted Alarms banner', 1),
(8, 'Manufacturers', 1),
(9, 'second banner', 1),
(10, 'right banner', 1),
(12, 'facebookbanner', 1),
(13, 'google banner', 1),
(14, 'twitterbanner', 1),
(15, 'Youtubebanner', 1),
(16, 'add', 1),
(17, 'how it works', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_banner_image`
--

CREATE TABLE IF NOT EXISTS `ft_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

--
-- Dumping data for table `ft_banner_image`
--

INSERT INTO `ft_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(84, 7, '', 'data/slide4.jpg'),
(83, 7, '', 'data/banner6.jpg'),
(77, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_banner.jpg'),
(75, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=5', 'data/demo/htc_logo.jpg'),
(73, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=8', 'data/demo/apple_logo.jpg'),
(74, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=9', 'data/demo/canon_logo.jpg'),
(71, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=10', 'data/demo/sony_logo.jpg'),
(72, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=6', 'data/demo/palm_logo.jpg'),
(76, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_logo.jpg'),
(82, 7, '', 'data/slide1.jpg'),
(85, 7, '', 'data/slide3.jpg'),
(86, 7, '', 'data/banner5.jpg'),
(88, 9, '', 'data/installation_with_warranty.png'),
(89, 9, '', 'data/no-hidden-charges.png'),
(90, 9, '', 'data/quick-fitting.png'),
(91, 9, '', 'data/certified-installers.png'),
(92, 9, '', 'data/fctax.png'),
(107, 13, '', 'data/google+.jpg'),
(103, 10, '', 'data/survey.jpg'),
(108, 12, '', 'data/facebook.jpg'),
(109, 14, '', 'data/twitter.jpg'),
(110, 15, '', 'data/youtube.jpg'),
(112, 16, '', 'data/cctv_add.jpg'),
(113, 17, '', 'data/howitworks.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ft_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `ft_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_banner_image_description`
--

INSERT INTO `ft_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(84, 1, 7, 'slider3'),
(77, 1, 6, 'HP Banner'),
(75, 1, 8, 'HTC'),
(74, 1, 8, 'Canon'),
(73, 1, 8, 'Apple'),
(72, 1, 8, 'Palm'),
(71, 1, 8, 'Sony'),
(76, 1, 8, 'Hewlett-Packard'),
(83, 1, 7, 'slider2'),
(82, 1, 7, 'slider1'),
(85, 1, 7, 'slider4'),
(86, 1, 7, 'slider5'),
(88, 1, 9, '1st '),
(89, 1, 9, '2nd'),
(90, 1, 9, '3rd'),
(91, 1, 9, '4th'),
(92, 1, 9, '5th'),
(108, 1, 12, 'facebook'),
(103, 1, 10, 'banner1'),
(107, 1, 13, 'google'),
(109, 1, 14, 'twitter'),
(110, 1, 15, 'youtube'),
(112, 1, 16, 'add'),
(113, 1, 17, 'pic');

-- --------------------------------------------------------

--
-- Table structure for table `ft_callback_request`
--

CREATE TABLE IF NOT EXISTS `ft_callback_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `postcode` text NOT NULL,
  `email` text NOT NULL,
  `call_backtime` text NOT NULL,
  `product` text NOT NULL,
  `contact_number` text NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `ft_callback_request`
--

INSERT INTO `ft_callback_request` (`id`, `name`, `postcode`, `email`, `call_backtime`, `product`, `contact_number`, `created_time`) VALUES
(1, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-02 10:35:06'),
(2, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-02 11:16:31'),
(3, 'gfhgf', 'hgjgh', 'lorath@gmail.com', 'fgh', '59', '32323', '2013-08-02 11:17:45'),
(4, 'gfhhgfh', 'hgjgh', 'fjg', '5', '59', '32323', '2013-08-05 07:44:59'),
(5, 'khg', 'hgjgh', 'fjg', '5', '59', '32323', '2013-08-05 07:45:26'),
(6, 'yre', 'rey', 'fjg', '5', '59', '32323', '2013-08-05 07:52:31'),
(7, '', '', '', '', '59', '', '2013-08-05 07:53:06'),
(8, '', '', '', '', '59', '', '2013-08-05 07:53:27'),
(9, 'gfhgf', 'hgjgh', 'fjg', 'fgh', '59', '32323', '2013-08-05 07:56:15'),
(10, 'jgfjf', 'gf', 'gfjf', '', '59', '', '2013-08-05 07:58:30'),
(11, '', '', '', '', '59', '', '2013-08-05 07:59:06'),
(12, 'dfhfd', 'dfh', 'df', 'fdhfd', '59', '32323', '2013-08-05 07:59:48'),
(13, 'gf', 'gfj', 'fjg', '5', '59', '32323', '2013-08-05 08:01:15'),
(14, 'gf', '', '', '', '59', '', '2013-08-05 08:02:24'),
(15, '', '', '', '', '59', '', '2013-08-05 08:02:39'),
(16, 'fjggfj', 'gfjf', 'fjg', '5', '59', '32323', '2013-08-05 08:03:04'),
(17, '', '', '', '', '59', '', '2013-08-05 08:04:40'),
(18, 'jhh', 'hgjgh', 'fjg', '5', '59', '32323', '2013-08-05 08:05:55'),
(19, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-05 08:09:32'),
(20, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-05 09:10:19'),
(21, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-05 09:11:30'),
(34, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-06 11:38:16'),
(35, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-06 11:39:48'),
(36, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-06 11:59:01'),
(37, 'fdtgdfgd', 'dgfgdf', 'lorath@gmail.com', '5', '59', '32323', '2013-08-07 06:06:54'),
(38, 'hgjhg', 'hgjgh', 'lorath@gmail.com', '5', '59', '32323', '2013-08-07 06:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `ft_category`
--

CREATE TABLE IF NOT EXISTS `ft_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Dumping data for table `ft_category`
--

INSERT INTO `ft_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(77, '', 73, 0, 1, 1, 1, '2013-07-22 12:37:49', '2013-07-22 12:37:49'),
(61, '', 0, 1, 1, 3, 1, '2013-07-16 10:52:15', '2013-07-22 12:41:08'),
(60, '', 0, 1, 1, 2, 1, '2013-07-16 10:51:37', '2013-07-22 12:31:13'),
(68, '', 59, 0, 1, 0, 1, '2013-07-22 11:59:39', '2013-07-22 11:59:39'),
(69, '', 68, 0, 1, 0, 1, '2013-07-22 12:00:25', '2013-07-22 12:00:25'),
(70, '', 68, 0, 1, 0, 1, '2013-07-22 12:27:43', '2013-07-22 12:27:43'),
(71, '', 68, 0, 1, 0, 1, '2013-07-22 12:28:57', '2013-07-22 12:28:57'),
(72, '', 60, 0, 1, 1, 1, '2013-07-22 12:31:49', '2013-07-22 12:32:49'),
(73, '', 60, 0, 1, 2, 1, '2013-07-22 12:32:10', '2013-07-22 12:32:38'),
(74, '', 60, 0, 1, 3, 1, '2013-07-22 12:33:02', '2013-07-22 12:33:02'),
(75, '', 72, 0, 1, 1, 1, '2013-07-22 12:33:40', '2013-07-22 12:33:40'),
(76, '', 72, 0, 1, 2, 1, '2013-07-22 12:34:07', '2013-07-22 12:34:07'),
(79, '', 61, 0, 1, 1, 1, '2013-07-22 12:43:08', '2013-07-22 12:43:08'),
(78, '', 74, 0, 1, 1, 1, '2013-07-22 12:39:42', '2013-07-22 12:39:42'),
(59, '', 0, 1, 1, 1, 1, '2013-07-16 10:50:56', '2013-07-22 12:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `ft_category_description`
--

CREATE TABLE IF NOT EXISTS `ft_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_category_description`
--

INSERT INTO `ft_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(60, 1, 'Safes', '', '', ''),
(61, 1, 'CCTVs', '', '', ''),
(68, 1, 'Yale', '', '', ''),
(69, 1, 'Yale Smart Home Alarm', '', '', ''),
(70, 1, 'Yale 6200 Pet Friendly', '', '', ''),
(71, 1, 'Yale 6300', '', '', ''),
(72, 1, 'Fire Safes', '', '', ''),
(73, 1, 'Certified Safes', '', '', ''),
(74, 1, 'Security Safes', '', '', ''),
(75, 1, 'Medium Fire Safe', '', '', ''),
(76, 1, 'Large Fire Safe', '', '', ''),
(77, 1, 'Home Safe', '', '', ''),
(78, 1, 'Compact Safes', '', '', ''),
(79, 1, '2 Camera cctv system', '', '', ''),
(59, 1, 'Home Alarms', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ft_category_filter`
--

CREATE TABLE IF NOT EXISTS `ft_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_category_path`
--

CREATE TABLE IF NOT EXISTS `ft_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_category_path`
--

INSERT INTO `ft_category_path` (`category_id`, `path_id`, `level`) VALUES
(76, 76, 2),
(76, 72, 1),
(76, 60, 0),
(75, 75, 2),
(75, 72, 1),
(75, 60, 0),
(74, 74, 1),
(74, 60, 0),
(73, 73, 1),
(73, 60, 0),
(72, 72, 1),
(72, 60, 0),
(71, 71, 2),
(71, 68, 1),
(71, 59, 0),
(70, 70, 2),
(70, 68, 1),
(70, 59, 0),
(69, 69, 2),
(69, 68, 1),
(69, 59, 0),
(68, 68, 1),
(61, 61, 0),
(68, 59, 0),
(60, 60, 0),
(77, 60, 0),
(79, 79, 1),
(79, 61, 0),
(78, 78, 2),
(78, 74, 1),
(78, 60, 0),
(77, 77, 2),
(77, 73, 1),
(59, 59, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `ft_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_category_to_store`
--

CREATE TABLE IF NOT EXISTS `ft_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_category_to_store`
--

INSERT INTO `ft_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0),
(61, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_contact`
--

CREATE TABLE IF NOT EXISTS `ft_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `postcode` text NOT NULL,
  `email` text NOT NULL,
  `call_backtime` text NOT NULL,
  `contact_number` text NOT NULL,
  `comments` text NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_country`
--

CREATE TABLE IF NOT EXISTS `ft_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `ft_country`
--

INSERT INTO `ft_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(240, 'Jersey', 'JE', 'JEY', '', 1, 1),
(241, 'Guernsey', 'GG', 'GGY', '', 1, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_coupon`
--

CREATE TABLE IF NOT EXISTS `ft_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ft_coupon`
--

INSERT INTO `ft_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `ft_coupon_category`
--

CREATE TABLE IF NOT EXISTS `ft_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_coupon_history`
--

CREATE TABLE IF NOT EXISTS `ft_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_coupon_product`
--

CREATE TABLE IF NOT EXISTS `ft_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_currency`
--

CREATE TABLE IF NOT EXISTS `ft_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ft_currency`
--

INSERT INTO `ft_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.65030003, 1, '2013-08-05 09:57:44'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2013-08-06 09:44:22'),
(3, 'Euro', 'EUR', '', '€', '2', 0.75279999, 1, '2013-08-05 09:57:44'),
(4, 'rupees', 'Rup', 'rs', '', '2', 59.59999847, 1, '2013-07-04 16:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer`
--

CREATE TABLE IF NOT EXISTS `ft_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ft_customer`
--

INSERT INTO `ft_customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'abc', 'abc', 'lorath@gmail.com', '456568989899', '', 'a712b5cf28019973c901dbb25380cfc87b4fc703', '1dab36014', 'a:0:{}', '', 0, 1, 1, '127.0.0.1', 1, 1, '', '2013-08-19 11:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `ft_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_field`
--

CREATE TABLE IF NOT EXISTS `ft_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_group`
--

CREATE TABLE IF NOT EXISTS `ft_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ft_customer_group`
--

INSERT INTO `ft_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `ft_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_customer_group_description`
--

INSERT INTO `ft_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_history`
--

CREATE TABLE IF NOT EXISTS `ft_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_ip`
--

CREATE TABLE IF NOT EXISTS `ft_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ft_customer_ip`
--

INSERT INTO `ft_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2013-08-19 11:08:40');

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_online`
--

CREATE TABLE IF NOT EXISTS `ft_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_reward`
--

CREATE TABLE IF NOT EXISTS `ft_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `ft_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_custom_field`
--

CREATE TABLE IF NOT EXISTS `ft_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `ft_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_custom_field_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `ft_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `ft_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `ft_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_download`
--

CREATE TABLE IF NOT EXISTS `ft_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_download_description`
--

CREATE TABLE IF NOT EXISTS `ft_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_extension`
--

CREATE TABLE IF NOT EXISTS `ft_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=459 ;

--
-- Dumping data for table `ft_extension`
--

INSERT INTO `ft_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(435, 'module', 'vqmod_manager'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(438, 'module', 'category'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(447, 'module', 'featured'),
(436, 'module', 'menu'),
(428, 'module', 'custom_banner'),
(456, 'module', 'testimonial'),
(430, 'module', 'settings'),
(431, 'module', 'styler'),
(440, 'module', 'special'),
(442, 'module', 'store'),
(448, 'module', 'kdo_category'),
(444, 'module', 'banner'),
(455, 'module', 'information'),
(451, 'module', 'welcome'),
(452, 'module', 'footerspecail'),
(454, 'module', 'nivoslider'),
(457, 'module', 'tagcloud'),
(458, 'module', 'viewed');

-- --------------------------------------------------------

--
-- Table structure for table `ft_filter`
--

CREATE TABLE IF NOT EXISTS `ft_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_filter_description`
--

CREATE TABLE IF NOT EXISTS `ft_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_filter_group`
--

CREATE TABLE IF NOT EXISTS `ft_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `ft_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_geo_zone`
--

CREATE TABLE IF NOT EXISTS `ft_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ft_geo_zone`
--

INSERT INTO `ft_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `ft_getqoute`
--

CREATE TABLE IF NOT EXISTS `ft_getqoute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gt_name` text NOT NULL,
  `gt_postcode` text NOT NULL,
  `gt_email` text NOT NULL,
  `gt_num` text NOT NULL,
  `gt_product` text NOT NULL,
  `gt_comments` text NOT NULL,
  `gt_callback_time` text NOT NULL,
  `gt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ft_getqoute`
--

INSERT INTO `ft_getqoute` (`id`, `gt_name`, `gt_postcode`, `gt_email`, `gt_num`, `gt_product`, `gt_comments`, `gt_callback_time`, `gt_time`) VALUES
(1, 'gfhgf', 'hgjgh', 'lorath@gmail.com', 'hgjhg', '59', 'gfhgf', 'fgh', '2013-08-02 11:14:14'),
(2, '', '', '', '', '59', '', '', '2013-08-06 11:09:13'),
(3, '', '', '', '', '59', '', '', '2013-08-06 11:09:20'),
(4, 'hgjhg', 'hgjhg', 'lorath@gmail.com', 'gfhf', '59', 'werw', '5', '2013-08-06 11:57:00'),
(5, 'gfhgf', 'hgjgh', 'lorath@gmail.com', 'gfhf', '59', 'gfdg', '5', '2013-08-06 11:57:47'),
(6, 'gfhgf', 'hgjgh', 'lorath@gmail.com', 'gfhf', '59', 'dfg', '5', '2013-08-06 11:58:37'),
(7, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '43erwrew', '59', 'tryrty tryry rtytry', '5', '2013-08-07 06:07:34'),
(8, 'gfhgf', 'hgjgh', 'lorath@gmail.com', '43erwrew', '59', 'uyiy', '5', '2013-08-21 07:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `ft_information`
--

CREATE TABLE IF NOT EXISTS `ft_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ft_information`
--

INSERT INTO `ft_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 0),
(4, 1, 1, 0),
(5, 1, 4, 1),
(6, 1, 2, 0),
(7, 1, 5, 1),
(8, 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_information_description`
--

CREATE TABLE IF NOT EXISTS `ft_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_information_description`
--

INSERT INTO `ft_information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(4, 1, 'Home Alarms', '&lt;p&gt;&lt;a href=&quot;http://fittedhomealarms.local/index.php?route=product/category&amp;amp;path=59&quot;&gt;Home Alarms&lt;/a&gt;&lt;/p&gt;\r\n'),
(6, 1, 'Safes', '&lt;p&gt;&lt;a href=&quot;http://fittedhomealarms.local/index.php?route=product/category&amp;amp;path=60&quot;&gt;Safes&lt;/a&gt;&lt;/p&gt;\r\n'),
(3, 1, 'CCTVs', '&lt;p&gt;&lt;a href=&quot;http://fittedhomealarms.local/index.php?route=product/category&amp;amp;path=61&quot;&gt;CCTVs&lt;/a&gt;&lt;/p&gt;\r\n'),
(7, 1, 'Alarms/CCTV Installation', '&lt;p&gt;&lt;a href=&quot;http://www.fittedhomealarms.co.uk/cctv-installation.php&quot;&gt;Alarms/CCTV Installation&lt;/a&gt;&lt;/p&gt;\r\n'),
(8, 1, 'Express Installation', '&lt;p&gt;&lt;a href=&quot;http://www.fittedhomealarms.co.uk/express_install.php&quot;&gt;Express Installation&lt;/a&gt;&lt;/p&gt;\r\n'),
(5, 1, 'Alarms Servicing', '&lt;p&gt;&lt;a href=&quot;http://www.fittedhomealarms.co.uk/alarm-servicing.php&quot;&gt;Alarms Servicing&lt;/a&gt;&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `ft_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `ft_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_information_to_store`
--

CREATE TABLE IF NOT EXISTS `ft_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_information_to_store`
--

INSERT INTO `ft_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_language`
--

CREATE TABLE IF NOT EXISTS `ft_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ft_language`
--

INSERT INTO `ft_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_layout`
--

CREATE TABLE IF NOT EXISTS `ft_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ft_layout`
--

INSERT INTO `ft_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information');

-- --------------------------------------------------------

--
-- Table structure for table `ft_layout_route`
--

CREATE TABLE IF NOT EXISTS `ft_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `ft_layout_route`
--

INSERT INTO `ft_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(33, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(37, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap');

-- --------------------------------------------------------

--
-- Table structure for table `ft_length_class`
--

CREATE TABLE IF NOT EXISTS `ft_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ft_length_class`
--

INSERT INTO `ft_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `ft_length_class_description`
--

CREATE TABLE IF NOT EXISTS `ft_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ft_length_class_description`
--

INSERT INTO `ft_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `ft_manufacturer`
--

CREATE TABLE IF NOT EXISTS `ft_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `ft_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_menuitems`
--

CREATE TABLE IF NOT EXISTS `ft_menuitems` (
  `menu_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `sort_order` int(3) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `menu_id` int(11) unsigned NOT NULL,
  `menu_item_class` varchar(100) DEFAULT NULL,
  `menu_item_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ft_menuitems`
--

INSERT INTO `ft_menuitems` (`menu_item_id`, `parent_id`, `sort_order`, `status`, `menu_id`, `menu_item_class`, `menu_item_link`) VALUES
(1, 0, 0, 1, 1, '', '#'),
(2, 0, 0, 1, 1, '', '#'),
(3, 0, 0, 1, 1, '', '#'),
(4, 0, 0, 1, 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ft_menuitem_descriptions`
--

CREATE TABLE IF NOT EXISTS `ft_menuitem_descriptions` (
  `menu_item_id` int(11) unsigned NOT NULL,
  `language_id` int(11) unsigned NOT NULL,
  `menu_item_name` varchar(255) DEFAULT NULL,
  `menu_item_description` text,
  PRIMARY KEY (`menu_item_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_menuitem_descriptions`
--

INSERT INTO `ft_menuitem_descriptions` (`menu_item_id`, `language_id`, `menu_item_name`, `menu_item_description`) VALUES
(1, 1, 'Best Sellers', ''),
(2, 1, 'Yale', ''),
(3, 1, 'Compact', ''),
(4, 1, 'Product A', '');

-- --------------------------------------------------------

--
-- Table structure for table `ft_menus`
--

CREATE TABLE IF NOT EXISTS `ft_menus` (
  `menu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_description` text,
  `menu_class` varchar(150) DEFAULT '"menu"',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ft_menus`
--

INSERT INTO `ft_menus` (`menu_id`, `menu_name`, `menu_description`, `menu_class`, `status`) VALUES
(1, 'Fitted sp menu', '', 'menu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_option`
--

CREATE TABLE IF NOT EXISTS `ft_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ft_option`
--

INSERT INTO `ft_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_option_description`
--

CREATE TABLE IF NOT EXISTS `ft_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_option_description`
--

INSERT INTO `ft_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `ft_option_value`
--

CREATE TABLE IF NOT EXISTS `ft_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `ft_option_value`
--

INSERT INTO `ft_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ft_option_value_description`
--

CREATE TABLE IF NOT EXISTS `ft_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_option_value_description`
--

INSERT INTO `ft_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `ft_order`
--

CREATE TABLE IF NOT EXISTS `ft_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ft_order`
--

INSERT INTO `ft_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_company_id`, `payment_tax_id`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2013-00', 0, 'Fittedhomealarms', 'http://fittedhomealarms.local/', 0, 1, 'tretre', 'ret5435', 'lorath@gmail.com', '456568989899', '', 'tretre', 'ret5435', '', '', '', 'wetr', 'dsdff', 'dsfsf', 'sdffds', 'Yemen', 235, 'Hajjah', 3796, '', 'Cash On Delivery', 'cod', 'tretre', 'ret5435', '', 'wetr', 'dsdff', 'dsfsf', 'sdffds', 'Yemen', 235, 'Hajjah', 3796, '', 'Flat Shipping Rate', 'flat.flat', '', '155.0000', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-gb,en;q=0.5', '2013-08-08 11:09:04', '2013-08-08 11:09:06'),
(2, 0, 'INV-2013-00', 0, 'Fittedhomealarms', 'http://fittedhomealarms.local/', 1, 1, 'abc', 'abc', 'lorath@gmail.com', '456568989899', '', 'abc', 'abc', '', '', '', 'abc', 'abc', 'abc', 'hgjgh', 'United States Minor Outlying Islands', 224, 'Howland Island', 3679, '', 'Cash On Delivery', 'cod', 'abc', 'abc', '', 'abc', 'abc', 'abc', 'hgjgh', 'United States Minor Outlying Islands', 224, 'Howland Island', 3679, '', 'Flat Shipping Rate', 'flat.flat', '', '5.0000', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-gb,en;q=0.5', '2013-08-19 11:09:06', '2013-08-19 11:09:09'),
(3, 0, 'INV-2013-00', 0, 'Fittedhomealarms', 'http://fittedhomealarms.local/', 1, 1, 'abc', 'abc', 'lorath@gmail.com', '456568989899', '', 'abc', 'abc', '', '', '', 'abc', 'abc', 'abc', 'hgjgh', 'United States Minor Outlying Islands', 224, 'Howland Island', 3679, '', 'Cash On Delivery', 'cod', 'abc', 'abc', '', 'abc', 'abc', 'abc', 'hgjgh', 'United States Minor Outlying Islands', 224, 'Howland Island', 3679, '', 'Flat Shipping Rate', 'flat.flat', '', '5.0000', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-gb,en;q=0.5', '2013-08-19 11:13:08', '2013-08-19 11:13:10'),
(4, 0, 'INV-2013-00', 0, 'Fittedhomealarms', 'http://fittedhomealarms.local/', 0, 1, 'llll', 'llll', 'lorath@gmail.com', '456568989899', '', 'llll', 'llll', '', '', '', 'llhgfhgf', 'll', 'll', 'll', 'Latvia', 117, 'Liepajas Rajons', 1831, '', 'Cash On Delivery', 'cod', 'llll', 'llll', '', 'llhgfhgf', 'll', 'll', 'll', 'Latvia', 117, 'Liepajas Rajons', 1831, '', 'Flat Shipping Rate', 'flat.flat', '', '5.0000', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-gb,en;q=0.5', '2013-08-19 11:17:43', '2013-08-19 11:17:45'),
(5, 0, 'INV-2013-00', 0, 'Fittedhomealarms', 'http://fittedhomealarms.local/', 0, 1, 'uyyt', 'utyu', 'lorath@gmail.com', '456568989899', '', 'uyyt', 'utyu', '', '', '', 'trrrtywrew', 'wer', 'ewrw', 'werwer', 'India', 99, 'Kerala', 1490, '', 'Cash On Delivery', 'cod', 'uyyt', 'utyu', '', 'trrrtywrew', 'wer', 'ewrw', 'werwer', 'India', 99, 'Kerala', 1490, '', 'Flat Shipping Rate', 'flat.flat', '', '5.0000', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-gb,en;q=0.5', '2013-08-19 11:23:43', '2013-08-19 11:23:44'),
(6, 0, 'INV-2013-00', 0, 'Fittedhomealarms', 'http://fittedhomealarms.local/', 0, 1, 'dfsfs', 'sdfsd', 'lorath@gmail.com', '456568989899', '', 'dfsfs', 'sdfsd', '', '', '', 'jfgfjfg', 'fgjgf', 'gfjgfjf', 'werwer', 'India', 99, 'Kerala', 1490, '', 'Cash On Delivery', 'cod', 'dfsfs', 'sdfsd', '', 'jfgfjfg', 'fgjgf', 'gfjgfjf', 'werwer', 'India', 99, 'Kerala', 1490, '', 'Flat Shipping Rate', 'flat.flat', '', '5.0000', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-gb,en;q=0.5', '2013-08-19 11:36:56', '2013-08-19 11:36:58'),
(7, 0, 'INV-2013-00', 0, 'Fittedhomealarms', 'http://fittedhomealarms.local/', 0, 1, 'hhk', 'KH', 'lorath@gmail.com', '456568989899', '', 'hhk', 'KH', '', '', '', 'KJLHKL', 'JHKJH', 'KHKLH', 'werwer', 'India', 99, 'Kerala', 1490, '', 'Cash On Delivery', 'cod', 'hhk', 'KH', '', 'KJLHKL', 'JHKJH', 'KHKLH', 'werwer', 'India', 99, 'Kerala', 1490, '', 'Flat Shipping Rate', 'flat.flat', '', '605.0000', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-gb,en;q=0.5', '2013-08-19 13:24:55', '2013-08-19 13:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_download`
--

CREATE TABLE IF NOT EXISTS `ft_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_field`
--

CREATE TABLE IF NOT EXISTS `ft_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_fraud`
--

CREATE TABLE IF NOT EXISTS `ft_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_history`
--

CREATE TABLE IF NOT EXISTS `ft_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ft_order_history`
--

INSERT INTO `ft_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 1, '', '2013-08-08 11:09:06'),
(2, 2, 1, 1, '', '2013-08-19 11:09:09'),
(3, 3, 1, 1, '', '2013-08-19 11:13:10'),
(4, 4, 1, 1, '', '2013-08-19 11:17:45'),
(5, 5, 1, 1, '', '2013-08-19 11:23:44'),
(6, 6, 1, 1, '', '2013-08-19 11:36:58'),
(7, 7, 1, 1, '', '2013-08-19 13:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_option`
--

CREATE TABLE IF NOT EXISTS `ft_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_product`
--

CREATE TABLE IF NOT EXISTS `ft_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ft_order_product`
--

INSERT INTO `ft_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 57, '2 CAMERA CCTV SYSTEM FULLY FITTED FOR £749 (Inc.VAT)', 'product1', 1, '150.0000', '150.0000', '0.0000', 0),
(2, 1, 55, 'Home Safe at £ 249 (Inc.VAT)', 'abc123', 1, '0.0000', '0.0000', '0.0000', 0),
(3, 2, 58, 'test', 'test', 1, '0.0000', '0.0000', '0.0000', 0),
(4, 2, 56, 'Compact Safe at £ 199 (Inc.VAT)', 'abc123', 1, '0.0000', '0.0000', '0.0000', 0),
(5, 3, 56, 'Compact Safe at £ 199 (Inc.VAT)', 'abc123', 1, '0.0000', '0.0000', '0.0000', 0),
(6, 3, 58, 'test', 'test', 1, '0.0000', '0.0000', '0.0000', 0),
(7, 4, 58, 'test', 'test', 1, '0.0000', '0.0000', '0.0000', 0),
(8, 4, 56, 'Compact Safe at £ 199 (Inc.VAT)', 'abc123', 1, '0.0000', '0.0000', '0.0000', 0),
(9, 5, 66, 'test4', 'test4', 1, '0.0000', '0.0000', '0.0000', 0),
(10, 5, 56, 'Compact Safe at £ 199 (Inc.VAT)', 'abc123', 1, '0.0000', '0.0000', '0.0000', 0),
(11, 6, 67, 'test5', 'test5', 1, '0.0000', '0.0000', '0.0000', 0),
(12, 6, 56, 'Compact Safe at £ 199 (Inc.VAT)', 'abc123', 1, '0.0000', '0.0000', '0.0000', 0),
(13, 7, 56, 'Compact Safe at £ 199 (Inc.VAT)', 'abc123', 2, '200.0000', '400.0000', '0.0000', 0),
(14, 7, 58, 'test', 'test', 1, '50.0000', '50.0000', '0.0000', 0),
(15, 7, 59, 'test2', 'test2', 1, '0.0000', '0.0000', '0.0000', 0),
(16, 7, 57, '2 CAMERA CCTV SYSTEM FULLY FITTED FOR £749 (Inc.VAT)', 'product1', 1, '150.0000', '150.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_status`
--

CREATE TABLE IF NOT EXISTS `ft_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ft_order_status`
--

INSERT INTO `ft_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_total`
--

CREATE TABLE IF NOT EXISTS `ft_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `ft_order_total`
--

INSERT INTO `ft_order_total` (`order_total_id`, `order_id`, `code`, `title`, `text`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '$150.00', '150.0000', 1),
(2, 1, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(3, 1, 'total', 'Total', '$155.00', '155.0000', 9),
(4, 2, 'sub_total', 'Sub-Total', '$0.00', '0.0000', 1),
(5, 2, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(6, 2, 'total', 'Total', '$5.00', '5.0000', 9),
(7, 3, 'sub_total', 'Sub-Total', '$0.00', '0.0000', 1),
(8, 3, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(9, 3, 'total', 'Total', '$5.00', '5.0000', 9),
(10, 4, 'sub_total', 'Sub-Total', '$0.00', '0.0000', 1),
(11, 4, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(12, 4, 'total', 'Total', '$5.00', '5.0000', 9),
(13, 5, 'sub_total', 'Sub-Total', '$0.00', '0.0000', 1),
(14, 5, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(15, 5, 'total', 'Total', '$5.00', '5.0000', 9),
(16, 6, 'sub_total', 'Sub-Total', '$0.00', '0.0000', 1),
(17, 6, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(18, 6, 'total', 'Total', '$5.00', '5.0000', 9),
(19, 7, 'sub_total', 'Sub-Total', '$600.00', '600.0000', 1),
(20, 7, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(21, 7, 'total', 'Total', '$605.00', '605.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `ft_order_voucher`
--

CREATE TABLE IF NOT EXISTS `ft_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product`
--

CREATE TABLE IF NOT EXISTS `ft_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `add_on` int(11) NOT NULL DEFAULT '0',
  `product_type` int(11) NOT NULL DEFAULT '1',
  `parent_product_id` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `ft_product`
--

INSERT INTO `ft_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `add_on`, `product_type`, `parent_product_id`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(50, 'abc123', '', '', '', '', '', '', '', 1, 7, 'data/yale_smart_home.jpg', 0, 1, '0.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 0, 1, '', 1, '2013-07-22 12:22:10', '2013-08-10 12:11:53', 97),
(51, 'abc123', '', '', '', '', '', '', '', 10, 7, 'data/yale_6200_big.jpg', 0, 1, '150.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 1, 1, '--', 1, '2013-07-22 12:25:31', '2013-08-19 12:56:35', 67),
(52, 'abc123', '', '', '', '', '', '', '', 10, 7, 'data/yale6300_big.jpg', 0, 1, '150.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 1, 1, '--', 1, '2013-07-22 12:29:55', '2013-08-19 12:56:57', 10),
(53, 'abc123', '', '', '', '', '', '', '', 1, 7, 'data/safes_large.jpg', 0, 1, '0.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 0, 1, NULL, 1, '2013-07-22 12:35:11', '2013-08-06 11:01:57', 11),
(54, 'abc123', '', '', '', '', '', '', '', 1, 5, 'data/firesafe.jpg', 0, 1, '0.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 0, 1, NULL, 1, '2013-07-22 12:36:36', '2013-08-06 11:01:48', 6),
(55, 'abc123', '', '', '', '', '', '', '', 0, 5, 'data/home_safe.jpg', 0, 1, '0.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 0, 1, NULL, 1, '2013-07-22 12:38:52', '2013-08-06 11:01:35', 3),
(56, 'abc123', '', '', '', '', '', '', '', 8, 7, 'data/compact_safe.jpg', 0, 1, '200.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 1, 0, '--', 1, '2013-07-22 12:40:34', '2013-08-19 13:24:22', 49),
(57, 'product1', '', '', '', '', '', '', '', 9, 7, 'data/cctv_lat.jpg', 0, 1, '150.0000', 0, 0, '2013-07-21', '1.00000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 1, 1, 0, '--', 1, '2013-07-22 12:44:15', '2013-08-21 11:53:01', 193),
(59, 'test2', '', '', '', '', '', '', '', 0, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '-57-53-', 1, '2013-08-10 12:50:05', '2013-08-16 11:14:57', 1),
(58, 'test', '', '', '', '', '', '', '', 2, 5, 'data/firesafe.jpg', 0, 1, '50.0000', 0, 0, '2013-08-08', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '-56-51-52-', 1, '2013-08-09 17:59:36', '2013-08-19 13:23:06', 1),
(60, 'test3', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 0, 2, '-53-54-57-', 1, '2013-08-16 10:39:45', '0000-00-00 00:00:00', 0),
(61, 'no thanks', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '--', 1, '2013-08-16 15:39:09', '2013-08-16 16:55:18', 0),
(62, 'ser2', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '--', 1, '2013-08-16 15:39:59', '2013-08-16 16:55:54', 0),
(63, 'ser3', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '--', 1, '2013-08-16 15:41:53', '2013-08-16 16:55:29', 0),
(64, 'ser4', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '--', 1, '2013-08-16 15:42:41', '2013-08-16 16:56:16', 0),
(65, 'ser5', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '--', 1, '2013-08-16 15:43:08', '2013-08-16 16:56:27', 0),
(66, 'test4', '', '', '', '', '', '', '', 0, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 0, 2, '-57-56-51-', 1, '2013-08-19 11:05:48', '0000-00-00 00:00:00', 0),
(67, 'test5', '', '', '', '', '', '', '', 10, 5, '', 0, 1, '25.0000', 0, 0, '2013-08-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '-57-56-', 1, '2013-08-19 11:06:07', '2013-08-19 13:23:41', 0),
(68, 'test6', '', '', '', '', '', '', '', 10, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '-57-56-', 1, '2013-08-19 11:06:29', '2013-08-19 12:23:00', 0),
(69, 'test7', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '--', 1, '2013-08-20 17:08:59', '2013-08-20 17:24:18', 0),
(70, 'test8', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '--', 1, '2013-08-20 17:25:58', '2013-08-20 17:38:43', 0),
(71, 'test9', '', '', '', '', '', '', '', 1, 5, '', 0, 1, '0.0000', 0, 0, '2013-08-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 0, 2, '-51-52-', 1, '2013-08-21 11:54:15', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_attribute`
--

CREATE TABLE IF NOT EXISTS `ft_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_description`
--

CREATE TABLE IF NOT EXISTS `ft_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_product_description`
--

INSERT INTO `ft_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(50, 1, 'Fully fitted Yale SmartHome Alarm for £599.00 with free Yale wireless keyfob and Yale wireless door bell! (Worth £78.00) (Inc.VAT)', '&lt;p&gt;Yale SmartHome Alarm puts you firmly in control - and gives you new ways to protect your family and property. With its beautiful touch-screen control panel, and user-friendly voice assist helping guide you as you use the system, Yale Smart Home Alarm is the future of alarm systems and takes home security to the next level. It combines all this new technology with the convenience of Yale''s wirefree connectivity, and the reassurance of professional installation in one future-proof package.&lt;/p&gt;\r\n', '', '', 'Home Alarms'),
(51, 1, 'Fully fitted YALE 6200 for £ 299 (Inc.VAT)', '&lt;p&gt;Yale Standard Alarm is a basic keypad operated system ideal for a flat, terraced, or semi-detached home. An access code on the keypad can be used to enable and disable the alarm. A preset 20 second exit/ entry period will allow the entire property to be either armed or disarmed, and has a 30 metre range. It uses easy to use alkaline batteries and average battery life is over 2 years. Up to 20 devices can be connected to this alarm system.&lt;/p&gt;\r\n', '', '', ''),
(53, 1, 'Large Fire Safe', '', '', '', 'Safes'),
(54, 1, 'Medium Fire Safe', '', '', '', 'Safes'),
(55, 1, 'Home Safe at £ 249 (Inc.VAT)', '', '', '', 'Safes'),
(56, 1, 'Compact Safe at £ 199 (Inc.VAT)', '', '', '', 'Safes'),
(57, 1, '2 CAMERA CCTV SYSTEM FULLY FITTED FOR £749 (Inc.VAT)', '', '', '', ''),
(52, 1, 'Fully fitted YALE 6300 for £ 375 (Inc.VAT)', '', '', '', 'Visonic Alarm'),
(58, 1, 'test', '', '', '', ''),
(59, 1, 'test2', '', '', '', ''),
(60, 1, 'test3', '', '', '', ''),
(61, 1, 'No Thanks', 'I dont need express Installation ', '', '', ''),
(62, 1, 'Within 24 Hours', 'Express Installation for £99\r\n', '', '', ''),
(63, 1, 'Within 48 Hours', 'Express Installation for £49\r\n', '', '', ''),
(64, 1, 'Evening', 'Evening Installation for £39\r\n', '', '', ''),
(65, 1, 'Weekend', 'Weekend Installation for £39\r\n', '', '', ''),
(66, 1, 'test4', '', '', '', ''),
(67, 1, 'test5', '', '', '', ''),
(68, 1, 'test6', '', '', '', ''),
(69, 1, 'test7', '', '', '', ''),
(70, 1, 'test8', '', '', '', ''),
(71, 1, 'test9', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_discount`
--

CREATE TABLE IF NOT EXISTS `ft_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=442 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_filter`
--

CREATE TABLE IF NOT EXISTS `ft_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_image`
--

CREATE TABLE IF NOT EXISTS `ft_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2357 ;

--
-- Dumping data for table `ft_product_image`
--

INSERT INTO `ft_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2356, 58, 'no_image.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_option`
--

CREATE TABLE IF NOT EXISTS `ft_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_option_value`
--

CREATE TABLE IF NOT EXISTS `ft_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_package`
--

CREATE TABLE IF NOT EXISTS `ft_product_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `packages` text NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `ft_product_package`
--

INSERT INTO `ft_product_package` (`id`, `product_id`, `packages`, `sort_order`) VALUES
(7, 70, 'gfjgf', 3),
(8, 70, 'csfdsfdsf', 2),
(9, 70, 'tretret', 1),
(14, 57, 'qaewqewq', 3),
(15, 57, 'fddgdf', 2),
(16, 57, 'retrey', 1),
(17, 57, 'dyyreytr', 4),
(18, 71, 'dhgdfh', 1),
(19, 71, 'tuytutu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_related`
--

CREATE TABLE IF NOT EXISTS `ft_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_reward`
--

CREATE TABLE IF NOT EXISTS `ft_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=640 ;

--
-- Dumping data for table `ft_product_reward`
--

INSERT INTO `ft_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(606, 68, 1, 0),
(595, 65, 1, 0),
(594, 64, 1, 0),
(564, 55, 1, 0),
(609, 51, 1, 0),
(591, 61, 1, 0),
(593, 62, 1, 0),
(596, 66, 1, 0),
(565, 54, 1, 0),
(566, 53, 1, 0),
(610, 52, 1, 0),
(571, 50, 1, 0),
(611, 58, 1, 0),
(612, 67, 1, 0),
(592, 63, 1, 0),
(581, 60, 1, 0),
(638, 57, 1, 0),
(613, 56, 1, 0),
(584, 59, 1, 0),
(621, 69, 1, 0),
(635, 70, 1, 0),
(639, 71, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_special`
--

CREATE TABLE IF NOT EXISTS `ft_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_to_category`
--

CREATE TABLE IF NOT EXISTS `ft_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_product_to_category`
--

INSERT INTO `ft_product_to_category` (`product_id`, `category_id`) VALUES
(50, 59),
(50, 68),
(50, 69),
(51, 59),
(51, 68),
(51, 70),
(52, 59),
(52, 68),
(52, 71),
(53, 60),
(53, 72),
(53, 76),
(54, 60),
(54, 72),
(54, 75),
(55, 60),
(55, 73),
(55, 77),
(56, 60),
(56, 74),
(56, 78),
(57, 61),
(57, 79);

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_to_download`
--

CREATE TABLE IF NOT EXISTS `ft_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `ft_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_to_store`
--

CREATE TABLE IF NOT EXISTS `ft_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_product_to_store`
--

INSERT INTO `ft_product_to_store` (`product_id`, `store_id`) VALUES
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_product_type`
--

CREATE TABLE IF NOT EXISTS `ft_product_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type` text NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ft_product_type`
--

INSERT INTO `ft_product_type` (`type_id`, `product_type`) VALUES
(1, 'Normal Product'),
(2, 'Add ons'),
(3, 'Service'),
(4, 'Express Installation Service');

-- --------------------------------------------------------

--
-- Table structure for table `ft_return`
--

CREATE TABLE IF NOT EXISTS `ft_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_return_action`
--

CREATE TABLE IF NOT EXISTS `ft_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ft_return_action`
--

INSERT INTO `ft_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `ft_return_history`
--

CREATE TABLE IF NOT EXISTS `ft_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_return_reason`
--

CREATE TABLE IF NOT EXISTS `ft_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ft_return_reason`
--

INSERT INTO `ft_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `ft_return_status`
--

CREATE TABLE IF NOT EXISTS `ft_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ft_return_status`
--

INSERT INTO `ft_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `ft_review`
--

CREATE TABLE IF NOT EXISTS `ft_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_setting`
--

CREATE TABLE IF NOT EXISTS `ft_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1986 ;

--
-- Dumping data for table `ft_setting`
--

INSERT INTO `ft_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(848, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:9:{s:9:"banner_id";s:1:"8";s:5:"limit";s:1:"5";s:6:"scroll";s:1:"3";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"0";s:10:"sort_order";s:2:"-1";}}', 1),
(1735, 0, 'featured', 'product', 's', 0),
(1736, 0, 'featured', 'featured_product', '57,51,52,50,56,55,53,54,33', 0),
(1737, 0, 'featured', 'featured_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"9";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(862, 0, 'menu', 'act_mode', '0', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(1974, 0, 'config', 'config_google_analytics', '', 0),
(1973, 0, 'config', 'config_error_filename', 'error.txt', 0),
(1972, 0, 'config', 'config_error_log', '1', 0),
(1971, 0, 'config', 'config_error_display', '1', 0),
(1969, 0, 'config', 'config_encryption', '63f19cf2cc75ba2c812f4d68977032ac', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(1970, 0, 'config', 'config_compression', '0', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(923, 0, 'category', 'category_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"4";}}', 1),
(60, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(1964, 0, 'config', 'config_seo_url', '0', 0),
(1965, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(1966, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(1967, 0, 'config', 'config_maintenance', '0', 0),
(1968, 0, 'config', 'config_password', '1', 0),
(1962, 0, 'config', 'config_shared', '0', 0),
(1963, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(1009, 0, 'custom_banner', 'custom_banner_module', 'a:2:{i:0;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:3:"170";s:6:"height";s:2:"85";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:7:{s:9:"banner_id";s:2:"11";s:5:"width";s:3:"930";s:6:"height";s:3:"100";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}}', 1),
(1961, 0, 'config', 'config_secure', '0', 0),
(1960, 0, 'config', 'config_fraud_status_id', '7', 0),
(1959, 0, 'config', 'config_fraud_score', '', 0),
(1958, 0, 'config', 'config_fraud_key', '', 0),
(1957, 0, 'config', 'config_fraud_detection', '0', 0),
(1956, 0, 'config', 'config_alert_emails', '', 0),
(1955, 0, 'config', 'config_account_mail', '0', 0),
(1954, 0, 'config', 'config_alert_mail', '0', 0),
(1953, 0, 'config', 'config_smtp_timeout', '5', 0),
(1952, 0, 'config', 'config_smtp_port', '25', 0),
(1951, 0, 'config', 'config_smtp_password', '', 0),
(1950, 0, 'config', 'config_smtp_username', '', 0),
(1949, 0, 'config', 'config_smtp_host', '', 0),
(1948, 0, 'config', 'config_mail_parameter', '', 0),
(1947, 0, 'config', 'config_mail_protocol', 'mail', 0),
(1946, 0, 'config', 'config_ftp_status', '0', 0),
(1945, 0, 'config', 'config_ftp_root', '', 0),
(1944, 0, 'config', 'config_ftp_password', '', 0),
(1943, 0, 'config', 'config_ftp_username', '', 0),
(1942, 0, 'config', 'config_ftp_port', '21', 0),
(1941, 0, 'config', 'config_ftp_host', 'fittedhomealarms.local', 0),
(1940, 0, 'config', 'config_image_cart_height', '47', 0),
(1939, 0, 'config', 'config_image_cart_width', '47', 0),
(1938, 0, 'config', 'config_image_wishlist_height', '47', 0),
(1937, 0, 'config', 'config_image_wishlist_width', '47', 0),
(1936, 0, 'config', 'config_image_compare_height', '90', 0),
(1935, 0, 'config', 'config_image_compare_width', '90', 0),
(1934, 0, 'config', 'config_image_related_height', '140', 0),
(1933, 0, 'config', 'config_image_related_width', '140', 0),
(1932, 0, 'config', 'config_image_additional_height', '300', 0),
(1931, 0, 'config', 'config_image_additional_width', '300', 0),
(1930, 0, 'config', 'config_image_product_height', '140', 0),
(1929, 0, 'config', 'config_image_product_width', '140', 0),
(1928, 0, 'config', 'config_image_popup_height', '700', 0),
(1927, 0, 'config', 'config_image_popup_width', '700', 0),
(1926, 0, 'config', 'config_image_thumb_height', '300', 0),
(1925, 0, 'config', 'config_image_thumb_width', '300', 0),
(1924, 0, 'config', 'config_image_category_height', '148', 0),
(1923, 0, 'config', 'config_image_category_width', '740', 0),
(1922, 0, 'config', 'config_icon', 'data/cart.png', 0),
(1921, 0, 'config', 'config_logo', 'data/logo.jpg', 0),
(1920, 0, 'config', 'config_return_status_id', '2', 0),
(1919, 0, 'config', 'config_return_id', '0', 0),
(1918, 0, 'config', 'config_commission', '5', 0),
(1917, 0, 'config', 'config_affiliate_id', '4', 0),
(1916, 0, 'config', 'config_stock_status_id', '5', 0),
(1915, 0, 'config', 'config_stock_checkout', '0', 0),
(1914, 0, 'config', 'config_stock_warning', '0', 0),
(1913, 0, 'config', 'config_stock_display', '0', 0),
(1912, 0, 'config', 'config_complete_status_id', '5', 0),
(1911, 0, 'config', 'config_order_status_id', '1', 0),
(1910, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(1909, 0, 'config', 'config_order_edit', '100', 0),
(1908, 0, 'config', 'config_checkout_id', '5', 0),
(1907, 0, 'config', 'config_guest_checkout', '1', 0),
(1906, 0, 'config', 'config_cart_weight', '1', 0),
(1905, 0, 'config', 'config_account_id', '3', 0),
(1903, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(1904, 0, 'config', 'config_customer_price', '0', 0),
(1902, 0, 'config', 'config_customer_group_id', '1', 0),
(1901, 0, 'config', 'config_customer_online', '0', 0),
(1900, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1897, 0, 'config', 'config_tax', '1', 0),
(1899, 0, 'config', 'config_tax_default', 'shipping', 0),
(1898, 0, 'config', 'config_vat', '0', 0),
(1896, 0, 'config', 'config_voucher_max', '1000', 0),
(1895, 0, 'config', 'config_voucher_min', '1', 0),
(1894, 0, 'config', 'config_download', '1', 0),
(1893, 0, 'config', 'config_review_status', '1', 0),
(1892, 0, 'config', 'config_product_count', '0', 0),
(1891, 0, 'config', 'config_admin_limit', '20', 0),
(1890, 0, 'config', 'config_catalog_limit', '15', 0),
(1889, 0, 'config', 'config_weight_class_id', '1', 0),
(1888, 0, 'config', 'config_length_class_id', '1', 0),
(1887, 0, 'config', 'config_currency_auto', '0', 0),
(1886, 0, 'config', 'config_currency', 'GSB', 0),
(1885, 0, 'config', 'config_admin_language', 'en', 0),
(1882, 0, 'config', 'config_country_id', '222', 0),
(1883, 0, 'config', 'config_zone_id', '3563', 0),
(1884, 0, 'config', 'config_language', 'en', 0),
(1881, 0, 'config', 'config_layout_id', '4', 0),
(1880, 0, 'config', 'config_template', 'aquacart', 0),
(1879, 0, 'config', 'config_meta_description', 'My Store', 0),
(1878, 0, 'config', 'config_title', 'Burglar Alarms,CCTV Cameras and Safes | Fitted Home Alarms - Specialist security Installers', 0),
(1877, 0, 'config', 'config_fax', '', 0),
(1875, 0, 'config', 'config_email', 'lorathantony@acube.co', 0),
(1876, 0, 'config', 'config_telephone', '123456789', 0),
(1874, 0, 'config', 'config_address', 'Address 1', 0),
(1010, 0, 'settings', 'settings_module', 'a:25:{i:0;a:22:{s:9:"layout_id";i:1;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:1;a:22:{s:9:"layout_id";i:2;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:2;a:22:{s:9:"layout_id";i:3;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:3;a:22:{s:9:"layout_id";i:4;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:4;a:22:{s:9:"layout_id";i:5;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:5;a:22:{s:9:"layout_id";i:6;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:6;a:22:{s:9:"layout_id";i:7;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:7;a:22:{s:9:"layout_id";i:8;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:8;a:22:{s:9:"layout_id";i:9;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:9;a:22:{s:9:"layout_id";i:10;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:10;a:22:{s:9:"layout_id";i:11;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:11;a:22:{s:9:"layout_id";i:12;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:12;a:22:{s:9:"layout_id";i:13;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:13;a:22:{s:9:"layout_id";i:14;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:14;a:22:{s:9:"layout_id";i:15;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:15;a:22:{s:9:"layout_id";i:16;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:16;a:22:{s:9:"layout_id";i:17;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:17;a:22:{s:9:"layout_id";i:18;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:18;a:22:{s:9:"layout_id";i:19;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:19;a:22:{s:9:"layout_id";i:20;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:20;a:22:{s:9:"layout_id";i:21;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:21;a:22:{s:9:"layout_id";i:22;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:22;a:22:{s:9:"layout_id";i:23;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:23;a:22:{s:9:"layout_id";i:24;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}i:24;a:22:{s:9:"layout_id";i:25;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:14:"fading_effects";s:1:"1";s:16:"sliding_products";s:1:"0";s:12:"header_links";s:1:"0";s:13:"wishlist_link";s:1:"1";s:12:"compare_link";s:1:"1";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:8:"location";s:0:"";s:13:"facebook_icon";s:0:"";s:11:"google_icon";s:0:"";s:10:"skype_icon";s:0:"";s:12:"tweeter_icon";s:0:"";s:14:"pinterest_icon";s:0:"";s:9:"visa_icon";s:1:"1";s:15:"mastercard_icon";s:1:"1";s:9:"amex_icon";s:1:"1";s:13:"discover_icon";s:1:"1";s:11:"paypal_icon";s:1:"1";}}', 1),
(1846, 0, 'styler', 'styler_module', 'a:25:{i:0;a:16:{s:9:"layout_id";i:1;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:1;a:16:{s:9:"layout_id";i:2;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:2;a:16:{s:9:"layout_id";i:3;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:3;a:16:{s:9:"layout_id";i:4;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:4;a:16:{s:9:"layout_id";i:5;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:5;a:16:{s:9:"layout_id";i:6;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:6;a:16:{s:9:"layout_id";i:7;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:7;a:16:{s:9:"layout_id";i:8;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:8;a:16:{s:9:"layout_id";i:9;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:9;a:16:{s:9:"layout_id";i:10;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:10;a:16:{s:9:"layout_id";i:11;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:11;a:16:{s:9:"layout_id";i:12;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:12;a:16:{s:9:"layout_id";i:13;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:13;a:16:{s:9:"layout_id";i:14;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:14;a:16:{s:9:"layout_id";i:15;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:15;a:16:{s:9:"layout_id";i:16;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:16;a:16:{s:9:"layout_id";i:17;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:17;a:16:{s:9:"layout_id";i:18;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:18;a:16:{s:9:"layout_id";i:19;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:19;a:16:{s:9:"layout_id";i:20;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:20;a:16:{s:9:"layout_id";i:21;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:21;a:16:{s:9:"layout_id";i:22;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:22;a:16:{s:9:"layout_id";i:23;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:23;a:16:{s:9:"layout_id";i:24;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}i:24;a:16:{s:9:"layout_id";i:25;s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:6:"status";s:1:"1";s:22:"display_theme_settings";s:1:"1";s:10:"menu_style";s:6:"custom";s:10:"menu_color";s:6:"000000";s:15:"nav_font_picker";s:5:"Cabin";s:19:"nav_fontsize_picker";s:4:"14px";s:10:"main_color";s:6:"000000";s:17:"title_font_picker";s:12:"Pontano Sans";s:18:"button_font_picker";s:10:"Droid Sans";s:16:"body_font_picker";s:10:"Droid Sans";s:12:"footer_style";s:5:"light";s:9:"bgr_image";s:4:"none";s:9:"bgr_color";s:6:"db9200";}}', 1),
(861, 0, 'menu', 'menu_module', 'a:1:{i:0;a:5:{s:7:"menu_id";s:1:"1";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(1863, 0, 'kdo_category', 'kdo_category_module', 'a:4:{i:0;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:2;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:3;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(1498, 0, 'nivoslider', 'nivoslider_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"7";s:5:"width";s:3:"891";s:6:"height";s:3:"200";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(1734, 0, 'banner', 'banner_module', 'a:8:{i:0;a:7:{s:9:"banner_id";s:1:"6";s:5:"width";s:3:"100";s:6:"height";s:3:"100";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"3";}i:1;a:7:{s:9:"banner_id";s:2:"10";s:5:"width";s:3:"200";s:6:"height";s:3:"100";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"8";}i:2;a:7:{s:9:"banner_id";s:2:"12";s:5:"width";s:3:"200";s:6:"height";s:2:"50";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}i:3;a:7:{s:9:"banner_id";s:2:"13";s:5:"width";s:3:"200";s:6:"height";s:2:"40";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}i:4;a:7:{s:9:"banner_id";s:2:"14";s:5:"width";s:3:"200";s:6:"height";s:2:"40";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"6";}i:5;a:7:{s:9:"banner_id";s:2:"15";s:5:"width";s:3:"200";s:6:"height";s:2:"40";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"7";}i:6;a:7:{s:9:"banner_id";s:2:"16";s:5:"width";s:3:"200";s:6:"height";s:3:"210";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"9";}i:7;a:7:{s:9:"banner_id";s:2:"17";s:5:"width";s:3:"190";s:6:"height";s:3:"500";s:9:"layout_id";s:1:"2";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1);
INSERT INTO `ft_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1855, 0, 'welcome', 'welcome_module', 'a:1:{i:1;a:5:{s:11:"description";a:1:{i:1;s:5892:"&lt;div&gt;\r\n&lt;h3&gt;&lt;strong&gt;Welcome to Fitted Home Alarms&lt;/strong&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;We are Professional Installers of Quality Home Security Systems and we offer a range of services such as installation and maintenance of&amp;nbsp;&lt;a href=&quot;http://www.fittedhomealarms.co.uk/alarms-list.php&quot;&gt;&lt;strong&gt;Burglar Alarms&lt;/strong&gt;&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://www.fittedhomealarms.co.uk/alarms-list.php&quot;&gt;&lt;strong&gt;Home Security Systems&lt;/strong&gt;&lt;/a&gt;, &lt;a href=&quot;http://www.fittedhomealarms.co.uk/cctv-list.php&quot;&gt;&lt;strong&gt;CCTV&lt;/strong&gt;&lt;/a&gt;s and &lt;strong&gt;Safes&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;98%&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;25%&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;background-color:#D5D5D5&quot; width=&quot;100%&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;15%&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.fittedhomealarms.co.uk/images/plus-icon_new.png&quot; style=&quot;width: 28px; height: 27px;&quot; /&gt;&lt;/td&gt;\r\n						&lt;td width=&quot;83%&quot;&gt;All our installers are CRB checked for your protection.&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;2%&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;25%&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;background-color:#D5D5D5&quot; width=&quot;100%&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;15%&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.fittedhomealarms.co.uk/images/plus-icon_new.png&quot; style=&quot;width: 28px; height: 27px;&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;We work with latest infra-red, motion sensor technologies.&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;2%&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;25%&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;background-color:#D5D5D5&quot; width=&quot;100%&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;15%&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.fittedhomealarms.co.uk/images/plus-icon_new.png&quot; style=&quot;width: 28px; height: 27px;&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;We provide professional and unbiased advice on security.&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;5&quot; height=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;25%&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;background-color:#D5D5D5&quot; width=&quot;100%&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;15%&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.fittedhomealarms.co.uk/images/plus-icon_new.png&quot; style=&quot;width: 28px; height: 27px;&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;We install advanced and affordable security systems.&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;2%&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;25%&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;background-color:#D5D5D5&quot; width=&quot;100%&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;15%&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.fittedhomealarms.co.uk/images/plus-icon_new.png&quot; style=&quot;width: 28px; height: 27px;&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;All our alarms are installed with no hidden charges and no monitoring charges.&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;2%&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;25%&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;background-color:#D5D5D5&quot; width=&quot;100%&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;15%&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.fittedhomealarms.co.uk/images/plus-icon_new.png&quot; style=&quot;width: 28px; height: 27px;&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;Custom Installations are done to your specific requirements and your property.&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n";}s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"11";}}', 1),
(1007, 0, 'footerspecail', 'footerspecail_module', 'a:1:{i:1;a:7:{s:11:"description";a:1:{i:1;s:0:"";}s:12:"description1";a:1:{i:1;s:0:"";}s:12:"description2";a:1:{i:1;s:482:"&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://fittedhomealarms.local/image/data/cards_logos.jpg&quot; style=&quot;width: 774px; height: 65px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left: 80px;&quot;&gt;We use some non-essential cookies to improve your online experience. By using this site you consent to this use in our Cookies policy&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left: 200px;&quot;&gt;Copyright © 2011 Fitted Home Alarms. All rights reserved.&lt;/p&gt;\r\n";}s:9:"layout_id";s:1:"1";s:8:"position";s:13:"column_footer";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(1873, 0, 'config', 'config_owner', 'Your Name', 0),
(1872, 0, 'config', 'config_name', 'Fittedhomealarms', 0),
(1497, 0, 'nivoslider', 'slide_startSlide', '0', 0),
(1496, 0, 'nivoslider', 'slide_pauseTime', '3000', 0),
(1495, 0, 'nivoslider', 'slide_animSpeed', '1500', 0),
(1494, 0, 'nivoslider', 'slide_boxRows', '3', 0),
(1493, 0, 'nivoslider', 'slide_boxCols', '5', 0),
(1492, 0, 'nivoslider', 'slide_slices', '10', 0),
(1491, 0, 'nivoslider', 'display_soption', 'sliceDown', 0),
(1857, 0, 'testimonial', 'testimonial_default_rating', '3', 0),
(1858, 0, 'testimonial', 'testimonial_module', 'a:1:{i:1;a:8:{s:17:"testimonial_title";a:1:{i:1;s:11:"Testimonial";}s:17:"testimonial_limit";s:2:"10";s:18:"testimonial_random";s:1:"0";s:27:"testimonial_character_limit";s:3:"100";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}}', 1),
(1856, 0, 'testimonial', 'testimonial_admin_approved', '0', 0),
(1975, 0, 'tagcloud', 'tagcloud_resize', '1', 0),
(1976, 0, 'tagcloud', 'tagcloud_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"5";s:13:"min_font_size";s:2:"18";s:13:"max_font_size";s:2:"30";s:9:"layout_id";s:1:"6";s:8:"position";s:14:"content_footer";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(1984, 0, 'viewed', 'show_on_product', '1', 0),
(1985, 0, 'viewed', 'viewed_module', 'a:1:{i:0;a:6:{s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:9:"layout_id";s:1:"2";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}}', 1),
(1983, 0, 'viewed', 'viewed_count', '5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_stock_status`
--

CREATE TABLE IF NOT EXISTS `ft_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ft_stock_status`
--

INSERT INTO `ft_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2 - 3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `ft_store`
--

CREATE TABLE IF NOT EXISTS `ft_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_tag_cloud`
--

CREATE TABLE IF NOT EXISTS `ft_tag_cloud` (
  `qty` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL,
  `language_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`tag`,`language_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ft_tag_cloud`
--

INSERT INTO `ft_tag_cloud` (`qty`, `tag`, `language_id`, `store_id`) VALUES
(1, 'Home Alarms', 1, 0),
(1, 'Visonic Alarm', 1, 0),
(4, 'Safes', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ft_tax_class`
--

CREATE TABLE IF NOT EXISTS `ft_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ft_tax_class`
--

INSERT INTO `ft_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `ft_tax_rate`
--

CREATE TABLE IF NOT EXISTS `ft_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `ft_tax_rate`
--

INSERT INTO `ft_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `ft_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `ft_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_tax_rate_to_customer_group`
--

INSERT INTO `ft_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_tax_rule`
--

CREATE TABLE IF NOT EXISTS `ft_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `ft_tax_rule`
--

INSERT INTO `ft_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ft_testimonial`
--

CREATE TABLE IF NOT EXISTS `ft_testimonial` (
  `testimonial_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(96) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `rating` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`testimonial_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ft_testimonial`
--

INSERT INTO `ft_testimonial` (`testimonial_id`, `name`, `city`, `email`, `status`, `rating`, `date_added`) VALUES
(1, 'abc', 'abc', 'abc@fff.com', 1, 3, '2013-07-26 12:03:07'),
(4, 'tru', 'trur', 'aeu@ggg.com', 1, 3, '2013-07-26 15:26:17'),
(5, '', '', '', 0, 3, '2013-07-31 16:16:37'),
(6, 'kjjh', 'sdg', 'lorath@gmail.com', 0, 3, '2013-08-01 13:48:01'),
(7, '', '', '', 0, 3, '2013-08-01 17:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `ft_testimonial_description`
--

CREATE TABLE IF NOT EXISTS `ft_testimonial_description` (
  `testimonial_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`testimonial_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ft_testimonial_description`
--

INSERT INTO `ft_testimonial_description` (`testimonial_id`, `language_id`, `title`, `description`) VALUES
(1, 1, 'abc', '<p>abc</p>\r\n'),
(4, 1, 'tryr', '<p>tryrtyrtyrty trytrytry</p>\r\n'),
(5, 1, '', 'dsdsgdsgsgds sdgdsg'),
(6, 1, 'hgj', 'hgjhgjg'),
(7, 1, '', 'jgggj');

-- --------------------------------------------------------

--
-- Table structure for table `ft_url_alias`
--

CREATE TABLE IF NOT EXISTS `ft_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=776 ;

--
-- Dumping data for table `ft_url_alias`
--

INSERT INTO `ft_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(775, 'information_id=4', 'about_us');

-- --------------------------------------------------------

--
-- Table structure for table `ft_user`
--

CREATE TABLE IF NOT EXISTS `ft_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ft_user`
--

INSERT INTO `ft_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '87a03b987540a526459fcaac99971e159f8279e9', 'c613ca4b0', '', '', 'lorathantony@acube.co', '', '127.0.0.1', 1, '2013-07-01 12:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `ft_user_group`
--

CREATE TABLE IF NOT EXISTS `ft_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ft_user_group`
--

INSERT INTO `ft_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:141:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:14:"catalog/review";i:10;s:19:"catalog/testimonial";i:11;s:18:"common/filemanager";i:12;s:13:"design/banner";i:13;s:19:"design/custom_field";i:14;s:13:"design/layout";i:15;s:14:"extension/feed";i:16;s:17:"extension/manager";i:17;s:16:"extension/module";i:18;s:17:"extension/payment";i:19;s:18:"extension/shipping";i:20;s:15:"extension/total";i:21;s:16:"feed/google_base";i:22;s:19:"feed/google_sitemap";i:23;s:20:"localisation/country";i:24;s:21:"localisation/currency";i:25;s:21:"localisation/geo_zone";i:26;s:21:"localisation/language";i:27;s:25:"localisation/length_class";i:28;s:25:"localisation/order_status";i:29;s:26:"localisation/return_action";i:30;s:26:"localisation/return_reason";i:31;s:26:"localisation/return_status";i:32;s:25:"localisation/stock_status";i:33;s:22:"localisation/tax_class";i:34;s:21:"localisation/tax_rate";i:35;s:25:"localisation/weight_class";i:36;s:17:"localisation/zone";i:37;s:14:"menu/menuitems";i:38;s:10:"menu/menus";i:39;s:14:"module/account";i:40;s:16:"module/affiliate";i:41;s:13:"module/banner";i:42;s:17:"module/bestseller";i:43;s:15:"module/carousel";i:44;s:15:"module/category";i:45;s:20:"module/custom_banner";i:46;s:23:"module/custom_slideshow";i:47;s:15:"module/featured";i:48;s:13:"module/filter";i:49;s:20:"module/footerspecail";i:50;s:18:"module/google_talk";i:51;s:18:"module/information";i:52;s:19:"module/kdo_category";i:53;s:13:"module/latest";i:54;s:11:"module/menu";i:55;s:17:"module/nivoslider";i:56;s:15:"module/settings";i:57;s:16:"module/slideshow";i:58;s:14:"module/special";i:59;s:12:"module/store";i:60;s:13:"module/styler";i:61;s:15:"module/tagcloud";i:62;s:18:"module/testimonial";i:63;s:20:"module/vqmod_manager";i:64;s:14:"module/welcome";i:65;s:24:"payment/authorizenet_aim";i:66;s:21:"payment/bank_transfer";i:67;s:14:"payment/cheque";i:68;s:11:"payment/cod";i:69;s:21:"payment/free_checkout";i:70;s:22:"payment/klarna_account";i:71;s:22:"payment/klarna_invoice";i:72;s:14:"payment/liqpay";i:73;s:20:"payment/moneybookers";i:74;s:14:"payment/nochex";i:75;s:15:"payment/paymate";i:76;s:16:"payment/paypoint";i:77;s:13:"payment/payza";i:78;s:26:"payment/perpetual_payments";i:79;s:14:"payment/pp_pro";i:80;s:17:"payment/pp_pro_uk";i:81;s:19:"payment/pp_standard";i:82;s:15:"payment/sagepay";i:83;s:22:"payment/sagepay_direct";i:84;s:18:"payment/sagepay_us";i:85;s:19:"payment/twocheckout";i:86;s:28:"payment/web_payment_software";i:87;s:16:"payment/worldpay";i:88;s:27:"report/affiliate_commission";i:89;s:22:"report/customer_credit";i:90;s:22:"report/customer_online";i:91;s:21:"report/customer_order";i:92;s:22:"report/customer_reward";i:93;s:24:"report/product_purchased";i:94;s:21:"report/product_viewed";i:95;s:18:"report/sale_coupon";i:96;s:17:"report/sale_order";i:97;s:18:"report/sale_return";i:98;s:20:"report/sale_shipping";i:99;s:15:"report/sale_tax";i:100;s:14:"sale/affiliate";i:101;s:12:"sale/contact";i:102;s:11:"sale/coupon";i:103;s:13:"sale/customer";i:104;s:20:"sale/customer_ban_ip";i:105;s:19:"sale/customer_group";i:106;s:10:"sale/order";i:107;s:11:"sale/return";i:108;s:12:"sale/voucher";i:109;s:18:"sale/voucher_theme";i:110;s:15:"setting/setting";i:111;s:13:"setting/store";i:112;s:16:"shipping/auspost";i:113;s:17:"shipping/citylink";i:114;s:14:"shipping/fedex";i:115;s:13:"shipping/flat";i:116;s:13:"shipping/free";i:117;s:13:"shipping/item";i:118;s:23:"shipping/parcelforce_48";i:119;s:15:"shipping/pickup";i:120;s:19:"shipping/royal_mail";i:121;s:12:"shipping/ups";i:122;s:13:"shipping/usps";i:123;s:15:"shipping/weight";i:124;s:11:"tool/backup";i:125;s:14:"tool/error_log";i:126;s:12:"total/coupon";i:127;s:12:"total/credit";i:128;s:14:"total/handling";i:129;s:16:"total/klarna_fee";i:130;s:19:"total/low_order_fee";i:131;s:12:"total/reward";i:132;s:14:"total/shipping";i:133;s:15:"total/sub_total";i:134;s:9:"total/tax";i:135;s:11:"total/total";i:136;s:13:"total/voucher";i:137;s:9:"user/user";i:138;s:20:"user/user_permission";i:139;s:15:"module/tagcloud";i:140;s:13:"module/viewed";}s:6:"modify";a:141:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:14:"catalog/review";i:10;s:19:"catalog/testimonial";i:11;s:18:"common/filemanager";i:12;s:13:"design/banner";i:13;s:19:"design/custom_field";i:14;s:13:"design/layout";i:15;s:14:"extension/feed";i:16;s:17:"extension/manager";i:17;s:16:"extension/module";i:18;s:17:"extension/payment";i:19;s:18:"extension/shipping";i:20;s:15:"extension/total";i:21;s:16:"feed/google_base";i:22;s:19:"feed/google_sitemap";i:23;s:20:"localisation/country";i:24;s:21:"localisation/currency";i:25;s:21:"localisation/geo_zone";i:26;s:21:"localisation/language";i:27;s:25:"localisation/length_class";i:28;s:25:"localisation/order_status";i:29;s:26:"localisation/return_action";i:30;s:26:"localisation/return_reason";i:31;s:26:"localisation/return_status";i:32;s:25:"localisation/stock_status";i:33;s:22:"localisation/tax_class";i:34;s:21:"localisation/tax_rate";i:35;s:25:"localisation/weight_class";i:36;s:17:"localisation/zone";i:37;s:14:"menu/menuitems";i:38;s:10:"menu/menus";i:39;s:14:"module/account";i:40;s:16:"module/affiliate";i:41;s:13:"module/banner";i:42;s:17:"module/bestseller";i:43;s:15:"module/carousel";i:44;s:15:"module/category";i:45;s:20:"module/custom_banner";i:46;s:23:"module/custom_slideshow";i:47;s:15:"module/featured";i:48;s:13:"module/filter";i:49;s:20:"module/footerspecail";i:50;s:18:"module/google_talk";i:51;s:18:"module/information";i:52;s:19:"module/kdo_category";i:53;s:13:"module/latest";i:54;s:11:"module/menu";i:55;s:17:"module/nivoslider";i:56;s:15:"module/settings";i:57;s:16:"module/slideshow";i:58;s:14:"module/special";i:59;s:12:"module/store";i:60;s:13:"module/styler";i:61;s:15:"module/tagcloud";i:62;s:18:"module/testimonial";i:63;s:20:"module/vqmod_manager";i:64;s:14:"module/welcome";i:65;s:24:"payment/authorizenet_aim";i:66;s:21:"payment/bank_transfer";i:67;s:14:"payment/cheque";i:68;s:11:"payment/cod";i:69;s:21:"payment/free_checkout";i:70;s:22:"payment/klarna_account";i:71;s:22:"payment/klarna_invoice";i:72;s:14:"payment/liqpay";i:73;s:20:"payment/moneybookers";i:74;s:14:"payment/nochex";i:75;s:15:"payment/paymate";i:76;s:16:"payment/paypoint";i:77;s:13:"payment/payza";i:78;s:26:"payment/perpetual_payments";i:79;s:14:"payment/pp_pro";i:80;s:17:"payment/pp_pro_uk";i:81;s:19:"payment/pp_standard";i:82;s:15:"payment/sagepay";i:83;s:22:"payment/sagepay_direct";i:84;s:18:"payment/sagepay_us";i:85;s:19:"payment/twocheckout";i:86;s:28:"payment/web_payment_software";i:87;s:16:"payment/worldpay";i:88;s:27:"report/affiliate_commission";i:89;s:22:"report/customer_credit";i:90;s:22:"report/customer_online";i:91;s:21:"report/customer_order";i:92;s:22:"report/customer_reward";i:93;s:24:"report/product_purchased";i:94;s:21:"report/product_viewed";i:95;s:18:"report/sale_coupon";i:96;s:17:"report/sale_order";i:97;s:18:"report/sale_return";i:98;s:20:"report/sale_shipping";i:99;s:15:"report/sale_tax";i:100;s:14:"sale/affiliate";i:101;s:12:"sale/contact";i:102;s:11:"sale/coupon";i:103;s:13:"sale/customer";i:104;s:20:"sale/customer_ban_ip";i:105;s:19:"sale/customer_group";i:106;s:10:"sale/order";i:107;s:11:"sale/return";i:108;s:12:"sale/voucher";i:109;s:18:"sale/voucher_theme";i:110;s:15:"setting/setting";i:111;s:13:"setting/store";i:112;s:16:"shipping/auspost";i:113;s:17:"shipping/citylink";i:114;s:14:"shipping/fedex";i:115;s:13:"shipping/flat";i:116;s:13:"shipping/free";i:117;s:13:"shipping/item";i:118;s:23:"shipping/parcelforce_48";i:119;s:15:"shipping/pickup";i:120;s:19:"shipping/royal_mail";i:121;s:12:"shipping/ups";i:122;s:13:"shipping/usps";i:123;s:15:"shipping/weight";i:124;s:11:"tool/backup";i:125;s:14:"tool/error_log";i:126;s:12:"total/coupon";i:127;s:12:"total/credit";i:128;s:14:"total/handling";i:129;s:16:"total/klarna_fee";i:130;s:19:"total/low_order_fee";i:131;s:12:"total/reward";i:132;s:14:"total/shipping";i:133;s:15:"total/sub_total";i:134;s:9:"total/tax";i:135;s:11:"total/total";i:136;s:13:"total/voucher";i:137;s:9:"user/user";i:138;s:20:"user/user_permission";i:139;s:15:"module/tagcloud";i:140;s:13:"module/viewed";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `ft_voucher`
--

CREATE TABLE IF NOT EXISTS `ft_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_voucher_history`
--

CREATE TABLE IF NOT EXISTS `ft_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `ft_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ft_voucher_theme`
--

INSERT INTO `ft_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ft_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `ft_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ft_voucher_theme_description`
--

INSERT INTO `ft_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `ft_weight_class`
--

CREATE TABLE IF NOT EXISTS `ft_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ft_weight_class`
--

INSERT INTO `ft_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `ft_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `ft_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ft_weight_class_description`
--

INSERT INTO `ft_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `ft_zone`
--

CREATE TABLE IF NOT EXISTS `ft_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4033 ;

--
-- Dumping data for table `ft_zone`
--

INSERT INTO `ft_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Hi', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chi', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovar-Bilogora', 'BB', 1),
(848, 53, 'City of Zagreb', 'CZ', 1),
(849, 53, 'Dubrovnik-Neretva', 'DN', 1),
(850, 53, 'Istra', 'IS', 1),
(851, 53, 'Karlovac', 'KA', 1),
(852, 53, 'Koprivnica-Krizevci', 'KK', 1),
(853, 53, 'Krapina-Zagorje', 'KZ', 1),
(854, 53, 'Lika-Senj', 'LS', 1),
(855, 53, 'Medimurje', 'ME', 1),
(856, 53, 'Osijek-Baranja', 'OB', 1),
(857, 53, 'Pozega-Slavonia', 'PS', 1),
(858, 53, 'Primorje-Gorski Kotar', 'PG', 1),
(859, 53, 'Sibenik', 'SI', 1),
(860, 53, 'Sisak-Moslavina', 'SM', 1),
(861, 53, 'Slavonski Brod-Posavina', 'SB', 1),
(862, 53, 'Split-Dalmatia', 'SD', 1),
(863, 53, 'Varazdin', 'VA', 1),
(864, 53, 'Virovitica-Podravina', 'VP', 1),
(865, 53, 'Vukovar-Srijem', 'VS', 1),
(866, 53, 'Zadar-Knin', 'ZK', 1),
(867, 53, 'Zagreb', 'ZA', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan Laani', 'AL', 1),
(1086, 72, 'Etela-Suomen Laani', 'ES', 1),
(1087, 72, 'Ita-Suomen Laani', 'IS', 1),
(1088, 72, 'Lansi-Suomen Laani', 'LS', 1),
(1089, 72, 'Lapin Lanani', 'LA', 1),
(1090, 72, 'Oulun Laani', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1428, 97, 'Bacs-Kiskun', 'BK', 1),
(1429, 97, 'Baranya', 'BA', 1),
(1430, 97, 'Bekes', 'BE', 1),
(1431, 97, 'Bekescsaba', 'BS', 1),
(1432, 97, 'Borsod-Abauj-Zemplen', 'BZ', 1),
(1433, 97, 'Budapest', 'BU', 1),
(1434, 97, 'Csongrad', 'CS', 1),
(1435, 97, 'Debrecen', 'DE', 1),
(1436, 97, 'Dunaujvaros', 'DU', 1),
(1437, 97, 'Eger', 'EG', 1),
(1438, 97, 'Fejer', 'FE', 1),
(1439, 97, 'Gyor', 'GY', 1),
(1440, 97, 'Gyor-Moson-Sopron', 'GM', 1),
(1441, 97, 'Hajdu-Bihar', 'HB', 1),
(1442, 97, 'Heves', 'HE', 1),
(1443, 97, 'Hodmezovasarhely', 'HO', 1),
(1444, 97, 'Jasz-Nagykun-Szolnok', 'JN', 1),
(1445, 97, 'Kaposvar', 'KA', 1),
(1446, 97, 'Kecskemet', 'KE', 1),
(1447, 97, 'Komarom-Esztergom', 'KO', 1),
(1448, 97, 'Miskolc', 'MI', 1),
(1449, 97, 'Nagykanizsa', 'NA', 1),
(1450, 97, 'Nograd', 'NO', 1),
(1451, 97, 'Nyiregyhaza', 'NY', 1),
(1452, 97, 'Pecs', 'PE', 1),
(1453, 97, 'Pest', 'PS', 1),
(1454, 97, 'Somogy', 'SO', 1),
(1455, 97, 'Sopron', 'SP', 1),
(1456, 97, 'Szabolcs-Szatmar-Bereg', 'SS', 1),
(1457, 97, 'Szeged', 'SZ', 1),
(1458, 97, 'Szekesfehervar', 'SE', 1),
(1459, 97, 'Szolnok', 'SL', 1),
(1460, 97, 'Szombathely', 'SM', 1),
(1461, 97, 'Tatabanya', 'TA', 1),
(1462, 97, 'Tolna', 'TO', 1),
(1463, 97, 'Vas', 'VA', 1),
(1464, 97, 'Veszprem', 'VE', 1),
(1465, 97, 'Zala', 'ZA', 1),
(1466, 97, 'Zalaegerszeg', 'ZZ', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1);
INSERT INTO `ft_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1819, 117, 'Aizkraukles Rajons', 'AIZ', 1),
(1820, 117, 'Aluksnes Rajons', 'ALU', 1),
(1821, 117, 'Balvu Rajons', 'BAL', 1),
(1822, 117, 'Bauskas Rajons', 'BAU', 1),
(1823, 117, 'Cesu Rajons', 'CES', 1),
(1824, 117, 'Daugavpils Rajons', 'DGR', 1),
(1825, 117, 'Dobeles Rajons', 'DOB', 1),
(1826, 117, 'Gulbenes Rajons', 'GUL', 1),
(1827, 117, 'Jekabpils Rajons', 'JEK', 1),
(1828, 117, 'Jelgavas Rajons', 'JGR', 1),
(1829, 117, 'Kraslavas Rajons', 'KRA', 1),
(1830, 117, 'Kuldigas Rajons', 'KUL', 1),
(1831, 117, 'Liepajas Rajons', 'LPR', 1),
(1832, 117, 'Limbazu Rajons', 'LIM', 1),
(1833, 117, 'Ludzas Rajons', 'LUD', 1),
(1834, 117, 'Madonas Rajons', 'MAD', 1),
(1835, 117, 'Ogres Rajons', 'OGR', 1),
(1836, 117, 'Preilu Rajons', 'PRE', 1),
(1837, 117, 'Rezeknes Rajons', 'RZR', 1),
(1838, 117, 'Rigas Rajons', 'RGR', 1),
(1839, 117, 'Saldus Rajons', 'SAL', 1),
(1840, 117, 'Talsu Rajons', 'TAL', 1),
(1841, 117, 'Tukuma Rajons', 'TUK', 1),
(1842, 117, 'Valkas Rajons', 'VLK', 1),
(1843, 117, 'Valmieras Rajons', 'VLM', 1),
(1844, 117, 'Ventspils Rajons', 'VSR', 1),
(1845, 117, 'Daugavpils', 'DGV', 1),
(1846, 117, 'Jelgava', 'JGV', 1),
(1847, 117, 'Jurmala', 'JUR', 1),
(1848, 117, 'Liepaja', 'LPK', 1),
(1849, 117, 'Rezekne', 'RZK', 1),
(1850, 117, 'Riga', 'RGA', 1),
(1851, 117, 'Ventspils', 'VSL', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'JO', 1),
(1972, 129, 'Kedah', 'KE', 1),
(1973, 129, 'Kelantan', 'KL', 1),
(1974, 129, 'Labuan', 'LA', 1),
(1975, 129, 'Melaka', 'ME', 1),
(1976, 129, 'Negeri Sembilan', 'NS', 1),
(1977, 129, 'Pahang', 'PA', 1),
(1978, 129, 'Perak', 'PE', 1),
(1979, 129, 'Perlis', 'PR', 1),
(1980, 129, 'Pulau Pinang', 'PP', 1),
(1981, 129, 'Sabah', 'SA', 1),
(1982, 129, 'Sarawak', 'SR', 1),
(1983, 129, 'Selangor', 'SE', 1),
(1984, 129, 'Terengganu', 'TE', 1),
(1985, 129, 'Wilayah Persekutuan', 'WP', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3031, 197, 'Ascension', 'A', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3033, 197, 'Tristan da Cunha', 'T', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1);
INSERT INTO `ft_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakir', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkasy', 'CK', 1),
(3481, 220, 'Chernihiv', 'CH', 1),
(3482, 220, 'Chernivtsi', 'CV', 1),
(3483, 220, 'Crimea', 'CR', 1),
(3484, 220, 'Dnipropetrovs''k', 'DN', 1),
(3485, 220, 'Donets''k', 'DO', 1),
(3486, 220, 'Ivano-Frankivs''k', 'IV', 1),
(3487, 220, 'Kharkiv Kherson', 'KL', 1),
(3488, 220, 'Khmel''nyts''kyy', 'KM', 1),
(3489, 220, 'Kirovohrad', 'KR', 1),
(3490, 220, 'Kiev', 'KV', 1),
(3491, 220, 'Kyyiv', 'KY', 1),
(3492, 220, 'Luhans''k', 'LU', 1),
(3493, 220, 'L''viv', 'LV', 1),
(3494, 220, 'Mykolayiv', 'MY', 1),
(3495, 220, 'Odesa', 'OD', 1),
(3496, 220, 'Poltava', 'PO', 1),
(3497, 220, 'Rivne', 'RI', 1),
(3498, 220, 'Sevastopol', 'SE', 1),
(3499, 220, 'Sumy', 'SU', 1),
(3500, 220, 'Ternopil''', 'TE', 1),
(3501, 220, 'Vinnytsya', 'VI', 1),
(3502, 220, 'Volyn''', 'VO', 1),
(3503, 220, 'Zakarpattya', 'ZK', 1),
(3504, 220, 'Zaporizhzhya', 'ZA', 1),
(3505, 220, 'Zhytomyr', 'ZH', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3972, 222, 'Isle of Man', 'IOM', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4019, 243, 'Kosovo', 'KM', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ft_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `ft_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `ft_zone_to_geo_zone`
--

INSERT INTO `ft_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_account`
--

CREATE TABLE IF NOT EXISTS `vtiger_account` (
  `accountid` int(19) NOT NULL DEFAULT '0',
  `account_no` varchar(100) NOT NULL,
  `accountname` varchar(100) NOT NULL,
  `parentid` int(19) DEFAULT '0',
  `account_type` varchar(200) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `annualrevenue` int(19) DEFAULT '0',
  `rating` varchar(200) DEFAULT NULL,
  `ownership` varchar(50) DEFAULT NULL,
  `siccode` varchar(50) DEFAULT NULL,
  `tickersymbol` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `otherphone` varchar(30) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `employees` int(10) DEFAULT '0',
  `emailoptout` varchar(3) DEFAULT '0',
  `notify_owner` varchar(3) DEFAULT '0',
  PRIMARY KEY (`accountid`),
  KEY `account_account_type_idx` (`account_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountbillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountbillads` (
  `accountaddressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`accountaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountdepstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountdepstatus` (
  `deploymentstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `deploymentstatus` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`deploymentstatusid`),
  UNIQUE KEY `accountdepstatus_deploymentstatus_idx` (`deploymentstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountownership`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountownership` (
  `acctownershipid` int(19) NOT NULL AUTO_INCREMENT,
  `ownership` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`acctownershipid`),
  UNIQUE KEY `accountownership_ownership_idx` (`ownership`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountrating`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountrating` (
  `accountratingid` int(19) NOT NULL AUTO_INCREMENT,
  `rating` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accountratingid`),
  UNIQUE KEY `accountrating_rating_idx` (`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountregion`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountregion` (
  `accountregionid` int(19) NOT NULL AUTO_INCREMENT,
  `region` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accountregionid`),
  UNIQUE KEY `accountregion_region_idx` (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountscf` (
  `accountid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountshipads` (
  `accountaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`accountaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accounttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_accounttype` (
  `accounttypeid` int(19) NOT NULL AUTO_INCREMENT,
  `accounttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accounttypeid`),
  UNIQUE KEY `accounttype_accounttype_idx` (`accounttype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `vtiger_accounttype`
--

INSERT INTO `vtiger_accounttype` (`accounttypeid`, `accounttype`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 1),
(2, 'Analyst', 1, 2),
(3, 'Competitor', 1, 3),
(4, 'Customer', 1, 4),
(5, 'Integrator', 1, 5),
(6, 'Investor', 1, 6),
(7, 'Partner', 1, 7),
(8, 'Press', 1, 8),
(9, 'Prospect', 1, 9),
(10, 'Reseller', 1, 10),
(11, 'Other', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accounttype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_accounttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_accounttype_seq`
--

INSERT INTO `vtiger_accounttype_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_actionmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_actionmapping` (
  `actionid` int(19) NOT NULL,
  `actionname` varchar(200) NOT NULL,
  `securitycheck` int(19) DEFAULT NULL,
  PRIMARY KEY (`actionid`,`actionname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_actionmapping`
--

INSERT INTO `vtiger_actionmapping` (`actionid`, `actionname`, `securitycheck`) VALUES
(0, 'Save', 0),
(0, 'SavePriceBook', 1),
(0, 'SaveVendor', 1),
(1, 'DetailViewAjax', 1),
(1, 'EditView', 0),
(1, 'PriceBookEditView', 1),
(1, 'QuickCreate', 1),
(1, 'VendorEditView', 1),
(2, 'Delete', 0),
(2, 'DeletePriceBook', 1),
(2, 'DeleteVendor', 1),
(3, 'index', 0),
(3, 'Popup', 1),
(4, 'DetailView', 0),
(4, 'PriceBookDetailView', 1),
(4, 'TagCloud', 1),
(4, 'VendorDetailView', 1),
(5, 'Import', 0),
(6, 'Export', 0),
(8, 'Merge', 0),
(9, 'ConvertLead', 0),
(10, 'DuplicatesHandling', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity` (
  `activityid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL,
  `semodule` varchar(20) DEFAULT NULL,
  `activitytype` varchar(200) NOT NULL,
  `date_start` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `time_start` varchar(50) DEFAULT NULL,
  `time_end` varchar(50) DEFAULT NULL,
  `sendnotification` varchar(3) NOT NULL DEFAULT '0',
  `duration_hours` varchar(200) DEFAULT NULL,
  `duration_minutes` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `eventstatus` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `notime` varchar(3) NOT NULL DEFAULT '0',
  `visibility` varchar(50) NOT NULL DEFAULT 'all',
  `recurringtype` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`activityid`),
  KEY `activity_activityid_subject_idx` (`activityid`,`subject`),
  KEY `activity_activitytype_date_start_idx` (`activitytype`,`date_start`),
  KEY `activity_date_start_due_date_idx` (`date_start`,`due_date`),
  KEY `activity_date_start_time_start_idx` (`date_start`,`time_start`),
  KEY `activity_eventstatus_idx` (`eventstatus`),
  KEY `activity_status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activitycf`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitycf` (
  `activityid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activityproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_activityproductrel` (
  `activityid` int(19) NOT NULL DEFAULT '0',
  `productid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activityid`,`productid`),
  KEY `activityproductrel_activityid_idx` (`activityid`),
  KEY `activityproductrel_productid_idx` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activitytype`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitytype` (
  `activitytypeid` int(19) NOT NULL AUTO_INCREMENT,
  `activitytype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activitytypeid`),
  UNIQUE KEY `activitytype_activitytype_idx` (`activitytype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vtiger_activitytype`
--

INSERT INTO `vtiger_activitytype` (`activitytypeid`, `activitytype`, `presence`, `picklist_valueid`) VALUES
(1, 'Call', 0, 12),
(2, 'Meeting', 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activitytype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitytype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_activitytype_seq`
--

INSERT INTO `vtiger_activitytype_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_reminder`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_reminder` (
  `activity_id` int(11) NOT NULL,
  `reminder_time` int(11) NOT NULL,
  `reminder_sent` int(2) NOT NULL,
  `recurringid` int(19) NOT NULL,
  PRIMARY KEY (`activity_id`,`recurringid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_reminder_popup`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_reminder_popup` (
  `reminderid` int(19) NOT NULL AUTO_INCREMENT,
  `semodule` varchar(100) NOT NULL,
  `recordid` int(19) NOT NULL,
  `date_start` date NOT NULL,
  `time_start` varchar(100) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`reminderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_view` (
  `activity_viewid` int(19) NOT NULL AUTO_INCREMENT,
  `activity_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`activity_viewid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_activity_view`
--

INSERT INTO `vtiger_activity_view` (`activity_viewid`, `activity_view`, `sortorderid`, `presence`) VALUES
(1, 'Today', 0, 1),
(2, 'This Week', 1, 1),
(3, 'This Month', 2, 1),
(4, 'This Year', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_activity_view_seq`
--

INSERT INTO `vtiger_activity_view_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activsubtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_activsubtype` (
  `activesubtypeid` int(19) NOT NULL AUTO_INCREMENT,
  `activsubtype` varchar(100) DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`activesubtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_announcement`
--

CREATE TABLE IF NOT EXISTS `vtiger_announcement` (
  `creatorid` int(19) NOT NULL,
  `announcement` text,
  `title` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`creatorid`),
  KEY `announcement_creatorid_idx` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assets`
--

CREATE TABLE IF NOT EXISTS `vtiger_assets` (
  `assetsid` int(11) NOT NULL,
  `asset_no` varchar(30) NOT NULL,
  `account` int(19) NOT NULL,
  `product` int(19) NOT NULL,
  `serialnumber` varchar(200) NOT NULL,
  `datesold` date NOT NULL,
  `dateinservice` date NOT NULL,
  `assetstatus` varchar(200) DEFAULT 'In Service',
  `tagnumber` varchar(300) DEFAULT NULL,
  `invoiceid` int(19) DEFAULT NULL,
  `shippingmethod` varchar(200) DEFAULT NULL,
  `shippingtrackingnumber` varchar(200) DEFAULT NULL,
  `assetname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`assetsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assetscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetscf` (
  `assetsid` int(19) NOT NULL,
  PRIMARY KEY (`assetsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assetstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetstatus` (
  `assetstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `assetstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assetstatusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vtiger_assetstatus`
--

INSERT INTO `vtiger_assetstatus` (`assetstatusid`, `assetstatus`, `presence`, `picklist_valueid`) VALUES
(1, 'In Service', 1, 235),
(2, 'Out-of-service', 1, 236);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assetstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_assetstatus_seq`
--

INSERT INTO `vtiger_assetstatus_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asterisk`
--

CREATE TABLE IF NOT EXISTS `vtiger_asterisk` (
  `server` varchar(30) DEFAULT NULL,
  `port` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asteriskextensions`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskextensions` (
  `userid` int(11) DEFAULT NULL,
  `asterisk_extension` varchar(50) DEFAULT NULL,
  `use_asterisk` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_asteriskextensions`
--

INSERT INTO `vtiger_asteriskextensions` (`userid`, `asterisk_extension`, `use_asterisk`) VALUES
(1, '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asteriskincomingcalls`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskincomingcalls` (
  `from_number` varchar(50) DEFAULT NULL,
  `from_name` varchar(50) DEFAULT NULL,
  `to_number` varchar(50) DEFAULT NULL,
  `callertype` varchar(30) DEFAULT NULL,
  `flag` int(19) DEFAULT NULL,
  `timer` int(19) DEFAULT NULL,
  `refuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asteriskincomingevents`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskincomingevents` (
  `uid` varchar(255) NOT NULL,
  `channel` varchar(100) DEFAULT NULL,
  `from_number` bigint(20) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `to_number` bigint(20) DEFAULT NULL,
  `callertype` varchar(100) DEFAULT NULL,
  `timer` int(20) DEFAULT NULL,
  `flag` varchar(3) DEFAULT NULL,
  `pbxrecordid` int(19) DEFAULT NULL,
  `relcrmid` int(19) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_attachments`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachments` (
  `attachmentsid` int(19) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `type` varchar(100) DEFAULT NULL,
  `path` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attachmentsid`),
  KEY `attachments_attachmentsid_idx` (`attachmentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_attachmentsfolder`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachmentsfolder` (
  `folderid` int(19) NOT NULL AUTO_INCREMENT,
  `foldername` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdby` int(19) NOT NULL,
  `sequence` int(19) DEFAULT NULL,
  PRIMARY KEY (`folderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vtiger_attachmentsfolder`
--

INSERT INTO `vtiger_attachmentsfolder` (`folderid`, `foldername`, `description`, `createdby`, `sequence`) VALUES
(1, 'Default', 'This is a Default Folder', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_attachmentsfolder_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachmentsfolder_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_attachmentsfolder_seq`
--

INSERT INTO `vtiger_attachmentsfolder_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_audit_trial`
--

CREATE TABLE IF NOT EXISTS `vtiger_audit_trial` (
  `auditid` int(19) NOT NULL,
  `userid` int(19) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `recordid` varchar(20) DEFAULT NULL,
  `actiondate` datetime DEFAULT NULL,
  PRIMARY KEY (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_blocks`
--

CREATE TABLE IF NOT EXISTS `vtiger_blocks` (
  `blockid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `blocklabel` varchar(100) NOT NULL,
  `sequence` int(10) DEFAULT NULL,
  `show_title` int(2) DEFAULT NULL,
  `visible` int(2) NOT NULL DEFAULT '0',
  `create_view` int(2) NOT NULL DEFAULT '0',
  `edit_view` int(2) NOT NULL DEFAULT '0',
  `detail_view` int(2) NOT NULL DEFAULT '0',
  `display_status` int(1) NOT NULL DEFAULT '1',
  `iscustom` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blockid`),
  KEY `block_tabid_idx` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_blocks`
--

INSERT INTO `vtiger_blocks` (`blockid`, `tabid`, `blocklabel`, `sequence`, `show_title`, `visible`, `create_view`, `edit_view`, `detail_view`, `display_status`, `iscustom`) VALUES
(1, 2, 'LBL_OPPORTUNITY_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(2, 2, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(3, 2, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(4, 4, 'LBL_CONTACT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(5, 4, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(6, 4, 'LBL_CUSTOMER_PORTAL_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(7, 4, 'LBL_ADDRESS_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(8, 4, 'LBL_DESCRIPTION_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(9, 6, 'LBL_ACCOUNT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(10, 6, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(11, 6, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(12, 6, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(13, 7, 'LBL_LEAD_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(14, 7, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(15, 7, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(16, 7, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(17, 8, 'LBL_NOTE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(18, 8, 'LBL_FILE_INFORMATION', 3, 1, 0, 0, 0, 0, 1, 0),
(19, 9, 'LBL_TASK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(20, 9, '', 2, 1, 0, 0, 0, 0, 1, 0),
(21, 10, 'LBL_EMAIL_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(22, 10, '', 2, 1, 0, 0, 0, 0, 1, 0),
(23, 10, '', 3, 1, 0, 0, 0, 0, 1, 0),
(24, 10, '', 4, 1, 0, 0, 0, 0, 1, 0),
(25, 13, 'LBL_TICKET_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(26, 13, '', 2, 1, 0, 0, 0, 0, 1, 0),
(27, 13, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(28, 13, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(29, 13, 'LBL_TICKET_RESOLUTION', 5, 0, 0, 1, 0, 0, 1, 0),
(30, 13, 'LBL_COMMENTS', 6, 0, 0, 1, 0, 0, 1, 0),
(31, 14, 'LBL_PRODUCT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(32, 14, 'LBL_PRICING_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(33, 14, 'LBL_STOCK_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(34, 14, 'LBL_CUSTOM_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(35, 14, 'LBL_IMAGE_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(36, 14, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(37, 15, 'LBL_FAQ_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(38, 15, 'LBL_COMMENT_INFORMATION', 4, 0, 0, 1, 0, 0, 1, 0),
(39, 16, 'LBL_EVENT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(40, 16, '', 2, 1, 0, 0, 0, 0, 1, 0),
(41, 16, '', 3, 1, 0, 0, 0, 0, 1, 0),
(42, 18, 'LBL_VENDOR_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(43, 18, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(44, 18, 'LBL_VENDOR_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(45, 18, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(46, 19, 'LBL_PRICEBOOK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(47, 19, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(48, 19, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(49, 20, 'LBL_QUOTE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(50, 20, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(51, 20, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(52, 20, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(53, 20, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(54, 20, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(55, 21, 'LBL_PO_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(56, 21, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(57, 21, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(58, 21, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(59, 21, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(60, 21, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(61, 22, 'LBL_SO_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(62, 22, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(63, 22, 'LBL_ADDRESS_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(64, 22, 'LBL_RELATED_PRODUCTS', 5, 0, 0, 0, 0, 0, 1, 0),
(65, 22, 'LBL_TERMS_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(66, 22, 'LBL_DESCRIPTION_INFORMATION', 7, 0, 0, 0, 0, 0, 1, 0),
(67, 23, 'LBL_INVOICE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(68, 23, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(69, 23, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(70, 23, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(71, 23, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(72, 23, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(73, 4, 'LBL_IMAGE_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(74, 26, 'LBL_CAMPAIGN_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(75, 26, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(76, 26, 'LBL_EXPECTATIONS_AND_ACTUALS', 3, 0, 0, 0, 0, 0, 1, 0),
(77, 29, 'LBL_USERLOGIN_ROLE', 1, 0, 0, 0, 0, 0, 1, 0),
(78, 29, 'LBL_CURRENCY_CONFIGURATION', 2, 0, 0, 0, 0, 0, 1, 0),
(79, 29, 'LBL_MORE_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(80, 29, 'LBL_ADDRESS_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(81, 26, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(82, 29, 'LBL_USER_IMAGE_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(83, 29, 'LBL_USER_ADV_OPTIONS', 5, 0, 0, 0, 0, 0, 1, 0),
(84, 8, 'LBL_DESCRIPTION', 2, 0, 0, 0, 0, 0, 1, 0),
(85, 22, 'Recurring Invoice Information', 2, 0, 0, 0, 0, 0, 1, 0),
(86, 9, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(87, 16, 'LBL_CUSTOM_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(88, 32, 'LBL_SERVICE_CONTRACT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(89, 32, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(90, 38, 'LBL_SERVICE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(91, 38, 'LBL_PRICING_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(92, 38, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(93, 38, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(94, 40, 'LBL_CALL_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(95, 40, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(96, 29, 'Asterisk Configuration', 6, 0, 0, 0, 0, 0, 1, 0),
(97, 42, 'LBL_MODCOMMENTS_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(98, 42, 'LBL_OTHER_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(99, 42, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(100, 44, 'LBL_ASSET_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(101, 44, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(102, 44, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(103, 47, 'LBL_SMSNOTIFIER_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(104, 47, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(105, 47, 'StatusInformation', 3, 0, 0, 0, 0, 0, 1, 0),
(106, 50, 'LBL_PROJECT_MILESTONE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(107, 50, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(108, 50, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(109, 51, 'LBL_PROJECT_TASK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(110, 51, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(111, 51, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(112, 52, 'LBL_PROJECT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(113, 52, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(114, 52, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_blocks_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_blocks_seq`
--

INSERT INTO `vtiger_blocks_seq` (`id`) VALUES
(114);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_businesstype`
--

CREATE TABLE IF NOT EXISTS `vtiger_businesstype` (
  `businesstypeid` int(19) NOT NULL AUTO_INCREMENT,
  `businesstype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`businesstypeid`),
  UNIQUE KEY `businesstype_businesstype_idx` (`businesstype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaign`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaign` (
  `campaign_no` varchar(100) NOT NULL,
  `campaignname` varchar(255) DEFAULT NULL,
  `campaigntype` varchar(200) DEFAULT NULL,
  `campaignstatus` varchar(200) DEFAULT NULL,
  `expectedrevenue` decimal(25,3) DEFAULT NULL,
  `budgetcost` decimal(25,3) DEFAULT NULL,
  `actualcost` decimal(25,3) DEFAULT NULL,
  `expectedresponse` varchar(200) DEFAULT NULL,
  `numsent` decimal(11,0) DEFAULT NULL,
  `product_id` int(19) DEFAULT NULL,
  `sponsor` varchar(255) DEFAULT NULL,
  `targetaudience` varchar(255) DEFAULT NULL,
  `targetsize` int(19) DEFAULT NULL,
  `expectedresponsecount` int(19) DEFAULT NULL,
  `expectedsalescount` int(19) DEFAULT NULL,
  `expectedroi` decimal(25,3) DEFAULT NULL,
  `actualresponsecount` int(19) DEFAULT NULL,
  `actualsalescount` int(19) DEFAULT NULL,
  `actualroi` decimal(25,3) DEFAULT NULL,
  `campaignid` int(19) NOT NULL,
  `closingdate` date DEFAULT NULL,
  PRIMARY KEY (`campaignid`),
  KEY `campaign_campaignstatus_idx` (`campaignstatus`),
  KEY `campaign_campaignname_idx` (`campaignname`),
  KEY `campaign_campaignid_idx` (`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignaccountrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignaccountrel` (
  `campaignid` int(19) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `campaignrelstatusid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaigncontrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigncontrel` (
  `campaignid` int(19) NOT NULL DEFAULT '0',
  `contactid` int(19) NOT NULL DEFAULT '0',
  `campaignrelstatusid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaignid`,`contactid`,`campaignrelstatusid`),
  KEY `campaigncontrel_contractid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignleadrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignleadrel` (
  `campaignid` int(19) NOT NULL DEFAULT '0',
  `leadid` int(19) NOT NULL DEFAULT '0',
  `campaignrelstatusid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaignid`,`leadid`,`campaignrelstatusid`),
  KEY `campaignleadrel_leadid_campaignid_idx` (`leadid`,`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignrelstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignrelstatus` (
  `campaignrelstatusid` int(19) DEFAULT NULL,
  `campaignrelstatus` varchar(256) DEFAULT NULL,
  `sortorderid` int(19) DEFAULT NULL,
  `presence` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaignrelstatus`
--

INSERT INTO `vtiger_campaignrelstatus` (`campaignrelstatusid`, `campaignrelstatus`, `sortorderid`, `presence`) VALUES
(1, '--None--', 0, 1),
(2, 'Contacted - Successful', 1, 1),
(3, 'Contacted - Unsuccessful', 2, 1),
(4, 'Contacted - Never Contact Again', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignrelstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignrelstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaignrelstatus_seq`
--

INSERT INTO `vtiger_campaignrelstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignscf` (
  `campaignid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignstatus` (
  `campaignstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `campaignstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaignstatusid`),
  KEY `campaignstatus_campaignstatus_idx` (`campaignstatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_campaignstatus`
--

INSERT INTO `vtiger_campaignstatus` (`campaignstatusid`, `campaignstatus`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 14),
(2, 'Planning', 1, 15),
(3, 'Active', 1, 16),
(4, 'Inactive', 1, 17),
(5, 'Completed', 1, 18),
(6, 'Cancelled', 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaignstatus_seq`
--

INSERT INTO `vtiger_campaignstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaigntype`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigntype` (
  `campaigntypeid` int(19) NOT NULL AUTO_INCREMENT,
  `campaigntype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaigntypeid`),
  UNIQUE KEY `campaigntype_campaigntype_idx` (`campaigntype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `vtiger_campaigntype`
--

INSERT INTO `vtiger_campaigntype` (`campaigntypeid`, `campaigntype`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 20),
(2, 'Conference', 1, 21),
(3, 'Webinar', 1, 22),
(4, 'Trade Show', 1, 23),
(5, 'Public Relations', 1, 24),
(6, 'Partners', 1, 25),
(7, 'Referral Program', 1, 26),
(8, 'Advertisement', 1, 27),
(9, 'Banner Ads', 1, 28),
(10, 'Direct Mail', 1, 29),
(11, 'Email', 1, 30),
(12, 'Telemarketing', 1, 31),
(13, 'Others', 1, 32);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaigntype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigntype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaigntype_seq`
--

INSERT INTO `vtiger_campaigntype_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_carrier`
--

CREATE TABLE IF NOT EXISTS `vtiger_carrier` (
  `carrierid` int(19) NOT NULL AUTO_INCREMENT,
  `carrier` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`carrierid`),
  UNIQUE KEY `carrier_carrier_idx` (`carrier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_carrier`
--

INSERT INTO `vtiger_carrier` (`carrierid`, `carrier`, `presence`, `picklist_valueid`) VALUES
(1, 'FedEx', 1, 33),
(2, 'UPS', 1, 34),
(3, 'USPS', 1, 35),
(4, 'DHL', 1, 36),
(5, 'BlueDart', 1, 37);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_carrier_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_carrier_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_carrier_seq`
--

INSERT INTO `vtiger_carrier_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_chat_msg`
--

CREATE TABLE IF NOT EXISTS `vtiger_chat_msg` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `chat_from` int(20) NOT NULL DEFAULT '0',
  `chat_to` int(20) NOT NULL DEFAULT '0',
  `born` datetime DEFAULT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_msg_chat_from_idx` (`chat_from`),
  KEY `chat_msg_chat_to_idx` (`chat_to`),
  KEY `chat_msg_born_idx` (`born`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_chat_pchat`
--

CREATE TABLE IF NOT EXISTS `vtiger_chat_pchat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `msg` int(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_pchat_msg_idx` (`msg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_chat_pvchat`
--

CREATE TABLE IF NOT EXISTS `vtiger_chat_pvchat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `msg` int(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_pvchat_msg_idx` (`msg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_chat_users`
--

CREATE TABLE IF NOT EXISTS `vtiger_chat_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nick` varchar(50) NOT NULL,
  `session` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '000.000.000.000',
  `ping` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_users_nick_idx` (`nick`),
  KEY `chat_users_session_idx` (`session`),
  KEY `chat_users_ping_idx` (`ping`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vtiger_chat_users`
--

INSERT INTO `vtiger_chat_users` (`id`, `nick`, `session`, `ip`, `ping`) VALUES
(1, 'admin', 'o2oao3sj39chmg7k1drjnie1s2', '127.0.0.1', '2013-07-23 17:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cntactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_cntactivityrel` (
  `contactid` int(19) NOT NULL DEFAULT '0',
  `activityid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contactid`,`activityid`),
  KEY `cntactivityrel_contactid_idx` (`contactid`),
  KEY `cntactivityrel_activityid_idx` (`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_competitor`
--

CREATE TABLE IF NOT EXISTS `vtiger_competitor` (
  `competitorid` int(19) NOT NULL,
  `competitorname` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `strength` varchar(250) DEFAULT NULL,
  `weakness` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`competitorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactaddress`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactaddress` (
  `contactaddressid` int(19) NOT NULL DEFAULT '0',
  `mailingcity` varchar(40) DEFAULT NULL,
  `mailingstreet` varchar(250) DEFAULT NULL,
  `mailingcountry` varchar(40) DEFAULT NULL,
  `othercountry` varchar(30) DEFAULT NULL,
  `mailingstate` varchar(30) DEFAULT NULL,
  `mailingpobox` varchar(30) DEFAULT NULL,
  `othercity` varchar(40) DEFAULT NULL,
  `otherstate` varchar(50) DEFAULT NULL,
  `mailingzip` varchar(30) DEFAULT NULL,
  `otherzip` varchar(30) DEFAULT NULL,
  `otherstreet` varchar(250) DEFAULT NULL,
  `otherpobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`contactaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactdetails` (
  `contactid` int(19) NOT NULL DEFAULT '0',
  `contact_no` varchar(100) NOT NULL,
  `accountid` int(19) DEFAULT NULL,
  `salutation` varchar(200) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(80) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `reportsto` varchar(30) DEFAULT NULL,
  `training` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `contacttype` varchar(50) DEFAULT NULL,
  `otheremail` varchar(100) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `donotcall` varchar(3) DEFAULT NULL,
  `emailoptout` varchar(3) DEFAULT '0',
  `imagename` varchar(150) DEFAULT NULL,
  `reference` varchar(3) DEFAULT NULL,
  `notify_owner` varchar(3) DEFAULT '0',
  PRIMARY KEY (`contactid`),
  KEY `contactdetails_accountid_idx` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactscf` (
  `contactid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactsubdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactsubdetails` (
  `contactsubscriptionid` int(19) NOT NULL DEFAULT '0',
  `homephone` varchar(50) DEFAULT NULL,
  `otherphone` varchar(50) DEFAULT NULL,
  `assistant` varchar(30) DEFAULT NULL,
  `assistantphone` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `laststayintouchrequest` int(30) DEFAULT '0',
  `laststayintouchsavedate` int(19) DEFAULT '0',
  `leadsource` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`contactsubscriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contacttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_contacttype` (
  `contacttypeid` int(19) NOT NULL AUTO_INCREMENT,
  `contacttype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`contacttypeid`),
  UNIQUE KEY `contacttype_contacttype_idx` (`contacttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contpotentialrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_contpotentialrel` (
  `contactid` int(19) NOT NULL DEFAULT '0',
  `potentialid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contactid`,`potentialid`),
  KEY `contpotentialrel_potentialid_idx` (`potentialid`),
  KEY `contpotentialrel_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_priority`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_priority` (
  `contract_priorityid` int(11) NOT NULL AUTO_INCREMENT,
  `contract_priority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contract_priorityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_contract_priority`
--

INSERT INTO `vtiger_contract_priority` (`contract_priorityid`, `contract_priority`, `presence`, `picklist_valueid`) VALUES
(1, 'Low', 1, 220),
(2, 'Normal', 1, 221),
(3, 'High', 1, 222);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_priority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_priority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_priority_seq`
--

INSERT INTO `vtiger_contract_priority_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_status` (
  `contract_statusid` int(11) NOT NULL AUTO_INCREMENT,
  `contract_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contract_statusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_contract_status`
--

INSERT INTO `vtiger_contract_status` (`contract_statusid`, `contract_status`, `presence`, `picklist_valueid`) VALUES
(1, 'Undefined', 1, 214),
(2, 'In Planning', 1, 215),
(3, 'In Progress', 1, 216),
(4, 'On Hold', 1, 217),
(5, 'Complete', 0, 218),
(6, 'Archived', 1, 219);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_status_seq`
--

INSERT INTO `vtiger_contract_status_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_type` (
  `contract_typeid` int(11) NOT NULL AUTO_INCREMENT,
  `contract_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contract_typeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_contract_type`
--

INSERT INTO `vtiger_contract_type` (`contract_typeid`, `contract_type`, `presence`, `picklist_valueid`) VALUES
(1, 'Support', 1, 223),
(2, 'Services', 1, 224),
(3, 'Administrative', 1, 225);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_type_seq`
--

INSERT INTO `vtiger_contract_type_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_convertleadmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_convertleadmapping` (
  `cfmid` int(19) NOT NULL AUTO_INCREMENT,
  `leadfid` int(19) NOT NULL,
  `accountfid` int(19) DEFAULT NULL,
  `contactfid` int(19) DEFAULT NULL,
  `potentialfid` int(19) DEFAULT NULL,
  `editable` int(19) DEFAULT '1',
  PRIMARY KEY (`cfmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `vtiger_convertleadmapping`
--

INSERT INTO `vtiger_convertleadmapping` (`cfmid`, `leadfid`, `accountfid`, `contactfid`, `potentialfid`, `editable`) VALUES
(1, 43, 1, 0, 110, 0),
(2, 49, 14, 0, 0, 1),
(3, 40, 3, 69, 0, NULL),
(4, 0, 0, 0, 0, NULL),
(5, 44, 5, 77, 0, 1),
(6, 52, 13, 0, 0, 1),
(7, 46, 9, 80, 0, 0),
(8, 48, 4, 0, 0, 1),
(9, 61, 26, 98, 0, 1),
(10, 60, 30, 0, 0, 1),
(11, 62, 32, 104, 0, 1),
(12, 63, 28, 100, 0, 1),
(13, 59, 24, 96, 0, 1),
(14, 64, 34, 106, 0, 1),
(15, 61, 27, 0, 0, 1),
(16, 60, 31, 0, 0, 1),
(17, 62, 33, 0, 0, 1),
(18, 63, 29, 0, 0, 1),
(19, 59, 25, 0, 0, 1),
(20, 64, 35, 0, 0, 1),
(21, 65, 36, 109, 125, 1),
(22, 37, 0, 66, 0, 1),
(23, 38, 0, 67, 0, 0),
(24, 41, 0, 70, 0, 0),
(25, 42, 0, 71, 0, 1),
(26, 45, 0, 76, 0, 1),
(27, 55, 0, 83, 0, 1),
(28, 47, 0, 74, 117, 1),
(29, 50, 0, 0, 0, 1),
(30, 53, 10, 0, 0, 1),
(31, 51, 17, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentity`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentity` (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT '0',
  `smownerid` int(19) NOT NULL DEFAULT '0',
  `modifiedby` int(19) NOT NULL DEFAULT '0',
  `setype` varchar(30) NOT NULL,
  `description` text,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`crmid`),
  KEY `crmentity_smcreatorid_idx` (`smcreatorid`),
  KEY `crmentity_modifiedby_idx` (`modifiedby`),
  KEY `crmentity_deleted_idx` (`deleted`),
  KEY `crm_ownerid_del_setype_idx` (`smownerid`,`deleted`,`setype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentitynotesrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentitynotesrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `notesid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`crmid`,`notesid`),
  KEY `crmentitynotesrel_notesid_idx` (`notesid`),
  KEY `crmentitynotesrel_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentityrel` (
  `crmid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relcrmid` int(11) NOT NULL,
  `relmodule` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentity_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_crmentity_seq`
--

INSERT INTO `vtiger_crmentity_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cron_task`
--

CREATE TABLE IF NOT EXISTS `vtiger_cron_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `handler_file` varchar(100) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `laststart` mediumtext,
  `lastend` mediumtext,
  `status` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `handler_file` (`handler_file`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_cron_task`
--

INSERT INTO `vtiger_cron_task` (`id`, `name`, `handler_file`, `frequency`, `laststart`, `lastend`, `status`, `module`, `sequence`, `description`) VALUES
(1, 'Workflow', 'cron/modules/com_vtiger_workflow/com_vtiger_workflow.service', 900, NULL, NULL, 1, 'com_vtiger_workflow', 1, 'Recommended frequency for Workflow is 15 mins'),
(2, 'RecurringInvoice', 'cron/modules/SalesOrder/RecurringInvoice.service', 43200, NULL, NULL, 1, 'SalesOrder', 2, 'Recommended frequency for RecurringInvoice is 12 hours'),
(3, 'SendReminder', 'cron/SendReminder.service', 900, NULL, NULL, 1, 'Calendar', 3, 'Recommended frequency for SendReminder is 15 mins'),
(4, 'ScheduleReports', 'cron/modules/Reports/ScheduleReports.service', 900, NULL, NULL, 1, 'Reports', 4, 'Recommended frequency for ScheduleReports is 15 mins'),
(5, 'MailScanner', 'cron/MailScanner.service', 900, NULL, NULL, 1, 'Settings', 5, 'Recommended frequency for MailScanner is 15 mins'),
(6, 'Scheduled Import', 'cron/modules/Import/ScheduledImport.service', 900, NULL, NULL, 1, 'Import', 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currencies`
--

CREATE TABLE IF NOT EXISTS `vtiger_currencies` (
  `currencyid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(200) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `currency_symbol` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`currencyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=130 ;

--
-- Dumping data for table `vtiger_currencies`
--

INSERT INTO `vtiger_currencies` (`currencyid`, `currency_name`, `currency_code`, `currency_symbol`) VALUES
(1, 'Albania, Leke', 'ALL', 'Lek'),
(2, 'Argentina, Pesos', 'ARS', '$'),
(3, 'Aruba, Guilders', 'AWG', 'ƒ'),
(4, 'Australia, Dollars', 'AUD', '$'),
(5, 'Azerbaijan, New Manats', 'AZN', 'ман'),
(6, 'Bahamas, Dollars', 'BSD', '$'),
(7, 'Bahrain, Dinar', 'BHD', 'BD'),
(8, 'Barbados, Dollars', 'BBD', '$'),
(9, 'Belarus, Rubles', 'BYR', 'p.'),
(10, 'Belize, Dollars', 'BZD', 'BZ$'),
(11, 'Bermuda, Dollars', 'BMD', '$'),
(12, 'Bolivia, Bolivianos', 'BOB', '$b'),
(13, 'China, Yuan Renminbi', 'CNY', '¥'),
(14, 'Convertible Marka', 'BAM', 'KM'),
(15, 'Botswana, Pulas', 'BWP', 'P'),
(16, 'Bulgaria, Leva', 'BGN', 'лв'),
(17, 'Brazil, Reais', 'BRL', 'R$'),
(18, 'Great Britain Pounds', 'GBP', '£'),
(19, 'Brunei Darussalam, Dollars', 'BND', '$'),
(20, 'Canada, Dollars', 'CAD', '$'),
(21, 'Cayman Islands, Dollars', 'KYD', '$'),
(22, 'Chile, Pesos', 'CLP', '$'),
(23, 'Colombia, Pesos', 'COP', '$'),
(24, 'Costa Rica, Colón', 'CRC', '₡'),
(25, 'Croatia, Kuna', 'HRK', 'kn'),
(26, 'Cuba, Pesos', 'CUP', '₱'),
(27, 'Czech Republic, Koruny', 'CZK', 'Kč'),
(28, 'Cyprus, Pounds', 'CYP', '£'),
(29, 'Denmark, Kroner', 'DKK', 'kr'),
(30, 'Dominican Republic, Pesos', 'DOP', 'RD$'),
(31, 'East Caribbean, Dollars', 'XCD', '$'),
(32, 'Egypt, Pounds', 'EGP', '£'),
(33, 'El Salvador, Colón', 'SVC', '₡'),
(34, 'England, Pounds', 'GBP', '£'),
(35, 'Estonia, Krooni', 'EEK', 'kr'),
(36, 'Euro', 'EUR', '€'),
(37, 'Falkland Islands, Pounds', 'FKP', '£'),
(38, 'Fiji, Dollars', 'FJD', '$'),
(39, 'Ghana, Cedis', 'GHC', '¢'),
(40, 'Gibraltar, Pounds', 'GIP', '£'),
(41, 'Guatemala, Quetzales', 'GTQ', 'Q'),
(42, 'Guernsey, Pounds', 'GGP', '£'),
(43, 'Guyana, Dollars', 'GYD', '$'),
(44, 'Honduras, Lempiras', 'HNL', 'L'),
(45, 'LvHong Kong, Dollars ', 'HKD', 'HK$'),
(46, 'Hungary, Forint', 'HUF', 'Ft'),
(47, 'Iceland, Krona', 'ISK', 'kr'),
(48, 'India, Rupees', 'INR', '₨'),
(49, 'Indonesia, Rupiahs', 'IDR', 'Rp'),
(50, 'Iran, Rials', 'IRR', '﷼'),
(51, 'Isle of Man, Pounds', 'IMP', '£'),
(52, 'Israel, New Shekels', 'ILS', '₪'),
(53, 'Jamaica, Dollars', 'JMD', 'J$'),
(54, 'Japan, Yen', 'JPY', '¥'),
(55, 'Jersey, Pounds', 'JEP', '£'),
(56, 'Jordan, Dinar', 'JOD', 'JOD'),
(57, 'Kazakhstan, Tenge', 'KZT', '〒'),
(58, 'Kenya, Shilling', 'KES', 'KES'),
(59, 'Korea (North), Won', 'KPW', '₩'),
(60, 'Korea (South), Won', 'KRW', '₩'),
(61, 'Kuwait, Dinar', 'KWD', 'KWD'),
(62, 'Kyrgyzstan, Soms', 'KGS', 'лв'),
(63, 'Laos, Kips', 'LAK', '₭'),
(64, 'Latvia, Lati', 'LVL', 'Ls'),
(65, 'Lebanon, Pounds', 'LBP', '£'),
(66, 'Liberia, Dollars', 'LRD', '$'),
(67, 'Switzerland Francs', 'CHF', 'CHF'),
(68, 'Lithuania, Litai', 'LTL', 'Lt'),
(69, 'MADAGASCAR, Malagasy Ariary', 'MGA', 'MGA'),
(70, 'Macedonia, Denars', 'MKD', 'ден'),
(71, 'Malaysia, Ringgits', 'MYR', 'RM'),
(72, 'Malta, Liri', 'MTL', '₤'),
(73, 'Mauritius, Rupees', 'MUR', '₨'),
(74, 'Mexico, Pesos', 'MXN', '$'),
(75, 'Mongolia, Tugriks', 'MNT', '₮'),
(76, 'Mozambique, Meticais', 'MZN', 'MT'),
(77, 'Namibia, Dollars', 'NAD', '$'),
(78, 'Nepal, Rupees', 'NPR', '₨'),
(79, 'Netherlands Antilles, Guilders', 'ANG', 'ƒ'),
(80, 'New Zealand, Dollars', 'NZD', '$'),
(81, 'Nicaragua, Cordobas', 'NIO', 'C$'),
(82, 'Nigeria, Nairas', 'NGN', '₦'),
(83, 'North Korea, Won', 'KPW', '₩'),
(84, 'Norway, Krone', 'NOK', 'kr'),
(85, 'Oman, Rials', 'OMR', '﷼'),
(86, 'Pakistan, Rupees', 'PKR', '₨'),
(87, 'Panama, Balboa', 'PAB', 'B/.'),
(88, 'Paraguay, Guarani', 'PYG', 'Gs'),
(89, 'Peru, Nuevos Soles', 'PEN', 'S/.'),
(90, 'Philippines, Pesos', 'PHP', 'Php'),
(91, 'Poland, Zlotych', 'PLN', 'zł'),
(92, 'Qatar, Rials', 'QAR', '﷼'),
(93, 'Romania, New Lei', 'RON', 'lei'),
(94, 'Russia, Rubles', 'RUB', 'руб'),
(95, 'Saint Helena, Pounds', 'SHP', '£'),
(96, 'Saudi Arabia, Riyals', 'SAR', '﷼'),
(97, 'Serbia, Dinars', 'RSD', 'Дин.'),
(98, 'Seychelles, Rupees', 'SCR', '₨'),
(99, 'Singapore, Dollars', 'SGD', '$'),
(100, 'Solomon Islands, Dollars', 'SBD', '$'),
(101, 'Somalia, Shillings', 'SOS', 'S'),
(102, 'South Africa, Rand', 'ZAR', 'R'),
(103, 'South Korea, Won', 'KRW', '₩'),
(104, 'Sri Lanka, Rupees', 'LKR', '₨'),
(105, 'Sweden, Kronor', 'SEK', 'kr'),
(106, 'Switzerland, Francs', 'CHF', 'CHF'),
(107, 'Suriname, Dollars', 'SRD', '$'),
(108, 'Syria, Pounds', 'SYP', '£'),
(109, 'Taiwan, New Dollars', 'TWD', 'NT$'),
(110, 'Thailand, Baht', 'THB', '฿'),
(111, 'Trinidad and Tobago, Dollars', 'TTD', 'TT$'),
(112, 'Turkey, New Lira', 'TRY', 'YTL'),
(113, 'Turkey, Liras', 'TRL', '₤'),
(114, 'Tuvalu, Dollars', 'TVD', '$'),
(115, 'Ukraine, Hryvnia', 'UAH', '₴'),
(116, 'United Arab Emirates, Dirham', 'AED', 'AED'),
(117, 'United Kingdom, Pounds', 'GBP', '£'),
(118, 'United Republic of Tanzania, Shilling', 'TZS', 'TZS'),
(119, 'USA, Dollars', 'USD', '$'),
(120, 'Uruguay, Pesos', 'UYU', '$U'),
(121, 'Uzbekistan, Sums', 'UZS', 'лв'),
(122, 'Venezuela, Bolivares Fuertes', 'VEF', 'Bs'),
(123, 'Vietnam, Dong', 'VND', '₫'),
(124, 'Zambia, Kwacha', 'ZMK', 'ZMK'),
(125, 'Yemen, Rials', 'YER', '﷼'),
(126, 'Zimbabwe Dollars', 'ZWD', 'Z$'),
(127, 'Malawi, Kwacha', 'MWK', 'MK'),
(128, 'Tunisian, Dinar', 'TD', 'TD'),
(129, 'Moroccan, Dirham', 'MAD', 'درهم');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currencies_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currencies_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currencies_seq`
--

INSERT INTO `vtiger_currencies_seq` (`id`) VALUES
(129);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency` (
  `currencyid` int(19) NOT NULL AUTO_INCREMENT,
  `currency` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`currencyid`),
  UNIQUE KEY `currency_currency_idx` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_decimal_separator`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_decimal_separator` (
  `currency_decimal_separatorid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_decimal_separator` varchar(2) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`currency_decimal_separatorid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_currency_decimal_separator`
--

INSERT INTO `vtiger_currency_decimal_separator` (`currency_decimal_separatorid`, `currency_decimal_separator`, `sortorderid`, `presence`) VALUES
(1, '.', 0, 1),
(2, ',', 1, 1),
(3, '''', 2, 1),
(4, ' ', 3, 1),
(5, '$', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_decimal_separator_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_decimal_separator_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_decimal_separator_seq`
--

INSERT INTO `vtiger_currency_decimal_separator_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_pattern`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_pattern` (
  `currency_grouping_patternid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_grouping_pattern` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`currency_grouping_patternid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_currency_grouping_pattern`
--

INSERT INTO `vtiger_currency_grouping_pattern` (`currency_grouping_patternid`, `currency_grouping_pattern`, `sortorderid`, `presence`) VALUES
(1, '123,456,789', 0, 1),
(2, '123456789', 1, 1),
(3, '123456,789', 2, 1),
(4, '12,34,56,789', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_pattern_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_pattern_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_grouping_pattern_seq`
--

INSERT INTO `vtiger_currency_grouping_pattern_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_separator`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_separator` (
  `currency_grouping_separatorid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_grouping_separator` varchar(2) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`currency_grouping_separatorid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_currency_grouping_separator`
--

INSERT INTO `vtiger_currency_grouping_separator` (`currency_grouping_separatorid`, `currency_grouping_separator`, `sortorderid`, `presence`) VALUES
(1, '.', 0, 1),
(2, ',', 1, 1),
(3, '''', 2, 1),
(4, ' ', 3, 1),
(5, '$', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_separator_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_separator_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_grouping_separator_seq`
--

INSERT INTO `vtiger_currency_grouping_separator_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(30) DEFAULT NULL,
  `conversion_rate` decimal(10,3) DEFAULT NULL,
  `currency_status` varchar(25) DEFAULT NULL,
  `defaultid` varchar(10) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vtiger_currency_info`
--

INSERT INTO `vtiger_currency_info` (`id`, `currency_name`, `currency_code`, `currency_symbol`, `conversion_rate`, `currency_status`, `defaultid`, `deleted`) VALUES
(1, 'United Kingdom, Pounds', 'GBP', '£', '1.000', 'Active', '-11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_info_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_info_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_info_seq`
--

INSERT INTO `vtiger_currency_info_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_symbol_placement`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_symbol_placement` (
  `currency_symbol_placementid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_symbol_placement` varchar(30) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`currency_symbol_placementid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vtiger_currency_symbol_placement`
--

INSERT INTO `vtiger_currency_symbol_placement` (`currency_symbol_placementid`, `currency_symbol_placement`, `sortorderid`, `presence`) VALUES
(1, '$1.0', 0, 1),
(2, '1.0$', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_symbol_placement_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_symbol_placement_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_symbol_placement_seq`
--

INSERT INTO `vtiger_currency_symbol_placement_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customaction`
--

CREATE TABLE IF NOT EXISTS `vtiger_customaction` (
  `cvid` int(19) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` text,
  KEY `customaction_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerdetails` (
  `customerid` int(19) NOT NULL,
  `portal` varchar(3) DEFAULT NULL,
  `support_start_date` date DEFAULT NULL,
  `support_end_date` date DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_fields`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_fields` (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_prefs`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_prefs` (
  `tabid` int(19) NOT NULL,
  `prefkey` varchar(100) NOT NULL,
  `prefvalue` int(20) DEFAULT NULL,
  PRIMARY KEY (`tabid`,`prefkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerportal_prefs`
--

INSERT INTO `vtiger_customerportal_prefs` (`tabid`, `prefkey`, `prefvalue`) VALUES
(0, 'defaultassignee', 1),
(0, 'userid', 1),
(4, 'showrelatedinfo', 1),
(6, 'showrelatedinfo', 1),
(8, 'showrelatedinfo', 1),
(13, 'showrelatedinfo', 1),
(14, 'showrelatedinfo', 1),
(15, 'showrelatedinfo', 1),
(20, 'showrelatedinfo', 1),
(23, 'showrelatedinfo', 1),
(38, 'showrelatedinfo', 1),
(44, 'showrelatedinfo', 1),
(50, 'showrelatedinfo', 1),
(51, 'showrelatedinfo', 1),
(52, 'showrelatedinfo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_tabs`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_tabs` (
  `tabid` int(19) NOT NULL,
  `visible` int(1) DEFAULT '1',
  `sequence` int(1) DEFAULT NULL,
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerportal_tabs`
--

INSERT INTO `vtiger_customerportal_tabs` (`tabid`, `visible`, `sequence`) VALUES
(4, 1, 9),
(6, 1, 10),
(8, 1, 8),
(13, 1, 2),
(14, 1, 6),
(15, 1, 3),
(20, 1, 5),
(23, 1, 4),
(38, 1, 7),
(44, 1, 11),
(50, 1, 12),
(51, 1, 13),
(52, 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customview`
--

CREATE TABLE IF NOT EXISTS `vtiger_customview` (
  `cvid` int(19) NOT NULL,
  `viewname` varchar(100) NOT NULL,
  `setdefault` int(1) DEFAULT '0',
  `setmetrics` int(1) DEFAULT '0',
  `entitytype` varchar(25) NOT NULL,
  `status` int(1) DEFAULT '1',
  `userid` int(19) DEFAULT '1',
  PRIMARY KEY (`cvid`),
  KEY `customview_entitytype_idx` (`entitytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customview`
--

INSERT INTO `vtiger_customview` (`cvid`, `viewname`, `setdefault`, `setmetrics`, `entitytype`, `status`, `userid`) VALUES
(1, 'All', 1, 0, 'Leads', 0, 1),
(2, 'Hot Leads', 0, 1, 'Leads', 3, 1),
(3, 'This Month Leads', 0, 0, 'Leads', 3, 1),
(4, 'All', 1, 0, 'Accounts', 0, 1),
(5, 'Prospect Accounts', 0, 1, 'Accounts', 3, 1),
(6, 'New This Week', 0, 0, 'Accounts', 3, 1),
(7, 'All', 1, 0, 'Contacts', 0, 1),
(8, 'Contacts Address', 0, 0, 'Contacts', 3, 1),
(9, 'Todays Birthday', 0, 0, 'Contacts', 3, 1),
(10, 'All', 1, 0, 'Potentials', 0, 1),
(11, 'Potentials Won', 0, 1, 'Potentials', 3, 1),
(12, 'Prospecting', 0, 0, 'Potentials', 3, 1),
(13, 'All', 1, 0, 'HelpDesk', 0, 1),
(14, 'Open Tickets', 0, 1, 'HelpDesk', 3, 1),
(15, 'High Prioriy Tickets', 0, 0, 'HelpDesk', 3, 1),
(16, 'All', 1, 0, 'Quotes', 0, 1),
(17, 'Open Quotes', 0, 1, 'Quotes', 3, 1),
(18, 'Rejected Quotes', 0, 0, 'Quotes', 3, 1),
(19, 'All', 1, 0, 'Calendar', 0, 1),
(20, 'All', 1, 0, 'Emails', 0, 1),
(21, 'All', 1, 0, 'Invoice', 0, 1),
(22, 'All', 1, 0, 'Documents', 0, 1),
(23, 'All', 1, 0, 'PriceBooks', 0, 1),
(24, 'All', 1, 0, 'Products', 0, 1),
(25, 'All', 1, 0, 'PurchaseOrder', 0, 1),
(26, 'All', 1, 0, 'SalesOrder', 0, 1),
(27, 'All', 1, 0, 'Vendors', 0, 1),
(28, 'All', 1, 0, 'Faq', 0, 1),
(29, 'All', 1, 0, 'Campaigns', 0, 1),
(30, 'All', 1, 0, 'Webmails', 0, 1),
(31, 'Drafted FAQ', 0, 0, 'Faq', 3, 1),
(32, 'Published FAQ', 0, 0, 'Faq', 3, 1),
(33, 'Open Purchase Orders', 0, 0, 'PurchaseOrder', 3, 1),
(34, 'Received Purchase Orders', 0, 0, 'PurchaseOrder', 3, 1),
(35, 'Open Invoices', 0, 0, 'Invoice', 3, 1),
(36, 'Paid Invoices', 0, 0, 'Invoice', 3, 1),
(37, 'Pending Sales Orders', 0, 0, 'SalesOrder', 3, 1),
(38, 'All', 1, 0, 'ServiceContracts', 0, 1),
(39, 'All', 1, 0, 'Services', 0, 1),
(40, 'All', 1, 0, 'PBXManager', 0, 1),
(41, 'Missed', 0, 0, 'PBXManager', 3, 1),
(42, 'Dialed', 0, 0, 'PBXManager', 3, 1),
(43, 'Received', 0, 0, 'PBXManager', 3, 1),
(44, 'All', 0, 0, 'ModComments', 0, 1),
(45, 'All', 1, 0, 'Assets', 0, 1),
(46, 'All', 0, 0, 'SMSNotifier', 0, 1),
(47, 'All', 1, 0, 'ProjectMilestone', 0, 1),
(48, 'All', 1, 0, 'ProjectTask', 0, 1),
(49, 'All', 1, 0, 'Project', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customview_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_customview_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customview_seq`
--

INSERT INTO `vtiger_customview_seq` (`id`) VALUES
(49);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvadvfilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvadvfilter` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `comparator` varchar(10) DEFAULT '',
  `value` varchar(200) DEFAULT '',
  `groupid` int(11) DEFAULT '1',
  `column_condition` varchar(255) DEFAULT 'and',
  PRIMARY KEY (`cvid`,`columnindex`),
  KEY `cvadvfilter_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvadvfilter`
--

INSERT INTO `vtiger_cvadvfilter` (`cvid`, `columnindex`, `columnname`, `comparator`, `value`, `groupid`, `column_condition`) VALUES
(2, 0, 'vtiger_leaddetails:leadstatus:leadstatus:Leads_Lead_Status:V', 'e', 'Hot', 1, 'and'),
(5, 0, 'vtiger_account:account_type:accounttype:Accounts_Type:V', 'e', 'Prospect', 1, 'and'),
(11, 0, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V', 'e', 'Closed Won', 1, 'and'),
(12, 0, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V', 'e', 'Prospecting', 1, 'and'),
(14, 0, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V', 'n', 'Closed', 1, 'and'),
(15, 0, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V', 'e', 'High', 1, 'and'),
(17, 0, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'n', 'Accepted', 1, 'and'),
(17, 1, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'n', 'Rejected', 1, 'and'),
(18, 0, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'e', 'Rejected', 1, 'and'),
(31, 0, 'vtiger_faq:status:faqstatus:Faq_Status:V', 'e', 'Draft', 1, 'and'),
(32, 0, 'vtiger_faq:status:faqstatus:Faq_Status:V', 'e', 'Published', 1, 'and'),
(33, 0, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V', 'e', 'Created, Approved, Delivered', 1, 'and'),
(34, 0, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V', 'e', 'Received Shipment', 1, 'and'),
(35, 0, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V', 'e', 'Created, Approved, Sent', 1, 'and'),
(36, 0, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V', 'e', 'Paid', 1, 'and'),
(37, 0, 'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V', 'e', 'Created, Approved', 1, 'and'),
(41, 0, 'vtiger_pbxmanager:status:status:PBXManager_Status:V', 'c', 'Missed', 1, 'and'),
(42, 0, 'vtiger_pbxmanager:status:status:PBXManager_Status:V', 'c', 'outgoing', 1, 'and'),
(43, 0, 'vtiger_pbxmanager:status:status:PBXManager_Status:V', 'c', 'received', 1, 'and');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvadvfilter_grouping`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvadvfilter_grouping` (
  `groupid` int(11) NOT NULL,
  `cvid` int(19) NOT NULL,
  `group_condition` varchar(255) DEFAULT NULL,
  `condition_expression` text,
  PRIMARY KEY (`groupid`,`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvadvfilter_grouping`
--

INSERT INTO `vtiger_cvadvfilter_grouping` (`groupid`, `cvid`, `group_condition`, `condition_expression`) VALUES
(1, 2, '', ''),
(1, 5, '', ''),
(1, 11, '', ''),
(1, 12, '', ''),
(1, 14, '', ''),
(1, 15, '', ''),
(1, 17, '', ''),
(1, 18, '', ''),
(1, 31, '', ''),
(1, 32, '', ''),
(1, 33, '', ''),
(1, 34, '', ''),
(1, 35, '', ''),
(1, 36, '', ''),
(1, 37, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvcolumnlist`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvcolumnlist` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  PRIMARY KEY (`cvid`,`columnindex`),
  KEY `cvcolumnlist_columnindex_idx` (`columnindex`),
  KEY `cvcolumnlist_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvcolumnlist`
--

INSERT INTO `vtiger_cvcolumnlist` (`cvid`, `columnindex`, `columnname`) VALUES
(1, 0, 'vtiger_leaddetails:lead_no:lead_no:Leads_Lead_No:V'),
(1, 1, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(1, 2, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(1, 3, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(1, 4, 'vtiger_leadaddress:phone:phone:Leads_Phone:V'),
(1, 5, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(1, 6, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(1, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Leads_Assigned_To:V'),
(2, 0, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(2, 1, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(2, 2, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(2, 3, 'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),
(2, 4, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(2, 5, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(3, 0, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(3, 1, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(3, 2, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(3, 3, 'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),
(3, 4, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(3, 5, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(4, 0, 'vtiger_account:account_no:account_no:Accounts_Account_No:V'),
(4, 1, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(4, 2, 'vtiger_accountbillads:bill_city:bill_city:Accounts_City:V'),
(4, 3, 'vtiger_account:website:website:Accounts_Website:V'),
(4, 4, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(4, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),
(5, 0, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(5, 1, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(5, 2, 'vtiger_account:website:website:Accounts_Website:V'),
(5, 3, 'vtiger_account:rating:rating:Accounts_Rating:V'),
(5, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),
(6, 0, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(6, 1, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(6, 2, 'vtiger_account:website:website:Accounts_Website:V'),
(6, 3, 'vtiger_accountbillads:bill_city:bill_city:Accounts_City:V'),
(6, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),
(7, 0, 'vtiger_contactdetails:contact_no:contact_no:Contacts_Contact_Id:V'),
(7, 1, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(7, 2, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(7, 3, 'vtiger_contactdetails:title:title:Contacts_Title:V'),
(7, 4, 'vtiger_contactdetails:accountid:account_id:Contacts_Account_Name:I'),
(7, 5, 'vtiger_contactdetails:email:email:Contacts_Email:E'),
(7, 6, 'vtiger_contactdetails:phone:phone:Contacts_Office_Phone:V'),
(7, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Contacts_Assigned_To:V'),
(8, 0, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(8, 1, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(8, 2, 'vtiger_contactaddress:mailingstreet:mailingstreet:Contacts_Mailing_Street:V'),
(8, 3, 'vtiger_contactaddress:mailingcity:mailingcity:Contacts_Mailing_City:V'),
(8, 4, 'vtiger_contactaddress:mailingstate:mailingstate:Contacts_Mailing_State:V'),
(8, 5, 'vtiger_contactaddress:mailingzip:mailingzip:Contacts_Mailing_Zip:V'),
(8, 6, 'vtiger_contactaddress:mailingcountry:mailingcountry:Contacts_Mailing_Country:V'),
(9, 0, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(9, 1, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(9, 2, 'vtiger_contactdetails:title:title:Contacts_Title:V'),
(9, 3, 'vtiger_contactdetails:accountid:account_id:Contacts_Account_Name:I'),
(9, 4, 'vtiger_contactdetails:email:email:Contacts_Email:E'),
(9, 5, 'vtiger_contactsubdetails:otherphone:otherphone:Contacts_Phone:V'),
(9, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Contacts_Assigned_To:V'),
(10, 0, 'vtiger_potential:potential_no:potential_no:Potentials_Potential_No:V'),
(10, 1, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(10, 2, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(10, 3, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V'),
(10, 4, 'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),
(10, 5, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(10, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(11, 0, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(11, 1, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(11, 2, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(11, 3, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(11, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(12, 0, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(12, 1, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(12, 2, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(12, 3, 'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),
(12, 4, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(12, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(13, 0, 'vtiger_troubletickets:ticket_no:ticket_no:HelpDesk_Ticket_No:V'),
(13, 1, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(13, 2, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(13, 3, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),
(13, 4, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),
(13, 5, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(14, 0, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(14, 1, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(14, 2, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),
(14, 3, 'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),
(14, 4, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(15, 0, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(15, 1, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(15, 2, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),
(15, 3, 'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),
(15, 4, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(16, 0, 'vtiger_quotes:quote_no:quote_no:Quotes_Quote_No:V'),
(16, 1, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(16, 2, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),
(16, 3, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(16, 4, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(16, 5, 'vtiger_quotes:total:hdnGrandTotal:Quotes_Total:I'),
(16, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(17, 0, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(17, 1, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),
(17, 2, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(17, 3, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(17, 4, 'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),
(17, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(18, 0, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(18, 1, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(18, 2, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(18, 3, 'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),
(18, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(19, 0, 'vtiger_activity:status:taskstatus:Calendar_Status:V'),
(19, 1, 'vtiger_activity:activitytype:activitytype:Calendar_Type:V'),
(19, 2, 'vtiger_activity:subject:subject:Calendar_Subject:V'),
(19, 3, 'vtiger_seactivityrel:crmid:parent_id:Calendar_Related_to:V'),
(19, 4, 'vtiger_activity:date_start:date_start:Calendar_Start_Date:D'),
(19, 5, 'vtiger_activity:due_date:due_date:Calendar_End_Date:D'),
(19, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Calendar_Assigned_To:V'),
(20, 0, 'vtiger_activity:subject:subject:Emails_Subject:V'),
(20, 1, 'vtiger_emaildetails:to_email:saved_toid:Emails_To:V'),
(20, 2, 'vtiger_activity:date_start:date_start:Emails_Date_Sent:D'),
(21, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(21, 1, 'vtiger_invoice:subject:subject:Invoice_Subject:V'),
(21, 2, 'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),
(21, 3, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(21, 4, 'vtiger_invoice:total:hdnGrandTotal:Invoice_Total:I'),
(21, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(22, 0, 'vtiger_notes:note_no:note_no:Notes_Note_No:V'),
(22, 1, 'vtiger_notes:title:notes_title:Notes_Title:V'),
(22, 2, 'vtiger_notes:filename:filename:Notes_File:V'),
(22, 3, 'vtiger_crmentity:modifiedtime:modifiedtime:Notes_Modified_Time:DT'),
(22, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Notes_Assigned_To:V'),
(23, 0, 'vtiger_pricebook:pricebook_no:pricebook_no:PriceBooks_PriceBook_No:V'),
(23, 1, 'vtiger_pricebook:bookname:bookname:PriceBooks_Price_Book_Name:V'),
(23, 2, 'vtiger_pricebook:active:active:PriceBooks_Active:V'),
(23, 3, 'vtiger_pricebook:currency_id:currency_id:PriceBooks_Currency:I'),
(24, 0, 'vtiger_products:product_no:product_no:Products_Product_No:V'),
(24, 1, 'vtiger_products:productname:productname:Products_Product_Name:V'),
(24, 2, 'vtiger_products:productcode:productcode:Products_Part_Number:V'),
(24, 3, 'vtiger_products:commissionrate:commissionrate:Products_Commission_Rate:V'),
(24, 4, 'vtiger_products:qtyinstock:qtyinstock:Products_Quantity_In_Stock:V'),
(24, 5, 'vtiger_products:qty_per_unit:qty_per_unit:Products_Qty/Unit:V'),
(24, 6, 'vtiger_products:unit_price:unit_price:Products_Unit_Price:V'),
(25, 0, 'vtiger_purchaseorder:purchaseorder_no:purchaseorder_no:PurchaseOrder_PurchaseOrder_No:V'),
(25, 1, 'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),
(25, 2, 'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),
(25, 3, 'vtiger_purchaseorder:tracking_no:tracking_no:PurchaseOrder_Tracking_Number:V'),
(25, 4, 'vtiger_purchaseorder:total:hdnGrandTotal:PurchaseOrder_Total:V'),
(25, 5, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(26, 0, 'vtiger_salesorder:salesorder_no:salesorder_no:SalesOrder_SalesOrder_No:V'),
(26, 1, 'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),
(26, 2, 'vtiger_salesorder:accountid:account_id:SalesOrder_Account_Name:I'),
(26, 3, 'vtiger_salesorder:quoteid:quote_id:SalesOrder_Quote_Name:I'),
(26, 4, 'vtiger_salesorder:total:hdnGrandTotal:SalesOrder_Total:V'),
(26, 5, 'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),
(27, 0, 'vtiger_vendor:vendor_no:vendor_no:Vendors_Vendor_No:V'),
(27, 1, 'vtiger_vendor:vendorname:vendorname:Vendors_Vendor_Name:V'),
(27, 2, 'vtiger_vendor:phone:phone:Vendors_Phone:V'),
(27, 3, 'vtiger_vendor:email:email:Vendors_Email:E'),
(27, 4, 'vtiger_vendor:category:category:Vendors_Category:V'),
(28, 0, 'vtiger_faq:faq_no:faq_no:Faq_Faq_No:V'),
(28, 1, 'vtiger_faq:question:question:Faq_Question:V'),
(28, 2, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(28, 3, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(28, 4, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(28, 5, 'vtiger_crmentity:modifiedtime:modifiedtime:Faq_Modified_Time:DT'),
(29, 0, 'vtiger_campaign:campaign_no:campaign_no:Campaigns_Campaign_No:V'),
(29, 1, 'vtiger_campaign:campaignname:campaignname:Campaigns_Campaign_Name:V'),
(29, 2, 'vtiger_campaign:campaigntype:campaigntype:Campaigns_Campaign_Type:N'),
(29, 3, 'vtiger_campaign:campaignstatus:campaignstatus:Campaigns_Campaign_Status:N'),
(29, 4, 'vtiger_campaign:expectedrevenue:expectedrevenue:Campaigns_Expected_Revenue:V'),
(29, 5, 'vtiger_campaign:closingdate:closingdate:Campaigns_Expected_Close_Date:D'),
(29, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Campaigns_Assigned_To:V'),
(30, 0, 'subject:subject:subject:Subject:V'),
(30, 1, 'from:fromname:fromname:From:N'),
(30, 2, 'to:tpname:toname:To:N'),
(30, 3, 'body:body:body:Body:V'),
(31, 0, 'vtiger_faq:question:question:Faq_Question:V'),
(31, 1, 'vtiger_faq:status:faqstatus:Faq_Status:V'),
(31, 2, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(31, 3, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(31, 4, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(32, 0, 'vtiger_faq:question:question:Faq_Question:V'),
(32, 1, 'vtiger_faq:answer:faq_answer:Faq_Answer:V'),
(32, 2, 'vtiger_faq:status:faqstatus:Faq_Status:V'),
(32, 3, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(32, 4, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(32, 5, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(33, 0, 'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),
(33, 1, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V'),
(33, 2, 'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),
(33, 3, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(33, 4, 'vtiger_purchaseorder:duedate:duedate:PurchaseOrder_Due_Date:V'),
(34, 0, 'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),
(34, 1, 'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),
(34, 2, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(34, 3, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V'),
(34, 4, 'vtiger_purchaseorder:carrier:carrier:PurchaseOrder_Carrier:V'),
(34, 5, 'vtiger_poshipads:ship_street:ship_street:PurchaseOrder_Shipping_Address:V'),
(35, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(35, 1, 'vtiger_invoice:subject:subject:Invoice_Subject:V'),
(35, 2, 'vtiger_invoice:accountid:account_id:Invoice_Account_Name:I'),
(35, 3, 'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),
(35, 4, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(35, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(35, 6, 'vtiger_crmentity:createdtime:createdtime:Invoice_Created_Time:DT'),
(36, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(36, 1, 'vtiger_invoice:subject:subject:Invoice_Subject:V'),
(36, 2, 'vtiger_invoice:accountid:account_id:Invoice_Account_Name:I'),
(36, 3, 'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),
(36, 4, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(36, 5, 'vtiger_invoiceshipads:ship_street:ship_street:Invoice_Shipping_Address:V'),
(36, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(37, 0, 'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),
(37, 1, 'vtiger_salesorder:accountid:account_id:SalesOrder_Account_Name:I'),
(37, 2, 'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V'),
(37, 3, 'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),
(37, 4, 'vtiger_soshipads:ship_street:ship_street:SalesOrder_Shipping_Address:V'),
(37, 5, 'vtiger_salesorder:carrier:carrier:SalesOrder_Carrier:V'),
(38, 0, 'vtiger_servicecontracts:contract_no:contract_no:ServiceContracts_Contract_No:V'),
(38, 1, 'vtiger_servicecontracts:subject:subject:ServiceContracts_Subject:V'),
(38, 2, 'vtiger_servicecontracts:sc_related_to:sc_related_to:ServiceContracts_Related_to:V'),
(38, 3, 'vtiger_crmentity:smownerid:assigned_user_id:ServiceContracts_Assigned_To:V'),
(38, 4, 'vtiger_servicecontracts:start_date:start_date:ServiceContracts_Start_Date:D'),
(38, 5, 'vtiger_servicecontracts:due_date:due_date:ServiceContracts_Due_date:D'),
(38, 7, 'vtiger_servicecontracts:progress:progress:ServiceContracts_Progress:N'),
(38, 8, 'vtiger_servicecontracts:contract_status:contract_status:ServiceContracts_Status:V'),
(39, 0, 'vtiger_service:service_no:service_no:Services_Service_No:V'),
(39, 1, 'vtiger_service:servicename:servicename:Services_Service_Name:V'),
(39, 2, 'vtiger_service:service_usageunit:service_usageunit:Services_Usage_Unit:V'),
(39, 3, 'vtiger_service:unit_price:unit_price:Services_Price:N'),
(39, 4, 'vtiger_service:qty_per_unit:qty_per_unit:Services_No_of_Units:N'),
(39, 5, 'vtiger_service:servicecategory:servicecategory:Services_Service_Category:V'),
(39, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Services_Owner:I'),
(40, 0, 'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),
(40, 1, 'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),
(40, 2, 'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),
(40, 3, 'vtiger_pbxmanager:status:status:PBXManager_Status:V'),
(41, 0, 'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),
(41, 1, 'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),
(41, 2, 'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),
(41, 3, 'vtiger_pbxmanager:status:status:PBXManager_Status:V'),
(42, 0, 'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),
(42, 1, 'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),
(42, 2, 'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),
(42, 3, 'vtiger_pbxmanager:status:status:PBXManager_Status:V'),
(43, 0, 'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),
(43, 1, 'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),
(43, 2, 'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),
(43, 3, 'vtiger_pbxmanager:status:status:PBXManager_Status:V'),
(44, 0, 'vtiger_modcomments:commentcontent:commentcontent:ModComments_Comment:V'),
(44, 1, 'vtiger_modcomments:related_to:related_to:ModComments_Related_To:V'),
(44, 2, 'vtiger_crmentity:modifiedtime:modifiedtime:ModComments_Modified_Time:T'),
(44, 3, 'vtiger_crmentity:smownerid:assigned_user_id:ModComments_Assigned_To:V'),
(45, 0, 'vtiger_assets:asset_no:asset_no:Assets_Asset_No:V'),
(45, 1, 'vtiger_assets:assetname:assetname:Assets_Asset_Name:V'),
(45, 2, 'vtiger_assets:account:account:Assets_Customer_Name:V'),
(45, 3, 'vtiger_assets:product:product:Assets_Product_Name:V'),
(46, 0, 'vtiger_smsnotifier:message:message:SMSNotifier_message:V'),
(46, 2, 'vtiger_crmentity:smownerid:assigned_user_id:SMSNotifier_Assigned_To:V'),
(46, 3, 'vtiger_crmentity:createdtime:createdtime:SMSNotifier_Created_Time:T'),
(46, 4, 'vtiger_crmentity:modifiedtime:modifiedtime:SMSNotifier_Modified_Time:T'),
(47, 0, 'vtiger_projectmilestone:projectmilestonename:projectmilestonename:ProjectMilestone_Project_Milestone_Name:V'),
(47, 1, 'vtiger_projectmilestone:projectmilestonedate:projectmilestonedate:ProjectMilestone_Milestone_Date:D'),
(47, 3, 'vtiger_crmentity:description:description:ProjectMilestone_description:V'),
(47, 4, 'vtiger_crmentity:createdtime:createdtime:ProjectMilestone_Created_Time:T'),
(47, 5, 'vtiger_crmentity:modifiedtime:modifiedtime:ProjectMilestone_Modified_Time:T'),
(48, 2, 'vtiger_projecttask:projecttaskname:projecttaskname:ProjectTask_Project_Task_Name:V'),
(48, 3, 'vtiger_projecttask:projectid:projectid:ProjectTask_Related_to:V'),
(48, 4, 'vtiger_projecttask:projecttaskpriority:projecttaskpriority:ProjectTask_Priority:V'),
(48, 5, 'vtiger_projecttask:projecttaskprogress:projecttaskprogress:ProjectTask_Progress:V'),
(48, 6, 'vtiger_projecttask:projecttaskhours:projecttaskhours:ProjectTask_Worked_Hours:V'),
(48, 7, 'vtiger_projecttask:startdate:startdate:ProjectTask_Start_Date:D'),
(48, 8, 'vtiger_projecttask:enddate:enddate:ProjectTask_End_Date:D'),
(48, 9, 'vtiger_crmentity:smownerid:assigned_user_id:ProjectTask_Assigned_To:V'),
(49, 0, 'vtiger_project:projectname:projectname:Project_Project_Name:V'),
(49, 1, 'vtiger_project:linktoaccountscontacts:linktoaccountscontacts:Project_Related_to:V'),
(49, 2, 'vtiger_project:startdate:startdate:Project_Start_Date:D'),
(49, 3, 'vtiger_project:targetenddate:targetenddate:Project_Target_End_Date:D'),
(49, 4, 'vtiger_project:actualenddate:actualenddate:Project_Actual_End_Date:D'),
(49, 5, 'vtiger_project:targetbudget:targetbudget:Project_Target_Budget:V'),
(49, 6, 'vtiger_project:progress:progress:Project_Progress:V'),
(49, 7, 'vtiger_project:projectstatus:projectstatus:Project_Status:V'),
(49, 8, 'vtiger_crmentity:smownerid:assigned_user_id:Project_Assigned_To:V');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvstdfilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvstdfilter` (
  `cvid` int(19) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `stdfilter` varchar(250) DEFAULT '',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`cvid`),
  KEY `cvstdfilter_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvstdfilter`
--

INSERT INTO `vtiger_cvstdfilter` (`cvid`, `columnname`, `stdfilter`, `startdate`, `enddate`) VALUES
(3, 'vtiger_crmentity:modifiedtime:modifiedtime:Leads_Modified_Time', 'thismonth', '2005-06-01', '2005-06-30'),
(6, 'vtiger_crmentity:createdtime:createdtime:Accounts_Created_Time', 'thisweek', '2005-06-19', '2005-06-25'),
(9, 'vtiger_contactsubdetails:birthday:birthday:Contacts_Birthdate', 'today', '2005-06-25', '2005-06-25');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_grp2grp`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2grp` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_grp2grp_share_groupid_idx` (`share_groupid`),
  KEY `datashare_grp2grp_to_groupid_idx` (`to_groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_grp2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2role` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `idx_datashare_grp2role_share_groupid` (`share_groupid`),
  KEY `idx_datashare_grp2role_to_roleid` (`to_roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_grp2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2rs` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_grp2rs_share_groupid_idx` (`share_groupid`),
  KEY `datashare_grp2rs_to_roleandsubid_idx` (`to_roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_module_rel`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_module_rel` (
  `shareid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `relationtype` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `idx_datashare_module_rel_tabid` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_relatedmodules`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodules` (
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `tabid` int(19) DEFAULT NULL,
  `relatedto_tabid` int(19) DEFAULT NULL,
  PRIMARY KEY (`datashare_relatedmodule_id`),
  KEY `datashare_relatedmodules_tabid_idx` (`tabid`),
  KEY `datashare_relatedmodules_relatedto_tabid_idx` (`relatedto_tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_datashare_relatedmodules`
--

INSERT INTO `vtiger_datashare_relatedmodules` (`datashare_relatedmodule_id`, `tabid`, `relatedto_tabid`) VALUES
(1, 6, 2),
(2, 6, 13),
(3, 6, 20),
(4, 6, 22),
(5, 6, 23),
(6, 2, 20),
(7, 2, 22),
(8, 20, 22),
(9, 22, 23);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_relatedmodules_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodules_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_datashare_relatedmodules_seq`
--

INSERT INTO `vtiger_datashare_relatedmodules_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_relatedmodule_permission`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodule_permission` (
  `shareid` int(19) NOT NULL,
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`,`datashare_relatedmodule_id`),
  KEY `datashare_relatedmodule_permission_shareid_permissions_idx` (`shareid`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_role2group`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2group` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `idx_datashare_role2group_share_roleid` (`share_roleid`),
  KEY `idx_datashare_role2group_to_groupid` (`to_groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_role2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2role` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_role2role_share_roleid_idx` (`share_roleid`),
  KEY `datashare_role2role_to_roleid_idx` (`to_roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_role2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_role2s_share_roleid_idx` (`share_roleid`),
  KEY `datashare_role2s_to_roleandsubid_idx` (`to_roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_rs2grp`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2grp` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_rs2grp_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `datashare_rs2grp_to_groupid_idx` (`to_groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_rs2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2role` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_rs2role_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `datashare_rs2role_to_roleid_idx` (`to_roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_rs2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_rs2rs_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `idx_datashare_rs2rs_to_roleandsubid_idx` (`to_roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_date_format`
--

CREATE TABLE IF NOT EXISTS `vtiger_date_format` (
  `date_formatid` int(19) NOT NULL AUTO_INCREMENT,
  `date_format` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`date_formatid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_date_format`
--

INSERT INTO `vtiger_date_format` (`date_formatid`, `date_format`, `sortorderid`, `presence`) VALUES
(1, 'dd-mm-yyyy', 0, 1),
(2, 'mm-dd-yyyy', 1, 1),
(3, 'yyyy-mm-dd', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_date_format_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_date_format_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_date_format_seq`
--

INSERT INTO `vtiger_date_format_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_dealintimation`
--

CREATE TABLE IF NOT EXISTS `vtiger_dealintimation` (
  `dealintimationid` int(19) NOT NULL DEFAULT '0',
  `dealname` varchar(100) NOT NULL,
  `intimationamount` int(19) NOT NULL DEFAULT '0',
  `dealprobability` decimal(3,2) NOT NULL DEFAULT '0.00',
  `dealintimationactive` int(1) DEFAULT NULL,
  `fromname` varchar(120) NOT NULL,
  `fromemailid` varchar(100) NOT NULL,
  `notifyemails` varchar(50) NOT NULL,
  `notifybccemails` varchar(50) NOT NULL,
  `notifyccmails` varchar(50) NOT NULL,
  `notifypotentialowner` int(1) DEFAULT NULL,
  PRIMARY KEY (`dealintimationid`),
  UNIQUE KEY `dealintimation_dealname_idx` (`dealname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaultcv`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultcv` (
  `tabid` int(19) NOT NULL,
  `defaultviewname` varchar(50) NOT NULL,
  `query` text,
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_def_org_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_field` (
  `tabid` int(10) DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) DEFAULT NULL,
  `readonly` int(19) DEFAULT NULL,
  PRIMARY KEY (`fieldid`),
  KEY `def_org_field_tabid_fieldid_idx` (`tabid`,`fieldid`),
  KEY `def_org_field_tabid_idx` (`tabid`),
  KEY `def_org_field_visible_fieldid_idx` (`visible`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_def_org_field`
--

INSERT INTO `vtiger_def_org_field` (`tabid`, `fieldid`, `visible`, `readonly`) VALUES
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 5, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(6, 8, 0, 0),
(6, 9, 0, 0),
(6, 10, 0, 0),
(6, 11, 0, 0),
(6, 12, 0, 0),
(6, 13, 0, 0),
(6, 14, 0, 0),
(6, 15, 0, 0),
(6, 16, 0, 0),
(6, 17, 0, 0),
(6, 18, 0, 0),
(6, 19, 0, 0),
(6, 20, 0, 0),
(6, 21, 0, 0),
(6, 22, 0, 0),
(6, 23, 0, 0),
(6, 24, 0, 0),
(6, 25, 0, 0),
(6, 26, 0, 0),
(6, 27, 0, 0),
(6, 28, 0, 0),
(6, 29, 0, 0),
(6, 30, 0, 0),
(6, 31, 0, 0),
(6, 32, 0, 0),
(6, 33, 0, 0),
(6, 34, 0, 0),
(6, 35, 0, 0),
(6, 36, 0, 0),
(7, 37, 0, 0),
(7, 38, 0, 0),
(7, 39, 0, 0),
(7, 40, 0, 0),
(7, 41, 0, 0),
(7, 42, 0, 0),
(7, 43, 0, 0),
(7, 44, 0, 0),
(7, 45, 0, 0),
(7, 46, 0, 0),
(7, 47, 0, 0),
(7, 48, 0, 0),
(7, 49, 0, 0),
(7, 50, 0, 0),
(7, 51, 0, 0),
(7, 52, 0, 0),
(7, 53, 0, 0),
(7, 54, 0, 0),
(7, 55, 0, 0),
(7, 56, 0, 0),
(7, 57, 0, 0),
(7, 58, 0, 0),
(7, 59, 0, 0),
(7, 60, 0, 0),
(7, 61, 0, 0),
(7, 62, 0, 0),
(7, 63, 0, 0),
(7, 64, 0, 0),
(7, 65, 0, 0),
(4, 66, 0, 0),
(4, 67, 0, 0),
(4, 68, 0, 0),
(4, 69, 0, 0),
(4, 70, 0, 0),
(4, 71, 0, 0),
(4, 72, 0, 0),
(4, 73, 0, 0),
(4, 74, 0, 0),
(4, 75, 0, 0),
(4, 76, 0, 0),
(4, 77, 0, 0),
(4, 78, 0, 0),
(4, 79, 0, 0),
(4, 80, 0, 0),
(4, 81, 0, 0),
(4, 82, 0, 0),
(4, 83, 0, 0),
(4, 84, 0, 0),
(4, 85, 0, 0),
(4, 86, 0, 0),
(4, 87, 0, 0),
(4, 88, 0, 0),
(4, 89, 0, 0),
(4, 90, 0, 0),
(4, 91, 0, 0),
(4, 92, 0, 0),
(4, 93, 0, 0),
(4, 94, 0, 0),
(4, 95, 0, 0),
(4, 96, 0, 0),
(4, 97, 0, 0),
(4, 98, 0, 0),
(4, 99, 0, 0),
(4, 100, 0, 0),
(4, 101, 0, 0),
(4, 102, 0, 0),
(4, 103, 0, 0),
(4, 104, 0, 0),
(4, 105, 0, 0),
(4, 106, 0, 0),
(4, 107, 0, 0),
(4, 108, 0, 0),
(4, 109, 0, 0),
(2, 110, 0, 0),
(2, 111, 0, 0),
(2, 112, 0, 0),
(2, 113, 0, 0),
(2, 114, 0, 0),
(2, 115, 0, 0),
(2, 116, 0, 0),
(2, 117, 0, 0),
(2, 118, 0, 0),
(2, 119, 0, 0),
(2, 120, 0, 0),
(2, 121, 0, 0),
(2, 122, 0, 0),
(2, 123, 0, 0),
(2, 124, 0, 0),
(2, 125, 0, 0),
(26, 126, 0, 0),
(26, 127, 0, 0),
(26, 128, 0, 0),
(26, 129, 0, 0),
(26, 130, 0, 0),
(26, 131, 0, 0),
(26, 132, 0, 0),
(26, 133, 0, 0),
(26, 134, 0, 0),
(26, 135, 0, 0),
(26, 136, 0, 0),
(26, 137, 0, 0),
(26, 138, 0, 0),
(26, 139, 0, 0),
(26, 140, 0, 0),
(26, 141, 0, 0),
(26, 142, 0, 0),
(26, 143, 0, 0),
(26, 144, 0, 0),
(26, 145, 0, 0),
(26, 146, 0, 0),
(26, 147, 0, 0),
(26, 148, 0, 0),
(26, 149, 0, 0),
(26, 150, 0, 0),
(4, 151, 0, 0),
(6, 152, 0, 0),
(7, 153, 0, 0),
(26, 154, 0, 0),
(13, 155, 0, 0),
(13, 156, 0, 0),
(13, 157, 0, 0),
(13, 158, 0, 0),
(13, 159, 0, 0),
(13, 160, 0, 0),
(13, 161, 0, 0),
(13, 162, 0, 0),
(13, 163, 0, 0),
(13, 164, 0, 0),
(13, 165, 0, 0),
(13, 166, 0, 0),
(13, 167, 0, 0),
(13, 168, 0, 0),
(13, 169, 0, 0),
(13, 170, 0, 0),
(13, 171, 0, 0),
(13, 172, 0, 0),
(13, 173, 0, 0),
(14, 174, 0, 0),
(14, 175, 0, 0),
(14, 176, 0, 0),
(14, 177, 0, 0),
(14, 178, 0, 0),
(14, 179, 0, 0),
(14, 180, 0, 0),
(14, 181, 0, 0),
(14, 182, 0, 0),
(14, 183, 0, 0),
(14, 184, 0, 0),
(14, 185, 0, 0),
(14, 186, 0, 0),
(14, 187, 0, 0),
(14, 188, 0, 0),
(14, 189, 0, 0),
(14, 190, 0, 0),
(14, 191, 0, 0),
(14, 192, 0, 0),
(14, 193, 0, 0),
(14, 194, 0, 0),
(14, 195, 0, 0),
(14, 196, 0, 0),
(14, 197, 0, 0),
(14, 198, 0, 0),
(14, 199, 0, 0),
(14, 200, 0, 0),
(14, 201, 0, 0),
(14, 202, 0, 0),
(14, 203, 0, 0),
(14, 204, 0, 0),
(8, 205, 0, 0),
(8, 206, 0, 0),
(8, 207, 0, 0),
(8, 208, 0, 0),
(8, 209, 0, 0),
(8, 210, 0, 0),
(8, 211, 0, 0),
(8, 212, 0, 0),
(8, 213, 0, 0),
(8, 214, 0, 0),
(8, 215, 0, 0),
(8, 216, 0, 0),
(8, 217, 0, 0),
(8, 218, 0, 0),
(8, 219, 0, 0),
(10, 220, 0, 0),
(10, 221, 0, 0),
(10, 222, 0, 0),
(10, 223, 0, 0),
(10, 224, 0, 0),
(10, 225, 0, 0),
(10, 226, 0, 0),
(10, 227, 0, 0),
(10, 228, 0, 0),
(10, 229, 0, 0),
(10, 230, 0, 0),
(10, 231, 0, 0),
(9, 232, 0, 0),
(9, 233, 0, 0),
(9, 234, 0, 0),
(9, 235, 0, 0),
(9, 236, 0, 0),
(9, 237, 0, 0),
(9, 238, 0, 0),
(9, 239, 0, 0),
(9, 240, 0, 0),
(9, 241, 0, 0),
(9, 242, 0, 0),
(9, 243, 0, 0),
(9, 244, 0, 0),
(9, 245, 0, 0),
(9, 246, 0, 0),
(9, 247, 0, 0),
(9, 248, 0, 0),
(9, 249, 0, 0),
(9, 250, 0, 0),
(9, 251, 0, 0),
(9, 252, 0, 0),
(9, 253, 0, 0),
(9, 254, 0, 0),
(9, 255, 0, 0),
(16, 256, 0, 0),
(16, 257, 0, 0),
(16, 258, 0, 0),
(16, 259, 0, 0),
(16, 260, 0, 0),
(16, 261, 0, 0),
(16, 262, 0, 0),
(16, 263, 0, 0),
(16, 264, 0, 0),
(16, 265, 0, 0),
(16, 266, 0, 0),
(16, 267, 0, 0),
(16, 268, 0, 0),
(16, 269, 0, 0),
(16, 270, 0, 0),
(16, 271, 0, 0),
(16, 272, 0, 0),
(16, 273, 0, 0),
(16, 274, 0, 0),
(16, 275, 0, 0),
(16, 276, 0, 0),
(16, 277, 0, 0),
(16, 278, 0, 0),
(15, 279, 0, 0),
(15, 280, 0, 0),
(15, 281, 0, 0),
(15, 282, 0, 0),
(15, 283, 0, 0),
(15, 284, 0, 0),
(15, 285, 0, 0),
(15, 286, 0, 0),
(15, 287, 0, 0),
(15, 288, 0, 0),
(18, 289, 0, 0),
(18, 290, 0, 0),
(18, 291, 0, 0),
(18, 292, 0, 0),
(18, 293, 0, 0),
(18, 294, 0, 0),
(18, 295, 0, 0),
(18, 296, 0, 0),
(18, 297, 0, 0),
(18, 298, 0, 0),
(18, 299, 0, 0),
(18, 300, 0, 0),
(18, 301, 0, 0),
(18, 302, 0, 0),
(18, 303, 0, 0),
(18, 304, 0, 0),
(18, 305, 0, 0),
(19, 306, 0, 0),
(19, 307, 0, 0),
(19, 308, 0, 0),
(19, 309, 0, 0),
(19, 310, 0, 0),
(19, 311, 0, 0),
(19, 312, 0, 0),
(19, 313, 0, 0),
(20, 314, 0, 0),
(20, 315, 0, 0),
(20, 316, 0, 0),
(20, 317, 0, 0),
(20, 318, 0, 0),
(20, 319, 0, 0),
(20, 320, 0, 0),
(20, 321, 0, 0),
(20, 322, 0, 0),
(20, 323, 0, 0),
(20, 324, 0, 0),
(20, 325, 0, 0),
(20, 326, 0, 0),
(20, 327, 0, 0),
(20, 328, 0, 0),
(20, 329, 0, 0),
(20, 330, 0, 0),
(20, 331, 0, 0),
(20, 332, 0, 0),
(20, 333, 0, 0),
(20, 334, 0, 0),
(20, 335, 0, 0),
(20, 336, 0, 0),
(20, 337, 0, 0),
(20, 338, 0, 0),
(20, 339, 0, 0),
(20, 340, 0, 0),
(20, 341, 0, 0),
(20, 342, 0, 0),
(20, 343, 0, 0),
(20, 344, 0, 0),
(20, 345, 0, 0),
(20, 346, 0, 0),
(20, 347, 0, 0),
(20, 348, 0, 0),
(20, 349, 0, 0),
(20, 350, 0, 0),
(21, 351, 0, 0),
(21, 352, 0, 0),
(21, 353, 0, 0),
(21, 354, 0, 0),
(21, 355, 0, 0),
(21, 356, 0, 0),
(21, 357, 0, 0),
(21, 358, 0, 0),
(21, 359, 0, 0),
(21, 360, 0, 0),
(21, 361, 0, 0),
(21, 362, 0, 0),
(21, 363, 0, 0),
(21, 364, 0, 0),
(21, 365, 0, 0),
(21, 366, 0, 0),
(21, 367, 0, 0),
(21, 368, 0, 0),
(21, 369, 0, 0),
(21, 370, 0, 0),
(21, 371, 0, 0),
(21, 372, 0, 0),
(21, 373, 0, 0),
(21, 374, 0, 0),
(21, 375, 0, 0),
(21, 376, 0, 0),
(21, 377, 0, 0),
(21, 378, 0, 0),
(21, 379, 0, 0),
(21, 380, 0, 0),
(21, 381, 0, 0),
(21, 382, 0, 0),
(21, 383, 0, 0),
(21, 384, 0, 0),
(21, 385, 0, 0),
(21, 386, 0, 0),
(21, 387, 0, 0),
(21, 388, 0, 0),
(22, 389, 0, 0),
(22, 390, 0, 0),
(22, 391, 0, 0),
(22, 392, 0, 0),
(22, 393, 0, 0),
(22, 394, 0, 0),
(22, 395, 0, 0),
(22, 396, 0, 0),
(22, 397, 0, 0),
(22, 398, 0, 0),
(22, 399, 0, 0),
(22, 400, 0, 0),
(22, 401, 0, 0),
(22, 402, 0, 0),
(22, 403, 0, 0),
(22, 404, 0, 0),
(22, 405, 0, 0),
(22, 406, 0, 0),
(22, 407, 0, 0),
(22, 408, 0, 0),
(22, 409, 0, 0),
(22, 410, 0, 0),
(22, 411, 0, 0),
(22, 412, 0, 0),
(22, 413, 0, 0),
(22, 414, 0, 0),
(22, 415, 0, 0),
(22, 416, 0, 0),
(22, 417, 0, 0),
(22, 418, 0, 0),
(22, 419, 0, 0),
(22, 420, 0, 0),
(22, 421, 0, 0),
(22, 422, 0, 0),
(22, 423, 0, 0),
(22, 424, 0, 0),
(22, 425, 0, 0),
(22, 426, 0, 0),
(22, 427, 0, 0),
(22, 428, 0, 0),
(22, 429, 0, 0),
(22, 430, 0, 0),
(22, 431, 0, 0),
(22, 432, 0, 0),
(22, 433, 0, 0),
(22, 434, 0, 0),
(22, 435, 0, 0),
(23, 436, 0, 0),
(23, 437, 0, 0),
(23, 438, 0, 0),
(23, 439, 0, 0),
(23, 440, 0, 0),
(23, 441, 0, 0),
(23, 442, 0, 0),
(23, 443, 0, 0),
(23, 444, 0, 0),
(23, 445, 0, 0),
(23, 446, 0, 0),
(23, 447, 0, 0),
(23, 448, 0, 0),
(23, 449, 0, 0),
(23, 450, 0, 0),
(23, 451, 0, 0),
(23, 452, 0, 0),
(23, 453, 0, 0),
(23, 454, 0, 0),
(23, 455, 0, 0),
(23, 456, 0, 0),
(23, 457, 0, 0),
(23, 458, 0, 0),
(23, 459, 0, 0),
(23, 460, 0, 0),
(23, 461, 0, 0),
(23, 462, 0, 0),
(23, 463, 0, 0),
(23, 464, 0, 0),
(23, 465, 0, 0),
(23, 466, 0, 0),
(23, 467, 0, 0),
(23, 468, 0, 0),
(23, 469, 0, 0),
(23, 470, 0, 0),
(23, 471, 0, 0),
(23, 472, 0, 0),
(23, 473, 0, 0),
(23, 474, 0, 0),
(10, 519, 0, 0),
(10, 520, 0, 0),
(10, 521, 0, 0),
(10, 522, 0, 0),
(10, 523, 0, 0),
(10, 524, 0, 0),
(32, 525, 0, 0),
(32, 526, 0, 0),
(32, 527, 0, 0),
(32, 528, 0, 0),
(32, 529, 0, 0),
(32, 530, 0, 0),
(32, 531, 0, 0),
(32, 532, 0, 0),
(32, 533, 0, 0),
(32, 534, 0, 0),
(32, 535, 0, 0),
(32, 536, 0, 0),
(32, 537, 0, 0),
(32, 538, 0, 0),
(32, 539, 0, 0),
(32, 540, 0, 0),
(32, 541, 0, 0),
(32, 542, 0, 0),
(32, 543, 0, 0),
(38, 544, 0, 0),
(38, 545, 0, 0),
(38, 546, 0, 0),
(38, 547, 0, 0),
(38, 548, 0, 0),
(38, 549, 0, 0),
(38, 550, 0, 0),
(38, 551, 0, 0),
(38, 552, 0, 0),
(38, 553, 0, 0),
(38, 554, 0, 0),
(38, 555, 0, 0),
(38, 556, 0, 0),
(38, 557, 0, 0),
(38, 558, 0, 0),
(38, 559, 0, 0),
(38, 560, 0, 0),
(38, 561, 0, 0),
(38, 562, 0, 0),
(40, 563, 0, 0),
(40, 564, 0, 0),
(40, 565, 0, 0),
(40, 566, 0, 0),
(42, 569, 0, 0),
(42, 570, 0, 0),
(42, 571, 0, 0),
(42, 572, 0, 0),
(42, 573, 0, 0),
(42, 574, 0, 0),
(42, 575, 0, 0),
(44, 576, 0, 0),
(44, 577, 0, 0),
(44, 578, 0, 0),
(44, 579, 0, 0),
(44, 580, 0, 0),
(44, 581, 0, 0),
(44, 582, 0, 0),
(44, 583, 0, 0),
(44, 584, 0, 0),
(44, 585, 0, 0),
(44, 586, 0, 0),
(44, 587, 0, 0),
(44, 588, 0, 0),
(44, 589, 0, 0),
(44, 590, 0, 0),
(44, 591, 0, 0),
(44, 592, 0, 0),
(47, 593, 0, 0),
(47, 594, 0, 0),
(47, 595, 0, 0),
(47, 596, 0, 0),
(47, 597, 0, 0),
(50, 598, 0, 0),
(50, 599, 0, 0),
(50, 600, 0, 0),
(50, 601, 0, 0),
(50, 602, 0, 0),
(50, 603, 0, 0),
(50, 604, 0, 0),
(50, 605, 0, 0),
(50, 606, 0, 0),
(50, 607, 0, 0),
(51, 608, 0, 0),
(51, 609, 0, 0),
(51, 610, 0, 0),
(51, 611, 0, 0),
(51, 612, 0, 0),
(51, 613, 0, 0),
(51, 614, 0, 0),
(51, 615, 0, 0),
(51, 616, 0, 0),
(51, 617, 0, 0),
(51, 618, 0, 0),
(51, 619, 0, 0),
(51, 620, 0, 0),
(51, 621, 0, 0),
(51, 622, 0, 0),
(52, 623, 0, 0),
(52, 624, 0, 0),
(52, 625, 0, 0),
(52, 626, 0, 0),
(52, 627, 0, 0),
(52, 628, 0, 0),
(52, 629, 0, 0),
(52, 630, 0, 0),
(52, 631, 0, 0),
(52, 632, 0, 0),
(52, 633, 0, 0),
(52, 634, 0, 0),
(52, 635, 0, 0),
(52, 636, 0, 0),
(52, 637, 0, 0),
(52, 638, 0, 0),
(52, 639, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_def_org_share`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_share` (
  `ruleid` int(11) NOT NULL AUTO_INCREMENT,
  `tabid` int(11) NOT NULL,
  `permission` int(19) DEFAULT NULL,
  `editstatus` int(19) DEFAULT NULL,
  PRIMARY KEY (`ruleid`),
  KEY `fk_1_vtiger_def_org_share` (`permission`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `vtiger_def_org_share`
--

INSERT INTO `vtiger_def_org_share` (`ruleid`, `tabid`, `permission`, `editstatus`) VALUES
(1, 2, 2, 0),
(2, 4, 2, 2),
(3, 6, 2, 0),
(4, 7, 2, 0),
(5, 9, 3, 1),
(6, 13, 2, 0),
(7, 16, 3, 2),
(8, 20, 2, 0),
(9, 21, 2, 0),
(10, 22, 2, 0),
(11, 23, 2, 0),
(12, 26, 2, 0),
(13, 8, 2, 0),
(14, 14, 2, 0),
(15, 32, 2, 0),
(16, 38, 2, 0),
(17, 40, 3, 0),
(18, 42, 2, 0),
(19, 44, 2, 0),
(20, 47, 2, 0),
(21, 50, 2, 0),
(22, 51, 2, 0),
(23, 52, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_def_org_share_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_share_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_def_org_share_seq`
--

INSERT INTO `vtiger_def_org_share_seq` (`id`) VALUES
(23);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_downloadpurpose`
--

CREATE TABLE IF NOT EXISTS `vtiger_downloadpurpose` (
  `downloadpurposeid` int(19) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`downloadpurposeid`),
  UNIQUE KEY `downloadpurpose_purpose_idx` (`purpose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_durationhrs`
--

CREATE TABLE IF NOT EXISTS `vtiger_durationhrs` (
  `hrsid` int(19) NOT NULL AUTO_INCREMENT,
  `hrs` varchar(50) DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hrsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_durationmins`
--

CREATE TABLE IF NOT EXISTS `vtiger_durationmins` (
  `minsid` int(19) NOT NULL AUTO_INCREMENT,
  `mins` varchar(50) DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`minsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_duration_minutes`
--

CREATE TABLE IF NOT EXISTS `vtiger_duration_minutes` (
  `minutesid` int(19) NOT NULL AUTO_INCREMENT,
  `duration_minutes` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`minutesid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_duration_minutes`
--

INSERT INTO `vtiger_duration_minutes` (`minutesid`, `duration_minutes`, `sortorderid`, `presence`) VALUES
(1, '00', 0, 1),
(2, '15', 1, 1),
(3, '30', 2, 1),
(4, '45', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_duration_minutes_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_duration_minutes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_duration_minutes_seq`
--

INSERT INTO `vtiger_duration_minutes_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emaildetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_emaildetails` (
  `emailid` int(19) NOT NULL,
  `from_email` varchar(50) NOT NULL DEFAULT '',
  `to_email` text,
  `cc_email` text,
  `bcc_email` text,
  `assigned_user_email` varchar(50) NOT NULL DEFAULT '',
  `idlists` text,
  `email_flag` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emailtemplates`
--

CREATE TABLE IF NOT EXISTS `vtiger_emailtemplates` (
  `foldername` varchar(100) DEFAULT NULL,
  `templatename` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `description` text,
  `body` text,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `templateid` int(19) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`templateid`),
  KEY `emailtemplates_foldernamd_templatename_subject_idx` (`foldername`,`templatename`,`subject`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `vtiger_emailtemplates`
--

INSERT INTO `vtiger_emailtemplates` (`foldername`, `templatename`, `subject`, `description`, `body`, `deleted`, `templateid`) VALUES
('Public', 'Announcement for Release', 'Announcement for Release', 'Announcement of a release', 'Hello!   <br />\n	<br />\n	On behalf of the vtiger team,  I am pleased to announce the release of vtiger crm4.2 . This is a feature packed release including the mass email template handling, custom view feature, vtiger_reports feature and a host of other utilities. vtiger runs on all platforms.    <br />\n        <br />\n	Notable Features of vtiger are :   <br />\n	<br />\n	-Email Client Integration    <br />\n	-Trouble Ticket Integration   <br />\n	-Invoice Management Integration   <br />\n	-Reports Integration   <br />\n	-Portal Integration   <br />\n	-Enhanced Word Plugin Support   <br />\n	-Custom View Integration   <br />\n	<br />\n	Known Issues:   <br />\n	-ABCD   <br />\n	-EFGH   <br />\n	-IJKL   <br />\n	-MNOP   <br />\n	-QRST', 0, 1),
('Public', 'Pending Invoices', 'Invoices Pending', 'Payment Due', 'name <br />\nstreet, <br />\ncity, <br />\nstate, <br />\n zip) <br />\n  <br />\n Dear <br />\n <br />\n Please check the following invoices that are yet to be paid by you: <br />\n <br />\n No. Date      Amount <br />\n 1   1/1/01    $4000 <br />\n 2   2/2//01   $5000 <br />\n 3   3/3/01    $10000 <br />\n 4   7/4/01    $23560 <br />\n <br />\n Kindly let us know if there are any issues that you feel are pending to be discussed. <br />\n We will be more than happy to give you a call. <br />\n We would like to continue our business with you.', 0, 2),
('Public', 'Acceptance Proposal', 'Acceptance Proposal', 'Acceptance of Proposal', ' Dear <br />\n <br />\nYour proposal on the project XYZW has been reviewed by us <br />\nand is acceptable in its entirety. <br />\n <br />\nWe are eagerly looking forward to this project <br />\nand are pleased about having the opportunity to work <br />\ntogether. We look forward to a long standing relationship <br />\nwith your esteemed firm. <br />\n<br />\nI would like to take this opportunity to invite you <br />\nto a game of golf on Wednesday morning 9am at the <br />\nCuff Links Ground. We will be waiting for you in the <br />\nExecutive Lounge. <br />\n<br />\nLooking forward to seeing you there.', 0, 3),
('Public', 'Goods received acknowledgement', 'Goods received acknowledgement', 'Acknowledged Receipt of Goods', ' The undersigned hereby acknowledges receipt and delivery of the goods. <br />\nThe undersigned will release the payment subject to the goods being discovered not satisfactory. <br />\n<br />\nSigned under seal this <date>', 0, 4),
('Public', 'Accept Order', 'Accept Order', 'Acknowledgement/Acceptance of Order', ' Dear <br />\n         We are in receipt of your order as contained in the <br />\n   purchase order form.We consider this to be final and binding on both sides. <br />\nIf there be any exceptions noted, we shall consider them <br />\nonly if the objection is received within ten days of receipt of <br />\nthis notice. <br />\n <br />\nThank you for your patronage.', 0, 5),
('Public', 'Address Change', 'Change of Address', 'Address Change', 'Dear <br />\n <br />\nWe are relocating our office to <br />\n11111,XYZDEF Cross, <br />\nUVWWX Circle <br />\nThe telephone number for this new location is (101) 1212-1328. <br />\n<br />\nOur Manufacturing Division will continue operations <br />\nat 3250 Lovedale Square Avenue, in Frankfurt. <br />\n<br />\nWe hope to keep in touch with you all. <br />\nPlease update your addressbooks.', 0, 6),
('Public', 'Follow Up', 'Follow Up', 'Follow Up of meeting', 'Dear <br />\n<br />\nThank you for extending us the opportunity to meet with <br />\nyou and members of your staff. <br />\n<br />\nI know that John Doe serviced your account <br />\nfor many years and made many friends at your firm. He has personally <br />\ndiscussed with me the deep relationship that he had with your firm. <br />\nWhile his presence will be missed, I can promise that we will <br />\ncontinue to provide the fine service that was accorded by <br />\nJohn to your firm. <br />\n<br />\nI was genuinely touched to receive such fine hospitality. <br />\n<br />\nThank you once again.', 0, 7),
('Public', 'Target Crossed!', 'Target Crossed!', 'Fantastic Sales Spree!', 'Congratulations! <br />\n<br />\nThe numbers are in and I am proud to inform you that our <br />\ntotal sales for the previous quarter <br />\namounts to $100,000,00.00!. This is the first time <br />\nwe have exceeded the target by almost 30%. <br />\nWe have also beat the previous quarter record by a <br />\nwhopping 75%! <br />\n<br />\nLet us meet at Smoking Joe for a drink in the evening! <br />\n\nC you all there guys!', 0, 8),
('Public', 'Thanks Note', 'Thanks Note', 'Note of thanks', 'Dear <br />\n<br />\nThank you for your confidence in our ability to serve you. <br />\nWe are glad to be given the chance to serve you.I look <br />\nforward to establishing a long term partnership with you. <br />\nConsider me as a friend. <br />\nShould any need arise,please do give us a call.', 0, 9),
('Public', 'Customer Login Details', 'Customer Portal Login Details', 'Send Portal login details to customer', '<table width="700" cellspacing="0" cellpadding="0" border="0" align="center" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width="50"> </td>\n            <td>\n            <table width="100%" cellspacing="0" cellpadding="0" border="0">\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;">\n                                <tr>\n                                    <td align="center" rowspan="4">$logo$</td>\n                                    <td align="center"> </td>\n                                </tr>\n                                <tr>\n                                    <td align="left" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;">vtiger CRM<br /> </td>\n                                </tr>\n                                <tr>\n                                    <td align="right" style="padding-right: 100px;">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">\n                                <tr>\n                                    <td valign="top">\n                                    <table width="100%" cellspacing="0" cellpadding="5" border="0">\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;">Dear $contact_name$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;"> Thank you very much for subscribing to the vtiger CRM - annual support service.<br />Here is your self service portal login details:</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="center">\n                                                <table width="75%" cellspacing="0" cellpadding="10" border="0" style="border: 2px solid rgb(180, 180, 179); background-color: rgb(226, 226, 225); font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal;">\n                                                        <tr>\n                                                            <td><br />User ID     : <font color="#990000"><strong> $login_name$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td>Password: <font color="#990000"><strong> $password$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td align="center"> <strong>  $URL$<br /> </strong> </td>\n                                                        </tr>\n                                                </table>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;"><strong>NOTE:</strong> We suggest you to change your password after logging in first time. <br /><br /> <strong><u>Help Documentation</u></strong><br />  <br /> After logging in to vtiger Self-service Portal first time, you can access the vtiger CRM documents from the <strong>Documents</strong> tab. Following documents are available for your reference:<br />\n                                                <ul>\n                                                    <li>Installation Manual (Windows &amp; Linux OS)<br /> </li>\n                                                    <li>User &amp; Administrator Manual<br /> </li>\n                                                    <li>vtiger Customer Portal - User Manual<br /> </li>\n                                                    <li>vtiger Outlook Plugin - User Manual<br /> </li>\n                                                    <li>vtiger Office Plug-in - User Manual<br /> </li>\n                                                    <li>vtiger Thunderbird Extension - User Manual<br /> </li>\n                                                    <li>vtiger Web Forms - User Manual<br /> </li>\n                                                    <li>vtiger Firefox Tool bar - User Manual<br /> </li>\n                                                </ul>\n                                                <br />  <br /> <strong><u>Knowledge Base</u></strong><br /> <br /> Periodically we update frequently asked question based on our customer experiences. You can access the latest articles from the <strong>FAQ</strong> tab.<br /> <br /> <strong><u>vtiger CRM - Details</u></strong><br /> <br /> Kindly let us know your current vtiger CRM version and system specification so that we can provide you necessary guidelines to enhance your vtiger CRM system performance. Based on your system specification we alert you about the latest security &amp; upgrade patches.<br />  <br />			 Thank you once again and wish you a wonderful experience with vtiger CRM.<br /> </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><strong style="padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;"><br /><br />Best Regards</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;">$support_team$ </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);" href="http://www.vtiger.com">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width="1%" valign="top"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="5" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);">\n                                <tr>\n                                    <td align="center">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Email Id: <a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);" href="mailto:support@vtiger.com">support@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width="50"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 10),
('Public', 'Support end notification before a week', 'VtigerCRM Support Notification', 'Send Notification mail to customer before a week of support end date', '<table width="700" cellspacing="0" cellpadding="0" border="0" align="center" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width="50"> </td>\n            <td>\n            <table width="100%" cellspacing="0" cellpadding="0" border="0">\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;">\n                                <tr>\n                                    <td align="center" rowspan="4">$logo$</td>\n                                    <td align="center"> </td>\n                                </tr>\n                                <tr>\n                                    <td align="left" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align="right" style="padding-right: 100px;">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">\n                                <tr>\n                                    <td valign="top">\n                                    <table width="100%" cellspacing="0" cellpadding="5" border="0">\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;">This is just a notification mail regarding your support end.<br /><span style="font-weight: bold;">Priority:</span> Urgent<br />Your Support is going to expire on next week<br />Please contact support@vtiger.com.<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="center"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><strong style="padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);" href="http://www.vtiger.com">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width="1%" valign="top"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="5" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);">\n                                <tr>\n                                    <td align="center">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Email Id: <a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);" href="mailto:info@vtiger.com">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width="50"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 11),
('Public', 'Support end notification before a month', 'VtigerCRM Support Notification', 'Send Notification mail to customer before a month of support end date', '<table width="700" cellspacing="0" cellpadding="0" border="0" align="center" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width="50"> </td>\n            <td>\n            <table width="100%" cellspacing="0" cellpadding="0" border="0">\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;">\n                                <tr>\n                                    <td align="center" rowspan="4">$logo$</td>\n                                    <td align="center"> </td>\n                                </tr>\n                                <tr>\n                                    <td align="left" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align="right" style="padding-right: 100px;">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">\n                                <tr>\n                                    <td valign="top">\n                                    <table width="100%" cellspacing="0" cellpadding="5" border="0">\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;">This is just a notification mail regarding your support end.<br /><span style="font-weight: bold;">Priority:</span> Normal<br />Your Support is going to expire on next month.<br />Please contact support@vtiger.com<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="center"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><strong style="padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><a href="http://www.vtiger.com" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width="1%" valign="top"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="5" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);">\n                                <tr>\n                                    <td align="center">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Email Id: <a href="mailto:info@vtiger.com" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width="50"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 12);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emailtemplates_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_emailtemplates_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_emailtemplates_seq`
--

INSERT INTO `vtiger_emailtemplates_seq` (`id`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_email_access`
--

CREATE TABLE IF NOT EXISTS `vtiger_email_access` (
  `crmid` int(11) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `accessdate` date DEFAULT NULL,
  `accesstime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_email_track`
--

CREATE TABLE IF NOT EXISTS `vtiger_email_track` (
  `crmid` int(11) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `access_count` int(11) DEFAULT NULL,
  UNIQUE KEY `link_tabidtype_idx` (`crmid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_entityname`
--

CREATE TABLE IF NOT EXISTS `vtiger_entityname` (
  `tabid` int(19) NOT NULL DEFAULT '0',
  `modulename` varchar(50) NOT NULL,
  `tablename` varchar(100) NOT NULL,
  `fieldname` varchar(150) NOT NULL,
  `entityidfield` varchar(150) NOT NULL,
  `entityidcolumn` varchar(150) NOT NULL,
  PRIMARY KEY (`tabid`),
  KEY `entityname_tabid_idx` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_entityname`
--

INSERT INTO `vtiger_entityname` (`tabid`, `modulename`, `tablename`, `fieldname`, `entityidfield`, `entityidcolumn`) VALUES
(2, 'Potentials', 'vtiger_potential', 'potentialname', 'potentialid', 'potential_id'),
(4, 'Contacts', 'vtiger_contactdetails', 'firstname,lastname', 'contactid', 'contact_id'),
(6, 'Accounts', 'vtiger_account', 'accountname', 'accountid', 'account_id'),
(7, 'Leads', 'vtiger_leaddetails', 'firstname,lastname', 'leadid', 'leadid'),
(8, 'Documents', 'vtiger_notes', 'title', 'notesid', 'notesid'),
(9, 'Calendar', 'vtiger_activity', 'subject', 'activityid', 'activityid'),
(10, 'Emails', 'vtiger_activity', 'subject', 'activityid', 'activityid'),
(13, 'HelpDesk', 'vtiger_troubletickets', 'title', 'ticketid', 'ticketid'),
(14, 'Products', 'vtiger_products', 'productname', 'productid', 'product_id'),
(15, 'Faq', 'vtiger_faq', 'question', 'id', 'id'),
(18, 'Vendors', 'vtiger_vendor', 'vendorname', 'vendorid', 'vendor_id'),
(19, 'PriceBooks', 'vtiger_pricebook', 'bookname', 'pricebookid', 'pricebookid'),
(20, 'Quotes', 'vtiger_quotes', 'subject', 'quoteid', 'quote_id'),
(21, 'PurchaseOrder', 'vtiger_purchaseorder', 'subject', 'purchaseorderid', 'purchaseorderid'),
(22, 'SalesOrder', 'vtiger_salesorder', 'subject', 'salesorderid', 'salesorder_id'),
(23, 'Invoice', 'vtiger_invoice', 'subject', 'invoiceid', 'invoiceid'),
(26, 'Campaigns', 'vtiger_campaign', 'campaignname', 'campaignid', 'campaignid'),
(29, 'Users', 'vtiger_users', 'first_name,last_name', 'id', 'id'),
(32, 'ServiceContracts', 'vtiger_servicecontracts', 'subject', 'servicecontractsid', 'servicecontractsid'),
(38, 'Services', 'vtiger_service', 'servicename', 'serviceid', 'serviceid'),
(40, 'PBXManager', 'vtiger_pbxmanager', 'callfrom', 'pbxmanagerid', 'pbxmanagerid'),
(42, 'ModComments', 'vtiger_modcomments', 'commentcontent', 'modcommentsid', 'modcommentsid'),
(44, 'Assets', 'vtiger_assets', 'assetname', 'assetsid', 'assetsid'),
(47, 'SMSNotifier', 'vtiger_smsnotifier', 'message', 'smsnotifierid', 'smsnotifierid'),
(50, 'ProjectMilestone', 'vtiger_projectmilestone', 'projectmilestonename', 'projectmilestoneid', 'projectmilestoneid'),
(51, 'ProjectTask', 'vtiger_projecttask', 'projecttaskname', 'projecttaskid', 'projecttaskid'),
(52, 'Project', 'vtiger_project', 'projectname', 'projectid', 'projectid');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_evaluationstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_evaluationstatus` (
  `evalstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`evalstatusid`),
  UNIQUE KEY `evaluationstatus_status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandlers`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandlers` (
  `eventhandler_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  `handler_path` varchar(400) NOT NULL,
  `handler_class` varchar(100) NOT NULL,
  `cond` text,
  `is_active` int(1) NOT NULL,
  `dependent_on` varchar(255) DEFAULT '[]',
  PRIMARY KEY (`eventhandler_id`,`event_name`,`handler_class`),
  UNIQUE KEY `eventhandler_idx` (`eventhandler_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `vtiger_eventhandlers`
--

INSERT INTO `vtiger_eventhandlers` (`eventhandler_id`, `event_name`, `handler_path`, `handler_class`, `cond`, `is_active`, `dependent_on`) VALUES
(1, 'vtiger.entity.aftersave', 'modules/SalesOrder/RecurringInvoiceHandler.php', 'RecurringInvoiceHandler', '', 1, '[]'),
(2, 'vtiger.entity.beforesave', 'data/VTEntityDelta.php', 'VTEntityDelta', '', 1, '[]'),
(3, 'vtiger.entity.aftersave', 'data/VTEntityDelta.php', 'VTEntityDelta', '', 1, '[]'),
(4, 'vtiger.entity.aftersave', 'modules/com_vtiger_workflow/VTEventHandler.inc', 'VTWorkflowEventHandler', '', 1, '["VTEntityDelta"]'),
(5, 'vtiger.entity.afterrestore', 'modules/com_vtiger_workflow/VTEventHandler.inc', 'VTWorkflowEventHandler', '', 1, '[]'),
(6, 'vtiger.entity.aftersave.final', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDeskHandler', '', 1, '[]'),
(7, 'vtiger.entity.beforesave', 'modules/ServiceContracts/ServiceContractsHandler.php', 'ServiceContractsHandler', '', 1, '[]'),
(8, 'vtiger.entity.aftersave', 'modules/ServiceContracts/ServiceContractsHandler.php', 'ServiceContractsHandler', '', 1, '[]'),
(9, 'vtiger.entity.aftersave.final', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(10, 'vtiger.entity.beforedelete', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(11, 'vtiger.entity.aftersave', 'modules/WSAPP/WorkFlowHandlers/WSAPPAssignToTracker.php', 'WSAPPAssignToTracker', '', 1, '["VTEntityDelta"]'),
(12, 'vtiger.entity.beforesave.modifiable', 'modules/FieldFormulas/VTFieldFormulasEventHandler.inc', 'VTFieldFormulasEventHandler', '', 1, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandlers_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandlers_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventhandlers_seq`
--

INSERT INTO `vtiger_eventhandlers_seq` (`id`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandler_module`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandler_module` (
  `eventhandler_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) DEFAULT NULL,
  `handler_class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eventhandler_module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_eventhandler_module`
--

INSERT INTO `vtiger_eventhandler_module` (`eventhandler_module_id`, `module_name`, `handler_class`) VALUES
(1, 'ServiceContracts', 'ServiceContractsHandler'),
(2, 'ModTracker', 'ModTrackerHandler'),
(3, 'FieldFormulas', 'VTFieldFormulasEventHandler');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandler_module_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandler_module_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventhandler_module_seq`
--

INSERT INTO `vtiger_eventhandler_module_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventstatus` (
  `eventstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `eventstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventstatusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_eventstatus`
--

INSERT INTO `vtiger_eventstatus` (`eventstatusid`, `eventstatus`, `presence`, `picklist_valueid`) VALUES
(1, 'Planned', 0, 38),
(2, 'Held', 0, 39),
(3, 'Not Held', 0, 40);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventstatus_seq`
--

INSERT INTO `vtiger_eventstatus_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_expectedresponse`
--

CREATE TABLE IF NOT EXISTS `vtiger_expectedresponse` (
  `expectedresponseid` int(19) NOT NULL AUTO_INCREMENT,
  `expectedresponse` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expectedresponseid`),
  UNIQUE KEY `CampaignExpRes_UK01` (`expectedresponse`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_expectedresponse`
--

INSERT INTO `vtiger_expectedresponse` (`expectedresponseid`, `expectedresponse`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 41),
(2, 'Excellent', 1, 42),
(3, 'Good', 1, 43),
(4, 'Average', 1, 44),
(5, 'Poor', 1, 45);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_expectedresponse_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_expectedresponse_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_expectedresponse_seq`
--

INSERT INTO `vtiger_expectedresponse_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_no` varchar(100) NOT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `question` text,
  `answer` text,
  `category` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqcategories`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcategories` (
  `faqcategories_id` int(19) NOT NULL AUTO_INCREMENT,
  `faqcategories` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faqcategories_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vtiger_faqcategories`
--

INSERT INTO `vtiger_faqcategories` (`faqcategories_id`, `faqcategories`, `presence`, `picklist_valueid`) VALUES
(1, 'General', 1, 46);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqcategories_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_faqcategories_seq`
--

INSERT INTO `vtiger_faqcategories_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcomments` (
  `commentid` int(19) NOT NULL AUTO_INCREMENT,
  `faqid` int(19) DEFAULT NULL,
  `comments` text,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `faqcomments_faqid_idx` (`faqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqstatus` (
  `faqstatus_id` int(19) NOT NULL AUTO_INCREMENT,
  `faqstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faqstatus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_faqstatus`
--

INSERT INTO `vtiger_faqstatus` (`faqstatus_id`, `faqstatus`, `presence`, `picklist_valueid`) VALUES
(1, 'Draft', 0, 47),
(2, 'Reviewed', 0, 48),
(3, 'Published', 0, 49),
(4, 'Obsolete', 0, 50);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_faqstatus_seq`
--

INSERT INTO `vtiger_faqstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_field` (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) NOT NULL AUTO_INCREMENT,
  `columnname` varchar(30) NOT NULL,
  `tablename` varchar(50) NOT NULL,
  `generatedtype` int(19) NOT NULL DEFAULT '0',
  `uitype` varchar(30) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `fieldlabel` varchar(50) NOT NULL,
  `readonly` int(1) NOT NULL,
  `presence` int(19) NOT NULL DEFAULT '1',
  `defaultvalue` text,
  `maximumlength` int(19) DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL,
  `block` int(19) DEFAULT NULL,
  `displaytype` int(19) DEFAULT NULL,
  `typeofdata` varchar(100) DEFAULT NULL,
  `quickcreate` int(10) NOT NULL DEFAULT '1',
  `quickcreatesequence` int(19) DEFAULT NULL,
  `info_type` varchar(20) DEFAULT NULL,
  `masseditable` int(10) NOT NULL DEFAULT '1',
  `helpinfo` text,
  PRIMARY KEY (`fieldid`),
  KEY `field_tabid_idx` (`tabid`),
  KEY `field_fieldname_idx` (`fieldname`),
  KEY `field_block_idx` (`block`),
  KEY `field_displaytype_idx` (`displaytype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=640 ;

--
-- Dumping data for table `vtiger_field`
--

INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`) VALUES
(6, 1, 'accountname', 'vtiger_account', 1, '2', 'accountname', 'Account Name', 1, 0, '', 100, 1, 9, 1, 'V~M', 0, 1, 'BAS', 0, NULL),
(6, 2, 'account_no', 'vtiger_account', 1, '4', 'account_no', 'Account No', 1, 0, '', 100, 2, 9, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(6, 3, 'phone', 'vtiger_account', 1, '11', 'phone', 'Phone', 1, 2, '', 100, 4, 9, 1, 'V~O', 2, 2, 'BAS', 1, NULL),
(6, 4, 'website', 'vtiger_account', 1, '17', 'website', 'Website', 1, 2, '', 100, 3, 9, 1, 'V~O', 2, 3, 'BAS', 1, NULL),
(6, 5, 'fax', 'vtiger_account', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 6, 9, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 6, 'tickersymbol', 'vtiger_account', 1, '1', 'tickersymbol', 'Ticker Symbol', 1, 2, '', 100, 5, 9, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 7, 'otherphone', 'vtiger_account', 1, '11', 'otherphone', 'Other Phone', 1, 2, '', 100, 8, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(6, 8, 'parentid', 'vtiger_account', 1, '51', 'account_id', 'Member Of', 1, 2, '', 100, 7, 9, 1, 'I~O', 1, NULL, 'BAS', 0, NULL),
(6, 9, 'email1', 'vtiger_account', 1, '13', 'email1', 'Email', 1, 2, '', 100, 10, 9, 1, 'E~O', 1, NULL, 'BAS', 1, NULL),
(6, 10, 'employees', 'vtiger_account', 1, '7', 'employees', 'Employees', 1, 2, '', 100, 9, 9, 1, 'I~O', 1, NULL, 'ADV', 1, NULL),
(6, 11, 'email2', 'vtiger_account', 1, '13', 'email2', 'Other Email', 1, 2, '', 100, 11, 9, 1, 'E~O', 1, NULL, 'ADV', 1, NULL),
(6, 12, 'ownership', 'vtiger_account', 1, '1', 'ownership', 'Ownership', 1, 2, '', 100, 12, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(6, 13, 'rating', 'vtiger_account', 1, '15', 'rating', 'Rating', 1, 2, '', 100, 14, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(6, 14, 'industry', 'vtiger_account', 1, '15', 'industry', 'industry', 1, 2, '', 100, 13, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(6, 15, 'siccode', 'vtiger_account', 1, '1', 'siccode', 'SIC Code', 1, 2, '', 100, 16, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(6, 16, 'account_type', 'vtiger_account', 1, '15', 'accounttype', 'Type', 1, 2, '', 100, 15, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(6, 17, 'annualrevenue', 'vtiger_account', 1, '71', 'annual_revenue', 'Annual Revenue', 1, 2, '', 100, 18, 9, 1, 'I~O', 1, NULL, 'ADV', 1, NULL),
(6, 18, 'emailoptout', 'vtiger_account', 1, '56', 'emailoptout', 'Email Opt Out', 1, 2, '', 100, 17, 9, 1, 'C~O', 1, NULL, 'ADV', 1, NULL),
(6, 19, 'notify_owner', 'vtiger_account', 1, '56', 'notify_owner', 'Notify Owner', 1, 2, '', 10, 20, 9, 1, 'C~O', 1, NULL, 'ADV', 1, NULL),
(6, 20, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 19, 9, 1, 'V~M', 0, 4, 'BAS', 1, NULL),
(6, 21, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 22, 9, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(6, 22, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 21, 9, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(6, 23, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 23, 9, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(6, 24, 'bill_street', 'vtiger_accountbillads', 1, '21', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 25, 'ship_street', 'vtiger_accountshipads', 1, '21', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 26, 'bill_city', 'vtiger_accountbillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 27, 'ship_city', 'vtiger_accountshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 28, 'bill_state', 'vtiger_accountbillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 29, 'ship_state', 'vtiger_accountshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 30, 'bill_code', 'vtiger_accountbillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 31, 'ship_code', 'vtiger_accountshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 32, 'bill_country', 'vtiger_accountbillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 33, 'ship_country', 'vtiger_accountshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 34, 'bill_pobox', 'vtiger_accountbillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 35, 'ship_pobox', 'vtiger_accountshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(6, 36, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 12, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 37, 'salutation', 'vtiger_leaddetails', 1, '55', 'salutationtype', 'Salutation', 1, 0, '', 100, 1, 13, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 38, 'firstname', 'vtiger_leaddetails', 1, '55', 'firstname', 'First Name', 1, 0, '', 100, 2, 13, 1, 'V~O', 2, 1, 'BAS', 1, NULL),
(7, 39, 'lead_no', 'vtiger_leaddetails', 1, '4', 'lead_no', 'Lead No', 1, 0, '', 100, 3, 13, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(7, 40, 'phone', 'vtiger_leadaddress', 1, '11', 'phone', 'Phone', 1, 2, '', 100, 5, 13, 1, 'V~O', 2, 4, 'BAS', 1, NULL),
(7, 41, 'lastname', 'vtiger_leaddetails', 1, '255', 'lastname', 'Last Name', 1, 0, '', 100, 4, 13, 1, 'V~M', 0, 2, 'BAS', 1, NULL),
(7, 42, 'mobile', 'vtiger_leadaddress', 1, '11', 'mobile', 'Mobile', 1, 2, '', 100, 7, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 43, 'company', 'vtiger_leaddetails', 1, '2', 'company', 'Company', 1, 2, '', 100, 6, 13, 1, 'V~M', 2, 3, 'BAS', 1, NULL),
(7, 44, 'fax', 'vtiger_leadaddress', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 9, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 45, 'designation', 'vtiger_leaddetails', 1, '1', 'designation', 'Designation', 1, 2, '', 100, 8, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 46, 'email', 'vtiger_leaddetails', 1, '13', 'email', 'Email', 1, 2, '', 100, 11, 13, 1, 'E~O', 2, 5, 'BAS', 1, NULL),
(7, 47, 'leadsource', 'vtiger_leaddetails', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 10, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 48, 'website', 'vtiger_leadsubdetails', 1, '17', 'website', 'Website', 1, 2, '', 100, 13, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(7, 49, 'industry', 'vtiger_leaddetails', 1, '15', 'industry', 'Industry', 1, 2, '', 100, 12, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(7, 50, 'leadstatus', 'vtiger_leaddetails', 1, '15', 'leadstatus', 'Lead Status', 1, 2, '', 100, 15, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 51, 'annualrevenue', 'vtiger_leaddetails', 1, '71', 'annualrevenue', 'Annual Revenue', 1, 2, '', 100, 14, 13, 1, 'I~O', 1, NULL, 'ADV', 1, NULL),
(7, 52, 'rating', 'vtiger_leaddetails', 1, '15', 'rating', 'Rating', 1, 2, '', 100, 17, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(7, 53, 'noofemployees', 'vtiger_leaddetails', 1, '1', 'noofemployees', 'No Of Employees', 1, 2, '', 100, 16, 13, 1, 'I~O', 1, NULL, 'ADV', 1, NULL),
(7, 54, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 19, 13, 1, 'V~M', 0, 6, 'BAS', 1, NULL),
(7, 55, 'secondaryemail', 'vtiger_leaddetails', 1, '13', 'secondaryemail', 'Secondary Email', 1, 2, '', 100, 18, 13, 1, 'E~O', 1, NULL, 'ADV', 1, NULL),
(7, 56, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 21, 13, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(7, 57, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 20, 13, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(7, 58, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 23, 13, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(7, 59, 'lane', 'vtiger_leadaddress', 1, '21', 'lane', 'Street', 1, 2, '', 100, 1, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 60, 'code', 'vtiger_leadaddress', 1, '1', 'code', 'Postal Code', 1, 2, '', 100, 3, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 61, 'city', 'vtiger_leadaddress', 1, '1', 'city', 'City', 1, 2, '', 100, 4, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 62, 'country', 'vtiger_leadaddress', 1, '1', 'country', 'Country', 1, 2, '', 100, 5, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 63, 'state', 'vtiger_leadaddress', 1, '1', 'state', 'State', 1, 2, '', 100, 6, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 64, 'pobox', 'vtiger_leadaddress', 1, '1', 'pobox', 'Po Box', 1, 2, '', 100, 2, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(7, 65, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 16, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 66, 'salutation', 'vtiger_contactdetails', 1, '55', 'salutationtype', 'Salutation', 1, 0, '', 100, 1, 4, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 67, 'firstname', 'vtiger_contactdetails', 1, '55', 'firstname', 'First Name', 1, 0, '', 100, 2, 4, 1, 'V~O', 2, 1, 'BAS', 1, NULL),
(4, 68, 'contact_no', 'vtiger_contactdetails', 1, '4', 'contact_no', 'Contact Id', 1, 0, '', 100, 3, 4, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(4, 69, 'phone', 'vtiger_contactdetails', 1, '11', 'phone', 'Office Phone', 1, 2, '', 100, 5, 4, 1, 'V~O', 2, 4, 'BAS', 1, NULL),
(4, 70, 'lastname', 'vtiger_contactdetails', 1, '255', 'lastname', 'Last Name', 1, 0, '', 100, 4, 4, 1, 'V~M', 0, 2, 'BAS', 1, NULL),
(4, 71, 'mobile', 'vtiger_contactdetails', 1, '11', 'mobile', 'Mobile', 1, 2, '', 100, 7, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 72, 'accountid', 'vtiger_contactdetails', 1, '51', 'account_id', 'Account Name', 1, 0, '', 100, 6, 4, 1, 'I~O', 2, 3, 'BAS', 1, NULL),
(4, 73, 'homephone', 'vtiger_contactsubdetails', 1, '11', 'homephone', 'Home Phone', 1, 2, '', 100, 9, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(4, 74, 'leadsource', 'vtiger_contactsubdetails', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 8, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 75, 'otherphone', 'vtiger_contactsubdetails', 1, '11', 'otherphone', 'Other Phone', 1, 2, '', 100, 11, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(4, 76, 'title', 'vtiger_contactdetails', 1, '1', 'title', 'Title', 1, 2, '', 100, 10, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 77, 'fax', 'vtiger_contactdetails', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 13, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 78, 'department', 'vtiger_contactdetails', 1, '1', 'department', 'Department', 1, 2, '', 100, 12, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(4, 79, 'birthday', 'vtiger_contactsubdetails', 1, '5', 'birthday', 'Birthdate', 1, 2, '', 100, 16, 4, 1, 'D~O', 1, NULL, 'ADV', 1, NULL),
(4, 80, 'email', 'vtiger_contactdetails', 1, '13', 'email', 'Email', 1, 2, '', 100, 15, 4, 1, 'E~O', 2, 5, 'BAS', 1, NULL),
(4, 81, 'reportsto', 'vtiger_contactdetails', 1, '57', 'contact_id', 'Reports To', 1, 2, '', 100, 18, 4, 1, 'V~O', 1, NULL, 'ADV', 0, NULL),
(4, 82, 'assistant', 'vtiger_contactsubdetails', 1, '1', 'assistant', 'Assistant', 1, 2, '', 100, 17, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(4, 83, 'secondaryemail', 'vtiger_contactdetails', 1, '13', 'secondaryemail', 'Secondary Email', 1, 2, '', 100, 20, 4, 1, 'E~O', 1, NULL, 'ADV', 1, NULL),
(4, 84, 'assistantphone', 'vtiger_contactsubdetails', 1, '11', 'assistantphone', 'Assistant Phone', 1, 2, '', 100, 19, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(4, 85, 'donotcall', 'vtiger_contactdetails', 1, '56', 'donotcall', 'Do Not Call', 1, 2, '', 100, 22, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL),
(4, 86, 'emailoptout', 'vtiger_contactdetails', 1, '56', 'emailoptout', 'Email Opt Out', 1, 2, '', 100, 21, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL),
(4, 87, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 24, 4, 1, 'V~M', 0, 6, 'BAS', 1, NULL),
(4, 88, 'reference', 'vtiger_contactdetails', 1, '56', 'reference', 'Reference', 1, 2, '', 10, 23, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL),
(4, 89, 'notify_owner', 'vtiger_contactdetails', 1, '56', 'notify_owner', 'Notify Owner', 1, 2, '', 10, 26, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL),
(4, 90, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 25, 4, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(4, 91, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 27, 4, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(4, 92, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 28, 4, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(4, 93, 'portal', 'vtiger_customerdetails', 1, '56', 'portal', 'Portal User', 1, 2, '', 100, 1, 6, 1, 'C~O', 1, NULL, 'ADV', 0, NULL),
(4, 94, 'support_start_date', 'vtiger_customerdetails', 1, '5', 'support_start_date', 'Support Start Date', 1, 2, '', 100, 2, 6, 1, 'D~O', 1, NULL, 'ADV', 1, NULL),
(4, 95, 'support_end_date', 'vtiger_customerdetails', 1, '5', 'support_end_date', 'Support End Date', 1, 2, '', 100, 3, 6, 1, 'D~O~OTH~GE~support_start_date~Support Start Date', 1, NULL, 'ADV', 1, NULL),
(4, 96, 'mailingstreet', 'vtiger_contactaddress', 1, '21', 'mailingstreet', 'Mailing Street', 1, 2, '', 100, 1, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 97, 'otherstreet', 'vtiger_contactaddress', 1, '21', 'otherstreet', 'Other Street', 1, 2, '', 100, 2, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 98, 'mailingcity', 'vtiger_contactaddress', 1, '1', 'mailingcity', 'Mailing City', 1, 2, '', 100, 5, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 99, 'othercity', 'vtiger_contactaddress', 1, '1', 'othercity', 'Other City', 1, 2, '', 100, 6, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 100, 'mailingstate', 'vtiger_contactaddress', 1, '1', 'mailingstate', 'Mailing State', 1, 2, '', 100, 7, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 101, 'otherstate', 'vtiger_contactaddress', 1, '1', 'otherstate', 'Other State', 1, 2, '', 100, 8, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 102, 'mailingzip', 'vtiger_contactaddress', 1, '1', 'mailingzip', 'Mailing Zip', 1, 2, '', 100, 9, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 103, 'otherzip', 'vtiger_contactaddress', 1, '1', 'otherzip', 'Other Zip', 1, 2, '', 100, 10, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 104, 'mailingcountry', 'vtiger_contactaddress', 1, '1', 'mailingcountry', 'Mailing Country', 1, 2, '', 100, 11, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 105, 'othercountry', 'vtiger_contactaddress', 1, '1', 'othercountry', 'Other Country', 1, 2, '', 100, 12, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 106, 'mailingpobox', 'vtiger_contactaddress', 1, '1', 'mailingpobox', 'Mailing Po Box', 1, 2, '', 100, 3, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 107, 'otherpobox', 'vtiger_contactaddress', 1, '1', 'otherpobox', 'Other Po Box', 1, 2, '', 100, 4, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 108, 'imagename', 'vtiger_contactdetails', 1, '69', 'imagename', 'Contact Image', 1, 2, '', 100, 1, 73, 1, 'V~O', 3, NULL, 'ADV', 0, NULL),
(4, 109, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 8, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(2, 110, 'potentialname', 'vtiger_potential', 1, '2', 'potentialname', 'Potential Name', 1, 0, '', 100, 1, 1, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(2, 111, 'potential_no', 'vtiger_potential', 1, '4', 'potential_no', 'Potential No', 1, 0, '', 100, 2, 1, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(2, 112, 'amount', 'vtiger_potential', 1, '71', 'amount', 'Amount', 1, 2, '', 100, 4, 1, 1, 'N~O', 2, 5, 'BAS', 1, NULL),
(2, 113, 'related_to', 'vtiger_potential', 1, '10', 'related_to', 'Related To', 1, 0, '', 100, 3, 1, 1, 'V~M', 0, 2, 'BAS', 1, NULL),
(2, 114, 'closingdate', 'vtiger_potential', 1, '23', 'closingdate', 'Expected Close Date', 1, 2, '', 100, 7, 1, 1, 'D~M', 2, 3, 'BAS', 1, NULL),
(2, 115, 'potentialtype', 'vtiger_potential', 1, '15', 'opportunity_type', 'Type', 1, 2, '', 100, 6, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(2, 116, 'nextstep', 'vtiger_potential', 1, '1', 'nextstep', 'Next Step', 1, 2, '', 100, 9, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(2, 117, 'leadsource', 'vtiger_potential', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 8, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(2, 118, 'sales_stage', 'vtiger_potential', 1, '15', 'sales_stage', 'Sales Stage', 1, 2, '', 100, 11, 1, 1, 'V~M', 2, 4, 'BAS', 1, NULL),
(2, 119, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 10, 1, 1, 'V~M', 0, 6, 'BAS', 1, NULL),
(2, 120, 'probability', 'vtiger_potential', 1, '9', 'probability', 'Probability', 1, 2, '', 100, 13, 1, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(2, 121, 'campaignid', 'vtiger_potential', 1, '58', 'campaignid', 'Campaign Source', 1, 2, '', 100, 12, 1, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(2, 122, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 15, 1, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(2, 123, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 14, 1, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(2, 124, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 1, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(2, 125, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 3, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(26, 126, 'campaignname', 'vtiger_campaign', 1, '2', 'campaignname', 'Campaign Name', 1, 0, '', 100, 1, 74, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(26, 127, 'campaign_no', 'vtiger_campaign', 1, '4', 'campaign_no', 'Campaign No', 1, 0, '', 100, 2, 74, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(26, 128, 'campaigntype', 'vtiger_campaign', 1, '15', 'campaigntype', 'Campaign Type', 1, 2, '', 100, 5, 74, 1, 'V~O', 2, 3, 'BAS', 1, NULL),
(26, 129, 'product_id', 'vtiger_campaign', 1, '59', 'product_id', 'Product', 1, 2, '', 100, 6, 74, 1, 'I~O', 2, 5, 'BAS', 1, NULL),
(26, 130, 'campaignstatus', 'vtiger_campaign', 1, '15', 'campaignstatus', 'Campaign Status', 1, 2, '', 100, 4, 74, 1, 'V~O', 2, 6, 'BAS', 1, NULL),
(26, 131, 'closingdate', 'vtiger_campaign', 1, '23', 'closingdate', 'Expected Close Date', 1, 2, '', 100, 8, 74, 1, 'D~M', 2, 2, 'BAS', 1, NULL),
(26, 132, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 3, 74, 1, 'V~M', 0, 7, 'BAS', 1, NULL),
(26, 133, 'numsent', 'vtiger_campaign', 1, '9', 'numsent', 'Num Sent', 1, 2, '', 100, 12, 74, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(26, 134, 'sponsor', 'vtiger_campaign', 1, '1', 'sponsor', 'Sponsor', 1, 2, '', 100, 9, 74, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(26, 135, 'targetaudience', 'vtiger_campaign', 1, '1', 'targetaudience', 'Target Audience', 1, 2, '', 100, 7, 74, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(26, 136, 'targetsize', 'vtiger_campaign', 1, '1', 'targetsize', 'TargetSize', 1, 2, '', 100, 10, 74, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(26, 137, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 11, 74, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(26, 138, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 13, 74, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(26, 139, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 74, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(26, 140, 'expectedresponse', 'vtiger_campaign', 1, '15', 'expectedresponse', 'Expected Response', 1, 2, '', 100, 3, 76, 1, 'V~O', 2, 4, 'BAS', 1, NULL),
(26, 141, 'expectedrevenue', 'vtiger_campaign', 1, '71', 'expectedrevenue', 'Expected Revenue', 1, 2, '', 100, 4, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(26, 142, 'budgetcost', 'vtiger_campaign', 1, '71', 'budgetcost', 'Budget Cost', 1, 2, '', 100, 1, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(26, 143, 'actualcost', 'vtiger_campaign', 1, '71', 'actualcost', 'Actual Cost', 1, 2, '', 100, 2, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(26, 144, 'expectedresponsecount', 'vtiger_campaign', 1, '1', 'expectedresponsecount', 'Expected Response Count', 1, 2, '', 100, 7, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(26, 145, 'expectedsalescount', 'vtiger_campaign', 1, '1', 'expectedsalescount', 'Expected Sales Count', 1, 2, '', 100, 5, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(26, 146, 'expectedroi', 'vtiger_campaign', 1, '71', 'expectedroi', 'Expected ROI', 1, 2, '', 100, 9, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(26, 147, 'actualresponsecount', 'vtiger_campaign', 1, '1', 'actualresponsecount', 'Actual Response Count', 1, 2, '', 100, 8, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(26, 148, 'actualsalescount', 'vtiger_campaign', 1, '1', 'actualsalescount', 'Actual Sales Count', 1, 2, '', 100, 6, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(26, 149, 'actualroi', 'vtiger_campaign', 1, '71', 'actualroi', 'Actual ROI', 1, 2, '', 100, 10, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(26, 150, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 81, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(4, 151, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL),
(6, 152, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL),
(7, 153, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL),
(26, 154, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL),
(13, 155, 'ticket_no', 'vtiger_troubletickets', 1, '4', 'ticket_no', 'Ticket No', 1, 0, '', 100, 13, 25, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(13, 156, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 4, 25, 1, 'V~M', 0, 4, 'BAS', 1, NULL),
(13, 157, 'parent_id', 'vtiger_troubletickets', 1, '68', 'parent_id', 'Related To', 1, 0, '', 100, 2, 25, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(13, 158, 'priority', 'vtiger_troubletickets', 1, '15', 'ticketpriorities', 'Priority', 1, 2, '', 100, 6, 25, 1, 'V~O', 2, 3, 'BAS', 1, NULL),
(13, 159, 'product_id', 'vtiger_troubletickets', 1, '59', 'product_id', 'Product Name', 1, 2, '', 100, 5, 25, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(13, 160, 'severity', 'vtiger_troubletickets', 1, '15', 'ticketseverities', 'Severity', 1, 2, '', 100, 8, 25, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(13, 161, 'status', 'vtiger_troubletickets', 1, '15', 'ticketstatus', 'Status', 1, 2, '', 100, 7, 25, 1, 'V~M', 1, 2, 'BAS', 1, NULL),
(13, 162, 'category', 'vtiger_troubletickets', 1, '15', 'ticketcategories', 'Category', 1, 2, '', 100, 10, 25, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(13, 163, 'update_log', 'vtiger_troubletickets', 1, '19', 'update_log', 'Update History', 1, 0, '', 100, 11, 25, 3, 'V~O', 1, NULL, 'BAS', 0, NULL),
(13, 164, 'hours', 'vtiger_troubletickets', 1, '1', 'hours', 'Hours', 1, 2, '', 100, 9, 25, 1, 'I~O', 1, NULL, 'BAS', 1, 'This gives the estimated hours for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.'),
(13, 165, 'days', 'vtiger_troubletickets', 1, '1', 'days', 'Days', 1, 2, '', 100, 10, 25, 1, 'I~O', 1, NULL, 'BAS', 1, 'This gives the estimated days for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.'),
(13, 166, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 9, 25, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(13, 167, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 12, 25, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(13, 168, 'from_portal', 'vtiger_troubletickets', 1, '56', 'from_portal', 'From Portal', 1, 0, '', 100, 13, 25, 3, 'C~O', 3, NULL, 'BAS', 0, NULL),
(13, 169, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 25, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(13, 170, 'title', 'vtiger_troubletickets', 1, '22', 'ticket_title', 'Title', 1, 0, '', 100, 1, 25, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(13, 171, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 28, 1, 'V~O', 2, 4, 'BAS', 1, NULL),
(13, 172, 'solution', 'vtiger_troubletickets', 1, '19', 'solution', 'Solution', 1, 0, '', 100, 1, 29, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(13, 173, 'comments', 'vtiger_ticketcomments', 1, '19', 'comments', 'Add Comment', 1, 0, '', 100, 1, 30, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(14, 174, 'productname', 'vtiger_products', 1, '2', 'productname', 'Product Name', 1, 0, '', 100, 1, 31, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(14, 175, 'product_no', 'vtiger_products', 1, '4', 'product_no', 'Product No', 1, 0, '', 100, 2, 31, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(14, 176, 'productcode', 'vtiger_products', 1, '1', 'productcode', 'Part Number', 1, 2, '', 100, 4, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 177, 'discontinued', 'vtiger_products', 1, '56', 'discontinued', 'Product Active', 1, 2, '', 100, 3, 31, 1, 'V~O', 2, 2, 'BAS', 1, NULL),
(14, 178, 'manufacturer', 'vtiger_products', 1, '15', 'manufacturer', 'Manufacturer', 1, 2, '', 100, 6, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 179, 'productcategory', 'vtiger_products', 1, '15', 'productcategory', 'Product Category', 1, 2, '', 100, 6, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 180, 'sales_start_date', 'vtiger_products', 1, '5', 'sales_start_date', 'Sales Start Date', 1, 2, '', 100, 5, 31, 1, 'D~O', 1, NULL, 'BAS', 1, NULL),
(14, 181, 'sales_end_date', 'vtiger_products', 1, '5', 'sales_end_date', 'Sales End Date', 1, 2, '', 100, 8, 31, 1, 'D~O~OTH~GE~sales_start_date~Sales Start Date', 1, NULL, 'BAS', 1, NULL),
(14, 182, 'start_date', 'vtiger_products', 1, '5', 'start_date', 'Support Start Date', 1, 2, '', 100, 7, 31, 1, 'D~O', 1, NULL, 'BAS', 1, NULL),
(14, 183, 'expiry_date', 'vtiger_products', 1, '5', 'expiry_date', 'Support Expiry Date', 1, 2, '', 100, 10, 31, 1, 'D~O~OTH~GE~start_date~Start Date', 1, NULL, 'BAS', 1, NULL),
(14, 184, 'website', 'vtiger_products', 1, '17', 'website', 'Website', 1, 2, '', 100, 14, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 185, 'vendor_id', 'vtiger_products', 1, '75', 'vendor_id', 'Vendor Name', 1, 2, '', 100, 13, 31, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(14, 186, 'mfr_part_no', 'vtiger_products', 1, '1', 'mfr_part_no', 'Mfr PartNo', 1, 2, '', 100, 16, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 187, 'vendor_part_no', 'vtiger_products', 1, '1', 'vendor_part_no', 'Vendor PartNo', 1, 2, '', 100, 15, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 188, 'serialno', 'vtiger_products', 1, '1', 'serial_no', 'Serial No', 1, 2, '', 100, 18, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 189, 'productsheet', 'vtiger_products', 1, '1', 'productsheet', 'Product Sheet', 1, 2, '', 100, 17, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 190, 'glacct', 'vtiger_products', 1, '15', 'glacct', 'GL Account', 1, 2, '', 100, 20, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(14, 191, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 19, 31, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(14, 192, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 21, 31, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(14, 193, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 31, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(14, 194, 'unit_price', 'vtiger_products', 1, '72', 'unit_price', 'Unit Price', 1, 2, '', 100, 1, 32, 1, 'N~O', 2, 3, 'BAS', 0, NULL),
(14, 195, 'commissionrate', 'vtiger_products', 1, '9', 'commissionrate', 'Commission Rate', 1, 2, '', 100, 2, 32, 1, 'N~O', 1, NULL, 'BAS', 1, NULL),
(14, 196, 'taxclass', 'vtiger_products', 1, '83', 'taxclass', 'Tax Class', 1, 2, '', 100, 4, 32, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(14, 197, 'usageunit', 'vtiger_products', 1, '15', 'usageunit', 'Usage Unit', 1, 2, '', 100, 1, 33, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(14, 198, 'qty_per_unit', 'vtiger_products', 1, '1', 'qty_per_unit', 'Qty/Unit', 1, 2, '', 100, 2, 33, 1, 'N~O', 1, NULL, 'ADV', 1, NULL),
(14, 199, 'qtyinstock', 'vtiger_products', 1, '1', 'qtyinstock', 'Qty In Stock', 1, 2, '', 100, 3, 33, 1, 'NN~O', 0, 4, 'ADV', 1, NULL),
(14, 200, 'reorderlevel', 'vtiger_products', 1, '1', 'reorderlevel', 'Reorder Level', 1, 2, '', 100, 4, 33, 1, 'I~O', 1, NULL, 'ADV', 1, NULL),
(14, 201, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Handler', 1, 0, '', 100, 5, 33, 1, 'V~M', 0, 5, 'BAS', 1, NULL),
(14, 202, 'qtyindemand', 'vtiger_products', 1, '1', 'qtyindemand', 'Qty In Demand', 1, 2, '', 100, 6, 33, 1, 'I~O', 1, NULL, 'ADV', 1, NULL),
(14, 203, 'imagename', 'vtiger_products', 1, '69', 'imagename', 'Product Image', 1, 2, '', 100, 1, 35, 1, 'V~O', 3, NULL, 'ADV', 0, NULL),
(14, 204, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 36, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(8, 205, 'title', 'vtiger_notes', 1, '2', 'notes_title', 'Title', 1, 0, '', 100, 1, 17, 1, 'V~M', 0, 1, 'BAS', 0, NULL),
(8, 206, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 17, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(8, 207, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 17, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(8, 208, 'filename', 'vtiger_notes', 1, '28', 'filename', 'File Name', 1, 2, '', 100, 3, 18, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(8, 209, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 4, 17, 1, 'V~M', 0, 3, 'BAS', 0, NULL),
(8, 210, 'notecontent', 'vtiger_notes', 1, '19', 'notecontent', 'Note', 1, 2, '', 100, 1, 84, 1, 'V~O', 1, NULL, 'BAS', 0, NULL),
(8, 211, 'filetype', 'vtiger_notes', 1, '1', 'filetype', 'File Type', 1, 2, '', 100, 5, 18, 2, 'V~O', 3, 0, 'BAS', 0, NULL),
(8, 212, 'filesize', 'vtiger_notes', 1, '1', 'filesize', 'File Size', 1, 2, '', 100, 4, 18, 2, 'I~O', 3, 0, 'BAS', 0, NULL),
(8, 213, 'filelocationtype', 'vtiger_notes', 1, '27', 'filelocationtype', 'Download Type', 1, 0, '', 100, 1, 18, 1, 'V~O', 3, 0, 'BAS', 0, NULL),
(8, 214, 'fileversion', 'vtiger_notes', 1, '1', 'fileversion', 'Version', 1, 2, '', 100, 6, 18, 1, 'V~O', 1, 0, 'BAS', 0, NULL),
(8, 215, 'filestatus', 'vtiger_notes', 1, '56', 'filestatus', 'Active', 1, 2, '', 100, 2, 18, 1, 'V~O', 1, 0, 'BAS', 0, NULL),
(8, 216, 'filedownloadcount', 'vtiger_notes', 1, '1', 'filedownloadcount', 'Download Count', 1, 2, '', 100, 7, 18, 2, 'I~O', 3, 0, 'BAS', 0, NULL),
(8, 217, 'folderid', 'vtiger_notes', 1, '26', 'folderid', 'Folder Name', 1, 2, '', 100, 2, 17, 1, 'V~O', 2, 2, 'BAS', 0, NULL),
(8, 218, 'note_no', 'vtiger_notes', 1, '4', 'note_no', 'Document No', 1, 0, '', 100, 3, 17, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(8, 219, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 17, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(10, 220, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Date & Time Sent', 1, 0, '', 100, 1, 21, 1, 'DT~M~time_start~Time Start', 1, NULL, 'BAS', 1, NULL),
(10, 221, 'semodule', 'vtiger_activity', 1, '2', 'parent_type', 'Sales Enity Module', 1, 0, '', 100, 2, 21, 3, '', 1, NULL, 'BAS', 1, NULL),
(10, 222, 'activitytype', 'vtiger_activity', 1, '2', 'activitytype', 'Activtiy Type', 1, 0, '', 100, 3, 21, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(10, 223, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 5, 21, 1, 'V~M', 1, NULL, 'BAS', 1, NULL),
(10, 224, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 23, 1, 'V~M', 1, NULL, 'BAS', 1, NULL),
(10, 225, 'name', 'vtiger_attachments', 1, '61', 'filename', 'Attachment', 1, 0, '', 100, 2, 23, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(10, 226, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 24, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(10, 227, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 9, 23, 1, 'T~O', 1, NULL, 'BAS', 1, NULL),
(10, 228, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 10, 22, 1, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(10, 229, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 11, 21, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(10, 230, 'access_count', 'vtiger_email_track', 1, '25', 'access_count', 'Access Count', 1, 0, '0', 100, 6, 21, 3, 'V~O', 1, NULL, 'BAS', 0, NULL),
(10, 231, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 21, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(9, 232, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 19, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(9, 233, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 19, 1, 'V~M', 0, 4, 'BAS', 1, NULL),
(9, 234, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Start Date & Time', 1, 0, '', 100, 3, 19, 1, 'DT~M~time_start', 0, 2, 'BAS', 1, NULL),
(9, 235, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 4, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL),
(9, 236, 'time_end', 'vtiger_activity', 1, '2', 'time_end', 'End Time', 1, 0, '', 100, 4, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL),
(9, 237, 'due_date', 'vtiger_activity', 1, '23', 'due_date', 'Due Date', 1, 0, '', 100, 5, 19, 1, 'D~M~OTH~GE~date_start~Start Date & Time', 1, NULL, 'BAS', 1, NULL),
(9, 238, 'crmid', 'vtiger_seactivityrel', 1, '66', 'parent_id', 'Related To', 1, 0, '', 100, 7, 19, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(9, 239, 'contactid', 'vtiger_cntactivityrel', 1, '57', 'contact_id', 'Contact Name', 1, 0, '', 100, 8, 19, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(9, 240, 'status', 'vtiger_activity', 1, '15', 'taskstatus', 'Status', 1, 0, '', 100, 8, 19, 1, 'V~M', 0, 3, 'BAS', 1, NULL),
(9, 241, 'eventstatus', 'vtiger_activity', 1, '15', 'eventstatus', 'Status', 1, 0, '', 100, 9, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(9, 242, 'priority', 'vtiger_activity', 1, '15', 'taskpriority', 'Priority', 1, 0, '', 100, 10, 19, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(9, 243, 'sendnotification', 'vtiger_activity', 1, '56', 'sendnotification', 'Send Notification', 1, 0, '', 100, 11, 19, 1, 'C~O', 1, NULL, 'BAS', 1, NULL),
(9, 244, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 19, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(9, 245, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 19, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(9, 246, 'activitytype', 'vtiger_activity', 1, '15', 'activitytype', 'Activity Type', 1, 0, '', 100, 16, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(9, 247, 'visibility', 'vtiger_activity', 1, '16', 'visibility', 'Visibility', 1, 0, '', 100, 17, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(9, 248, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 20, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(9, 249, 'duration_hours', 'vtiger_activity', 1, '63', 'duration_hours', 'Duration', 1, 0, '', 100, 17, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL),
(9, 250, 'duration_minutes', 'vtiger_activity', 1, '16', 'duration_minutes', 'Duration Minutes', 1, 0, '', 100, 18, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL),
(9, 251, 'location', 'vtiger_activity', 1, '1', 'location', 'Location', 1, 0, '', 100, 19, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(9, 252, 'reminder_time', 'vtiger_activity_reminder', 1, '30', 'reminder_time', 'Send Reminder', 1, 0, '', 100, 1, 19, 3, 'I~O', 1, NULL, 'BAS', 1, NULL),
(9, 253, 'recurringtype', 'vtiger_activity', 1, '16', 'recurringtype', 'Recurrence', 1, 0, '', 100, 6, 19, 3, 'O~O', 1, NULL, 'BAS', 1, NULL),
(9, 254, 'notime', 'vtiger_activity', 1, '56', 'notime', 'No Time', 1, 0, '', 100, 20, 19, 3, 'C~O', 1, NULL, 'BAS', 1, NULL),
(9, 255, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 19, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(16, 256, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 41, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(16, 257, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 41, 1, 'V~M', 0, 6, 'BAS', 1, NULL),
(16, 258, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Start Date & Time', 1, 0, '', 100, 3, 41, 1, 'DT~M~time_start', 0, 2, 'BAS', 1, NULL),
(16, 259, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 4, 41, 3, 'T~M', 1, NULL, 'BAS', 1, NULL),
(16, 260, 'due_date', 'vtiger_activity', 1, '23', 'due_date', 'End Date', 1, 0, '', 100, 5, 41, 1, 'D~M~OTH~GE~date_start~Start Date & Time', 0, 5, 'BAS', 1, NULL),
(16, 261, 'time_end', 'vtiger_activity', 1, '2', 'time_end', 'End Time', 1, 0, '', 100, 5, 41, 3, 'T~M', 1, NULL, 'BAS', 1, NULL),
(16, 262, 'recurringtype', 'vtiger_activity', 1, '16', 'recurringtype', 'Recurrence', 1, 0, '', 100, 6, 41, 1, 'O~O', 1, NULL, 'BAS', 1, NULL),
(16, 263, 'duration_hours', 'vtiger_activity', 1, '63', 'duration_hours', 'Duration', 1, 0, '', 100, 7, 41, 1, 'I~M', 1, NULL, 'BAS', 1, NULL),
(16, 264, 'duration_minutes', 'vtiger_activity', 1, '16', 'duration_minutes', 'Duration Minutes', 1, 0, '', 100, 8, 41, 3, 'O~O', 1, NULL, 'BAS', 1, NULL),
(16, 265, 'crmid', 'vtiger_seactivityrel', 1, '66', 'parent_id', 'Related To', 1, 0, '', 100, 9, 41, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(16, 266, 'eventstatus', 'vtiger_activity', 1, '15', 'eventstatus', 'Status', 1, 0, '', 100, 10, 41, 1, 'V~M', 0, 3, 'BAS', 1, NULL),
(16, 267, 'sendnotification', 'vtiger_activity', 1, '56', 'sendnotification', 'Send Notification', 1, 0, '', 100, 11, 41, 1, 'C~O', 1, NULL, 'BAS', 1, NULL),
(16, 268, 'activitytype', 'vtiger_activity', 1, '15', 'activitytype', 'Activity Type', 1, 0, '', 100, 12, 41, 1, 'V~M', 0, 4, 'BAS', 1, NULL),
(16, 269, 'location', 'vtiger_activity', 1, '1', 'location', 'Location', 1, 0, '', 100, 13, 41, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(16, 270, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 41, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(16, 271, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 41, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(16, 272, 'priority', 'vtiger_activity', 1, '15', 'taskpriority', 'Priority', 1, 0, '', 100, 16, 41, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(16, 273, 'notime', 'vtiger_activity', 1, '56', 'notime', 'No Time', 1, 0, '', 100, 17, 41, 1, 'C~O', 1, NULL, 'BAS', 1, NULL),
(16, 274, 'visibility', 'vtiger_activity', 1, '16', 'visibility', 'Visibility', 1, 0, '', 100, 18, 41, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(16, 275, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 41, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(16, 276, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 41, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(16, 277, 'reminder_time', 'vtiger_activity_reminder', 1, '30', 'reminder_time', 'Send Reminder', 1, 0, '', 100, 1, 40, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(16, 278, 'contactid', 'vtiger_cntactivityrel', 1, '57', 'contact_id', 'Contact Name', 1, 0, '', 100, 1, 19, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(15, 279, 'product_id', 'vtiger_faq', 1, '59', 'product_id', 'Product Name', 1, 2, '', 100, 1, 37, 1, 'I~O', 3, NULL, 'BAS', 1, NULL),
(15, 280, 'faq_no', 'vtiger_faq', 1, '4', 'faq_no', 'Faq No', 1, 0, '', 100, 2, 37, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(15, 281, 'category', 'vtiger_faq', 1, '15', 'faqcategories', 'Category', 1, 2, '', 100, 4, 37, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(15, 282, 'status', 'vtiger_faq', 1, '15', 'faqstatus', 'Status', 1, 2, '', 100, 3, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(15, 283, 'question', 'vtiger_faq', 1, '20', 'question', 'Question', 1, 2, '', 100, 7, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(15, 284, 'answer', 'vtiger_faq', 1, '20', 'faq_answer', 'Answer', 1, 2, '', 100, 8, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(15, 285, 'comments', 'vtiger_faqcomments', 1, '19', 'comments', 'Add Comment', 1, 0, '', 100, 1, 38, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(15, 286, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 37, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(15, 287, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 37, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(15, 288, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 37, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(18, 289, 'vendorname', 'vtiger_vendor', 1, '2', 'vendorname', 'Vendor Name', 1, 0, '', 100, 1, 42, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(18, 290, 'vendor_no', 'vtiger_vendor', 1, '4', 'vendor_no', 'Vendor No', 1, 0, '', 100, 2, 42, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(18, 291, 'phone', 'vtiger_vendor', 1, '1', 'phone', 'Phone', 1, 2, '', 100, 4, 42, 1, 'V~O', 2, 2, 'BAS', 1, NULL),
(18, 292, 'email', 'vtiger_vendor', 1, '13', 'email', 'Email', 1, 2, '', 100, 3, 42, 1, 'E~O', 2, 3, 'BAS', 1, NULL),
(18, 293, 'website', 'vtiger_vendor', 1, '17', 'website', 'Website', 1, 2, '', 100, 6, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(18, 294, 'glacct', 'vtiger_vendor', 1, '15', 'glacct', 'GL Account', 1, 2, '', 100, 5, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(18, 295, 'category', 'vtiger_vendor', 1, '1', 'category', 'Category', 1, 2, '', 100, 8, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(18, 296, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 7, 42, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(18, 297, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 9, 42, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(18, 298, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 42, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(18, 299, 'street', 'vtiger_vendor', 1, '21', 'street', 'Street', 1, 2, '', 100, 1, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(18, 300, 'pobox', 'vtiger_vendor', 1, '1', 'pobox', 'Po Box', 1, 2, '', 100, 2, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(18, 301, 'city', 'vtiger_vendor', 1, '1', 'city', 'City', 1, 2, '', 100, 3, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(18, 302, 'state', 'vtiger_vendor', 1, '1', 'state', 'State', 1, 2, '', 100, 4, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(18, 303, 'postalcode', 'vtiger_vendor', 1, '1', 'postalcode', 'Postal Code', 1, 2, '', 100, 5, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(18, 304, 'country', 'vtiger_vendor', 1, '1', 'country', 'Country', 1, 2, '', 100, 6, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(18, 305, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 45, 1, 'V~O', 1, NULL, 'ADV', 1, NULL),
(19, 306, 'bookname', 'vtiger_pricebook', 1, '2', 'bookname', 'Price Book Name', 1, 0, '', 100, 1, 46, 1, 'V~M', 0, 1, 'BAS', 1, NULL),
(19, 307, 'pricebook_no', 'vtiger_pricebook', 1, '4', 'pricebook_no', 'PriceBook No', 1, 0, '', 100, 3, 46, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(19, 308, 'active', 'vtiger_pricebook', 1, '56', 'active', 'Active', 1, 2, '', 100, 2, 46, 1, 'C~O', 2, 2, 'BAS', 1, NULL),
(19, 309, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 4, 46, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(19, 310, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 5, 46, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(19, 311, 'currency_id', 'vtiger_pricebook', 1, '117', 'currency_id', 'Currency', 1, 0, '', 100, 5, 46, 1, 'I~M', 0, 3, 'BAS', 0, NULL),
(19, 312, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 46, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(19, 313, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 48, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(20, 314, 'quote_no', 'vtiger_quotes', 1, '4', 'quote_no', 'Quote No', 1, 0, '', 100, 3, 49, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(20, 315, 'subject', 'vtiger_quotes', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 49, 1, 'V~M', 1, NULL, 'BAS', 1, NULL),
(20, 316, 'potentialid', 'vtiger_quotes', 1, '76', 'potential_id', 'Potential Name', 1, 2, '', 100, 2, 49, 1, 'I~O', 3, NULL, 'BAS', 1, NULL),
(20, 317, 'quotestage', 'vtiger_quotes', 1, '15', 'quotestage', 'Quote Stage', 1, 2, '', 100, 4, 49, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(20, 318, 'validtill', 'vtiger_quotes', 1, '5', 'validtill', 'Valid Till', 1, 2, '', 100, 5, 49, 1, 'D~O', 3, NULL, 'BAS', 1, NULL),
(20, 319, 'contactid', 'vtiger_quotes', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 320, 'carrier', 'vtiger_quotes', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 8, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 321, 'subtotal', 'vtiger_quotes', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 9, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(20, 322, 'shipping', 'vtiger_quotes', 1, '1', 'shipping', 'Shipping', 1, 2, '', 100, 10, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 323, 'inventorymanager', 'vtiger_quotes', 1, '77', 'assigned_user_id1', 'Inventory Manager', 1, 2, '', 100, 11, 49, 1, 'I~O', 3, NULL, 'BAS', 1, NULL),
(20, 324, 'adjustment', 'vtiger_quotes', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 20, 49, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL),
(20, 325, 'total', 'vtiger_quotes', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(20, 326, 'taxtype', 'vtiger_quotes', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 14, 49, 3, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 327, 'discount_percent', 'vtiger_quotes', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(20, 328, 'discount_amount', 'vtiger_quotes', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(20, 329, 's_h_amount', 'vtiger_quotes', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(20, 330, 'accountid', 'vtiger_quotes', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 16, 49, 1, 'I~M', 3, NULL, 'BAS', 1, NULL),
(20, 331, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 17, 49, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(20, 332, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 18, 49, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(20, 333, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 49, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(20, 334, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 49, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(20, 335, 'currency_id', 'vtiger_quotes', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 20, 49, 3, 'I~O', 3, NULL, 'BAS', 1, NULL),
(20, 336, 'conversion_rate', 'vtiger_quotes', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 21, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(20, 337, 'bill_street', 'vtiger_quotesbillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 51, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(20, 338, 'ship_street', 'vtiger_quotesshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 51, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(20, 339, 'bill_city', 'vtiger_quotesbillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 340, 'ship_city', 'vtiger_quotesshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 341, 'bill_state', 'vtiger_quotesbillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 342, 'ship_state', 'vtiger_quotesshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 343, 'bill_code', 'vtiger_quotesbillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 344, 'ship_code', 'vtiger_quotesshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 345, 'bill_country', 'vtiger_quotesbillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 346, 'ship_country', 'vtiger_quotesshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 347, 'bill_pobox', 'vtiger_quotesbillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 348, 'ship_pobox', 'vtiger_quotesshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(20, 349, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 54, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(20, 350, 'terms_conditions', 'vtiger_quotes', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 53, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(21, 351, 'purchaseorder_no', 'vtiger_purchaseorder', 1, '4', 'purchaseorder_no', 'PurchaseOrder No', 1, 0, '', 100, 2, 55, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(21, 352, 'subject', 'vtiger_purchaseorder', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(21, 353, 'vendorid', 'vtiger_purchaseorder', 1, '81', 'vendor_id', 'Vendor Name', 1, 0, '', 100, 3, 55, 1, 'I~M', 3, NULL, 'BAS', 1, NULL),
(21, 354, 'requisition_no', 'vtiger_purchaseorder', 1, '1', 'requisition_no', 'Requisition No', 1, 2, '', 100, 4, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 355, 'tracking_no', 'vtiger_purchaseorder', 1, '1', 'tracking_no', 'Tracking Number', 1, 2, '', 100, 5, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL);
INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`) VALUES
(21, 356, 'contactid', 'vtiger_purchaseorder', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 55, 1, 'I~O', 3, NULL, 'BAS', 1, NULL),
(21, 357, 'duedate', 'vtiger_purchaseorder', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 7, 55, 1, 'D~O', 3, NULL, 'BAS', 1, NULL),
(21, 358, 'carrier', 'vtiger_purchaseorder', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 8, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 359, 'adjustment', 'vtiger_purchaseorder', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 10, 55, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL),
(21, 360, 'salescommission', 'vtiger_purchaseorder', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 100, 11, 55, 1, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 361, 'exciseduty', 'vtiger_purchaseorder', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 12, 55, 1, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 362, 'total', 'vtiger_purchaseorder', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 13, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 363, 'subtotal', 'vtiger_purchaseorder', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 364, 'taxtype', 'vtiger_purchaseorder', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 14, 55, 3, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 365, 'discount_percent', 'vtiger_purchaseorder', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 366, 'discount_amount', 'vtiger_purchaseorder', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 0, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 367, 's_h_amount', 'vtiger_purchaseorder', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 368, 'postatus', 'vtiger_purchaseorder', 1, '15', 'postatus', 'Status', 1, 2, '', 100, 15, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(21, 369, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 16, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(21, 370, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 55, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(21, 371, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 55, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(21, 372, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 55, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(21, 373, 'currency_id', 'vtiger_purchaseorder', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 19, 55, 3, 'I~O', 3, NULL, 'BAS', 1, NULL),
(21, 374, 'conversion_rate', 'vtiger_purchaseorder', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 20, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(21, 375, 'bill_street', 'vtiger_pobillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 57, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(21, 376, 'ship_street', 'vtiger_poshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 57, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(21, 377, 'bill_city', 'vtiger_pobillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 378, 'ship_city', 'vtiger_poshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 379, 'bill_state', 'vtiger_pobillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 380, 'ship_state', 'vtiger_poshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 381, 'bill_code', 'vtiger_pobillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 382, 'ship_code', 'vtiger_poshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 383, 'bill_country', 'vtiger_pobillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 384, 'ship_country', 'vtiger_poshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 385, 'bill_pobox', 'vtiger_pobillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 386, 'ship_pobox', 'vtiger_poshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(21, 387, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 60, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(21, 388, 'terms_conditions', 'vtiger_purchaseorder', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 59, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(22, 389, 'salesorder_no', 'vtiger_salesorder', 1, '4', 'salesorder_no', 'SalesOrder No', 1, 0, '', 100, 4, 61, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(22, 390, 'subject', 'vtiger_salesorder', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(22, 391, 'potentialid', 'vtiger_salesorder', 1, '76', 'potential_id', 'Potential Name', 1, 2, '', 100, 2, 61, 1, 'I~O', 3, NULL, 'BAS', 1, NULL),
(22, 392, 'customerno', 'vtiger_salesorder', 1, '1', 'customerno', 'Customer No', 1, 2, '', 100, 3, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 393, 'quoteid', 'vtiger_salesorder', 1, '78', 'quote_id', 'Quote Name', 1, 2, '', 100, 5, 61, 1, 'I~O', 3, NULL, 'BAS', 0, NULL),
(22, 394, 'purchaseorder', 'vtiger_salesorder', 1, '1', 'vtiger_purchaseorder', 'Purchase Order', 1, 2, '', 100, 5, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 395, 'contactid', 'vtiger_salesorder', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 61, 1, 'I~O', 3, NULL, 'BAS', 1, NULL),
(22, 396, 'duedate', 'vtiger_salesorder', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 8, 61, 1, 'D~O', 3, NULL, 'BAS', 1, NULL),
(22, 397, 'carrier', 'vtiger_salesorder', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 9, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 398, 'pending', 'vtiger_salesorder', 1, '1', 'pending', 'Pending', 1, 2, '', 100, 10, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 399, 'sostatus', 'vtiger_salesorder', 1, '15', 'sostatus', 'Status', 1, 2, '', 100, 11, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(22, 400, 'adjustment', 'vtiger_salesorder', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 12, 61, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL),
(22, 401, 'salescommission', 'vtiger_salesorder', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 100, 13, 61, 1, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 402, 'exciseduty', 'vtiger_salesorder', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 13, 61, 1, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 403, 'total', 'vtiger_salesorder', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 14, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 404, 'subtotal', 'vtiger_salesorder', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 405, 'taxtype', 'vtiger_salesorder', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 15, 61, 3, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 406, 'discount_percent', 'vtiger_salesorder', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 407, 'discount_amount', 'vtiger_salesorder', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 0, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 408, 's_h_amount', 'vtiger_salesorder', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 409, 'accountid', 'vtiger_salesorder', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 16, 61, 1, 'I~M', 3, NULL, 'BAS', 1, NULL),
(22, 410, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 17, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(22, 411, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 18, 61, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(22, 412, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 61, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(22, 413, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 61, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(22, 414, 'currency_id', 'vtiger_salesorder', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 20, 61, 3, 'I~O', 3, NULL, 'BAS', 1, NULL),
(22, 415, 'conversion_rate', 'vtiger_salesorder', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 21, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(22, 416, 'bill_street', 'vtiger_sobillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 63, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(22, 417, 'ship_street', 'vtiger_soshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 63, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(22, 418, 'bill_city', 'vtiger_sobillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 419, 'ship_city', 'vtiger_soshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 420, 'bill_state', 'vtiger_sobillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 421, 'ship_state', 'vtiger_soshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 422, 'bill_code', 'vtiger_sobillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 423, 'ship_code', 'vtiger_soshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 424, 'bill_country', 'vtiger_sobillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 425, 'ship_country', 'vtiger_soshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 426, 'bill_pobox', 'vtiger_sobillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 427, 'ship_pobox', 'vtiger_soshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(22, 428, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 66, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(22, 429, 'terms_conditions', 'vtiger_salesorder', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 65, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(22, 430, 'enable_recurring', 'vtiger_salesorder', 1, '56', 'enable_recurring', 'Enable Recurring', 1, 0, '', 100, 1, 85, 1, 'C~O', 3, NULL, 'BAS', 0, NULL),
(22, 431, 'recurring_frequency', 'vtiger_invoice_recurring_info', 1, '16', 'recurring_frequency', 'Frequency', 1, 0, '', 100, 2, 85, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(22, 432, 'start_period', 'vtiger_invoice_recurring_info', 1, '5', 'start_period', 'Start Period', 1, 0, '', 100, 3, 85, 1, 'D~O', 3, NULL, 'BAS', 0, NULL),
(22, 433, 'end_period', 'vtiger_invoice_recurring_info', 1, '5', 'end_period', 'End Period', 1, 0, '', 100, 4, 85, 1, 'D~O~OTH~G~start_period~Start Period', 3, NULL, 'BAS', 0, NULL),
(22, 434, 'payment_duration', 'vtiger_invoice_recurring_info', 1, '16', 'payment_duration', 'Payment Duration', 1, 0, '', 100, 5, 85, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(22, 435, 'invoice_status', 'vtiger_invoice_recurring_info', 1, '15', 'invoicestatus', 'Invoice Status', 1, 0, '', 100, 6, 85, 1, 'V~M', 3, NULL, 'BAS', 0, NULL),
(23, 436, 'subject', 'vtiger_invoice', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 67, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(23, 437, 'salesorderid', 'vtiger_invoice', 1, '80', 'salesorder_id', 'Sales Order', 1, 2, '', 100, 2, 67, 1, 'I~O', 3, NULL, 'BAS', 0, NULL),
(23, 438, 'customerno', 'vtiger_invoice', 1, '1', 'customerno', 'Customer No', 1, 2, '', 100, 3, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 439, 'contactid', 'vtiger_invoice', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 4, 67, 1, 'I~O', 3, NULL, 'BAS', 1, NULL),
(23, 440, 'invoicedate', 'vtiger_invoice', 1, '5', 'invoicedate', 'Invoice Date', 1, 2, '', 100, 5, 67, 1, 'D~O', 3, NULL, 'BAS', 1, NULL),
(23, 441, 'duedate', 'vtiger_invoice', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 6, 67, 1, 'D~O', 3, NULL, 'BAS', 1, NULL),
(23, 442, 'purchaseorder', 'vtiger_invoice', 1, '1', 'vtiger_purchaseorder', 'Purchase Order', 1, 2, '', 100, 8, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 443, 'adjustment', 'vtiger_invoice', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 9, 67, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL),
(23, 444, 'salescommission', 'vtiger_invoice', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 10, 13, 67, 1, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 445, 'exciseduty', 'vtiger_invoice', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 11, 67, 1, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 446, 'subtotal', 'vtiger_invoice', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 12, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 447, 'total', 'vtiger_invoice', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 13, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 448, 'taxtype', 'vtiger_invoice', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 13, 67, 3, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 449, 'discount_percent', 'vtiger_invoice', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 13, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 450, 'discount_amount', 'vtiger_invoice', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 2, '', 100, 13, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 451, 's_h_amount', 'vtiger_invoice', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 57, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 452, 'accountid', 'vtiger_invoice', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 14, 67, 1, 'I~M', 3, NULL, 'BAS', 1, NULL),
(23, 453, 'invoicestatus', 'vtiger_invoice', 1, '15', 'invoicestatus', 'Status', 1, 2, '', 100, 15, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 454, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 16, 67, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(23, 455, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 67, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(23, 456, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 67, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL),
(23, 457, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 67, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(23, 458, 'currency_id', 'vtiger_invoice', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 19, 67, 3, 'I~O', 3, NULL, 'BAS', 1, NULL),
(23, 459, 'conversion_rate', 'vtiger_invoice', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 20, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL),
(23, 460, 'bill_street', 'vtiger_invoicebillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 69, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(23, 461, 'ship_street', 'vtiger_invoiceshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 69, 1, 'V~M', 3, NULL, 'BAS', 1, NULL),
(23, 462, 'bill_city', 'vtiger_invoicebillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 463, 'ship_city', 'vtiger_invoiceshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 464, 'bill_state', 'vtiger_invoicebillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 465, 'ship_state', 'vtiger_invoiceshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 466, 'bill_code', 'vtiger_invoicebillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 467, 'ship_code', 'vtiger_invoiceshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 468, 'bill_country', 'vtiger_invoicebillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 469, 'ship_country', 'vtiger_invoiceshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 470, 'bill_pobox', 'vtiger_invoicebillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 471, 'ship_pobox', 'vtiger_invoiceshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL),
(23, 472, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 72, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(23, 473, 'terms_conditions', 'vtiger_invoice', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 71, 1, 'V~O', 3, NULL, 'ADV', 1, NULL),
(23, 474, 'invoice_no', 'vtiger_invoice', 1, '4', 'invoice_no', 'Invoice No', 1, 0, '', 100, 3, 67, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(29, 475, 'user_name', 'vtiger_users', 1, '106', 'user_name', 'User Name', 1, 0, '', 11, 1, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL),
(29, 476, 'is_admin', 'vtiger_users', 1, '156', 'is_admin', 'Admin', 1, 0, '', 3, 2, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 477, 'user_password', 'vtiger_users', 1, '99', 'user_password', 'Password', 1, 0, '', 30, 3, 77, 4, 'P~M', 1, NULL, 'BAS', 1, NULL),
(29, 478, 'confirm_password', 'vtiger_users', 1, '99', 'confirm_password', 'Confirm Password', 1, 0, '', 30, 5, 77, 4, 'P~M', 1, NULL, 'BAS', 1, NULL),
(29, 479, 'first_name', 'vtiger_users', 1, '1', 'first_name', 'First Name', 1, 0, '', 30, 7, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 480, 'last_name', 'vtiger_users', 1, '2', 'last_name', 'Last Name', 1, 0, '', 30, 9, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL),
(29, 481, 'roleid', 'vtiger_user2role', 1, '98', 'roleid', 'Role', 1, 0, '', 200, 11, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL),
(29, 482, 'email1', 'vtiger_users', 1, '104', 'email1', 'Email', 1, 0, '', 100, 4, 77, 1, 'E~M', 1, NULL, 'BAS', 1, NULL),
(29, 483, 'status', 'vtiger_users', 1, '115', 'status', 'Status', 1, 0, '', 100, 6, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 484, 'activity_view', 'vtiger_users', 1, '16', 'activity_view', 'Default Activity View', 1, 0, '', 100, 12, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 485, 'lead_view', 'vtiger_users', 1, '16', 'lead_view', 'Default Lead View', 1, 0, '', 100, 10, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 486, 'hour_format', 'vtiger_users', 1, '116', 'hour_format', 'Calendar Hour Format', 1, 0, '', 100, 13, 77, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 487, 'end_hour', 'vtiger_users', 1, '116', 'end_hour', 'Day ends at', 1, 0, '', 100, 15, 77, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 488, 'start_hour', 'vtiger_users', 1, '116', 'start_hour', 'Day starts at', 1, 0, '', 100, 14, 77, 3, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 489, 'title', 'vtiger_users', 1, '1', 'title', 'Title', 1, 0, '', 50, 1, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 490, 'phone_work', 'vtiger_users', 1, '11', 'phone_work', 'Office Phone', 1, 0, '', 50, 5, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 491, 'department', 'vtiger_users', 1, '1', 'department', 'Department', 1, 0, '', 50, 3, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 492, 'phone_mobile', 'vtiger_users', 1, '11', 'phone_mobile', 'Mobile', 1, 0, '', 50, 7, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 493, 'reports_to_id', 'vtiger_users', 1, '101', 'reports_to_id', 'Reports To', 1, 0, '', 50, 8, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 494, 'phone_other', 'vtiger_users', 1, '11', 'phone_other', 'Other Phone', 1, 0, '', 50, 11, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 495, 'email2', 'vtiger_users', 1, '13', 'email2', 'Other Email', 1, 0, '', 100, 4, 79, 1, 'E~O', 1, NULL, 'BAS', 1, NULL),
(29, 496, 'phone_fax', 'vtiger_users', 1, '11', 'phone_fax', 'Fax', 1, 0, '', 50, 2, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 497, 'secondaryemail', 'vtiger_users', 1, '13', 'secondaryemail', 'Secondary Email', 1, 0, '', 100, 6, 79, 1, 'E~O', 1, NULL, 'BAS', 1, NULL),
(29, 498, 'phone_home', 'vtiger_users', 1, '11', 'phone_home', 'Home Phone', 1, 0, '', 50, 9, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 499, 'date_format', 'vtiger_users', 1, '16', 'date_format', 'Date Format', 1, 0, '', 30, 12, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 500, 'signature', 'vtiger_users', 1, '21', 'signature', 'Signature', 1, 0, '', 250, 13, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 501, 'description', 'vtiger_users', 1, '21', 'description', 'Documents', 1, 0, '', 250, 14, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 502, 'address_street', 'vtiger_users', 1, '21', 'address_street', 'Street Address', 1, 0, '', 250, 1, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 503, 'address_city', 'vtiger_users', 1, '1', 'address_city', 'City', 1, 0, '', 100, 3, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 504, 'address_state', 'vtiger_users', 1, '1', 'address_state', 'State', 1, 0, '', 100, 5, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 505, 'address_postalcode', 'vtiger_users', 1, '1', 'address_postalcode', 'Postal Code', 1, 0, '', 100, 4, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 506, 'address_country', 'vtiger_users', 1, '1', 'address_country', 'Country', 1, 0, '', 100, 2, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 507, 'accesskey', 'vtiger_users', 1, '3', 'accesskey', 'Webservice Access Key', 1, 0, '', 100, 2, 83, 2, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 508, 'time_zone', 'vtiger_users', 1, '16', 'time_zone', 'Time Zone', 1, 0, '', 200, 15, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 509, 'currency_id', 'vtiger_users', 1, '117', 'currency_id', 'Currency', 1, 0, '', 100, 1, 78, 1, 'I~O', 1, NULL, 'BAS', 1, NULL),
(29, 510, 'currency_grouping_pattern', 'vtiger_users', 1, '16', 'currency_grouping_pattern', 'Digit Grouping Pattern', 1, 0, '', 100, 2, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Digit Grouping Pattern</b> <br/><br/>This pattern specifies the format in which the currency separator will be placed.'),
(29, 511, 'currency_decimal_separator', 'vtiger_users', 1, '16', 'currency_decimal_separator', 'Decimal Separator', 1, 0, '', 2, 3, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Decimal Separator</b> <br/><br/>Decimal separator specifies the separator to be used to separate the fractional values from the whole number part. <br/><b>Eg:</b> <br/>. => 123.45 <br/>, => 123,45 <br/>'' => 123''45 <br/>  => 123 45 <br/>$ => 123$45 <br/>'),
(29, 512, 'currency_grouping_separator', 'vtiger_users', 1, '16', 'currency_grouping_separator', 'Digit Grouping Separator', 1, 0, '', 2, 4, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Grouping Separator</b> <br/><br/>Grouping separator specifies the separator to be used to group the whole number part into hundreds, thousands etc. <br/><b>Eg:</b> <br/>. => 123.456.789 <br/>, => 123,456,789 <br/>'' => 123''456''789 <br/>  => 123 456 789 <br/>$ => 123$456$789 <br/>'),
(29, 513, 'currency_symbol_placement', 'vtiger_users', 1, '16', 'currency_symbol_placement', 'Symbol Placement', 1, 0, '', 20, 5, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Symbol Placement</b> <br/><br/>Symbol Placement allows you to configure the position of the currency symbol with respect to the currency value.<br/><b>Eg:</b> <br/>$1.0 => $123,456,789.50 <br/>1.0$ => 123,456,789.50$ <br/>'),
(29, 514, 'imagename', 'vtiger_users', 1, '105', 'imagename', 'User Image', 1, 0, '', 250, 10, 82, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 515, 'internal_mailer', 'vtiger_users', 1, '56', 'internal_mailer', 'INTERNAL_MAIL_COMPOSER', 1, 0, '', 50, 15, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 516, 'theme', 'vtiger_users', 1, '31', 'theme', 'Theme', 1, 0, '', 100, 16, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 517, 'language', 'vtiger_users', 1, '32', 'language', 'Language', 1, 0, '', 100, 17, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 518, 'reminder_interval', 'vtiger_users', 1, '16', 'reminder_interval', 'Reminder Interval', 1, 0, '', 100, 1, 83, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(10, 519, 'from_email', 'vtiger_emaildetails', 1, '12', 'from_email', 'From', 1, 2, '', 100, 1, 21, 3, 'V~M', 3, NULL, 'BAS', 0, NULL),
(10, 520, 'to_email', 'vtiger_emaildetails', 1, '8', 'saved_toid', 'To', 1, 2, '', 100, 2, 21, 1, 'V~M', 3, NULL, 'BAS', 0, NULL),
(10, 521, 'cc_email', 'vtiger_emaildetails', 1, '8', 'ccmail', 'CC', 1, 2, '', 1000, 3, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(10, 522, 'bcc_email', 'vtiger_emaildetails', 1, '8', 'bccmail', 'BCC', 1, 2, '', 1000, 4, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(10, 523, 'idlists', 'vtiger_emaildetails', 1, '357', 'parent_id', 'Parent ID', 1, 2, '', 1000, 5, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL),
(10, 524, 'email_flag', 'vtiger_emaildetails', 1, '16', 'email_flag', 'Email Flag', 1, 2, '', 1000, 6, 21, 3, 'V~O', 3, NULL, 'BAS', 0, NULL),
(32, 525, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 88, 1, 'V~M', 2, 2, 'BAS', 1, ''),
(32, 526, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 88, 2, 'V~O', 3, 0, 'BAS', 0, ''),
(32, 527, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 88, 2, 'V~O', 3, 0, 'BAS', 0, ''),
(32, 528, 'start_date', 'vtiger_servicecontracts', 1, '5', 'start_date', 'Start Date', 1, 2, '', 100, 7, 88, 1, 'D~O', 2, 4, 'BAS', 1, ''),
(32, 529, 'end_date', 'vtiger_servicecontracts', 1, '5', 'end_date', 'End Date', 1, 2, '', 100, 11, 88, 2, 'D~O', 3, 0, 'BAS', 0, ''),
(32, 530, 'sc_related_to', 'vtiger_servicecontracts', 1, '10', 'sc_related_to', 'Related to', 1, 2, '', 100, 3, 88, 1, 'V~O', 2, 6, 'BAS', 1, ''),
(32, 531, 'tracking_unit', 'vtiger_servicecontracts', 1, '15', 'tracking_unit', 'Tracking Unit', 1, 2, '', 100, 6, 88, 1, 'V~O', 2, 7, 'BAS', 1, ''),
(32, 532, 'total_units', 'vtiger_servicecontracts', 1, '7', 'total_units', 'Total Units', 1, 2, '', 100, 8, 88, 1, 'V~O', 2, 8, 'BAS', 1, ''),
(32, 533, 'used_units', 'vtiger_servicecontracts', 1, '7', 'used_units', 'Used Units', 1, 2, '', 100, 10, 88, 1, 'V~O', 2, 9, 'BAS', 1, ''),
(32, 534, 'subject', 'vtiger_servicecontracts', 1, '1', 'subject', 'Subject', 1, 0, '', 100, 1, 88, 1, 'V~M', 0, 1, 'BAS', 1, ''),
(32, 535, 'due_date', 'vtiger_servicecontracts', 1, '23', 'due_date', 'Due date', 1, 2, '', 100, 9, 88, 1, 'D~O', 2, 5, 'BAS', 1, ''),
(32, 536, 'planned_duration', 'vtiger_servicecontracts', 1, '1', 'planned_duration', 'Planned Duration', 1, 2, '', 100, 13, 88, 2, 'V~O', 3, 0, 'BAS', 0, ''),
(32, 537, 'actual_duration', 'vtiger_servicecontracts', 1, '1', 'actual_duration', 'Actual Duration', 1, 2, '', 100, 15, 88, 2, 'V~O', 3, 0, 'BAS', 0, ''),
(32, 538, 'contract_status', 'vtiger_servicecontracts', 1, '15', 'contract_status', 'Status', 1, 2, '', 100, 12, 88, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(32, 539, 'priority', 'vtiger_servicecontracts', 1, '15', 'contract_priority', 'Priority', 1, 2, '', 100, 14, 88, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(32, 540, 'contract_type', 'vtiger_servicecontracts', 1, '15', 'contract_type', 'Type', 1, 2, '', 100, 5, 88, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(32, 541, 'progress', 'vtiger_servicecontracts', 1, '9', 'progress', 'Progress', 1, 2, '', 100, 16, 88, 2, 'N~O~2~2', 3, 3, 'BAS', 0, ''),
(32, 542, 'contract_no', 'vtiger_servicecontracts', 1, '4', 'contract_no', 'Contract No', 1, 0, '', 100, 2, 88, 1, 'V~O', 3, 0, 'BAS', 0, ''),
(32, 543, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 17, 88, 3, 'V~O', 3, 0, 'BAS', 0, ''),
(38, 544, 'servicename', 'vtiger_service', 1, '2', 'servicename', 'Service Name', 1, 0, '', 100, 1, 90, 1, 'V~M', 0, 1, 'BAS', 1, ''),
(38, 545, 'service_no', 'vtiger_service', 1, '4', 'service_no', 'Service No', 1, 0, '', 100, 2, 90, 1, 'V~O', 3, 0, 'BAS', 0, ''),
(38, 546, 'discontinued', 'vtiger_service', 1, '56', 'discontinued', 'Service Active', 1, 2, '', 100, 4, 90, 1, 'V~O', 2, 3, 'BAS', 1, ''),
(38, 547, 'sales_start_date', 'vtiger_service', 1, '5', 'sales_start_date', 'Sales Start Date', 1, 2, '', 100, 9, 90, 1, 'D~O', 1, NULL, 'BAS', 1, ''),
(38, 548, 'sales_end_date', 'vtiger_service', 1, '5', 'sales_end_date', 'Sales End Date', 1, 2, '', 100, 10, 90, 1, 'D~O~OTH~GE~sales_start_date~Sales Start Date', 1, NULL, 'BAS', 1, ''),
(38, 549, 'start_date', 'vtiger_service', 1, '5', 'start_date', 'Support Start Date', 1, 2, '', 100, 11, 90, 1, 'D~O', 1, NULL, 'BAS', 1, ''),
(38, 550, 'expiry_date', 'vtiger_service', 1, '5', 'expiry_date', 'Support Expiry Date', 1, 2, '', 100, 12, 90, 1, 'D~O~OTH~GE~start_date~Start Date', 1, NULL, 'BAS', 1, ''),
(38, 551, 'website', 'vtiger_service', 1, '17', 'website', 'Website', 1, 2, '', 100, 6, 90, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(38, 552, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 13, 90, 2, 'T~O', 3, 0, 'BAS', 0, ''),
(38, 553, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 14, 90, 2, 'T~O', 3, 0, 'BAS', 0, ''),
(38, 554, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 90, 3, 'V~O', 3, 0, 'BAS', 0, ''),
(38, 555, 'service_usageunit', 'vtiger_service', 1, '15', 'service_usageunit', 'Usage Unit', 1, 2, '', 100, 3, 90, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(38, 556, 'qty_per_unit', 'vtiger_service', 1, '1', 'qty_per_unit', 'No of Units', 1, 2, '', 100, 5, 90, 1, 'N~O', 1, NULL, 'BAS', 1, ''),
(38, 557, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Owner', 1, 0, '', 100, 8, 90, 1, 'I~O', 1, NULL, 'BAS', 1, ''),
(38, 558, 'servicecategory', 'vtiger_service', 1, '15', 'servicecategory', 'Service Category', 1, 2, '', 100, 7, 90, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(38, 559, 'unit_price', 'vtiger_service', 1, '72', 'unit_price', 'Price', 1, 2, '', 100, 1, 91, 1, 'N~O', 2, 2, 'BAS', 0, ''),
(38, 560, 'taxclass', 'vtiger_service', 1, '83', 'taxclass', 'Tax Class', 1, 2, '', 100, 4, 91, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(38, 561, 'commissionrate', 'vtiger_service', 1, '9', 'commissionrate', 'Commission Rate', 1, 2, '', 100, 2, 91, 1, 'N~O', 1, NULL, 'BAS', 1, ''),
(38, 562, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 93, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(40, 563, 'callfrom', 'vtiger_pbxmanager', 1, '2', 'callfrom', 'Call From', 1, 0, '', 100, 1, 94, 1, 'V~M', 1, NULL, 'BAS', 1, ''),
(40, 564, 'callto', 'vtiger_pbxmanager', 1, '2', 'callto', 'Call To', 1, 0, '', 100, 2, 94, 1, 'V~M', 1, NULL, 'BAS', 1, ''),
(40, 565, 'timeofcall', 'vtiger_pbxmanager', 1, '2', 'timeofcall', 'Time Of Call', 1, 0, '', 100, 3, 94, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(40, 566, 'status', 'vtiger_pbxmanager', 1, '2', 'status', 'Status', 1, 0, '', 100, 4, 94, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(29, 567, 'asterisk_extension', 'vtiger_asteriskextensions', 1, '1', 'asterisk_extension', 'Asterisk Extension', 1, 0, '0', 30, 1, 96, 1, 'V~O', 1, NULL, 'BAS', 1, NULL),
(29, 568, 'use_asterisk', 'vtiger_asteriskextensions', 1, '56', 'use_asterisk', ' Receive Incoming Calls', 1, 0, '0', 30, 2, 96, 1, 'C~O', 1, NULL, 'BAS', 1, NULL),
(42, 569, 'commentcontent', 'vtiger_modcomments', 1, '19', 'commentcontent', 'Comment', 1, 0, '', 100, 4, 97, 1, 'V~M', 0, 4, 'BAS', 2, ''),
(42, 570, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 1, 98, 1, 'V~M', 0, 1, 'BAS', 2, ''),
(42, 571, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 98, 2, 'T~O', 0, 2, 'BAS', 0, ''),
(42, 572, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 98, 2, 'T~O', 0, 3, 'BAS', 0, ''),
(42, 573, 'related_to', 'vtiger_modcomments', 1, '10', 'related_to', 'Related To', 1, 2, '', 100, 2, 98, 1, 'V~M', 2, 5, 'BAS', 2, ''),
(42, 574, 'smcreatorid', 'vtiger_crmentity', 1, '52', 'creator', 'Creator', 1, 2, '', 100, 4, 98, 2, 'V~O', 1, NULL, 'BAS', 1, ''),
(42, 575, 'parent_comments', 'vtiger_modcomments', 1, '10', 'parent_comments', 'Related To Comments', 1, 2, '', 100, 7, 98, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(44, 576, 'asset_no', 'vtiger_assets', 1, '4', 'asset_no', 'Asset No', 1, 0, '', 100, 2, 100, 1, 'V~O', 3, 0, 'BAS', 0, ''),
(44, 577, 'product', 'vtiger_assets', 1, '10', 'product', 'Product Name', 1, 2, '', 100, 3, 100, 1, 'V~M', 0, 3, 'BAS', 1, ''),
(44, 578, 'serialnumber', 'vtiger_assets', 1, '2', 'serialnumber', 'Serial Number', 1, 2, '', 100, 4, 100, 1, 'V~M', 0, 5, 'BAS', 1, ''),
(44, 579, 'datesold', 'vtiger_assets', 1, '5', 'datesold', 'Date Sold', 1, 2, '', 100, 5, 100, 1, 'D~M~OTH~GE~datesold~Date Sold', 0, 0, 'BAS', 1, ''),
(44, 580, 'dateinservice', 'vtiger_assets', 1, '5', 'dateinservice', 'Date in Service', 1, 2, '', 100, 6, 100, 1, 'D~M~OTH~GE~dateinservice~Date in Service', 0, 4, 'BAS', 1, ''),
(44, 581, 'assetstatus', 'vtiger_assets', 1, '15', 'assetstatus', 'Status', 1, 2, '', 100, 7, 100, 1, 'V~M', 0, 0, 'BAS', 1, ''),
(44, 582, 'tagnumber', 'vtiger_assets', 1, '2', 'tagnumber', 'Tag Number', 1, 2, '', 100, 8, 100, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(44, 583, 'invoiceid', 'vtiger_assets', 1, '10', 'invoiceid', 'Invoice Name', 1, 2, '', 100, 9, 100, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(44, 584, 'shippingmethod', 'vtiger_assets', 1, '2', 'shippingmethod', 'Shipping Method', 1, 2, '', 100, 10, 100, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(44, 585, 'shippingtrackingnumber', 'vtiger_assets', 1, '2', 'shippingtrackingnumber', 'Shipping Tracking Number', 1, 2, '', 100, 11, 100, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(44, 586, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 100, 1, 'V~M', 0, 2, 'BAS', 1, ''),
(44, 587, 'assetname', 'vtiger_assets', 1, '1', 'assetname', 'Asset Name', 1, 0, '', 100, 12, 100, 1, 'V~M', 0, 6, 'BAS', 1, ''),
(44, 588, 'account', 'vtiger_assets', 1, '10', 'account', 'Customer Name', 1, 2, '', 100, 13, 100, 1, 'V~M', 0, 0, 'BAS', 1, ''),
(44, 589, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 100, 2, 'T~O', 3, 0, 'BAS', 0, ''),
(44, 590, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 100, 2, 'T~O', 3, 0, 'BAS', 0, ''),
(44, 591, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 100, 3, 'V~O', 3, 0, 'BAS', 0, ''),
(44, 592, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Notes', 1, 2, '', 100, 1, 102, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(47, 593, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 103, 1, 'V~M', 1, NULL, 'BAS', 1, ''),
(47, 594, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 103, 2, 'T~O', 1, NULL, 'BAS', 0, ''),
(47, 595, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 103, 2, 'T~O', 1, NULL, 'BAS', 0, ''),
(47, 596, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 103, 3, 'V~O', 3, 0, 'BAS', 0, ''),
(47, 597, 'message', 'vtiger_smsnotifier', 1, '21', 'message', 'message', 1, 0, '', 100, 1, 103, 1, 'V~M', 1, NULL, 'BAS', 1, ''),
(50, 598, 'projectmilestonename', 'vtiger_projectmilestone', 1, '2', 'projectmilestonename', 'Project Milestone Name', 1, 2, '', 100, 1, 106, 1, 'V~M', 0, 1, 'BAS', 1, ''),
(50, 599, 'projectmilestonedate', 'vtiger_projectmilestone', 1, '5', 'projectmilestonedate', 'Milestone Date', 1, 2, '', 100, 5, 106, 1, 'D~O', 0, 3, 'BAS', 1, ''),
(50, 600, 'projectid', 'vtiger_projectmilestone', 1, '10', 'projectid', 'Related to', 1, 0, '', 100, 4, 106, 1, 'V~M', 0, 4, 'BAS', 1, ''),
(50, 601, 'projectmilestonetype', 'vtiger_projectmilestone', 1, '15', 'projectmilestonetype', 'Type', 1, 2, '', 100, 7, 106, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(50, 602, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 6, 106, 1, 'V~M', 0, 2, 'BAS', 1, ''),
(50, 603, 'projectmilestone_no', 'vtiger_projectmilestone', 2, '4', 'projectmilestone_no', 'Project Milestone No', 1, 0, '', 100, 2, 106, 1, 'V~O', 3, 4, 'BAS', 0, ''),
(50, 604, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 1, 107, 2, 'T~O', 1, NULL, 'BAS', 1, ''),
(50, 605, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 2, 107, 2, 'T~O', 1, NULL, 'BAS', 1, ''),
(50, 606, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 3, 107, 3, 'V~O', 3, 0, 'BAS', 0, ''),
(50, 607, 'description', 'vtiger_crmentity', 1, '19', 'description', 'description', 1, 2, '', 100, 1, 108, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(51, 608, 'projecttaskname', 'vtiger_projecttask', 1, '2', 'projecttaskname', 'Project Task Name', 1, 2, '', 100, 1, 109, 1, 'V~M', 0, 1, 'BAS', 1, ''),
(51, 609, 'projecttasktype', 'vtiger_projecttask', 1, '15', 'projecttasktype', 'Type', 1, 2, '', 100, 4, 109, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(51, 610, 'projecttaskpriority', 'vtiger_projecttask', 1, '15', 'projecttaskpriority', 'Priority', 1, 2, '', 100, 3, 109, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(51, 611, 'projectid', 'vtiger_projecttask', 1, '10', 'projectid', 'Related to', 1, 0, '', 100, 6, 109, 1, 'V~M', 0, 5, 'BAS', 1, ''),
(51, 612, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 7, 109, 1, 'V~M', 0, 2, 'BAS', 1, ''),
(51, 613, 'projecttasknumber', 'vtiger_projecttask', 1, '7', 'projecttasknumber', 'Project Task Number', 1, 2, '', 100, 5, 109, 1, 'I~O', 1, NULL, 'BAS', 1, ''),
(51, 614, 'projecttask_no', 'vtiger_projecttask', 2, '4', 'projecttask_no', 'Project Task No', 1, 0, '', 100, 2, 109, 1, 'V~O', 3, 4, 'BAS', 0, ''),
(51, 615, 'projecttaskprogress', 'vtiger_projecttask', 1, '15', 'projecttaskprogress', 'Progress', 1, 2, '', 100, 1, 110, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(51, 616, 'projecttaskhours', 'vtiger_projecttask', 1, '7', 'projecttaskhours', 'Worked Hours', 1, 2, '', 100, 2, 110, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(51, 617, 'startdate', 'vtiger_projecttask', 1, '5', 'startdate', 'Start Date', 1, 2, '', 100, 3, 110, 1, 'D~O', 0, 3, 'BAS', 1, ''),
(51, 618, 'enddate', 'vtiger_projecttask', 1, '5', 'enddate', 'End Date', 1, 2, '', 100, 4, 110, 1, 'D~O~OTH~GE~startdate~Start Date', 1, NULL, 'BAS', 1, ''),
(51, 619, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 5, 110, 2, 'T~O', 1, NULL, 'BAS', 1, ''),
(51, 620, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 6, 110, 2, 'T~O', 1, NULL, 'BAS', 1, ''),
(51, 621, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 110, 3, 'V~O', 3, 0, 'BAS', 0, ''),
(51, 622, 'description', 'vtiger_crmentity', 1, '19', 'description', 'description', 1, 2, '', 100, 1, 111, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 623, 'projectname', 'vtiger_project', 1, '2', 'projectname', 'Project Name', 1, 2, '', 100, 1, 112, 1, 'V~M', 0, 1, 'BAS', 1, ''),
(52, 624, 'startdate', 'vtiger_project', 1, '23', 'startdate', 'Start Date', 1, 2, '', 100, 3, 112, 1, 'D~O', 0, 3, 'BAS', 1, ''),
(52, 625, 'targetenddate', 'vtiger_project', 1, '23', 'targetenddate', 'Target End Date', 1, 2, '', 100, 5, 112, 1, 'D~O~OTH~GE~startdate~Start Date', 0, 4, 'BAS', 1, ''),
(52, 626, 'actualenddate', 'vtiger_project', 1, '23', 'actualenddate', 'Actual End Date', 1, 2, '', 100, 6, 112, 1, 'D~O~OTH~GE~startdate~Start Date', 1, NULL, 'BAS', 1, ''),
(52, 627, 'projectstatus', 'vtiger_project', 1, '15', 'projectstatus', 'Status', 1, 2, '', 100, 7, 112, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 628, 'projecttype', 'vtiger_project', 1, '15', 'projecttype', 'Type', 1, 2, '', 100, 8, 112, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 629, 'linktoaccountscontacts', 'vtiger_project', 1, '10', 'linktoaccountscontacts', 'Related to', 1, 2, '', 100, 9, 112, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 630, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 112, 1, 'V~M', 0, 2, 'BAS', 1, ''),
(52, 631, 'project_no', 'vtiger_project', 2, '4', 'project_no', 'Project No', 1, 0, '', 100, 2, 112, 1, 'V~O', 3, 0, 'BAS', 0, ''),
(52, 632, 'targetbudget', 'vtiger_project', 1, '7', 'targetbudget', 'Target Budget', 1, 2, '', 100, 1, 113, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 633, 'projecturl', 'vtiger_project', 1, '17', 'projecturl', 'Project Url', 1, 2, '', 100, 2, 113, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 634, 'projectpriority', 'vtiger_project', 1, '15', 'projectpriority', 'Priority', 1, 2, '', 100, 3, 113, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 635, 'progress', 'vtiger_project', 1, '15', 'progress', 'Progress', 1, 2, '', 100, 4, 113, 1, 'V~O', 1, NULL, 'BAS', 1, ''),
(52, 636, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 5, 113, 2, 'T~O', 1, NULL, 'BAS', 1, ''),
(52, 637, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 6, 113, 2, 'T~O', 1, NULL, 'BAS', 1, ''),
(52, 638, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 113, 3, 'V~O', 3, 0, 'BAS', 0, ''),
(52, 639, 'description', 'vtiger_crmentity', 1, '19', 'description', 'description', 1, 2, '', 100, 1, 114, 1, 'V~O', 1, NULL, 'BAS', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_fieldformulas`
--

CREATE TABLE IF NOT EXISTS `vtiger_fieldformulas` (
  `expressionid` int(11) NOT NULL DEFAULT '0',
  `modulename` varchar(100) DEFAULT NULL,
  `expression_engine` text,
  PRIMARY KEY (`expressionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_fieldmodulerel`
--

CREATE TABLE IF NOT EXISTS `vtiger_fieldmodulerel` (
  `fieldid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relmodule` varchar(100) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_fieldmodulerel`
--

INSERT INTO `vtiger_fieldmodulerel` (`fieldid`, `module`, `relmodule`, `status`, `sequence`) VALUES
(113, 'Potentials', 'Accounts', NULL, 0),
(113, 'Potentials', 'Contacts', NULL, 1),
(530, 'ServiceContracts', 'Contacts', NULL, NULL),
(530, 'ServiceContracts', 'Accounts', NULL, NULL),
(573, 'ModComments', 'Leads', NULL, NULL),
(573, 'ModComments', 'Contacts', NULL, NULL),
(573, 'ModComments', 'Accounts', NULL, NULL),
(575, 'ModComments', 'ModComments', NULL, NULL),
(573, 'ModComments', 'Potentials', NULL, NULL),
(577, 'Assets', 'Products', NULL, NULL),
(583, 'Assets', 'Invoice', NULL, NULL),
(588, 'Assets', 'Accounts', NULL, NULL),
(600, 'ProjectMilestone', 'Project', NULL, NULL),
(611, 'ProjectTask', 'Project', NULL, NULL),
(573, 'ModComments', 'ProjectTask', NULL, NULL),
(629, 'Project', 'Accounts', NULL, NULL),
(629, 'Project', 'Contacts', NULL, NULL),
(573, 'ModComments', 'Project', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_field_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_field_seq`
--

INSERT INTO `vtiger_field_seq` (`id`) VALUES
(639);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_files`
--

CREATE TABLE IF NOT EXISTS `vtiger_files` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `content` longblob,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assigned_user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_assigned_user_id_name_deleted_idx` (`assigned_user_id`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_freetagged_objects`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetagged_objects` (
  `tag_id` int(20) NOT NULL DEFAULT '0',
  `tagger_id` int(20) NOT NULL DEFAULT '0',
  `object_id` int(20) NOT NULL DEFAULT '0',
  `tagged_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `module` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`,`tagger_id`,`object_id`),
  KEY `freetagged_objects_tag_id_tagger_id_object_id_idx` (`tag_id`,`tagger_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_freetags`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetags` (
  `id` int(19) NOT NULL,
  `tag` varchar(50) NOT NULL DEFAULT '',
  `raw_tag` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_freetags_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetags_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_freetags_seq`
--

INSERT INTO `vtiger_freetags_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_glacct`
--

CREATE TABLE IF NOT EXISTS `vtiger_glacct` (
  `glacctid` int(19) NOT NULL AUTO_INCREMENT,
  `glacct` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`glacctid`),
  UNIQUE KEY `glacct_glacct_idx` (`glacct`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vtiger_glacct`
--

INSERT INTO `vtiger_glacct` (`glacctid`, `glacct`, `presence`, `picklist_valueid`) VALUES
(1, '300-Sales-Software', 1, 51),
(2, '301-Sales-Hardware', 1, 52),
(3, '302-Rental-Income', 1, 53),
(4, '303-Interest-Income', 1, 54),
(5, '304-Sales-Software-Support', 1, 55),
(6, '305-Sales Other', 1, 56),
(7, '306-Internet Sales', 1, 57),
(8, '307-Service-Hardware Labor', 1, 58),
(9, '308-Sales-Books', 1, 59);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_glacct_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_glacct_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_glacct_seq`
--

INSERT INTO `vtiger_glacct_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_group2grouprel`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2grouprel` (
  `groupid` int(19) NOT NULL,
  `containsgroupid` int(19) NOT NULL,
  PRIMARY KEY (`groupid`,`containsgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_group2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2role` (
  `groupid` int(19) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  PRIMARY KEY (`groupid`,`roleid`),
  KEY `fk_2_vtiger_group2role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_group2role`
--

INSERT INTO `vtiger_group2role` (`groupid`, `roleid`) VALUES
(3, 'H2'),
(4, 'H3'),
(2, 'H4');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_group2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2rs` (
  `groupid` int(19) NOT NULL,
  `roleandsubid` varchar(255) NOT NULL,
  PRIMARY KEY (`groupid`,`roleandsubid`),
  KEY `fk_2_vtiger_group2rs` (`roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_group2rs`
--

INSERT INTO `vtiger_group2rs` (`groupid`, `roleandsubid`) VALUES
(3, 'H3'),
(4, 'H3'),
(2, 'H5');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_groups`
--

CREATE TABLE IF NOT EXISTS `vtiger_groups` (
  `groupid` int(19) NOT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`groupid`),
  UNIQUE KEY `groups_groupname_idx` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_groups`
--

INSERT INTO `vtiger_groups` (`groupid`, `groupname`, `description`) VALUES
(2, 'Team Selling', 'Group Related to Sales'),
(3, 'Marketing Group', 'Group Related to Marketing Activities'),
(4, 'Support Group', 'Group Related to providing Support to Customers');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_headers`
--

CREATE TABLE IF NOT EXISTS `vtiger_headers` (
  `fileid` int(3) NOT NULL AUTO_INCREMENT,
  `headernames` varchar(30) NOT NULL,
  PRIMARY KEY (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homedashbd`
--

CREATE TABLE IF NOT EXISTS `vtiger_homedashbd` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `dashbdname` varchar(100) DEFAULT NULL,
  `dashbdtype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homedefault`
--

CREATE TABLE IF NOT EXISTS `vtiger_homedefault` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `hometype` varchar(30) NOT NULL,
  `maxentries` int(19) DEFAULT NULL,
  `setype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_homedefault`
--

INSERT INTO `vtiger_homedefault` (`stuffid`, `hometype`, `maxentries`, `setype`) VALUES
(1, 'ALVT', 5, 'Accounts'),
(2, 'HDB', 5, 'Dashboard'),
(3, 'PLVT', 5, 'Potentials'),
(4, 'QLTQ', 5, 'Quotes'),
(5, 'CVLVT', 5, 'NULL'),
(6, 'HLT', 5, 'HelpDesk'),
(7, 'UA', 5, 'Calendar'),
(8, 'GRT', 5, 'NULL'),
(9, 'OLTSO', 5, 'SalesOrder'),
(10, 'ILTI', 5, 'Invoice'),
(11, 'MNL', 5, 'Leads'),
(12, 'OLTPO', 5, 'PurchaseOrder'),
(13, 'PA', 5, 'Calendar'),
(14, 'LTFAQ', 5, 'Faq');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homemodule`
--

CREATE TABLE IF NOT EXISTS `vtiger_homemodule` (
  `stuffid` int(19) NOT NULL,
  `modulename` varchar(100) DEFAULT NULL,
  `maxentries` int(19) NOT NULL,
  `customviewid` int(19) NOT NULL,
  `setype` varchar(30) NOT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homemoduleflds`
--

CREATE TABLE IF NOT EXISTS `vtiger_homemoduleflds` (
  `stuffid` int(19) DEFAULT NULL,
  `fieldname` varchar(100) DEFAULT NULL,
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homereportchart`
--

CREATE TABLE IF NOT EXISTS `vtiger_homereportchart` (
  `stuffid` int(11) NOT NULL,
  `reportid` int(19) DEFAULT NULL,
  `reportcharttype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homerss`
--

CREATE TABLE IF NOT EXISTS `vtiger_homerss` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `url` varchar(100) DEFAULT NULL,
  `maxentries` int(19) NOT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homestuff`
--

CREATE TABLE IF NOT EXISTS `vtiger_homestuff` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `stuffsequence` int(19) NOT NULL DEFAULT '0',
  `stufftype` varchar(100) DEFAULT NULL,
  `userid` int(19) NOT NULL,
  `visible` int(10) NOT NULL DEFAULT '0',
  `stufftitle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`),
  KEY `fk_1_vtiger_homestuff` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_homestuff`
--

INSERT INTO `vtiger_homestuff` (`stuffid`, `stuffsequence`, `stufftype`, `userid`, `visible`, `stufftitle`) VALUES
(1, 1, 'Default', 1, 1, 'Top Accounts'),
(2, 2, 'Default', 1, 0, 'Home Page Dashboard'),
(3, 3, 'Default', 1, 1, 'Top Potentials'),
(4, 4, 'Default', 1, 1, 'Top Quotes'),
(5, 5, 'Default', 1, 1, 'Key Metrics'),
(6, 6, 'Default', 1, 1, 'Top Trouble Tickets'),
(7, 7, 'Default', 1, 1, 'Upcoming Activities'),
(8, 8, 'Default', 1, 1, 'My Group Allocation'),
(9, 9, 'Default', 1, 1, 'Top Sales Orders'),
(10, 10, 'Default', 1, 1, 'Top Invoices'),
(11, 11, 'Default', 1, 0, 'My New Leads'),
(12, 12, 'Default', 1, 1, 'Top Purchase Orders'),
(13, 13, 'Default', 1, 1, 'Pending Activities'),
(14, 14, 'Default', 1, 0, 'My Recent FAQs'),
(15, 15, 'Tag Cloud', 1, 1, 'Tag Cloud');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homestuff_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_homestuff_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_homestuff_seq`
--

INSERT INTO `vtiger_homestuff_seq` (`id`) VALUES
(15);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_home_layout`
--

CREATE TABLE IF NOT EXISTS `vtiger_home_layout` (
  `userid` int(19) NOT NULL,
  `layout` int(19) NOT NULL DEFAULT '4',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_import_locks`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_locks` (
  `vtiger_import_lock_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `importid` int(11) NOT NULL,
  `locked_since` datetime DEFAULT NULL,
  PRIMARY KEY (`vtiger_import_lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_import_maps`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_maps` (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `module` varchar(36) NOT NULL,
  `content` longblob,
  `has_header` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `is_published` varchar(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `import_maps_assigned_user_id_module_name_deleted_idx` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_import_queue`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_queue` (
  `importid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `field_mapping` text,
  `default_values` text,
  `merge_type` int(11) DEFAULT NULL,
  `merge_fields` text,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`importid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_industry`
--

CREATE TABLE IF NOT EXISTS `vtiger_industry` (
  `industryid` int(19) NOT NULL AUTO_INCREMENT,
  `industry` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`industryid`),
  UNIQUE KEY `industry_industry_idx` (`industry`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `vtiger_industry`
--

INSERT INTO `vtiger_industry` (`industryid`, `industry`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 60),
(2, 'Apparel', 1, 61),
(3, 'Banking', 1, 62),
(4, 'Biotechnology', 1, 63),
(5, 'Chemicals', 1, 64),
(6, 'Communications', 1, 65),
(7, 'Construction', 1, 66),
(8, 'Consulting', 1, 67),
(9, 'Education', 1, 68),
(10, 'Electronics', 1, 69),
(11, 'Energy', 1, 70),
(12, 'Engineering', 1, 71),
(13, 'Entertainment', 1, 72),
(14, 'Environmental', 1, 73),
(15, 'Finance', 1, 74),
(16, 'Food & Beverage', 1, 75),
(17, 'Government', 1, 76),
(18, 'Healthcare', 1, 77),
(19, 'Hospitality', 1, 78),
(20, 'Insurance', 1, 79),
(21, 'Machinery', 1, 80),
(22, 'Manufacturing', 1, 81),
(23, 'Media', 1, 82),
(24, 'Not For Profit', 1, 83),
(25, 'Recreation', 1, 84),
(26, 'Retail', 1, 85),
(27, 'Shipping', 1, 86),
(28, 'Technology', 1, 87),
(29, 'Telecommunications', 1, 88),
(30, 'Transportation', 1, 89),
(31, 'Utilities', 1, 90),
(32, 'Other', 1, 91);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_industry_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_industry_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_industry_seq`
--

INSERT INTO `vtiger_industry_seq` (`id`) VALUES
(32);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorynotification`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorynotification` (
  `notificationid` int(19) NOT NULL AUTO_INCREMENT,
  `notificationname` varchar(200) DEFAULT NULL,
  `notificationsubject` varchar(200) DEFAULT NULL,
  `notificationbody` text,
  `label` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`notificationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_inventorynotification`
--

INSERT INTO `vtiger_inventorynotification` (`notificationid`, `notificationname`, `notificationsubject`, `notificationbody`, `label`, `status`) VALUES
(1, 'InvoiceNotification', '{PRODUCTNAME} Stock Level is Low', 'Dear {HANDLER},\n\nThe current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}. Kindly procure required number of units as the stock level is below reorder level {REORDERLEVELVALUE}.\n\nPlease treat this information as Urgent as the invoice is already sent  to the customer.\n\nSeverity: Critical\n\nThanks,\n{CURRENTUSER} ', 'InvoiceNotificationDescription', NULL),
(2, 'QuoteNotification', 'Quote given for {PRODUCTNAME}', 'Dear {HANDLER},\n\nQuote is generated for {QUOTEQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}.\n\nSeverity: Minor\n\nThanks,\n{CURRENTUSER} ', 'QuoteNotificationDescription', NULL),
(3, 'SalesOrderNotification', 'Sales Order generated for {PRODUCTNAME}', 'Dear {HANDLER},\n\nSalesOrder is generated for {SOQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}.\n\nPlease treat this information  with priority as the sales order is already generated.\n\nSeverity: Major\n\nThanks,\n{CURRENTUSER} ', 'SalesOrderNotificationDescription', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorynotification_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorynotification_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorynotification_seq`
--

INSERT INTO `vtiger_inventorynotification_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventoryproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryproductrel` (
  `id` int(19) DEFAULT NULL,
  `productid` int(19) DEFAULT NULL,
  `sequence_no` int(4) DEFAULT NULL,
  `quantity` decimal(25,3) DEFAULT NULL,
  `listprice` decimal(25,3) DEFAULT NULL,
  `discount_percent` decimal(7,3) DEFAULT NULL,
  `discount_amount` decimal(25,3) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `description` text,
  `incrementondel` int(11) NOT NULL DEFAULT '0',
  `lineitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax1` decimal(7,3) DEFAULT NULL,
  `tax2` decimal(7,3) DEFAULT NULL,
  `tax3` decimal(7,3) DEFAULT NULL,
  PRIMARY KEY (`lineitem_id`),
  KEY `inventoryproductrel_id_idx` (`id`),
  KEY `inventoryproductrel_productid_idx` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventoryshippingrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryshippingrel` (
  `id` int(19) DEFAULT NULL,
  `shtax1` decimal(7,3) DEFAULT NULL,
  `shtax2` decimal(7,3) DEFAULT NULL,
  `shtax3` decimal(7,3) DEFAULT NULL,
  KEY `inventoryishippingrel_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorysubproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorysubproductrel` (
  `id` int(19) NOT NULL,
  `sequence_no` int(10) NOT NULL,
  `productid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorytaxinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorytaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) DEFAULT NULL,
  `taxlabel` varchar(50) DEFAULT NULL,
  `percentage` decimal(7,3) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  PRIMARY KEY (`taxid`),
  KEY `inventorytaxinfo_taxname_idx` (`taxname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorytaxinfo`
--

INSERT INTO `vtiger_inventorytaxinfo` (`taxid`, `taxname`, `taxlabel`, `percentage`, `deleted`) VALUES
(1, 'tax1', 'VAT', '4.500', 0),
(2, 'tax2', 'Sales', '10.000', 0),
(3, 'tax3', 'Service', '12.500', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorytaxinfo_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorytaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorytaxinfo_seq`
--

INSERT INTO `vtiger_inventorytaxinfo_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventory_tandc`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventory_tandc` (
  `id` int(19) NOT NULL,
  `type` varchar(30) NOT NULL,
  `tandc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventory_tandc`
--

INSERT INTO `vtiger_inventory_tandc` (`id`, `type`, `tandc`) VALUES
(1, 'Inventory', '\n - Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventory_tandc_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventory_tandc_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventory_tandc_seq`
--

INSERT INTO `vtiger_inventory_tandc_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invitees`
--

CREATE TABLE IF NOT EXISTS `vtiger_invitees` (
  `activityid` int(19) NOT NULL,
  `inviteeid` int(19) NOT NULL,
  PRIMARY KEY (`activityid`,`inviteeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoice`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoice` (
  `invoiceid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `salesorderid` int(19) DEFAULT NULL,
  `customerno` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `invoiceterms` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,3) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `subtotal` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,3) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,3) DEFAULT NULL,
  `s_h_amount` decimal(25,3) DEFAULT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text,
  `purchaseorder` varchar(200) DEFAULT NULL,
  `invoicestatus` varchar(200) DEFAULT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  PRIMARY KEY (`invoiceid`),
  KEY `invoice_purchaseorderid_idx` (`invoiceid`),
  KEY `fk_2_vtiger_invoice` (`salesorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicebillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicebillads` (
  `invoicebilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`invoicebilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicecf` (
  `invoiceid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoiceshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoiceshipads` (
  `invoiceshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`invoiceshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicestatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatus` (
  `invoicestatusid` int(19) NOT NULL AUTO_INCREMENT,
  `invoicestatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoicestatusid`),
  UNIQUE KEY `invoicestatus_invoiestatus_idx` (`invoicestatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_invoicestatus`
--

INSERT INTO `vtiger_invoicestatus` (`invoicestatusid`, `invoicestatus`, `presence`, `picklist_valueid`) VALUES
(1, 'AutoCreated', 0, 92),
(2, 'Created', 0, 93),
(3, 'Approved', 0, 94),
(4, 'Sent', 0, 95),
(5, 'Credit Invoice', 0, 96),
(6, 'Paid', 0, 97);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicestatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatushistory` (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `invoicestatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `invoicestatushistory_invoiceid_idx` (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicestatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_invoicestatus_seq`
--

INSERT INTO `vtiger_invoicestatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoice_recurring_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoice_recurring_info` (
  `salesorderid` int(11) DEFAULT NULL,
  `recurring_frequency` varchar(200) DEFAULT NULL,
  `start_period` date DEFAULT NULL,
  `end_period` date DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `payment_duration` varchar(200) DEFAULT NULL,
  `invoice_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_language`
--

CREATE TABLE IF NOT EXISTS `vtiger_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `label` varchar(30) DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `isdefault` int(1) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vtiger_language`
--

INSERT INTO `vtiger_language` (`id`, `name`, `prefix`, `label`, `lastupdated`, `sequence`, `isdefault`, `active`) VALUES
(1, 'English', 'en_us', 'US English', '2013-07-23 10:48:15', NULL, 1, 1),
(2, 'BritishEnglish', 'en_gb', 'British English', '2013-07-23 10:55:41', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_language_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_language_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_language_seq`
--

INSERT INTO `vtiger_language_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_lar`
--

CREATE TABLE IF NOT EXISTS `vtiger_lar` (
  `larid` int(19) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `createdby` int(19) NOT NULL DEFAULT '0',
  `createdon` date NOT NULL,
  PRIMARY KEY (`larid`),
  UNIQUE KEY `lar_name_idx` (`name`),
  KEY `lar_createdby_idx` (`createdby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadacctrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadacctrel` (
  `leadid` int(19) NOT NULL DEFAULT '0',
  `accountid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`leadid`),
  KEY `leadacctrel_accountid_idx` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadaddress`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadaddress` (
  `leadaddressid` int(19) NOT NULL DEFAULT '0',
  `city` varchar(30) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `pobox` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `lane` varchar(250) DEFAULT NULL,
  `leadaddresstype` varchar(30) DEFAULT 'Billing',
  PRIMARY KEY (`leadaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadcontrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadcontrel` (
  `leadid` int(19) NOT NULL DEFAULT '0',
  `contactid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`leadid`),
  KEY `leadcontrel_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leaddetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_leaddetails` (
  `leadid` int(19) NOT NULL,
  `lead_no` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `interest` varchar(50) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `salutation` varchar(200) DEFAULT NULL,
  `lastname` varchar(80) NOT NULL,
  `company` varchar(100) NOT NULL,
  `annualrevenue` int(19) DEFAULT '0',
  `industry` varchar(200) DEFAULT NULL,
  `campaign` varchar(30) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `leadstatus` varchar(50) DEFAULT NULL,
  `leadsource` varchar(200) DEFAULT NULL,
  `converted` int(1) DEFAULT '0',
  `designation` varchar(50) DEFAULT 'SalesMan',
  `licencekeystatus` varchar(50) DEFAULT NULL,
  `space` varchar(250) DEFAULT NULL,
  `comments` text,
  `priority` varchar(50) DEFAULT NULL,
  `demorequest` varchar(50) DEFAULT NULL,
  `partnercontact` varchar(50) DEFAULT NULL,
  `productversion` varchar(20) DEFAULT NULL,
  `product` varchar(50) DEFAULT NULL,
  `maildate` date DEFAULT NULL,
  `nextstepdate` date DEFAULT NULL,
  `fundingsituation` varchar(50) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `evaluationstatus` varchar(50) DEFAULT NULL,
  `transferdate` date DEFAULT NULL,
  `revenuetype` varchar(50) DEFAULT NULL,
  `noofemployees` int(50) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `assignleadchk` int(1) DEFAULT '0',
  PRIMARY KEY (`leadid`),
  KEY `leaddetails_converted_leadstatus_idx` (`converted`,`leadstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadpotrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadpotrel` (
  `leadid` int(19) NOT NULL DEFAULT '0',
  `potentialid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`potentialid`),
  UNIQUE KEY `leadpotrel_leadid_idx` (`leadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadscf` (
  `leadid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`leadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadsource`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsource` (
  `leadsourceid` int(19) NOT NULL AUTO_INCREMENT,
  `leadsource` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`leadsourceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `vtiger_leadsource`
--

INSERT INTO `vtiger_leadsource` (`leadsourceid`, `leadsource`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 98),
(2, 'Cold Call', 1, 99),
(3, 'Existing Customer', 1, 100),
(4, 'Self Generated', 1, 101),
(5, 'Employee', 1, 102),
(6, 'Partner', 1, 103),
(7, 'Public Relations', 1, 104),
(8, 'Direct Mail', 1, 105),
(9, 'Conference', 1, 106),
(10, 'Trade Show', 1, 107),
(11, 'Web Site', 1, 108),
(12, 'Word of mouth', 1, 109),
(13, 'Other', 1, 110);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadsource_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsource_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_leadsource_seq`
--

INSERT INTO `vtiger_leadsource_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadstage`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstage` (
  `leadstageid` int(19) NOT NULL AUTO_INCREMENT,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`leadstageid`),
  UNIQUE KEY `leadstage_stage_idx` (`stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstatus` (
  `leadstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `leadstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`leadstatusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `vtiger_leadstatus`
--

INSERT INTO `vtiger_leadstatus` (`leadstatusid`, `leadstatus`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 111),
(2, 'Attempted to Contact', 1, 112),
(3, 'Cold', 1, 113),
(4, 'Contact in Future', 1, 114),
(5, 'Contacted', 1, 115),
(6, 'Hot', 1, 116),
(7, 'Junk Lead', 1, 117),
(8, 'Lost Lead', 1, 118),
(9, 'Not Contacted', 1, 119),
(10, 'Pre Qualified', 1, 120),
(11, 'Qualified', 1, 121),
(12, 'Warm', 1, 122);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_leadstatus_seq`
--

INSERT INTO `vtiger_leadstatus_seq` (`id`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadsubdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsubdetails` (
  `leadsubscriptionid` int(19) NOT NULL DEFAULT '0',
  `website` varchar(255) DEFAULT NULL,
  `callornot` int(1) DEFAULT '0',
  `readornot` int(1) DEFAULT '0',
  `empct` int(10) DEFAULT '0',
  PRIMARY KEY (`leadsubscriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_lead_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_lead_view` (
  `lead_viewid` int(19) NOT NULL AUTO_INCREMENT,
  `lead_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lead_viewid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_lead_view`
--

INSERT INTO `vtiger_lead_view` (`lead_viewid`, `lead_view`, `sortorderid`, `presence`) VALUES
(1, 'Today', 0, 1),
(2, 'Last 2 Days', 1, 1),
(3, 'Last Week', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_lead_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_lead_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_lead_view_seq`
--

INSERT INTO `vtiger_lead_view_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_licencekeystatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_licencekeystatus` (
  `licencekeystatusid` int(19) NOT NULL AUTO_INCREMENT,
  `licencekeystatus` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`licencekeystatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_links`
--

CREATE TABLE IF NOT EXISTS `vtiger_links` (
  `linkid` int(11) NOT NULL,
  `tabid` int(11) DEFAULT NULL,
  `linktype` varchar(20) DEFAULT NULL,
  `linklabel` varchar(30) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `linkicon` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `handler_path` varchar(128) DEFAULT NULL,
  `handler_class` varchar(32) DEFAULT NULL,
  `handler` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`linkid`),
  KEY `link_tabidtype_idx` (`tabid`,`linktype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_links`
--

INSERT INTO `vtiger_links` (`linkid`, `tabid`, `linktype`, `linklabel`, `linkurl`, `linkicon`, `sequence`, `handler_path`, `handler_class`, `handler`) VALUES
(1, 6, 'DETAILVIEWBASIC', 'LBL_ADD_NOTE', 'index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', 'themes/images/bookMark.gif', 0, NULL, NULL, NULL),
(2, 6, 'DETAILVIEWBASIC', 'LBL_SHOW_ACCOUNT_HIERARCHY', 'index.php?module=Accounts&action=AccountHierarchy&accountid=$RECORD$', '', 0, NULL, NULL, NULL),
(3, 7, 'DETAILVIEWBASIC', 'LBL_ADD_NOTE', 'index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', 'themes/images/bookMark.gif', 0, NULL, NULL, NULL),
(4, 4, 'DETAILVIEWBASIC', 'LBL_ADD_NOTE', 'index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', 'themes/images/bookMark.gif', 0, NULL, NULL, NULL),
(5, 36, 'HEADERSCRIPT', 'ModTrackerCommon_JS', 'modules/ModTracker/ModTrackerCommon.js', '', 0, NULL, NULL, NULL),
(6, 42, 'HEADERSCRIPT', 'ModCommentsCommonHeaderScript', 'modules/ModComments/ModCommentsCommon.js', '', 0, NULL, NULL, NULL),
(7, 7, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(8, 4, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(9, 6, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(10, 2, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(11, 43, 'HEADERSCRIPT', 'ToolTip_HeaderScript', 'modules/Tooltip/TooltipHeaderScript.js', '', 0, NULL, NULL, NULL),
(12, 47, 'DETAILVIEWBASIC', 'LBL_CHECK_STATUS', 'javascript:SMSNotifier.checkstatus($RECORD$)', 'themes/images/reload.gif', 0, NULL, NULL, NULL),
(14, 47, 'HEADERSCRIPT', 'SMSNotifierCommonJS', 'modules/SMSNotifier/SMSNotifierCommon.js', '', 0, NULL, NULL, NULL),
(15, 7, 'LISTVIEWBASIC', 'Send SMS', 'SMSNotifierCommon.displaySelectWizard(this, ''$MODULE$'');', '', 0, NULL, NULL, NULL),
(16, 7, 'DETAILVIEWBASIC', 'Send SMS', 'javascript:SMSNotifierCommon.displaySelectWizard_DetailView(''$MODULE$'', ''$RECORD$'');', '', 0, NULL, NULL, NULL),
(17, 4, 'LISTVIEWBASIC', 'Send SMS', 'SMSNotifierCommon.displaySelectWizard(this, ''$MODULE$'');', '', 0, NULL, NULL, NULL),
(18, 4, 'DETAILVIEWBASIC', 'Send SMS', 'javascript:SMSNotifierCommon.displaySelectWizard_DetailView(''$MODULE$'', ''$RECORD$'');', '', 0, NULL, NULL, NULL),
(19, 6, 'LISTVIEWBASIC', 'Send SMS', 'SMSNotifierCommon.displaySelectWizard(this, ''$MODULE$'');', '', 0, NULL, NULL, NULL),
(20, 6, 'DETAILVIEWBASIC', 'Send SMS', 'javascript:SMSNotifierCommon.displaySelectWizard_DetailView(''$MODULE$'', ''$RECORD$'');', '', 0, NULL, NULL, NULL),
(21, 51, 'DETAILVIEWBASIC', 'Add Note', 'index.php?module=Documents&action=EditView&return_module=ProjectTask&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', '', 0, NULL, NULL, NULL),
(22, 51, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(23, 52, 'DETAILVIEWBASIC', 'Add Project Task', 'index.php?module=ProjectTask&action=EditView&projectid=$RECORD$&return_module=Project&return_action=DetailView&return_id=$RECORD$', '', 0, NULL, NULL, NULL),
(24, 52, 'DETAILVIEWBASIC', 'Add Note', 'index.php?module=Documents&action=EditView&return_module=Project&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', '', 1, NULL, NULL, NULL),
(25, 52, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_links_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_links_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_links_seq`
--

INSERT INTO `vtiger_links_seq` (`id`) VALUES
(25);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_loginhistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_loginhistory` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) NOT NULL,
  `user_ip` varchar(25) NOT NULL,
  `logout_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `vtiger_loginhistory`
--

INSERT INTO `vtiger_loginhistory` (`login_id`, `user_name`, `user_ip`, `logout_time`, `login_time`, `status`) VALUES
(1, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-07-23 05:49:50', 'Signed in'),
(2, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-07-23 05:50:26', 'Signed in'),
(3, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-07-23 05:52:10', 'Signed in'),
(4, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-07-23 05:52:23', 'Signed in'),
(5, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-07-23 05:59:42', 'Signed in'),
(6, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-07-23 06:08:16', 'Signed in'),
(7, 'admin', '127.0.0.1', '2013-07-23 06:49:13', '2013-07-23 06:08:22', 'Signed off'),
(8, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-07-23 06:51:40', 'Signed in'),
(9, 'admin', '127.0.0.1', '0000-00-00 00:00:00', '2013-08-06 05:12:02', 'Signed in'),
(10, 'admin', '127.0.0.1', '2013-08-07 02:01:31', '2013-08-07 02:00:31', 'Signed off');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailmanager_mailattachments`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailattachments` (
  `userid` int(11) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  `aname` varchar(100) DEFAULT NULL,
  `lastsavedtime` int(11) DEFAULT NULL,
  `attachid` int(19) NOT NULL,
  `path` varchar(200) NOT NULL,
  KEY `userid_muid_idx` (`userid`,`muid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailmanager_mailrecord`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailrecord` (
  `userid` int(11) DEFAULT NULL,
  `mfrom` varchar(255) DEFAULT NULL,
  `mto` varchar(255) DEFAULT NULL,
  `mcc` varchar(500) DEFAULT NULL,
  `mbcc` varchar(500) DEFAULT NULL,
  `mdate` varchar(20) DEFAULT NULL,
  `msubject` varchar(500) DEFAULT NULL,
  `mbody` text,
  `mcharset` varchar(10) DEFAULT NULL,
  `misbodyhtml` int(1) DEFAULT NULL,
  `mplainmessage` int(1) DEFAULT NULL,
  `mhtmlmessage` int(1) DEFAULT NULL,
  `muniqueid` varchar(500) DEFAULT NULL,
  `mbodyparsed` int(1) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  `lastsavedtime` int(11) DEFAULT NULL,
  KEY `userid_lastsavedtime_idx` (`userid`,`lastsavedtime`),
  KEY `userid_muid_idx` (`userid`,`muid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailmanager_mailrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailrel` (
  `mailuid` varchar(999) DEFAULT NULL,
  `crmid` int(11) DEFAULT NULL,
  `emailid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner` (
  `scannerid` int(11) NOT NULL AUTO_INCREMENT,
  `scannername` varchar(30) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `protocol` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ssltype` varchar(10) DEFAULT NULL,
  `sslmethod` varchar(30) DEFAULT NULL,
  `connecturl` varchar(255) DEFAULT NULL,
  `searchfor` varchar(10) DEFAULT NULL,
  `markas` varchar(10) DEFAULT NULL,
  `isvalid` int(1) DEFAULT NULL,
  PRIMARY KEY (`scannerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_actions`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_actions` (
  `actionid` int(11) NOT NULL AUTO_INCREMENT,
  `scannerid` int(11) DEFAULT NULL,
  `actiontype` varchar(10) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `lookup` varchar(30) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_folders`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_folders` (
  `folderid` int(11) NOT NULL AUTO_INCREMENT,
  `scannerid` int(11) DEFAULT NULL,
  `foldername` varchar(255) DEFAULT NULL,
  `lastscan` varchar(30) DEFAULT NULL,
  `rescan` int(1) DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL,
  PRIMARY KEY (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_ids`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_ids` (
  `scannerid` int(11) DEFAULT NULL,
  `messageid` text,
  `crmid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_ruleactions`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_ruleactions` (
  `ruleid` int(11) DEFAULT NULL,
  `actionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_rules`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_rules` (
  `ruleid` int(11) NOT NULL AUTO_INCREMENT,
  `scannerid` int(11) DEFAULT NULL,
  `fromaddress` varchar(255) DEFAULT NULL,
  `toaddress` varchar(255) DEFAULT NULL,
  `subjectop` varchar(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `bodyop` varchar(20) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `matchusing` varchar(5) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mail_accounts`
--

CREATE TABLE IF NOT EXISTS `vtiger_mail_accounts` (
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `mail_id` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `mail_protocol` varchar(20) DEFAULT NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` varchar(250) NOT NULL,
  `mail_servername` varchar(50) DEFAULT NULL,
  `box_refresh` int(10) DEFAULT NULL,
  `mails_per_page` int(10) DEFAULT NULL,
  `ssltype` varchar(50) DEFAULT NULL,
  `sslmeth` varchar(50) DEFAULT NULL,
  `int_mailer` int(1) DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `set_default` int(2) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_manufacturer`
--

CREATE TABLE IF NOT EXISTS `vtiger_manufacturer` (
  `manufacturerid` int(19) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`manufacturerid`),
  UNIQUE KEY `manufacturer_manufacturer_idx` (`manufacturer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_manufacturer`
--

INSERT INTO `vtiger_manufacturer` (`manufacturerid`, `manufacturer`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 123),
(2, 'AltvetPet Inc.', 1, 124),
(3, 'LexPon Inc.', 1, 125),
(4, 'MetBeat Corp', 1, 126);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_manufacturer_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_manufacturer_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_manufacturer_seq`
--

INSERT INTO `vtiger_manufacturer_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mobile_alerts`
--

CREATE TABLE IF NOT EXISTS `vtiger_mobile_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handler_path` varchar(500) DEFAULT NULL,
  `handler_class` varchar(50) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `vtiger_mobile_alerts`
--

INSERT INTO `vtiger_mobile_alerts` (`id`, `handler_path`, `handler_class`, `sequence`, `deleted`) VALUES
(12, 'modules/Mobile/api/ws/models/alerts/IdleTicketsOfMine.php', 'Mobile_WS_AlertModel_IdleTicketsOfMine', NULL, 0),
(13, 'modules/Mobile/api/ws/models/alerts/NewTicketOfMine.php', 'Mobile_WS_AlertModel_NewTicketOfMine', NULL, 0),
(14, 'modules/Mobile/api/ws/models/alerts/PendingTicketsOfMine.php', 'Mobile_WS_AlertModel_PendingTicketsOfMine', NULL, 0),
(15, 'modules/Mobile/api/ws/models/alerts/PotentialsDueIn5Days.php', 'Mobile_WS_AlertModel_PotentialsDueIn5Days', NULL, 0),
(16, 'modules/Mobile/api/ws/models/alerts/EventsOfMineToday.php', 'Mobile_WS_AlertModel_EventsOfMineToday', NULL, 0),
(17, 'modules/Mobile/api/ws/models/alerts/ProjectTasksOfMine.php', 'Mobile_WS_AlertModel_ProjectTasksOfMine', NULL, 0),
(18, 'modules/Mobile/api/ws/models/alerts/Projects.php', 'Mobile_WS_AlertModel_Projects', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_modcomments` (
  `modcommentsid` int(11) DEFAULT NULL,
  `commentcontent` text,
  `related_to` varchar(100) NOT NULL,
  `parent_comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modcommentscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_modcommentscf` (
  `modcommentsid` int(11) NOT NULL,
  PRIMARY KEY (`modcommentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modentity_num`
--

CREATE TABLE IF NOT EXISTS `vtiger_modentity_num` (
  `num_id` int(19) NOT NULL,
  `semodule` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `start_id` varchar(50) NOT NULL,
  `cur_id` varchar(50) NOT NULL,
  `active` varchar(2) NOT NULL,
  PRIMARY KEY (`num_id`),
  UNIQUE KEY `num_idx` (`num_id`),
  KEY `semodule_active_idx` (`semodule`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_modentity_num`
--

INSERT INTO `vtiger_modentity_num` (`num_id`, `semodule`, `prefix`, `start_id`, `cur_id`, `active`) VALUES
(1, 'Leads', 'LEA', '1', '1', '1'),
(2, 'Accounts', 'ACC', '1', '1', '1'),
(3, 'Campaigns', 'CAM', '1', '1', '1'),
(4, 'Contacts', 'CON', '1', '1', '1'),
(5, 'Potentials', 'POT', '1', '1', '1'),
(6, 'HelpDesk', 'TT', '1', '1', '1'),
(7, 'Quotes', 'QUO', '1', '1', '1'),
(8, 'SalesOrder', 'SO', '1', '1', '1'),
(9, 'PurchaseOrder', 'PO', '1', '1', '1'),
(10, 'Invoice', 'INV', '1', '1', '1'),
(11, 'Products', 'PRO', '1', '1', '1'),
(12, 'Vendors', 'VEN', '1', '1', '1'),
(13, 'PriceBooks', 'PB', '1', '1', '1'),
(14, 'Faq', 'FAQ', '1', '1', '1'),
(15, 'Documents', 'DOC', '1', '1', '1'),
(16, 'ServiceContracts', 'SERCON', '1', '1', '1'),
(17, 'Services', 'SER', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modentity_num_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_modentity_num_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_modentity_num_seq`
--

INSERT INTO `vtiger_modentity_num_seq` (`id`) VALUES
(17);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_basic`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_basic` (
  `id` int(20) NOT NULL,
  `crmid` int(20) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `whodid` int(20) DEFAULT NULL,
  `changedon` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_detail`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_detail` (
  `id` int(11) DEFAULT NULL,
  `fieldname` varchar(100) DEFAULT NULL,
  `prevalue` text,
  `postvalue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_tabs`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_tabs` (
  `tabid` int(11) NOT NULL,
  `visible` int(11) DEFAULT '0',
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notebook_contents`
--

CREATE TABLE IF NOT EXISTS `vtiger_notebook_contents` (
  `userid` int(19) NOT NULL,
  `notebookid` int(19) NOT NULL,
  `contents` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notes`
--

CREATE TABLE IF NOT EXISTS `vtiger_notes` (
  `notesid` int(19) NOT NULL DEFAULT '0',
  `note_no` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `notecontent` text,
  `folderid` int(19) NOT NULL DEFAULT '1',
  `filetype` varchar(50) DEFAULT NULL,
  `filelocationtype` varchar(5) DEFAULT NULL,
  `filedownloadcount` int(19) DEFAULT NULL,
  `filestatus` int(19) DEFAULT NULL,
  `filesize` int(19) NOT NULL DEFAULT '0',
  `fileversion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`notesid`),
  KEY `notes_title_idx` (`title`),
  KEY `notes_notesid_idx` (`notesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notescf`
--

CREATE TABLE IF NOT EXISTS `vtiger_notescf` (
  `notesid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notificationscheduler`
--

CREATE TABLE IF NOT EXISTS `vtiger_notificationscheduler` (
  `schedulednotificationid` int(19) NOT NULL AUTO_INCREMENT,
  `schedulednotificationname` varchar(200) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `notificationsubject` varchar(200) DEFAULT NULL,
  `notificationbody` text,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`schedulednotificationid`),
  UNIQUE KEY `notificationscheduler_schedulednotificationname_idx` (`schedulednotificationname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `vtiger_notificationscheduler`
--

INSERT INTO `vtiger_notificationscheduler` (`schedulednotificationid`, `schedulednotificationname`, `active`, `notificationsubject`, `notificationbody`, `label`, `type`) VALUES
(1, 'LBL_TASK_NOTIFICATION_DESCRITPION', 1, 'Task Delay Notification', 'Tasks delayed beyond 24 hrs ', 'LBL_TASK_NOTIFICATION', NULL),
(2, 'LBL_BIG_DEAL_DESCRIPTION', 1, 'Big Deal notification', 'Success! A big deal has been won! ', 'LBL_BIG_DEAL', NULL),
(3, 'LBL_TICKETS_DESCRIPTION', 1, 'Pending Tickets notification', 'Ticket pending please ', 'LBL_PENDING_TICKETS', NULL),
(4, 'LBL_MANY_TICKETS_DESCRIPTION', 1, 'Too many tickets Notification', 'Too many tickets pending against this entity ', 'LBL_MANY_TICKETS', NULL),
(5, 'LBL_START_DESCRIPTION', 1, 'Support Start Notification', '10', 'LBL_START_NOTIFICATION', 'select'),
(6, 'LBL_SUPPORT_DESCRIPTION', 1, 'Support ending please', '11', 'LBL_SUPPORT_NOTICIATION', 'select'),
(7, 'LBL_SUPPORT_DESCRIPTION_MONTH', 1, 'Support ending please', '12', 'LBL_SUPPORT_NOTICIATION_MONTH', 'select'),
(8, 'LBL_ACTIVITY_REMINDER_DESCRIPTION', 1, 'Activity Reminder Notification', 'This is a reminder notification for the Activity', 'LBL_ACTIVITY_NOTIFICATION', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notificationscheduler_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_notificationscheduler_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_notificationscheduler_seq`
--

INSERT INTO `vtiger_notificationscheduler_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_opportunitystage`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunitystage` (
  `potstageid` int(19) NOT NULL AUTO_INCREMENT,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  `probability` decimal(3,2) DEFAULT '0.00',
  PRIMARY KEY (`potstageid`),
  UNIQUE KEY `opportunitystage_stage_idx` (`stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_opportunity_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunity_type` (
  `opptypeid` int(19) NOT NULL AUTO_INCREMENT,
  `opportunity_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`opptypeid`),
  UNIQUE KEY `opportunity_type_opportunity_type_idx` (`opportunity_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_opportunity_type`
--

INSERT INTO `vtiger_opportunity_type` (`opptypeid`, `opportunity_type`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 127),
(2, 'Existing Business', 1, 128),
(3, 'New Business', 1, 129);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_opportunity_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunity_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_opportunity_type_seq`
--

INSERT INTO `vtiger_opportunity_type_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_organizationdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_organizationdetails` (
  `organization_id` int(11) NOT NULL,
  `organizationname` varchar(60) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `logoname` varchar(50) DEFAULT NULL,
  `logo` text,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_organizationdetails`
--

INSERT INTO `vtiger_organizationdetails` (`organization_id`, `organizationname`, `address`, `city`, `state`, `country`, `code`, `phone`, `fax`, `website`, `logoname`, `logo`) VALUES
(1, 'vtiger', ' 40-41-42, Sivasundar Apartments, Flat D-II, Shastri Street, Velachery', 'Chennai', 'Tamil Nadu', 'India', '600 042', '+91-44-5202-1990', '+91-44-5202-1990', 'www.vtiger.com', 'vtiger-crm-logo.gif', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_organizationdetails_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_organizationdetails_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_organizationdetails_seq`
--

INSERT INTO `vtiger_organizationdetails_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_org_share_action2tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_org_share_action2tab` (
  `share_action_id` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  PRIMARY KEY (`share_action_id`,`tabid`),
  KEY `fk_2_vtiger_org_share_action2tab` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_org_share_action2tab`
--

INSERT INTO `vtiger_org_share_action2tab` (`share_action_id`, `tabid`) VALUES
(0, 2),
(1, 2),
(2, 2),
(3, 2),
(0, 4),
(1, 4),
(2, 4),
(3, 4),
(0, 6),
(1, 6),
(2, 6),
(3, 6),
(0, 7),
(1, 7),
(2, 7),
(3, 7),
(0, 8),
(1, 8),
(2, 8),
(3, 8),
(0, 9),
(1, 9),
(2, 9),
(3, 9),
(0, 10),
(1, 10),
(2, 10),
(3, 10),
(0, 13),
(1, 13),
(2, 13),
(3, 13),
(0, 14),
(1, 14),
(2, 14),
(3, 14),
(0, 16),
(1, 16),
(2, 16),
(3, 16),
(0, 20),
(1, 20),
(2, 20),
(3, 20),
(0, 21),
(1, 21),
(2, 21),
(3, 21),
(0, 22),
(1, 22),
(2, 22),
(3, 22),
(0, 23),
(1, 23),
(2, 23),
(3, 23),
(0, 26),
(1, 26),
(2, 26),
(3, 26),
(0, 32),
(1, 32),
(2, 32),
(3, 32),
(0, 38),
(1, 38),
(2, 38),
(3, 38),
(0, 40),
(1, 40),
(2, 40),
(3, 40),
(0, 42),
(1, 42),
(2, 42),
(3, 42),
(0, 44),
(1, 44),
(2, 44),
(3, 44),
(0, 47),
(1, 47),
(2, 47),
(3, 47),
(0, 50),
(1, 50),
(2, 50),
(3, 50),
(0, 51),
(1, 51),
(2, 51),
(3, 51),
(0, 52),
(1, 52),
(2, 52),
(3, 52);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_org_share_action_mapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_org_share_action_mapping` (
  `share_action_id` int(19) NOT NULL,
  `share_action_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`share_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_org_share_action_mapping`
--

INSERT INTO `vtiger_org_share_action_mapping` (`share_action_id`, `share_action_name`) VALUES
(0, 'Public: Read Only'),
(1, 'Public: Read, Create/Edit'),
(2, 'Public: Read, Create/Edit, Delete'),
(3, 'Private'),
(4, 'Hide Details'),
(5, 'Hide Details and Add Events'),
(6, 'Show Details'),
(7, 'Show Details and Add Events');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ownernotify`
--

CREATE TABLE IF NOT EXISTS `vtiger_ownernotify` (
  `crmid` int(19) DEFAULT NULL,
  `smownerid` int(19) DEFAULT NULL,
  `flag` int(3) DEFAULT NULL,
  KEY `ownernotify_crmid_flag_idx` (`crmid`,`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_parenttab`
--

CREATE TABLE IF NOT EXISTS `vtiger_parenttab` (
  `parenttabid` int(19) NOT NULL,
  `parenttab_label` varchar(100) NOT NULL,
  `sequence` int(10) NOT NULL,
  `visible` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`parenttabid`),
  KEY `parenttab_parenttabid_parenttabl_label_visible_idx` (`parenttabid`,`parenttab_label`,`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_parenttab`
--

INSERT INTO `vtiger_parenttab` (`parenttabid`, `parenttab_label`, `sequence`, `visible`) VALUES
(1, 'My Home Page', 1, 0),
(2, 'Marketing', 2, 0),
(3, 'Sales', 3, 0),
(4, 'Support', 4, 0),
(5, 'Analytics', 5, 0),
(6, 'Inventory', 6, 0),
(7, 'Tools', 7, 0),
(8, 'Settings', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_parenttabrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_parenttabrel` (
  `parenttabid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sequence` int(3) NOT NULL,
  KEY `parenttabrel_tabid_parenttabid_idx` (`tabid`,`parenttabid`),
  KEY `fk_2_vtiger_parenttabrel` (`parenttabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_parenttabrel`
--

INSERT INTO `vtiger_parenttabrel` (`parenttabid`, `tabid`, `sequence`) VALUES
(1, 9, 2),
(1, 28, 4),
(1, 3, 1),
(3, 7, 1),
(3, 6, 2),
(3, 4, 3),
(3, 2, 4),
(3, 20, 5),
(3, 22, 6),
(3, 23, 7),
(3, 19, 8),
(3, 8, 9),
(4, 13, 1),
(4, 15, 2),
(4, 6, 3),
(4, 4, 4),
(4, 8, 5),
(5, 1, 2),
(5, 25, 1),
(6, 14, 1),
(6, 18, 2),
(6, 19, 3),
(6, 21, 4),
(6, 22, 5),
(6, 20, 6),
(6, 23, 7),
(7, 24, 1),
(7, 27, 2),
(7, 8, 3),
(2, 26, 1),
(2, 6, 2),
(2, 4, 3),
(2, 28, 4),
(4, 28, 7),
(2, 7, 5),
(2, 9, 6),
(4, 9, 8),
(2, 8, 8),
(3, 9, 11),
(7, 30, 4),
(7, 31, 5),
(4, 32, 9),
(6, 38, 8),
(7, 40, 6),
(7, 41, 7),
(7, 42, 8),
(6, 44, 9),
(7, 47, 9),
(4, 50, 10),
(4, 51, 11),
(4, 52, 12);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_payment_duration`
--

CREATE TABLE IF NOT EXISTS `vtiger_payment_duration` (
  `payment_duration_id` int(11) DEFAULT NULL,
  `payment_duration` varchar(200) DEFAULT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_payment_duration`
--

INSERT INTO `vtiger_payment_duration` (`payment_duration_id`, `payment_duration`, `sortorderid`, `presence`) VALUES
(1, 'Net 30 days', 0, 1),
(2, 'Net 45 days', 1, 1),
(3, 'Net 60 days', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_payment_duration_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_payment_duration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_payment_duration_seq`
--

INSERT INTO `vtiger_payment_duration_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pbxmanager`
--

CREATE TABLE IF NOT EXISTS `vtiger_pbxmanager` (
  `pbxmanagerid` int(11) DEFAULT NULL,
  `callfrom` varchar(255) DEFAULT NULL,
  `callto` varchar(255) DEFAULT NULL,
  `timeofcall` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklist`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist` (
  `picklistid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`picklistid`),
  UNIQUE KEY `picklist_name_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `vtiger_picklist`
--

INSERT INTO `vtiger_picklist` (`picklistid`, `name`) VALUES
(1, 'accounttype'),
(2, 'activitytype'),
(37, 'assetstatus'),
(3, 'campaignstatus'),
(4, 'campaigntype'),
(5, 'carrier'),
(33, 'contract_priority'),
(32, 'contract_status'),
(34, 'contract_type'),
(6, 'eventstatus'),
(7, 'expectedresponse'),
(8, 'faqcategories'),
(9, 'faqstatus'),
(10, 'glacct'),
(11, 'industry'),
(12, 'invoicestatus'),
(13, 'leadsource'),
(14, 'leadstatus'),
(15, 'manufacturer'),
(16, 'opportunity_type'),
(17, 'postatus'),
(18, 'productcategory'),
(45, 'progress'),
(38, 'projectmilestonetype'),
(44, 'projectpriority'),
(42, 'projectstatus'),
(40, 'projecttaskpriority'),
(41, 'projecttaskprogress'),
(39, 'projecttasktype'),
(43, 'projecttype'),
(19, 'quotestage'),
(20, 'rating'),
(21, 'sales_stage'),
(22, 'salutationtype'),
(36, 'servicecategory'),
(35, 'service_usageunit'),
(23, 'sostatus'),
(24, 'taskpriority'),
(25, 'taskstatus'),
(26, 'ticketcategories'),
(27, 'ticketpriorities'),
(28, 'ticketseverities'),
(29, 'ticketstatus'),
(31, 'tracking_unit'),
(30, 'usageunit');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklistvalues_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklistvalues_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_picklistvalues_seq`
--

INSERT INTO `vtiger_picklistvalues_seq` (`id`) VALUES
(287);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklist_dependency`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist_dependency` (
  `id` int(11) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sourcefield` varchar(255) DEFAULT NULL,
  `targetfield` varchar(255) DEFAULT NULL,
  `sourcevalue` varchar(100) DEFAULT NULL,
  `targetvalues` text,
  `criteria` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklist_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_picklist_seq`
--

INSERT INTO `vtiger_picklist_seq` (`id`) VALUES
(45);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pobillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_pobillads` (
  `pobilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pobilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_portal`
--

CREATE TABLE IF NOT EXISTS `vtiger_portal` (
  `portalid` int(19) NOT NULL,
  `portalname` varchar(200) NOT NULL,
  `portalurl` varchar(255) NOT NULL,
  `sequence` int(3) NOT NULL,
  `setdefault` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`portalid`),
  KEY `portal_portalname_idx` (`portalname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_portalinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_portalinfo` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(30) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_poshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_poshipads` (
  `poshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`poshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_postatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatus` (
  `postatusid` int(19) NOT NULL AUTO_INCREMENT,
  `postatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postatusid`),
  UNIQUE KEY `postatus_postatus_idx` (`postatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_postatus`
--

INSERT INTO `vtiger_postatus` (`postatusid`, `postatus`, `presence`, `picklist_valueid`) VALUES
(1, 'Created', 0, 130),
(2, 'Approved', 0, 131),
(3, 'Delivered', 0, 132),
(4, 'Cancelled', 0, 133),
(5, 'Received Shipment', 0, 134);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_postatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatushistory` (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `purchaseorderid` int(19) NOT NULL,
  `vendorname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `postatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `postatushistory_purchaseorderid_idx` (`purchaseorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_postatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_postatus_seq`
--

INSERT INTO `vtiger_postatus_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_potcompetitorrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_potcompetitorrel` (
  `potentialid` int(19) NOT NULL,
  `competitorid` int(19) NOT NULL,
  PRIMARY KEY (`potentialid`,`competitorid`),
  KEY `potcompetitorrel_potentialid_idx` (`potentialid`),
  KEY `potcompetitorrel_competitorid_idx` (`competitorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_potential`
--

CREATE TABLE IF NOT EXISTS `vtiger_potential` (
  `potentialid` int(19) NOT NULL DEFAULT '0',
  `potential_no` varchar(100) NOT NULL,
  `related_to` int(19) DEFAULT NULL,
  `potentialname` varchar(120) NOT NULL,
  `amount` decimal(14,2) DEFAULT '0.00',
  `currency` varchar(20) DEFAULT NULL,
  `closingdate` date DEFAULT NULL,
  `typeofrevenue` varchar(50) DEFAULT NULL,
  `nextstep` varchar(100) DEFAULT NULL,
  `private` int(1) DEFAULT '0',
  `probability` decimal(7,3) DEFAULT '0.000',
  `campaignid` int(19) DEFAULT NULL,
  `sales_stage` varchar(200) DEFAULT NULL,
  `potentialtype` varchar(200) DEFAULT NULL,
  `leadsource` varchar(200) DEFAULT NULL,
  `productid` int(50) DEFAULT NULL,
  `productversion` varchar(50) DEFAULT NULL,
  `quotationref` varchar(50) DEFAULT NULL,
  `partnercontact` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `runtimefee` int(19) DEFAULT '0',
  `followupdate` date DEFAULT NULL,
  `evaluationstatus` varchar(50) DEFAULT NULL,
  `description` text,
  `forecastcategory` int(19) DEFAULT '0',
  `outcomeanalysis` int(19) DEFAULT '0',
  PRIMARY KEY (`potentialid`),
  KEY `potential_relatedto_idx` (`related_to`),
  KEY `potentail_sales_stage_idx` (`sales_stage`),
  KEY `potentail_sales_stage_amount_idx` (`amount`,`sales_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_potentialscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_potentialscf` (
  `potentialid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`potentialid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_potstagehistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_potstagehistory` (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `potentialid` int(19) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `stage` varchar(100) DEFAULT NULL,
  `probability` decimal(7,3) DEFAULT NULL,
  `expectedrevenue` decimal(10,0) DEFAULT NULL,
  `closedate` date DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `potstagehistory_potentialid_idx` (`potentialid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pricebook`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebook` (
  `pricebookid` int(19) NOT NULL DEFAULT '0',
  `pricebook_no` varchar(100) NOT NULL,
  `bookname` varchar(100) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pricebookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pricebookcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebookcf` (
  `pricebookid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pricebookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pricebookproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebookproductrel` (
  `pricebookid` int(19) NOT NULL,
  `productid` int(19) NOT NULL,
  `listprice` decimal(25,3) DEFAULT NULL,
  `usedcurrency` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pricebookid`,`productid`),
  KEY `pricebookproductrel_pricebookid_idx` (`pricebookid`),
  KEY `pricebookproductrel_productid_idx` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_priority`
--

CREATE TABLE IF NOT EXISTS `vtiger_priority` (
  `priorityid` int(19) NOT NULL AUTO_INCREMENT,
  `priority` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priorityid`),
  UNIQUE KEY `priority_priority_idx` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcategory`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcategory` (
  `productcategoryid` int(19) NOT NULL AUTO_INCREMENT,
  `productcategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productcategoryid`),
  UNIQUE KEY `productcategory_productcategory_idx` (`productcategory`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_productcategory`
--

INSERT INTO `vtiger_productcategory` (`productcategoryid`, `productcategory`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 135),
(2, 'Hardware', 1, 136),
(3, 'Software', 1, 137),
(4, 'CRM Applications', 1, 138);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcategory_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_productcategory_seq`
--

INSERT INTO `vtiger_productcategory_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcf` (
  `productid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcollaterals`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcollaterals` (
  `productid` int(11) NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longblob,
  `description` text,
  `filename` varchar(50) DEFAULT NULL,
  `filesize` varchar(50) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `productcollaterals_productid_filename_idx` (`productid`,`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcurrencyrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcurrencyrel` (
  `productid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `converted_price` decimal(25,2) DEFAULT NULL,
  `actual_price` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_products`
--

CREATE TABLE IF NOT EXISTS `vtiger_products` (
  `productid` int(11) NOT NULL,
  `product_no` varchar(100) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `productcode` varchar(40) DEFAULT NULL,
  `productcategory` varchar(200) DEFAULT NULL,
  `manufacturer` varchar(200) DEFAULT NULL,
  `qty_per_unit` decimal(11,2) DEFAULT '0.00',
  `unit_price` decimal(25,2) DEFAULT NULL,
  `weight` decimal(11,3) DEFAULT NULL,
  `pack_size` int(11) DEFAULT NULL,
  `sales_start_date` date DEFAULT NULL,
  `sales_end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `cost_factor` int(11) DEFAULT NULL,
  `commissionrate` decimal(7,3) DEFAULT NULL,
  `commissionmethod` varchar(50) DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT '0',
  `usageunit` varchar(200) DEFAULT NULL,
  `reorderlevel` int(11) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `taxclass` varchar(200) DEFAULT NULL,
  `mfr_part_no` varchar(200) DEFAULT NULL,
  `vendor_part_no` varchar(200) DEFAULT NULL,
  `serialno` varchar(200) DEFAULT NULL,
  `qtyinstock` decimal(25,3) DEFAULT NULL,
  `productsheet` varchar(200) DEFAULT NULL,
  `qtyindemand` int(11) DEFAULT NULL,
  `glacct` varchar(200) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `imagename` text,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_producttaxrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_producttaxrel` (
  `productid` int(11) NOT NULL,
  `taxid` int(3) NOT NULL,
  `taxpercentage` decimal(7,3) DEFAULT NULL,
  KEY `producttaxrel_productid_idx` (`productid`),
  KEY `producttaxrel_taxid_idx` (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile` (
  `profileid` int(10) NOT NULL AUTO_INCREMENT,
  `profilename` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`profileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_profile`
--

INSERT INTO `vtiger_profile` (`profileid`, `profilename`, `description`) VALUES
(1, 'Administrator', 'Admin Profile'),
(2, 'Sales Profile', 'Profile Related to Sales'),
(3, 'Support Profile', 'Profile Related to Support'),
(4, 'Guest Profile', 'Guest Profile for Test Users');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2field`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2field` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) DEFAULT NULL,
  `readonly` int(19) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`fieldid`),
  KEY `profile2field_profileid_tabid_fieldname_idx` (`profileid`,`tabid`),
  KEY `profile2field_tabid_profileid_idx` (`tabid`,`profileid`),
  KEY `profile2field_visible_profileid_idx` (`visible`,`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2field`
--

INSERT INTO `vtiger_profile2field` (`profileid`, `tabid`, `fieldid`, `visible`, `readonly`) VALUES
(1, 6, 1, 0, 0),
(1, 6, 2, 0, 0),
(1, 6, 3, 0, 0),
(1, 6, 4, 0, 0),
(1, 6, 5, 0, 0),
(1, 6, 6, 0, 0),
(1, 6, 7, 0, 0),
(1, 6, 8, 0, 0),
(1, 6, 9, 0, 0),
(1, 6, 10, 0, 0),
(1, 6, 11, 0, 0),
(1, 6, 12, 0, 0),
(1, 6, 13, 0, 0),
(1, 6, 14, 0, 0),
(1, 6, 15, 0, 0),
(1, 6, 16, 0, 0),
(1, 6, 17, 0, 0),
(1, 6, 18, 0, 0),
(1, 6, 19, 0, 0),
(1, 6, 20, 0, 0),
(1, 6, 21, 0, 0),
(1, 6, 22, 0, 0),
(1, 6, 23, 0, 0),
(1, 6, 24, 0, 0),
(1, 6, 25, 0, 0),
(1, 6, 26, 0, 0),
(1, 6, 27, 0, 0),
(1, 6, 28, 0, 0),
(1, 6, 29, 0, 0),
(1, 6, 30, 0, 0),
(1, 6, 31, 0, 0),
(1, 6, 32, 0, 0),
(1, 6, 33, 0, 0),
(1, 6, 34, 0, 0),
(1, 6, 35, 0, 0),
(1, 6, 36, 0, 0),
(1, 7, 37, 0, 0),
(1, 7, 38, 0, 0),
(1, 7, 39, 0, 0),
(1, 7, 40, 0, 0),
(1, 7, 41, 0, 0),
(1, 7, 42, 0, 0),
(1, 7, 43, 0, 0),
(1, 7, 44, 0, 0),
(1, 7, 45, 0, 0),
(1, 7, 46, 0, 0),
(1, 7, 47, 0, 0),
(1, 7, 48, 0, 0),
(1, 7, 49, 0, 0),
(1, 7, 50, 0, 0),
(1, 7, 51, 0, 0),
(1, 7, 52, 0, 0),
(1, 7, 53, 0, 0),
(1, 7, 54, 0, 0),
(1, 7, 55, 0, 0),
(1, 7, 56, 0, 0),
(1, 7, 57, 0, 0),
(1, 7, 58, 0, 0),
(1, 7, 59, 0, 0),
(1, 7, 60, 0, 0),
(1, 7, 61, 0, 0),
(1, 7, 62, 0, 0),
(1, 7, 63, 0, 0),
(1, 7, 64, 0, 0),
(1, 7, 65, 0, 0),
(1, 4, 66, 0, 0),
(1, 4, 67, 0, 0),
(1, 4, 68, 0, 0),
(1, 4, 69, 0, 0),
(1, 4, 70, 0, 0),
(1, 4, 71, 0, 0),
(1, 4, 72, 0, 0),
(1, 4, 73, 0, 0),
(1, 4, 74, 0, 0),
(1, 4, 75, 0, 0),
(1, 4, 76, 0, 0),
(1, 4, 77, 0, 0),
(1, 4, 78, 0, 0),
(1, 4, 79, 0, 0),
(1, 4, 80, 0, 0),
(1, 4, 81, 0, 0),
(1, 4, 82, 0, 0),
(1, 4, 83, 0, 0),
(1, 4, 84, 0, 0),
(1, 4, 85, 0, 0),
(1, 4, 86, 0, 0),
(1, 4, 87, 0, 0),
(1, 4, 88, 0, 0),
(1, 4, 89, 0, 0),
(1, 4, 90, 0, 0),
(1, 4, 91, 0, 0),
(1, 4, 92, 0, 0),
(1, 4, 93, 0, 0),
(1, 4, 94, 0, 0),
(1, 4, 95, 0, 0),
(1, 4, 96, 0, 0),
(1, 4, 97, 0, 0),
(1, 4, 98, 0, 0),
(1, 4, 99, 0, 0),
(1, 4, 100, 0, 0),
(1, 4, 101, 0, 0),
(1, 4, 102, 0, 0),
(1, 4, 103, 0, 0),
(1, 4, 104, 0, 0),
(1, 4, 105, 0, 0),
(1, 4, 106, 0, 0),
(1, 4, 107, 0, 0),
(1, 4, 108, 0, 0),
(1, 4, 109, 0, 0),
(1, 2, 110, 0, 0),
(1, 2, 111, 0, 0),
(1, 2, 112, 0, 0),
(1, 2, 113, 0, 0),
(1, 2, 114, 0, 0),
(1, 2, 115, 0, 0),
(1, 2, 116, 0, 0),
(1, 2, 117, 0, 0),
(1, 2, 118, 0, 0),
(1, 2, 119, 0, 0),
(1, 2, 120, 0, 0),
(1, 2, 121, 0, 0),
(1, 2, 122, 0, 0),
(1, 2, 123, 0, 0),
(1, 2, 124, 0, 0),
(1, 2, 125, 0, 0),
(1, 26, 126, 0, 0),
(1, 26, 127, 0, 0),
(1, 26, 128, 0, 0),
(1, 26, 129, 0, 0),
(1, 26, 130, 0, 0),
(1, 26, 131, 0, 0),
(1, 26, 132, 0, 0),
(1, 26, 133, 0, 0),
(1, 26, 134, 0, 0),
(1, 26, 135, 0, 0),
(1, 26, 136, 0, 0),
(1, 26, 137, 0, 0),
(1, 26, 138, 0, 0),
(1, 26, 139, 0, 0),
(1, 26, 140, 0, 0),
(1, 26, 141, 0, 0),
(1, 26, 142, 0, 0),
(1, 26, 143, 0, 0),
(1, 26, 144, 0, 0),
(1, 26, 145, 0, 0),
(1, 26, 146, 0, 0),
(1, 26, 147, 0, 0),
(1, 26, 148, 0, 0),
(1, 26, 149, 0, 0),
(1, 26, 150, 0, 0),
(1, 4, 151, 0, 0),
(1, 6, 152, 0, 0),
(1, 7, 153, 0, 0),
(1, 26, 154, 0, 0),
(1, 13, 155, 0, 0),
(1, 13, 156, 0, 0),
(1, 13, 157, 0, 0),
(1, 13, 158, 0, 0),
(1, 13, 159, 0, 0),
(1, 13, 160, 0, 0),
(1, 13, 161, 0, 0),
(1, 13, 162, 0, 0),
(1, 13, 163, 0, 0),
(1, 13, 164, 0, 0),
(1, 13, 165, 0, 0),
(1, 13, 166, 0, 0),
(1, 13, 167, 0, 0),
(1, 13, 168, 0, 0),
(1, 13, 169, 0, 0),
(1, 13, 170, 0, 0),
(1, 13, 171, 0, 0),
(1, 13, 172, 0, 0),
(1, 13, 173, 0, 0),
(1, 14, 174, 0, 0),
(1, 14, 175, 0, 0),
(1, 14, 176, 0, 0),
(1, 14, 177, 0, 0),
(1, 14, 178, 0, 0),
(1, 14, 179, 0, 0),
(1, 14, 180, 0, 0),
(1, 14, 181, 0, 0),
(1, 14, 182, 0, 0),
(1, 14, 183, 0, 0),
(1, 14, 184, 0, 0),
(1, 14, 185, 0, 0),
(1, 14, 186, 0, 0),
(1, 14, 187, 0, 0),
(1, 14, 188, 0, 0),
(1, 14, 189, 0, 0),
(1, 14, 190, 0, 0),
(1, 14, 191, 0, 0),
(1, 14, 192, 0, 0),
(1, 14, 193, 0, 0),
(1, 14, 194, 0, 0),
(1, 14, 195, 0, 0),
(1, 14, 196, 0, 0),
(1, 14, 197, 0, 0),
(1, 14, 198, 0, 0),
(1, 14, 199, 0, 0),
(1, 14, 200, 0, 0),
(1, 14, 201, 0, 0),
(1, 14, 202, 0, 0),
(1, 14, 203, 0, 0),
(1, 14, 204, 0, 0),
(1, 8, 205, 0, 0),
(1, 8, 206, 0, 0),
(1, 8, 207, 0, 0),
(1, 8, 208, 0, 0),
(1, 8, 209, 0, 0),
(1, 8, 210, 0, 0),
(1, 8, 211, 0, 0),
(1, 8, 212, 0, 0),
(1, 8, 213, 0, 0),
(1, 8, 214, 0, 0),
(1, 8, 215, 0, 0),
(1, 8, 216, 0, 0),
(1, 8, 217, 0, 0),
(1, 8, 218, 0, 0),
(1, 8, 219, 0, 0),
(1, 10, 220, 0, 0),
(1, 10, 221, 0, 0),
(1, 10, 222, 0, 0),
(1, 10, 223, 0, 0),
(1, 10, 224, 0, 0),
(1, 10, 225, 0, 0),
(1, 10, 226, 0, 0),
(1, 10, 227, 0, 0),
(1, 10, 228, 0, 0),
(1, 10, 229, 0, 0),
(1, 10, 230, 0, 0),
(1, 10, 231, 0, 0),
(1, 9, 232, 0, 0),
(1, 9, 233, 0, 0),
(1, 9, 234, 0, 0),
(1, 9, 235, 0, 0),
(1, 9, 236, 0, 0),
(1, 9, 237, 0, 0),
(1, 9, 238, 0, 0),
(1, 9, 239, 0, 0),
(1, 9, 240, 0, 0),
(1, 9, 241, 0, 0),
(1, 9, 242, 0, 0),
(1, 9, 243, 0, 0),
(1, 9, 244, 0, 0),
(1, 9, 245, 0, 0),
(1, 9, 246, 0, 0),
(1, 9, 247, 0, 0),
(1, 9, 248, 0, 0),
(1, 9, 249, 0, 0),
(1, 9, 250, 0, 0),
(1, 9, 251, 0, 0),
(1, 9, 252, 0, 0),
(1, 9, 253, 0, 0),
(1, 9, 254, 0, 0),
(1, 9, 255, 0, 0),
(1, 16, 256, 0, 0),
(1, 16, 257, 0, 0),
(1, 16, 258, 0, 0),
(1, 16, 259, 0, 0),
(1, 16, 260, 0, 0),
(1, 16, 261, 0, 0),
(1, 16, 262, 0, 0),
(1, 16, 263, 0, 0),
(1, 16, 264, 0, 0),
(1, 16, 265, 0, 0),
(1, 16, 266, 0, 0),
(1, 16, 267, 0, 0),
(1, 16, 268, 0, 0),
(1, 16, 269, 0, 0),
(1, 16, 270, 0, 0),
(1, 16, 271, 0, 0),
(1, 16, 272, 0, 0),
(1, 16, 273, 0, 0),
(1, 16, 274, 0, 0),
(1, 16, 275, 0, 0),
(1, 16, 276, 0, 0),
(1, 16, 277, 0, 0),
(1, 16, 278, 0, 0),
(1, 15, 279, 0, 0),
(1, 15, 280, 0, 0),
(1, 15, 281, 0, 0),
(1, 15, 282, 0, 0),
(1, 15, 283, 0, 0),
(1, 15, 284, 0, 0),
(1, 15, 285, 0, 0),
(1, 15, 286, 0, 0),
(1, 15, 287, 0, 0),
(1, 15, 288, 0, 0),
(1, 18, 289, 0, 0),
(1, 18, 290, 0, 0),
(1, 18, 291, 0, 0),
(1, 18, 292, 0, 0),
(1, 18, 293, 0, 0),
(1, 18, 294, 0, 0),
(1, 18, 295, 0, 0),
(1, 18, 296, 0, 0),
(1, 18, 297, 0, 0),
(1, 18, 298, 0, 0),
(1, 18, 299, 0, 0),
(1, 18, 300, 0, 0),
(1, 18, 301, 0, 0),
(1, 18, 302, 0, 0),
(1, 18, 303, 0, 0),
(1, 18, 304, 0, 0),
(1, 18, 305, 0, 0),
(1, 19, 306, 0, 0),
(1, 19, 307, 0, 0),
(1, 19, 308, 0, 0),
(1, 19, 309, 0, 0),
(1, 19, 310, 0, 0),
(1, 19, 311, 0, 0),
(1, 19, 312, 0, 0),
(1, 19, 313, 0, 0),
(1, 20, 314, 0, 0),
(1, 20, 315, 0, 0),
(1, 20, 316, 0, 0),
(1, 20, 317, 0, 0),
(1, 20, 318, 0, 0),
(1, 20, 319, 0, 0),
(1, 20, 320, 0, 0),
(1, 20, 321, 0, 0),
(1, 20, 322, 0, 0),
(1, 20, 323, 0, 0),
(1, 20, 324, 0, 0),
(1, 20, 325, 0, 0),
(1, 20, 326, 0, 0),
(1, 20, 327, 0, 0),
(1, 20, 328, 0, 0),
(1, 20, 329, 0, 0),
(1, 20, 330, 0, 0),
(1, 20, 331, 0, 0),
(1, 20, 332, 0, 0),
(1, 20, 333, 0, 0),
(1, 20, 334, 0, 0),
(1, 20, 335, 0, 0),
(1, 20, 336, 0, 0),
(1, 20, 337, 0, 0),
(1, 20, 338, 0, 0),
(1, 20, 339, 0, 0),
(1, 20, 340, 0, 0),
(1, 20, 341, 0, 0),
(1, 20, 342, 0, 0),
(1, 20, 343, 0, 0),
(1, 20, 344, 0, 0),
(1, 20, 345, 0, 0),
(1, 20, 346, 0, 0),
(1, 20, 347, 0, 0),
(1, 20, 348, 0, 0),
(1, 20, 349, 0, 0),
(1, 20, 350, 0, 0),
(1, 21, 351, 0, 0),
(1, 21, 352, 0, 0),
(1, 21, 353, 0, 0),
(1, 21, 354, 0, 0),
(1, 21, 355, 0, 0),
(1, 21, 356, 0, 0),
(1, 21, 357, 0, 0),
(1, 21, 358, 0, 0),
(1, 21, 359, 0, 0),
(1, 21, 360, 0, 0),
(1, 21, 361, 0, 0),
(1, 21, 362, 0, 0),
(1, 21, 363, 0, 0),
(1, 21, 364, 0, 0),
(1, 21, 365, 0, 0),
(1, 21, 366, 0, 0),
(1, 21, 367, 0, 0),
(1, 21, 368, 0, 0),
(1, 21, 369, 0, 0),
(1, 21, 370, 0, 0),
(1, 21, 371, 0, 0),
(1, 21, 372, 0, 0),
(1, 21, 373, 0, 0),
(1, 21, 374, 0, 0),
(1, 21, 375, 0, 0),
(1, 21, 376, 0, 0),
(1, 21, 377, 0, 0),
(1, 21, 378, 0, 0),
(1, 21, 379, 0, 0),
(1, 21, 380, 0, 0),
(1, 21, 381, 0, 0),
(1, 21, 382, 0, 0),
(1, 21, 383, 0, 0),
(1, 21, 384, 0, 0),
(1, 21, 385, 0, 0),
(1, 21, 386, 0, 0),
(1, 21, 387, 0, 0),
(1, 21, 388, 0, 0),
(1, 22, 389, 0, 0),
(1, 22, 390, 0, 0),
(1, 22, 391, 0, 0),
(1, 22, 392, 0, 0),
(1, 22, 393, 0, 0),
(1, 22, 394, 0, 0),
(1, 22, 395, 0, 0),
(1, 22, 396, 0, 0),
(1, 22, 397, 0, 0),
(1, 22, 398, 0, 0),
(1, 22, 399, 0, 0),
(1, 22, 400, 0, 0),
(1, 22, 401, 0, 0),
(1, 22, 402, 0, 0),
(1, 22, 403, 0, 0),
(1, 22, 404, 0, 0),
(1, 22, 405, 0, 0),
(1, 22, 406, 0, 0),
(1, 22, 407, 0, 0),
(1, 22, 408, 0, 0),
(1, 22, 409, 0, 0),
(1, 22, 410, 0, 0),
(1, 22, 411, 0, 0),
(1, 22, 412, 0, 0),
(1, 22, 413, 0, 0),
(1, 22, 414, 0, 0),
(1, 22, 415, 0, 0),
(1, 22, 416, 0, 0),
(1, 22, 417, 0, 0),
(1, 22, 418, 0, 0),
(1, 22, 419, 0, 0),
(1, 22, 420, 0, 0),
(1, 22, 421, 0, 0),
(1, 22, 422, 0, 0),
(1, 22, 423, 0, 0),
(1, 22, 424, 0, 0),
(1, 22, 425, 0, 0),
(1, 22, 426, 0, 0),
(1, 22, 427, 0, 0),
(1, 22, 428, 0, 0),
(1, 22, 429, 0, 0),
(1, 22, 430, 0, 0),
(1, 22, 431, 0, 0),
(1, 22, 432, 0, 0),
(1, 22, 433, 0, 0),
(1, 22, 434, 0, 0),
(1, 22, 435, 0, 0),
(1, 23, 436, 0, 0),
(1, 23, 437, 0, 0),
(1, 23, 438, 0, 0),
(1, 23, 439, 0, 0),
(1, 23, 440, 0, 0),
(1, 23, 441, 0, 0),
(1, 23, 442, 0, 0),
(1, 23, 443, 0, 0),
(1, 23, 444, 0, 0),
(1, 23, 445, 0, 0),
(1, 23, 446, 0, 0),
(1, 23, 447, 0, 0),
(1, 23, 448, 0, 0),
(1, 23, 449, 0, 0),
(1, 23, 450, 0, 0),
(1, 23, 451, 0, 0),
(1, 23, 452, 0, 0),
(1, 23, 453, 0, 0),
(1, 23, 454, 0, 0),
(1, 23, 455, 0, 0),
(1, 23, 456, 0, 0),
(1, 23, 457, 0, 0),
(1, 23, 458, 0, 0),
(1, 23, 459, 0, 0),
(1, 23, 460, 0, 0),
(1, 23, 461, 0, 0),
(1, 23, 462, 0, 0),
(1, 23, 463, 0, 0),
(1, 23, 464, 0, 0),
(1, 23, 465, 0, 0),
(1, 23, 466, 0, 0),
(1, 23, 467, 0, 0),
(1, 23, 468, 0, 0),
(1, 23, 469, 0, 0),
(1, 23, 470, 0, 0),
(1, 23, 471, 0, 0),
(1, 23, 472, 0, 0),
(1, 23, 473, 0, 0),
(1, 23, 474, 0, 0),
(1, 10, 519, 0, 0),
(1, 10, 520, 0, 0),
(1, 10, 521, 0, 0),
(1, 10, 522, 0, 0),
(1, 10, 523, 0, 0),
(1, 10, 524, 0, 0),
(1, 32, 525, 0, 0),
(1, 32, 526, 0, 0),
(1, 32, 527, 0, 0),
(1, 32, 528, 0, 0),
(1, 32, 529, 0, 0),
(1, 32, 530, 0, 0),
(1, 32, 531, 0, 0),
(1, 32, 532, 0, 0),
(1, 32, 533, 0, 0),
(1, 32, 534, 0, 0),
(1, 32, 535, 0, 0),
(1, 32, 536, 0, 0),
(1, 32, 537, 0, 0),
(1, 32, 538, 0, 0),
(1, 32, 539, 0, 0),
(1, 32, 540, 0, 0),
(1, 32, 541, 0, 0),
(1, 32, 542, 0, 0),
(1, 32, 543, 0, 0),
(1, 38, 544, 0, 0),
(1, 38, 545, 0, 0),
(1, 38, 546, 0, 0),
(1, 38, 547, 0, 0),
(1, 38, 548, 0, 0),
(1, 38, 549, 0, 0),
(1, 38, 550, 0, 0),
(1, 38, 551, 0, 0),
(1, 38, 552, 0, 0),
(1, 38, 553, 0, 0),
(1, 38, 554, 0, 0),
(1, 38, 555, 0, 0),
(1, 38, 556, 0, 0),
(1, 38, 557, 0, 0),
(1, 38, 558, 0, 0),
(1, 38, 559, 0, 0),
(1, 38, 560, 0, 0),
(1, 38, 561, 0, 0),
(1, 38, 562, 0, 0),
(1, 40, 563, 0, 0),
(1, 40, 564, 0, 0),
(1, 40, 565, 0, 0),
(1, 40, 566, 0, 0),
(1, 42, 569, 0, 0),
(1, 42, 570, 0, 0),
(1, 42, 571, 0, 0),
(1, 42, 572, 0, 0),
(1, 42, 573, 0, 0),
(1, 42, 574, 0, 0),
(1, 42, 575, 0, 0),
(1, 44, 576, 0, 0),
(1, 44, 577, 0, 0),
(1, 44, 578, 0, 0),
(1, 44, 579, 0, 0),
(1, 44, 580, 0, 0),
(1, 44, 581, 0, 0),
(1, 44, 582, 0, 0),
(1, 44, 583, 0, 0),
(1, 44, 584, 0, 0),
(1, 44, 585, 0, 0),
(1, 44, 586, 0, 0),
(1, 44, 587, 0, 0),
(1, 44, 588, 0, 0),
(1, 44, 589, 0, 0),
(1, 44, 590, 0, 0),
(1, 44, 591, 0, 0),
(1, 44, 592, 0, 0),
(1, 47, 593, 0, 0),
(1, 47, 594, 0, 0),
(1, 47, 595, 0, 0),
(1, 47, 596, 0, 0),
(1, 47, 597, 0, 0),
(1, 50, 598, 0, 0),
(1, 50, 599, 0, 0),
(1, 50, 600, 0, 0),
(1, 50, 601, 0, 0),
(1, 50, 602, 0, 0),
(1, 50, 603, 0, 0),
(1, 50, 604, 0, 0),
(1, 50, 605, 0, 0),
(1, 50, 606, 0, 0),
(1, 50, 607, 0, 0),
(1, 51, 608, 0, 0),
(1, 51, 609, 0, 0),
(1, 51, 610, 0, 0),
(1, 51, 611, 0, 0),
(1, 51, 612, 0, 0),
(1, 51, 613, 0, 0),
(1, 51, 614, 0, 0),
(1, 51, 615, 0, 0),
(1, 51, 616, 0, 0),
(1, 51, 617, 0, 0),
(1, 51, 618, 0, 0),
(1, 51, 619, 0, 0),
(1, 51, 620, 0, 0),
(1, 51, 621, 0, 0),
(1, 51, 622, 0, 0),
(1, 52, 623, 0, 0),
(1, 52, 624, 0, 0),
(1, 52, 625, 0, 0),
(1, 52, 626, 0, 0),
(1, 52, 627, 0, 0),
(1, 52, 628, 0, 0),
(1, 52, 629, 0, 0),
(1, 52, 630, 0, 0),
(1, 52, 631, 0, 0),
(1, 52, 632, 0, 0),
(1, 52, 633, 0, 0),
(1, 52, 634, 0, 0),
(1, 52, 635, 0, 0),
(1, 52, 636, 0, 0),
(1, 52, 637, 0, 0),
(1, 52, 638, 0, 0),
(1, 52, 639, 0, 0),
(2, 6, 1, 0, 0),
(2, 6, 2, 0, 0),
(2, 6, 3, 0, 0),
(2, 6, 4, 0, 0),
(2, 6, 5, 0, 0),
(2, 6, 6, 0, 0),
(2, 6, 7, 0, 0),
(2, 6, 8, 0, 0),
(2, 6, 9, 0, 0),
(2, 6, 10, 0, 0),
(2, 6, 11, 0, 0),
(2, 6, 12, 0, 0),
(2, 6, 13, 0, 0),
(2, 6, 14, 0, 0),
(2, 6, 15, 0, 0),
(2, 6, 16, 0, 0),
(2, 6, 17, 0, 0),
(2, 6, 18, 0, 0),
(2, 6, 19, 0, 0),
(2, 6, 20, 0, 0),
(2, 6, 21, 0, 0),
(2, 6, 22, 0, 0),
(2, 6, 23, 0, 0),
(2, 6, 24, 0, 0),
(2, 6, 25, 0, 0),
(2, 6, 26, 0, 0),
(2, 6, 27, 0, 0),
(2, 6, 28, 0, 0),
(2, 6, 29, 0, 0),
(2, 6, 30, 0, 0),
(2, 6, 31, 0, 0),
(2, 6, 32, 0, 0),
(2, 6, 33, 0, 0),
(2, 6, 34, 0, 0),
(2, 6, 35, 0, 0),
(2, 6, 36, 0, 0),
(2, 7, 37, 0, 0),
(2, 7, 38, 0, 0),
(2, 7, 39, 0, 0),
(2, 7, 40, 0, 0),
(2, 7, 41, 0, 0),
(2, 7, 42, 0, 0),
(2, 7, 43, 0, 0),
(2, 7, 44, 0, 0),
(2, 7, 45, 0, 0),
(2, 7, 46, 0, 0),
(2, 7, 47, 0, 0),
(2, 7, 48, 0, 0),
(2, 7, 49, 0, 0),
(2, 7, 50, 0, 0),
(2, 7, 51, 0, 0),
(2, 7, 52, 0, 0),
(2, 7, 53, 0, 0),
(2, 7, 54, 0, 0),
(2, 7, 55, 0, 0),
(2, 7, 56, 0, 0),
(2, 7, 57, 0, 0),
(2, 7, 58, 0, 0),
(2, 7, 59, 0, 0),
(2, 7, 60, 0, 0),
(2, 7, 61, 0, 0),
(2, 7, 62, 0, 0),
(2, 7, 63, 0, 0),
(2, 7, 64, 0, 0),
(2, 7, 65, 0, 0),
(2, 4, 66, 0, 0),
(2, 4, 67, 0, 0),
(2, 4, 68, 0, 0),
(2, 4, 69, 0, 0),
(2, 4, 70, 0, 0),
(2, 4, 71, 0, 0),
(2, 4, 72, 0, 0),
(2, 4, 73, 0, 0),
(2, 4, 74, 0, 0),
(2, 4, 75, 0, 0),
(2, 4, 76, 0, 0),
(2, 4, 77, 0, 0),
(2, 4, 78, 0, 0),
(2, 4, 79, 0, 0),
(2, 4, 80, 0, 0),
(2, 4, 81, 0, 0),
(2, 4, 82, 0, 0),
(2, 4, 83, 0, 0),
(2, 4, 84, 0, 0),
(2, 4, 85, 0, 0),
(2, 4, 86, 0, 0),
(2, 4, 87, 0, 0),
(2, 4, 88, 0, 0),
(2, 4, 89, 0, 0),
(2, 4, 90, 0, 0),
(2, 4, 91, 0, 0),
(2, 4, 92, 0, 0),
(2, 4, 93, 0, 0),
(2, 4, 94, 0, 0),
(2, 4, 95, 0, 0),
(2, 4, 96, 0, 0),
(2, 4, 97, 0, 0),
(2, 4, 98, 0, 0),
(2, 4, 99, 0, 0),
(2, 4, 100, 0, 0),
(2, 4, 101, 0, 0),
(2, 4, 102, 0, 0),
(2, 4, 103, 0, 0),
(2, 4, 104, 0, 0),
(2, 4, 105, 0, 0),
(2, 4, 106, 0, 0),
(2, 4, 107, 0, 0),
(2, 4, 108, 0, 0),
(2, 4, 109, 0, 0),
(2, 2, 110, 0, 0),
(2, 2, 111, 0, 0),
(2, 2, 112, 0, 0),
(2, 2, 113, 0, 0),
(2, 2, 114, 0, 0),
(2, 2, 115, 0, 0),
(2, 2, 116, 0, 0),
(2, 2, 117, 0, 0),
(2, 2, 118, 0, 0),
(2, 2, 119, 0, 0),
(2, 2, 120, 0, 0),
(2, 2, 121, 0, 0),
(2, 2, 122, 0, 0),
(2, 2, 123, 0, 0),
(2, 2, 124, 0, 0),
(2, 2, 125, 0, 0),
(2, 26, 126, 0, 0),
(2, 26, 127, 0, 0),
(2, 26, 128, 0, 0),
(2, 26, 129, 0, 0),
(2, 26, 130, 0, 0),
(2, 26, 131, 0, 0),
(2, 26, 132, 0, 0),
(2, 26, 133, 0, 0),
(2, 26, 134, 0, 0),
(2, 26, 135, 0, 0),
(2, 26, 136, 0, 0),
(2, 26, 137, 0, 0),
(2, 26, 138, 0, 0),
(2, 26, 139, 0, 0),
(2, 26, 140, 0, 0),
(2, 26, 141, 0, 0),
(2, 26, 142, 0, 0),
(2, 26, 143, 0, 0),
(2, 26, 144, 0, 0),
(2, 26, 145, 0, 0),
(2, 26, 146, 0, 0),
(2, 26, 147, 0, 0),
(2, 26, 148, 0, 0),
(2, 26, 149, 0, 0),
(2, 26, 150, 0, 0),
(2, 4, 151, 0, 0),
(2, 6, 152, 0, 0),
(2, 7, 153, 0, 0),
(2, 26, 154, 0, 0),
(2, 13, 155, 0, 0),
(2, 13, 156, 0, 0),
(2, 13, 157, 0, 0),
(2, 13, 158, 0, 0),
(2, 13, 159, 0, 0),
(2, 13, 160, 0, 0),
(2, 13, 161, 0, 0),
(2, 13, 162, 0, 0),
(2, 13, 163, 0, 0),
(2, 13, 164, 0, 0),
(2, 13, 165, 0, 0),
(2, 13, 166, 0, 0),
(2, 13, 167, 0, 0),
(2, 13, 168, 0, 0),
(2, 13, 169, 0, 0),
(2, 13, 170, 0, 0),
(2, 13, 171, 0, 0),
(2, 13, 172, 0, 0),
(2, 13, 173, 0, 0),
(2, 14, 174, 0, 0),
(2, 14, 175, 0, 0),
(2, 14, 176, 0, 0),
(2, 14, 177, 0, 0),
(2, 14, 178, 0, 0),
(2, 14, 179, 0, 0),
(2, 14, 180, 0, 0),
(2, 14, 181, 0, 0),
(2, 14, 182, 0, 0),
(2, 14, 183, 0, 0),
(2, 14, 184, 0, 0),
(2, 14, 185, 0, 0),
(2, 14, 186, 0, 0),
(2, 14, 187, 0, 0),
(2, 14, 188, 0, 0),
(2, 14, 189, 0, 0),
(2, 14, 190, 0, 0),
(2, 14, 191, 0, 0),
(2, 14, 192, 0, 0),
(2, 14, 193, 0, 0),
(2, 14, 194, 0, 0),
(2, 14, 195, 0, 0),
(2, 14, 196, 0, 0),
(2, 14, 197, 0, 0),
(2, 14, 198, 0, 0),
(2, 14, 199, 0, 0),
(2, 14, 200, 0, 0),
(2, 14, 201, 0, 0),
(2, 14, 202, 0, 0),
(2, 14, 203, 0, 0),
(2, 14, 204, 0, 0),
(2, 8, 205, 0, 0),
(2, 8, 206, 0, 0),
(2, 8, 207, 0, 0),
(2, 8, 208, 0, 0),
(2, 8, 209, 0, 0),
(2, 8, 210, 0, 0),
(2, 8, 211, 0, 0),
(2, 8, 212, 0, 0),
(2, 8, 213, 0, 0),
(2, 8, 214, 0, 0),
(2, 8, 215, 0, 0),
(2, 8, 216, 0, 0),
(2, 8, 217, 0, 0),
(2, 8, 218, 0, 0),
(2, 8, 219, 0, 0),
(2, 10, 220, 0, 0),
(2, 10, 221, 0, 0),
(2, 10, 222, 0, 0),
(2, 10, 223, 0, 0),
(2, 10, 224, 0, 0),
(2, 10, 225, 0, 0),
(2, 10, 226, 0, 0),
(2, 10, 227, 0, 0),
(2, 10, 228, 0, 0),
(2, 10, 229, 0, 0),
(2, 10, 230, 0, 0),
(2, 10, 231, 0, 0),
(2, 9, 232, 0, 0),
(2, 9, 233, 0, 0),
(2, 9, 234, 0, 0),
(2, 9, 235, 0, 0),
(2, 9, 236, 0, 0),
(2, 9, 237, 0, 0),
(2, 9, 238, 0, 0),
(2, 9, 239, 0, 0),
(2, 9, 240, 0, 0),
(2, 9, 241, 0, 0),
(2, 9, 242, 0, 0),
(2, 9, 243, 0, 0),
(2, 9, 244, 0, 0),
(2, 9, 245, 0, 0),
(2, 9, 246, 0, 0),
(2, 9, 247, 0, 0),
(2, 9, 248, 0, 0),
(2, 9, 249, 0, 0),
(2, 9, 250, 0, 0),
(2, 9, 251, 0, 0),
(2, 9, 252, 0, 0),
(2, 9, 253, 0, 0),
(2, 9, 254, 0, 0),
(2, 9, 255, 0, 0),
(2, 16, 256, 0, 0),
(2, 16, 257, 0, 0),
(2, 16, 258, 0, 0),
(2, 16, 259, 0, 0),
(2, 16, 260, 0, 0),
(2, 16, 261, 0, 0),
(2, 16, 262, 0, 0),
(2, 16, 263, 0, 0),
(2, 16, 264, 0, 0),
(2, 16, 265, 0, 0),
(2, 16, 266, 0, 0),
(2, 16, 267, 0, 0),
(2, 16, 268, 0, 0),
(2, 16, 269, 0, 0),
(2, 16, 270, 0, 0),
(2, 16, 271, 0, 0),
(2, 16, 272, 0, 0),
(2, 16, 273, 0, 0),
(2, 16, 274, 0, 0),
(2, 16, 275, 0, 0),
(2, 16, 276, 0, 0),
(2, 16, 277, 0, 0),
(2, 16, 278, 0, 0),
(2, 15, 279, 0, 0),
(2, 15, 280, 0, 0),
(2, 15, 281, 0, 0),
(2, 15, 282, 0, 0),
(2, 15, 283, 0, 0),
(2, 15, 284, 0, 0),
(2, 15, 285, 0, 0),
(2, 15, 286, 0, 0),
(2, 15, 287, 0, 0),
(2, 15, 288, 0, 0),
(2, 18, 289, 0, 0),
(2, 18, 290, 0, 0),
(2, 18, 291, 0, 0),
(2, 18, 292, 0, 0),
(2, 18, 293, 0, 0),
(2, 18, 294, 0, 0),
(2, 18, 295, 0, 0),
(2, 18, 296, 0, 0),
(2, 18, 297, 0, 0),
(2, 18, 298, 0, 0),
(2, 18, 299, 0, 0),
(2, 18, 300, 0, 0),
(2, 18, 301, 0, 0),
(2, 18, 302, 0, 0),
(2, 18, 303, 0, 0),
(2, 18, 304, 0, 0),
(2, 18, 305, 0, 0),
(2, 19, 306, 0, 0),
(2, 19, 307, 0, 0),
(2, 19, 308, 0, 0),
(2, 19, 309, 0, 0),
(2, 19, 310, 0, 0),
(2, 19, 311, 0, 0),
(2, 19, 312, 0, 0),
(2, 19, 313, 0, 0),
(2, 20, 314, 0, 0),
(2, 20, 315, 0, 0),
(2, 20, 316, 0, 0),
(2, 20, 317, 0, 0),
(2, 20, 318, 0, 0),
(2, 20, 319, 0, 0),
(2, 20, 320, 0, 0),
(2, 20, 321, 0, 0),
(2, 20, 322, 0, 0),
(2, 20, 323, 0, 0),
(2, 20, 324, 0, 0),
(2, 20, 325, 0, 0),
(2, 20, 326, 0, 0),
(2, 20, 327, 0, 0),
(2, 20, 328, 0, 0),
(2, 20, 329, 0, 0),
(2, 20, 330, 0, 0),
(2, 20, 331, 0, 0),
(2, 20, 332, 0, 0),
(2, 20, 333, 0, 0),
(2, 20, 334, 0, 0),
(2, 20, 335, 0, 0),
(2, 20, 336, 0, 0),
(2, 20, 337, 0, 0),
(2, 20, 338, 0, 0),
(2, 20, 339, 0, 0),
(2, 20, 340, 0, 0),
(2, 20, 341, 0, 0),
(2, 20, 342, 0, 0),
(2, 20, 343, 0, 0),
(2, 20, 344, 0, 0),
(2, 20, 345, 0, 0),
(2, 20, 346, 0, 0),
(2, 20, 347, 0, 0),
(2, 20, 348, 0, 0),
(2, 20, 349, 0, 0),
(2, 20, 350, 0, 0),
(2, 21, 351, 0, 0),
(2, 21, 352, 0, 0),
(2, 21, 353, 0, 0),
(2, 21, 354, 0, 0),
(2, 21, 355, 0, 0),
(2, 21, 356, 0, 0),
(2, 21, 357, 0, 0),
(2, 21, 358, 0, 0),
(2, 21, 359, 0, 0),
(2, 21, 360, 0, 0),
(2, 21, 361, 0, 0),
(2, 21, 362, 0, 0),
(2, 21, 363, 0, 0),
(2, 21, 364, 0, 0),
(2, 21, 365, 0, 0),
(2, 21, 366, 0, 0),
(2, 21, 367, 0, 0),
(2, 21, 368, 0, 0),
(2, 21, 369, 0, 0),
(2, 21, 370, 0, 0),
(2, 21, 371, 0, 0),
(2, 21, 372, 0, 0),
(2, 21, 373, 0, 0),
(2, 21, 374, 0, 0),
(2, 21, 375, 0, 0),
(2, 21, 376, 0, 0),
(2, 21, 377, 0, 0),
(2, 21, 378, 0, 0),
(2, 21, 379, 0, 0),
(2, 21, 380, 0, 0),
(2, 21, 381, 0, 0),
(2, 21, 382, 0, 0),
(2, 21, 383, 0, 0),
(2, 21, 384, 0, 0),
(2, 21, 385, 0, 0),
(2, 21, 386, 0, 0),
(2, 21, 387, 0, 0),
(2, 21, 388, 0, 0),
(2, 22, 389, 0, 0),
(2, 22, 390, 0, 0),
(2, 22, 391, 0, 0),
(2, 22, 392, 0, 0),
(2, 22, 393, 0, 0),
(2, 22, 394, 0, 0),
(2, 22, 395, 0, 0),
(2, 22, 396, 0, 0),
(2, 22, 397, 0, 0),
(2, 22, 398, 0, 0),
(2, 22, 399, 0, 0),
(2, 22, 400, 0, 0),
(2, 22, 401, 0, 0),
(2, 22, 402, 0, 0),
(2, 22, 403, 0, 0),
(2, 22, 404, 0, 0),
(2, 22, 405, 0, 0),
(2, 22, 406, 0, 0),
(2, 22, 407, 0, 0),
(2, 22, 408, 0, 0),
(2, 22, 409, 0, 0),
(2, 22, 410, 0, 0),
(2, 22, 411, 0, 0),
(2, 22, 412, 0, 0),
(2, 22, 413, 0, 0),
(2, 22, 414, 0, 0),
(2, 22, 415, 0, 0),
(2, 22, 416, 0, 0),
(2, 22, 417, 0, 0),
(2, 22, 418, 0, 0),
(2, 22, 419, 0, 0),
(2, 22, 420, 0, 0),
(2, 22, 421, 0, 0),
(2, 22, 422, 0, 0),
(2, 22, 423, 0, 0),
(2, 22, 424, 0, 0),
(2, 22, 425, 0, 0),
(2, 22, 426, 0, 0),
(2, 22, 427, 0, 0),
(2, 22, 428, 0, 0),
(2, 22, 429, 0, 0),
(2, 22, 430, 0, 0),
(2, 22, 431, 0, 0),
(2, 22, 432, 0, 0),
(2, 22, 433, 0, 0),
(2, 22, 434, 0, 0),
(2, 22, 435, 0, 0),
(2, 23, 436, 0, 0),
(2, 23, 437, 0, 0),
(2, 23, 438, 0, 0),
(2, 23, 439, 0, 0),
(2, 23, 440, 0, 0),
(2, 23, 441, 0, 0),
(2, 23, 442, 0, 0),
(2, 23, 443, 0, 0),
(2, 23, 444, 0, 0),
(2, 23, 445, 0, 0),
(2, 23, 446, 0, 0),
(2, 23, 447, 0, 0),
(2, 23, 448, 0, 0),
(2, 23, 449, 0, 0),
(2, 23, 450, 0, 0),
(2, 23, 451, 0, 0),
(2, 23, 452, 0, 0),
(2, 23, 453, 0, 0),
(2, 23, 454, 0, 0),
(2, 23, 455, 0, 0),
(2, 23, 456, 0, 0),
(2, 23, 457, 0, 0),
(2, 23, 458, 0, 0),
(2, 23, 459, 0, 0),
(2, 23, 460, 0, 0),
(2, 23, 461, 0, 0),
(2, 23, 462, 0, 0),
(2, 23, 463, 0, 0),
(2, 23, 464, 0, 0),
(2, 23, 465, 0, 0),
(2, 23, 466, 0, 0),
(2, 23, 467, 0, 0),
(2, 23, 468, 0, 0),
(2, 23, 469, 0, 0),
(2, 23, 470, 0, 0),
(2, 23, 471, 0, 0),
(2, 23, 472, 0, 0),
(2, 23, 473, 0, 0),
(2, 23, 474, 0, 0),
(2, 10, 519, 0, 0),
(2, 10, 520, 0, 0),
(2, 10, 521, 0, 0),
(2, 10, 522, 0, 0),
(2, 10, 523, 0, 0),
(2, 10, 524, 0, 0),
(2, 32, 525, 0, 0),
(2, 32, 526, 0, 0),
(2, 32, 527, 0, 0),
(2, 32, 528, 0, 0),
(2, 32, 529, 0, 0),
(2, 32, 530, 0, 0),
(2, 32, 531, 0, 0),
(2, 32, 532, 0, 0),
(2, 32, 533, 0, 0),
(2, 32, 534, 0, 0),
(2, 32, 535, 0, 0),
(2, 32, 536, 0, 0),
(2, 32, 537, 0, 0),
(2, 32, 538, 0, 0),
(2, 32, 539, 0, 0),
(2, 32, 540, 0, 0),
(2, 32, 541, 0, 0),
(2, 32, 542, 0, 0),
(2, 32, 543, 0, 0),
(2, 38, 544, 0, 0),
(2, 38, 545, 0, 0),
(2, 38, 546, 0, 0),
(2, 38, 547, 0, 0),
(2, 38, 548, 0, 0),
(2, 38, 549, 0, 0),
(2, 38, 550, 0, 0),
(2, 38, 551, 0, 0),
(2, 38, 552, 0, 0),
(2, 38, 553, 0, 0),
(2, 38, 554, 0, 0),
(2, 38, 555, 0, 0),
(2, 38, 556, 0, 0),
(2, 38, 557, 0, 0),
(2, 38, 558, 0, 0),
(2, 38, 559, 0, 0),
(2, 38, 560, 0, 0),
(2, 38, 561, 0, 0),
(2, 38, 562, 0, 0),
(2, 40, 563, 0, 0),
(2, 40, 564, 0, 0),
(2, 40, 565, 0, 0),
(2, 40, 566, 0, 0),
(2, 42, 569, 0, 0),
(2, 42, 570, 0, 0),
(2, 42, 571, 0, 0),
(2, 42, 572, 0, 0),
(2, 42, 573, 0, 0),
(2, 42, 574, 0, 0),
(2, 42, 575, 0, 0),
(2, 44, 576, 0, 0),
(2, 44, 577, 0, 0),
(2, 44, 578, 0, 0),
(2, 44, 579, 0, 0),
(2, 44, 580, 0, 0),
(2, 44, 581, 0, 0),
(2, 44, 582, 0, 0),
(2, 44, 583, 0, 0),
(2, 44, 584, 0, 0),
(2, 44, 585, 0, 0),
(2, 44, 586, 0, 0),
(2, 44, 587, 0, 0),
(2, 44, 588, 0, 0),
(2, 44, 589, 0, 0),
(2, 44, 590, 0, 0),
(2, 44, 591, 0, 0),
(2, 44, 592, 0, 0),
(2, 47, 593, 0, 0),
(2, 47, 594, 0, 0),
(2, 47, 595, 0, 0),
(2, 47, 596, 0, 0),
(2, 47, 597, 0, 0),
(2, 50, 598, 0, 0),
(2, 50, 599, 0, 0),
(2, 50, 600, 0, 0),
(2, 50, 601, 0, 0),
(2, 50, 602, 0, 0),
(2, 50, 603, 0, 0),
(2, 50, 604, 0, 0),
(2, 50, 605, 0, 0),
(2, 50, 606, 0, 0),
(2, 50, 607, 0, 0),
(2, 51, 608, 0, 0),
(2, 51, 609, 0, 0),
(2, 51, 610, 0, 0),
(2, 51, 611, 0, 0),
(2, 51, 612, 0, 0),
(2, 51, 613, 0, 0),
(2, 51, 614, 0, 0),
(2, 51, 615, 0, 0),
(2, 51, 616, 0, 0),
(2, 51, 617, 0, 0),
(2, 51, 618, 0, 0),
(2, 51, 619, 0, 0),
(2, 51, 620, 0, 0),
(2, 51, 621, 0, 0),
(2, 51, 622, 0, 0),
(2, 52, 623, 0, 0),
(2, 52, 624, 0, 0),
(2, 52, 625, 0, 0),
(2, 52, 626, 0, 0),
(2, 52, 627, 0, 0),
(2, 52, 628, 0, 0),
(2, 52, 629, 0, 0),
(2, 52, 630, 0, 0),
(2, 52, 631, 0, 0),
(2, 52, 632, 0, 0),
(2, 52, 633, 0, 0),
(2, 52, 634, 0, 0),
(2, 52, 635, 0, 0),
(2, 52, 636, 0, 0),
(2, 52, 637, 0, 0),
(2, 52, 638, 0, 0),
(2, 52, 639, 0, 0),
(3, 6, 1, 0, 0),
(3, 6, 2, 0, 0),
(3, 6, 3, 0, 0),
(3, 6, 4, 0, 0),
(3, 6, 5, 0, 0),
(3, 6, 6, 0, 0),
(3, 6, 7, 0, 0),
(3, 6, 8, 0, 0),
(3, 6, 9, 0, 0),
(3, 6, 10, 0, 0),
(3, 6, 11, 0, 0),
(3, 6, 12, 0, 0),
(3, 6, 13, 0, 0),
(3, 6, 14, 0, 0),
(3, 6, 15, 0, 0),
(3, 6, 16, 0, 0),
(3, 6, 17, 0, 0),
(3, 6, 18, 0, 0),
(3, 6, 19, 0, 0),
(3, 6, 20, 0, 0),
(3, 6, 21, 0, 0),
(3, 6, 22, 0, 0),
(3, 6, 23, 0, 0),
(3, 6, 24, 0, 0),
(3, 6, 25, 0, 0),
(3, 6, 26, 0, 0),
(3, 6, 27, 0, 0),
(3, 6, 28, 0, 0),
(3, 6, 29, 0, 0),
(3, 6, 30, 0, 0),
(3, 6, 31, 0, 0),
(3, 6, 32, 0, 0),
(3, 6, 33, 0, 0),
(3, 6, 34, 0, 0),
(3, 6, 35, 0, 0),
(3, 6, 36, 0, 0),
(3, 7, 37, 0, 0),
(3, 7, 38, 0, 0),
(3, 7, 39, 0, 0),
(3, 7, 40, 0, 0),
(3, 7, 41, 0, 0),
(3, 7, 42, 0, 0),
(3, 7, 43, 0, 0),
(3, 7, 44, 0, 0),
(3, 7, 45, 0, 0),
(3, 7, 46, 0, 0),
(3, 7, 47, 0, 0),
(3, 7, 48, 0, 0),
(3, 7, 49, 0, 0),
(3, 7, 50, 0, 0),
(3, 7, 51, 0, 0),
(3, 7, 52, 0, 0),
(3, 7, 53, 0, 0),
(3, 7, 54, 0, 0),
(3, 7, 55, 0, 0),
(3, 7, 56, 0, 0),
(3, 7, 57, 0, 0),
(3, 7, 58, 0, 0),
(3, 7, 59, 0, 0),
(3, 7, 60, 0, 0),
(3, 7, 61, 0, 0),
(3, 7, 62, 0, 0),
(3, 7, 63, 0, 0),
(3, 7, 64, 0, 0),
(3, 7, 65, 0, 0),
(3, 4, 66, 0, 0),
(3, 4, 67, 0, 0),
(3, 4, 68, 0, 0),
(3, 4, 69, 0, 0),
(3, 4, 70, 0, 0),
(3, 4, 71, 0, 0),
(3, 4, 72, 0, 0),
(3, 4, 73, 0, 0),
(3, 4, 74, 0, 0),
(3, 4, 75, 0, 0),
(3, 4, 76, 0, 0),
(3, 4, 77, 0, 0),
(3, 4, 78, 0, 0),
(3, 4, 79, 0, 0),
(3, 4, 80, 0, 0),
(3, 4, 81, 0, 0),
(3, 4, 82, 0, 0),
(3, 4, 83, 0, 0),
(3, 4, 84, 0, 0),
(3, 4, 85, 0, 0),
(3, 4, 86, 0, 0),
(3, 4, 87, 0, 0),
(3, 4, 88, 0, 0),
(3, 4, 89, 0, 0),
(3, 4, 90, 0, 0),
(3, 4, 91, 0, 0),
(3, 4, 92, 0, 0),
(3, 4, 93, 0, 0),
(3, 4, 94, 0, 0),
(3, 4, 95, 0, 0),
(3, 4, 96, 0, 0),
(3, 4, 97, 0, 0),
(3, 4, 98, 0, 0),
(3, 4, 99, 0, 0),
(3, 4, 100, 0, 0),
(3, 4, 101, 0, 0),
(3, 4, 102, 0, 0),
(3, 4, 103, 0, 0),
(3, 4, 104, 0, 0),
(3, 4, 105, 0, 0),
(3, 4, 106, 0, 0),
(3, 4, 107, 0, 0),
(3, 4, 108, 0, 0),
(3, 4, 109, 0, 0),
(3, 2, 110, 0, 0),
(3, 2, 111, 0, 0),
(3, 2, 112, 0, 0),
(3, 2, 113, 0, 0),
(3, 2, 114, 0, 0),
(3, 2, 115, 0, 0),
(3, 2, 116, 0, 0),
(3, 2, 117, 0, 0),
(3, 2, 118, 0, 0),
(3, 2, 119, 0, 0),
(3, 2, 120, 0, 0),
(3, 2, 121, 0, 0),
(3, 2, 122, 0, 0),
(3, 2, 123, 0, 0),
(3, 2, 124, 0, 0),
(3, 2, 125, 0, 0),
(3, 26, 126, 0, 0),
(3, 26, 127, 0, 0),
(3, 26, 128, 0, 0),
(3, 26, 129, 0, 0),
(3, 26, 130, 0, 0),
(3, 26, 131, 0, 0),
(3, 26, 132, 0, 0),
(3, 26, 133, 0, 0),
(3, 26, 134, 0, 0),
(3, 26, 135, 0, 0),
(3, 26, 136, 0, 0),
(3, 26, 137, 0, 0),
(3, 26, 138, 0, 0),
(3, 26, 139, 0, 0),
(3, 26, 140, 0, 0),
(3, 26, 141, 0, 0),
(3, 26, 142, 0, 0),
(3, 26, 143, 0, 0),
(3, 26, 144, 0, 0),
(3, 26, 145, 0, 0),
(3, 26, 146, 0, 0),
(3, 26, 147, 0, 0),
(3, 26, 148, 0, 0),
(3, 26, 149, 0, 0),
(3, 26, 150, 0, 0),
(3, 4, 151, 0, 0),
(3, 6, 152, 0, 0),
(3, 7, 153, 0, 0),
(3, 26, 154, 0, 0),
(3, 13, 155, 0, 0),
(3, 13, 156, 0, 0),
(3, 13, 157, 0, 0),
(3, 13, 158, 0, 0),
(3, 13, 159, 0, 0),
(3, 13, 160, 0, 0),
(3, 13, 161, 0, 0),
(3, 13, 162, 0, 0),
(3, 13, 163, 0, 0),
(3, 13, 164, 0, 0),
(3, 13, 165, 0, 0),
(3, 13, 166, 0, 0),
(3, 13, 167, 0, 0),
(3, 13, 168, 0, 0),
(3, 13, 169, 0, 0),
(3, 13, 170, 0, 0),
(3, 13, 171, 0, 0),
(3, 13, 172, 0, 0),
(3, 13, 173, 0, 0),
(3, 14, 174, 0, 0),
(3, 14, 175, 0, 0),
(3, 14, 176, 0, 0),
(3, 14, 177, 0, 0),
(3, 14, 178, 0, 0),
(3, 14, 179, 0, 0),
(3, 14, 180, 0, 0),
(3, 14, 181, 0, 0),
(3, 14, 182, 0, 0),
(3, 14, 183, 0, 0),
(3, 14, 184, 0, 0),
(3, 14, 185, 0, 0),
(3, 14, 186, 0, 0),
(3, 14, 187, 0, 0),
(3, 14, 188, 0, 0),
(3, 14, 189, 0, 0),
(3, 14, 190, 0, 0),
(3, 14, 191, 0, 0),
(3, 14, 192, 0, 0),
(3, 14, 193, 0, 0),
(3, 14, 194, 0, 0),
(3, 14, 195, 0, 0),
(3, 14, 196, 0, 0),
(3, 14, 197, 0, 0),
(3, 14, 198, 0, 0),
(3, 14, 199, 0, 0),
(3, 14, 200, 0, 0),
(3, 14, 201, 0, 0),
(3, 14, 202, 0, 0),
(3, 14, 203, 0, 0),
(3, 14, 204, 0, 0),
(3, 8, 205, 0, 0),
(3, 8, 206, 0, 0),
(3, 8, 207, 0, 0),
(3, 8, 208, 0, 0),
(3, 8, 209, 0, 0),
(3, 8, 210, 0, 0),
(3, 8, 211, 0, 0),
(3, 8, 212, 0, 0),
(3, 8, 213, 0, 0),
(3, 8, 214, 0, 0),
(3, 8, 215, 0, 0),
(3, 8, 216, 0, 0),
(3, 8, 217, 0, 0),
(3, 8, 218, 0, 0),
(3, 8, 219, 0, 0),
(3, 10, 220, 0, 0),
(3, 10, 221, 0, 0),
(3, 10, 222, 0, 0),
(3, 10, 223, 0, 0),
(3, 10, 224, 0, 0),
(3, 10, 225, 0, 0),
(3, 10, 226, 0, 0),
(3, 10, 227, 0, 0),
(3, 10, 228, 0, 0),
(3, 10, 229, 0, 0),
(3, 10, 230, 0, 0),
(3, 10, 231, 0, 0),
(3, 9, 232, 0, 0),
(3, 9, 233, 0, 0),
(3, 9, 234, 0, 0),
(3, 9, 235, 0, 0),
(3, 9, 236, 0, 0),
(3, 9, 237, 0, 0),
(3, 9, 238, 0, 0),
(3, 9, 239, 0, 0),
(3, 9, 240, 0, 0),
(3, 9, 241, 0, 0),
(3, 9, 242, 0, 0),
(3, 9, 243, 0, 0),
(3, 9, 244, 0, 0),
(3, 9, 245, 0, 0),
(3, 9, 246, 0, 0),
(3, 9, 247, 0, 0),
(3, 9, 248, 0, 0),
(3, 9, 249, 0, 0),
(3, 9, 250, 0, 0),
(3, 9, 251, 0, 0),
(3, 9, 252, 0, 0),
(3, 9, 253, 0, 0),
(3, 9, 254, 0, 0),
(3, 9, 255, 0, 0),
(3, 16, 256, 0, 0),
(3, 16, 257, 0, 0),
(3, 16, 258, 0, 0),
(3, 16, 259, 0, 0),
(3, 16, 260, 0, 0),
(3, 16, 261, 0, 0),
(3, 16, 262, 0, 0),
(3, 16, 263, 0, 0),
(3, 16, 264, 0, 0),
(3, 16, 265, 0, 0),
(3, 16, 266, 0, 0),
(3, 16, 267, 0, 0),
(3, 16, 268, 0, 0),
(3, 16, 269, 0, 0),
(3, 16, 270, 0, 0),
(3, 16, 271, 0, 0),
(3, 16, 272, 0, 0),
(3, 16, 273, 0, 0),
(3, 16, 274, 0, 0),
(3, 16, 275, 0, 0),
(3, 16, 276, 0, 0),
(3, 16, 277, 0, 0),
(3, 16, 278, 0, 0),
(3, 15, 279, 0, 0),
(3, 15, 280, 0, 0),
(3, 15, 281, 0, 0),
(3, 15, 282, 0, 0),
(3, 15, 283, 0, 0),
(3, 15, 284, 0, 0),
(3, 15, 285, 0, 0),
(3, 15, 286, 0, 0),
(3, 15, 287, 0, 0),
(3, 15, 288, 0, 0),
(3, 18, 289, 0, 0),
(3, 18, 290, 0, 0),
(3, 18, 291, 0, 0),
(3, 18, 292, 0, 0),
(3, 18, 293, 0, 0),
(3, 18, 294, 0, 0),
(3, 18, 295, 0, 0),
(3, 18, 296, 0, 0),
(3, 18, 297, 0, 0),
(3, 18, 298, 0, 0),
(3, 18, 299, 0, 0),
(3, 18, 300, 0, 0),
(3, 18, 301, 0, 0),
(3, 18, 302, 0, 0),
(3, 18, 303, 0, 0),
(3, 18, 304, 0, 0),
(3, 18, 305, 0, 0),
(3, 19, 306, 0, 0),
(3, 19, 307, 0, 0),
(3, 19, 308, 0, 0),
(3, 19, 309, 0, 0),
(3, 19, 310, 0, 0),
(3, 19, 311, 0, 0),
(3, 19, 312, 0, 0),
(3, 19, 313, 0, 0),
(3, 20, 314, 0, 0),
(3, 20, 315, 0, 0),
(3, 20, 316, 0, 0),
(3, 20, 317, 0, 0),
(3, 20, 318, 0, 0),
(3, 20, 319, 0, 0),
(3, 20, 320, 0, 0),
(3, 20, 321, 0, 0),
(3, 20, 322, 0, 0),
(3, 20, 323, 0, 0),
(3, 20, 324, 0, 0),
(3, 20, 325, 0, 0),
(3, 20, 326, 0, 0),
(3, 20, 327, 0, 0),
(3, 20, 328, 0, 0),
(3, 20, 329, 0, 0),
(3, 20, 330, 0, 0),
(3, 20, 331, 0, 0),
(3, 20, 332, 0, 0),
(3, 20, 333, 0, 0),
(3, 20, 334, 0, 0),
(3, 20, 335, 0, 0),
(3, 20, 336, 0, 0),
(3, 20, 337, 0, 0),
(3, 20, 338, 0, 0),
(3, 20, 339, 0, 0),
(3, 20, 340, 0, 0),
(3, 20, 341, 0, 0),
(3, 20, 342, 0, 0),
(3, 20, 343, 0, 0),
(3, 20, 344, 0, 0),
(3, 20, 345, 0, 0),
(3, 20, 346, 0, 0),
(3, 20, 347, 0, 0),
(3, 20, 348, 0, 0),
(3, 20, 349, 0, 0),
(3, 20, 350, 0, 0),
(3, 21, 351, 0, 0),
(3, 21, 352, 0, 0),
(3, 21, 353, 0, 0),
(3, 21, 354, 0, 0),
(3, 21, 355, 0, 0),
(3, 21, 356, 0, 0),
(3, 21, 357, 0, 0),
(3, 21, 358, 0, 0),
(3, 21, 359, 0, 0),
(3, 21, 360, 0, 0),
(3, 21, 361, 0, 0),
(3, 21, 362, 0, 0),
(3, 21, 363, 0, 0),
(3, 21, 364, 0, 0),
(3, 21, 365, 0, 0),
(3, 21, 366, 0, 0),
(3, 21, 367, 0, 0),
(3, 21, 368, 0, 0),
(3, 21, 369, 0, 0),
(3, 21, 370, 0, 0),
(3, 21, 371, 0, 0),
(3, 21, 372, 0, 0),
(3, 21, 373, 0, 0),
(3, 21, 374, 0, 0),
(3, 21, 375, 0, 0),
(3, 21, 376, 0, 0),
(3, 21, 377, 0, 0),
(3, 21, 378, 0, 0),
(3, 21, 379, 0, 0),
(3, 21, 380, 0, 0),
(3, 21, 381, 0, 0),
(3, 21, 382, 0, 0),
(3, 21, 383, 0, 0),
(3, 21, 384, 0, 0),
(3, 21, 385, 0, 0),
(3, 21, 386, 0, 0),
(3, 21, 387, 0, 0),
(3, 21, 388, 0, 0),
(3, 22, 389, 0, 0),
(3, 22, 390, 0, 0),
(3, 22, 391, 0, 0),
(3, 22, 392, 0, 0),
(3, 22, 393, 0, 0),
(3, 22, 394, 0, 0),
(3, 22, 395, 0, 0),
(3, 22, 396, 0, 0),
(3, 22, 397, 0, 0),
(3, 22, 398, 0, 0),
(3, 22, 399, 0, 0),
(3, 22, 400, 0, 0),
(3, 22, 401, 0, 0),
(3, 22, 402, 0, 0),
(3, 22, 403, 0, 0),
(3, 22, 404, 0, 0),
(3, 22, 405, 0, 0),
(3, 22, 406, 0, 0),
(3, 22, 407, 0, 0),
(3, 22, 408, 0, 0),
(3, 22, 409, 0, 0),
(3, 22, 410, 0, 0),
(3, 22, 411, 0, 0),
(3, 22, 412, 0, 0),
(3, 22, 413, 0, 0),
(3, 22, 414, 0, 0),
(3, 22, 415, 0, 0),
(3, 22, 416, 0, 0),
(3, 22, 417, 0, 0),
(3, 22, 418, 0, 0),
(3, 22, 419, 0, 0),
(3, 22, 420, 0, 0),
(3, 22, 421, 0, 0),
(3, 22, 422, 0, 0),
(3, 22, 423, 0, 0),
(3, 22, 424, 0, 0),
(3, 22, 425, 0, 0),
(3, 22, 426, 0, 0),
(3, 22, 427, 0, 0),
(3, 22, 428, 0, 0),
(3, 22, 429, 0, 0),
(3, 22, 430, 0, 0),
(3, 22, 431, 0, 0),
(3, 22, 432, 0, 0),
(3, 22, 433, 0, 0),
(3, 22, 434, 0, 0),
(3, 22, 435, 0, 0),
(3, 23, 436, 0, 0),
(3, 23, 437, 0, 0),
(3, 23, 438, 0, 0),
(3, 23, 439, 0, 0),
(3, 23, 440, 0, 0),
(3, 23, 441, 0, 0),
(3, 23, 442, 0, 0),
(3, 23, 443, 0, 0),
(3, 23, 444, 0, 0),
(3, 23, 445, 0, 0),
(3, 23, 446, 0, 0),
(3, 23, 447, 0, 0),
(3, 23, 448, 0, 0),
(3, 23, 449, 0, 0),
(3, 23, 450, 0, 0),
(3, 23, 451, 0, 0),
(3, 23, 452, 0, 0),
(3, 23, 453, 0, 0),
(3, 23, 454, 0, 0),
(3, 23, 455, 0, 0),
(3, 23, 456, 0, 0),
(3, 23, 457, 0, 0),
(3, 23, 458, 0, 0),
(3, 23, 459, 0, 0),
(3, 23, 460, 0, 0),
(3, 23, 461, 0, 0),
(3, 23, 462, 0, 0),
(3, 23, 463, 0, 0),
(3, 23, 464, 0, 0),
(3, 23, 465, 0, 0),
(3, 23, 466, 0, 0),
(3, 23, 467, 0, 0),
(3, 23, 468, 0, 0),
(3, 23, 469, 0, 0),
(3, 23, 470, 0, 0),
(3, 23, 471, 0, 0),
(3, 23, 472, 0, 0),
(3, 23, 473, 0, 0),
(3, 23, 474, 0, 0),
(3, 10, 519, 0, 0),
(3, 10, 520, 0, 0),
(3, 10, 521, 0, 0),
(3, 10, 522, 0, 0),
(3, 10, 523, 0, 0),
(3, 10, 524, 0, 0),
(3, 32, 525, 0, 0),
(3, 32, 526, 0, 0),
(3, 32, 527, 0, 0),
(3, 32, 528, 0, 0),
(3, 32, 529, 0, 0),
(3, 32, 530, 0, 0),
(3, 32, 531, 0, 0),
(3, 32, 532, 0, 0),
(3, 32, 533, 0, 0),
(3, 32, 534, 0, 0),
(3, 32, 535, 0, 0),
(3, 32, 536, 0, 0),
(3, 32, 537, 0, 0),
(3, 32, 538, 0, 0),
(3, 32, 539, 0, 0),
(3, 32, 540, 0, 0),
(3, 32, 541, 0, 0),
(3, 32, 542, 0, 0),
(3, 32, 543, 0, 0),
(3, 38, 544, 0, 0),
(3, 38, 545, 0, 0),
(3, 38, 546, 0, 0),
(3, 38, 547, 0, 0),
(3, 38, 548, 0, 0),
(3, 38, 549, 0, 0),
(3, 38, 550, 0, 0),
(3, 38, 551, 0, 0),
(3, 38, 552, 0, 0),
(3, 38, 553, 0, 0),
(3, 38, 554, 0, 0),
(3, 38, 555, 0, 0),
(3, 38, 556, 0, 0),
(3, 38, 557, 0, 0),
(3, 38, 558, 0, 0),
(3, 38, 559, 0, 0),
(3, 38, 560, 0, 0),
(3, 38, 561, 0, 0),
(3, 38, 562, 0, 0),
(3, 40, 563, 0, 0),
(3, 40, 564, 0, 0),
(3, 40, 565, 0, 0),
(3, 40, 566, 0, 0),
(3, 42, 569, 0, 0),
(3, 42, 570, 0, 0),
(3, 42, 571, 0, 0),
(3, 42, 572, 0, 0),
(3, 42, 573, 0, 0),
(3, 42, 574, 0, 0),
(3, 42, 575, 0, 0),
(3, 44, 576, 0, 0),
(3, 44, 577, 0, 0),
(3, 44, 578, 0, 0),
(3, 44, 579, 0, 0),
(3, 44, 580, 0, 0),
(3, 44, 581, 0, 0),
(3, 44, 582, 0, 0),
(3, 44, 583, 0, 0),
(3, 44, 584, 0, 0),
(3, 44, 585, 0, 0),
(3, 44, 586, 0, 0),
(3, 44, 587, 0, 0),
(3, 44, 588, 0, 0),
(3, 44, 589, 0, 0),
(3, 44, 590, 0, 0),
(3, 44, 591, 0, 0),
(3, 44, 592, 0, 0),
(3, 47, 593, 0, 0),
(3, 47, 594, 0, 0),
(3, 47, 595, 0, 0),
(3, 47, 596, 0, 0),
(3, 47, 597, 0, 0),
(3, 50, 598, 0, 0),
(3, 50, 599, 0, 0),
(3, 50, 600, 0, 0),
(3, 50, 601, 0, 0),
(3, 50, 602, 0, 0),
(3, 50, 603, 0, 0),
(3, 50, 604, 0, 0),
(3, 50, 605, 0, 0),
(3, 50, 606, 0, 0),
(3, 50, 607, 0, 0),
(3, 51, 608, 0, 0),
(3, 51, 609, 0, 0),
(3, 51, 610, 0, 0),
(3, 51, 611, 0, 0),
(3, 51, 612, 0, 0),
(3, 51, 613, 0, 0),
(3, 51, 614, 0, 0),
(3, 51, 615, 0, 0),
(3, 51, 616, 0, 0),
(3, 51, 617, 0, 0),
(3, 51, 618, 0, 0),
(3, 51, 619, 0, 0),
(3, 51, 620, 0, 0),
(3, 51, 621, 0, 0),
(3, 51, 622, 0, 0),
(3, 52, 623, 0, 0),
(3, 52, 624, 0, 0),
(3, 52, 625, 0, 0),
(3, 52, 626, 0, 0),
(3, 52, 627, 0, 0),
(3, 52, 628, 0, 0),
(3, 52, 629, 0, 0),
(3, 52, 630, 0, 0),
(3, 52, 631, 0, 0),
(3, 52, 632, 0, 0),
(3, 52, 633, 0, 0),
(3, 52, 634, 0, 0),
(3, 52, 635, 0, 0),
(3, 52, 636, 0, 0),
(3, 52, 637, 0, 0),
(3, 52, 638, 0, 0),
(3, 52, 639, 0, 0),
(4, 6, 1, 0, 0),
(4, 6, 2, 0, 0),
(4, 6, 3, 0, 0),
(4, 6, 4, 0, 0),
(4, 6, 5, 0, 0),
(4, 6, 6, 0, 0),
(4, 6, 7, 0, 0),
(4, 6, 8, 0, 0),
(4, 6, 9, 0, 0),
(4, 6, 10, 0, 0),
(4, 6, 11, 0, 0),
(4, 6, 12, 0, 0),
(4, 6, 13, 0, 0),
(4, 6, 14, 0, 0),
(4, 6, 15, 0, 0),
(4, 6, 16, 0, 0),
(4, 6, 17, 0, 0),
(4, 6, 18, 0, 0),
(4, 6, 19, 0, 0),
(4, 6, 20, 0, 0),
(4, 6, 21, 0, 0),
(4, 6, 22, 0, 0),
(4, 6, 23, 0, 0),
(4, 6, 24, 0, 0),
(4, 6, 25, 0, 0),
(4, 6, 26, 0, 0),
(4, 6, 27, 0, 0),
(4, 6, 28, 0, 0),
(4, 6, 29, 0, 0),
(4, 6, 30, 0, 0),
(4, 6, 31, 0, 0),
(4, 6, 32, 0, 0),
(4, 6, 33, 0, 0),
(4, 6, 34, 0, 0),
(4, 6, 35, 0, 0),
(4, 6, 36, 0, 0),
(4, 7, 37, 0, 0),
(4, 7, 38, 0, 0),
(4, 7, 39, 0, 0),
(4, 7, 40, 0, 0),
(4, 7, 41, 0, 0),
(4, 7, 42, 0, 0),
(4, 7, 43, 0, 0),
(4, 7, 44, 0, 0),
(4, 7, 45, 0, 0),
(4, 7, 46, 0, 0),
(4, 7, 47, 0, 0),
(4, 7, 48, 0, 0),
(4, 7, 49, 0, 0),
(4, 7, 50, 0, 0),
(4, 7, 51, 0, 0),
(4, 7, 52, 0, 0),
(4, 7, 53, 0, 0),
(4, 7, 54, 0, 0),
(4, 7, 55, 0, 0),
(4, 7, 56, 0, 0),
(4, 7, 57, 0, 0),
(4, 7, 58, 0, 0),
(4, 7, 59, 0, 0),
(4, 7, 60, 0, 0),
(4, 7, 61, 0, 0),
(4, 7, 62, 0, 0),
(4, 7, 63, 0, 0),
(4, 7, 64, 0, 0),
(4, 7, 65, 0, 0),
(4, 4, 66, 0, 0),
(4, 4, 67, 0, 0),
(4, 4, 68, 0, 0),
(4, 4, 69, 0, 0),
(4, 4, 70, 0, 0),
(4, 4, 71, 0, 0),
(4, 4, 72, 0, 0),
(4, 4, 73, 0, 0),
(4, 4, 74, 0, 0),
(4, 4, 75, 0, 0),
(4, 4, 76, 0, 0),
(4, 4, 77, 0, 0),
(4, 4, 78, 0, 0),
(4, 4, 79, 0, 0),
(4, 4, 80, 0, 0),
(4, 4, 81, 0, 0),
(4, 4, 82, 0, 0),
(4, 4, 83, 0, 0),
(4, 4, 84, 0, 0),
(4, 4, 85, 0, 0),
(4, 4, 86, 0, 0),
(4, 4, 87, 0, 0),
(4, 4, 88, 0, 0),
(4, 4, 89, 0, 0),
(4, 4, 90, 0, 0),
(4, 4, 91, 0, 0),
(4, 4, 92, 0, 0),
(4, 4, 93, 0, 0),
(4, 4, 94, 0, 0),
(4, 4, 95, 0, 0),
(4, 4, 96, 0, 0),
(4, 4, 97, 0, 0),
(4, 4, 98, 0, 0),
(4, 4, 99, 0, 0),
(4, 4, 100, 0, 0),
(4, 4, 101, 0, 0),
(4, 4, 102, 0, 0),
(4, 4, 103, 0, 0),
(4, 4, 104, 0, 0),
(4, 4, 105, 0, 0),
(4, 4, 106, 0, 0),
(4, 4, 107, 0, 0),
(4, 4, 108, 0, 0),
(4, 4, 109, 0, 0),
(4, 2, 110, 0, 0),
(4, 2, 111, 0, 0),
(4, 2, 112, 0, 0),
(4, 2, 113, 0, 0),
(4, 2, 114, 0, 0),
(4, 2, 115, 0, 0),
(4, 2, 116, 0, 0),
(4, 2, 117, 0, 0),
(4, 2, 118, 0, 0),
(4, 2, 119, 0, 0),
(4, 2, 120, 0, 0),
(4, 2, 121, 0, 0),
(4, 2, 122, 0, 0),
(4, 2, 123, 0, 0),
(4, 2, 124, 0, 0),
(4, 2, 125, 0, 0),
(4, 26, 126, 0, 0),
(4, 26, 127, 0, 0),
(4, 26, 128, 0, 0),
(4, 26, 129, 0, 0),
(4, 26, 130, 0, 0),
(4, 26, 131, 0, 0),
(4, 26, 132, 0, 0),
(4, 26, 133, 0, 0),
(4, 26, 134, 0, 0),
(4, 26, 135, 0, 0),
(4, 26, 136, 0, 0),
(4, 26, 137, 0, 0),
(4, 26, 138, 0, 0),
(4, 26, 139, 0, 0),
(4, 26, 140, 0, 0),
(4, 26, 141, 0, 0),
(4, 26, 142, 0, 0),
(4, 26, 143, 0, 0),
(4, 26, 144, 0, 0),
(4, 26, 145, 0, 0),
(4, 26, 146, 0, 0),
(4, 26, 147, 0, 0),
(4, 26, 148, 0, 0),
(4, 26, 149, 0, 0),
(4, 26, 150, 0, 0),
(4, 4, 151, 0, 0),
(4, 6, 152, 0, 0),
(4, 7, 153, 0, 0),
(4, 26, 154, 0, 0),
(4, 13, 155, 0, 0),
(4, 13, 156, 0, 0),
(4, 13, 157, 0, 0),
(4, 13, 158, 0, 0),
(4, 13, 159, 0, 0),
(4, 13, 160, 0, 0),
(4, 13, 161, 0, 0),
(4, 13, 162, 0, 0),
(4, 13, 163, 0, 0),
(4, 13, 164, 0, 0),
(4, 13, 165, 0, 0),
(4, 13, 166, 0, 0),
(4, 13, 167, 0, 0),
(4, 13, 168, 0, 0),
(4, 13, 169, 0, 0),
(4, 13, 170, 0, 0),
(4, 13, 171, 0, 0),
(4, 13, 172, 0, 0),
(4, 13, 173, 0, 0),
(4, 14, 174, 0, 0),
(4, 14, 175, 0, 0),
(4, 14, 176, 0, 0),
(4, 14, 177, 0, 0),
(4, 14, 178, 0, 0),
(4, 14, 179, 0, 0),
(4, 14, 180, 0, 0),
(4, 14, 181, 0, 0),
(4, 14, 182, 0, 0),
(4, 14, 183, 0, 0),
(4, 14, 184, 0, 0),
(4, 14, 185, 0, 0),
(4, 14, 186, 0, 0),
(4, 14, 187, 0, 0),
(4, 14, 188, 0, 0),
(4, 14, 189, 0, 0),
(4, 14, 190, 0, 0),
(4, 14, 191, 0, 0),
(4, 14, 192, 0, 0),
(4, 14, 193, 0, 0),
(4, 14, 194, 0, 0),
(4, 14, 195, 0, 0),
(4, 14, 196, 0, 0),
(4, 14, 197, 0, 0),
(4, 14, 198, 0, 0),
(4, 14, 199, 0, 0),
(4, 14, 200, 0, 0),
(4, 14, 201, 0, 0),
(4, 14, 202, 0, 0),
(4, 14, 203, 0, 0),
(4, 14, 204, 0, 0),
(4, 8, 205, 0, 0),
(4, 8, 206, 0, 0),
(4, 8, 207, 0, 0),
(4, 8, 208, 0, 0),
(4, 8, 209, 0, 0),
(4, 8, 210, 0, 0),
(4, 8, 211, 0, 0),
(4, 8, 212, 0, 0),
(4, 8, 213, 0, 0),
(4, 8, 214, 0, 0),
(4, 8, 215, 0, 0),
(4, 8, 216, 0, 0),
(4, 8, 217, 0, 0),
(4, 8, 218, 0, 0),
(4, 8, 219, 0, 0),
(4, 10, 220, 0, 0),
(4, 10, 221, 0, 0),
(4, 10, 222, 0, 0),
(4, 10, 223, 0, 0),
(4, 10, 224, 0, 0),
(4, 10, 225, 0, 0),
(4, 10, 226, 0, 0),
(4, 10, 227, 0, 0),
(4, 10, 228, 0, 0),
(4, 10, 229, 0, 0),
(4, 10, 230, 0, 0),
(4, 10, 231, 0, 0),
(4, 9, 232, 0, 0),
(4, 9, 233, 0, 0),
(4, 9, 234, 0, 0),
(4, 9, 235, 0, 0),
(4, 9, 236, 0, 0),
(4, 9, 237, 0, 0),
(4, 9, 238, 0, 0),
(4, 9, 239, 0, 0),
(4, 9, 240, 0, 0),
(4, 9, 241, 0, 0),
(4, 9, 242, 0, 0),
(4, 9, 243, 0, 0),
(4, 9, 244, 0, 0),
(4, 9, 245, 0, 0),
(4, 9, 246, 0, 0),
(4, 9, 247, 0, 0),
(4, 9, 248, 0, 0),
(4, 9, 249, 0, 0),
(4, 9, 250, 0, 0),
(4, 9, 251, 0, 0),
(4, 9, 252, 0, 0),
(4, 9, 253, 0, 0),
(4, 9, 254, 0, 0),
(4, 9, 255, 0, 0),
(4, 16, 256, 0, 0),
(4, 16, 257, 0, 0),
(4, 16, 258, 0, 0),
(4, 16, 259, 0, 0),
(4, 16, 260, 0, 0),
(4, 16, 261, 0, 0),
(4, 16, 262, 0, 0),
(4, 16, 263, 0, 0),
(4, 16, 264, 0, 0),
(4, 16, 265, 0, 0),
(4, 16, 266, 0, 0),
(4, 16, 267, 0, 0),
(4, 16, 268, 0, 0),
(4, 16, 269, 0, 0),
(4, 16, 270, 0, 0),
(4, 16, 271, 0, 0),
(4, 16, 272, 0, 0),
(4, 16, 273, 0, 0),
(4, 16, 274, 0, 0),
(4, 16, 275, 0, 0),
(4, 16, 276, 0, 0),
(4, 16, 277, 0, 0),
(4, 16, 278, 0, 0),
(4, 15, 279, 0, 0),
(4, 15, 280, 0, 0),
(4, 15, 281, 0, 0),
(4, 15, 282, 0, 0),
(4, 15, 283, 0, 0),
(4, 15, 284, 0, 0),
(4, 15, 285, 0, 0),
(4, 15, 286, 0, 0),
(4, 15, 287, 0, 0),
(4, 15, 288, 0, 0),
(4, 18, 289, 0, 0),
(4, 18, 290, 0, 0),
(4, 18, 291, 0, 0),
(4, 18, 292, 0, 0),
(4, 18, 293, 0, 0),
(4, 18, 294, 0, 0),
(4, 18, 295, 0, 0),
(4, 18, 296, 0, 0),
(4, 18, 297, 0, 0),
(4, 18, 298, 0, 0),
(4, 18, 299, 0, 0),
(4, 18, 300, 0, 0),
(4, 18, 301, 0, 0),
(4, 18, 302, 0, 0),
(4, 18, 303, 0, 0),
(4, 18, 304, 0, 0),
(4, 18, 305, 0, 0),
(4, 19, 306, 0, 0),
(4, 19, 307, 0, 0),
(4, 19, 308, 0, 0),
(4, 19, 309, 0, 0),
(4, 19, 310, 0, 0),
(4, 19, 311, 0, 0),
(4, 19, 312, 0, 0),
(4, 19, 313, 0, 0),
(4, 20, 314, 0, 0),
(4, 20, 315, 0, 0),
(4, 20, 316, 0, 0),
(4, 20, 317, 0, 0),
(4, 20, 318, 0, 0),
(4, 20, 319, 0, 0),
(4, 20, 320, 0, 0),
(4, 20, 321, 0, 0),
(4, 20, 322, 0, 0),
(4, 20, 323, 0, 0),
(4, 20, 324, 0, 0),
(4, 20, 325, 0, 0),
(4, 20, 326, 0, 0),
(4, 20, 327, 0, 0),
(4, 20, 328, 0, 0),
(4, 20, 329, 0, 0),
(4, 20, 330, 0, 0),
(4, 20, 331, 0, 0),
(4, 20, 332, 0, 0),
(4, 20, 333, 0, 0),
(4, 20, 334, 0, 0),
(4, 20, 335, 0, 0),
(4, 20, 336, 0, 0),
(4, 20, 337, 0, 0),
(4, 20, 338, 0, 0),
(4, 20, 339, 0, 0),
(4, 20, 340, 0, 0),
(4, 20, 341, 0, 0),
(4, 20, 342, 0, 0),
(4, 20, 343, 0, 0),
(4, 20, 344, 0, 0),
(4, 20, 345, 0, 0),
(4, 20, 346, 0, 0),
(4, 20, 347, 0, 0),
(4, 20, 348, 0, 0),
(4, 20, 349, 0, 0),
(4, 20, 350, 0, 0),
(4, 21, 351, 0, 0),
(4, 21, 352, 0, 0),
(4, 21, 353, 0, 0),
(4, 21, 354, 0, 0),
(4, 21, 355, 0, 0),
(4, 21, 356, 0, 0),
(4, 21, 357, 0, 0),
(4, 21, 358, 0, 0),
(4, 21, 359, 0, 0),
(4, 21, 360, 0, 0),
(4, 21, 361, 0, 0),
(4, 21, 362, 0, 0),
(4, 21, 363, 0, 0),
(4, 21, 364, 0, 0),
(4, 21, 365, 0, 0),
(4, 21, 366, 0, 0),
(4, 21, 367, 0, 0),
(4, 21, 368, 0, 0),
(4, 21, 369, 0, 0),
(4, 21, 370, 0, 0),
(4, 21, 371, 0, 0),
(4, 21, 372, 0, 0),
(4, 21, 373, 0, 0),
(4, 21, 374, 0, 0),
(4, 21, 375, 0, 0),
(4, 21, 376, 0, 0),
(4, 21, 377, 0, 0),
(4, 21, 378, 0, 0),
(4, 21, 379, 0, 0),
(4, 21, 380, 0, 0),
(4, 21, 381, 0, 0),
(4, 21, 382, 0, 0),
(4, 21, 383, 0, 0),
(4, 21, 384, 0, 0),
(4, 21, 385, 0, 0),
(4, 21, 386, 0, 0),
(4, 21, 387, 0, 0),
(4, 21, 388, 0, 0),
(4, 22, 389, 0, 0),
(4, 22, 390, 0, 0),
(4, 22, 391, 0, 0),
(4, 22, 392, 0, 0),
(4, 22, 393, 0, 0),
(4, 22, 394, 0, 0),
(4, 22, 395, 0, 0),
(4, 22, 396, 0, 0),
(4, 22, 397, 0, 0),
(4, 22, 398, 0, 0),
(4, 22, 399, 0, 0),
(4, 22, 400, 0, 0),
(4, 22, 401, 0, 0),
(4, 22, 402, 0, 0),
(4, 22, 403, 0, 0),
(4, 22, 404, 0, 0),
(4, 22, 405, 0, 0),
(4, 22, 406, 0, 0),
(4, 22, 407, 0, 0),
(4, 22, 408, 0, 0),
(4, 22, 409, 0, 0),
(4, 22, 410, 0, 0),
(4, 22, 411, 0, 0),
(4, 22, 412, 0, 0),
(4, 22, 413, 0, 0),
(4, 22, 414, 0, 0),
(4, 22, 415, 0, 0),
(4, 22, 416, 0, 0),
(4, 22, 417, 0, 0),
(4, 22, 418, 0, 0),
(4, 22, 419, 0, 0),
(4, 22, 420, 0, 0),
(4, 22, 421, 0, 0),
(4, 22, 422, 0, 0),
(4, 22, 423, 0, 0),
(4, 22, 424, 0, 0),
(4, 22, 425, 0, 0),
(4, 22, 426, 0, 0),
(4, 22, 427, 0, 0),
(4, 22, 428, 0, 0),
(4, 22, 429, 0, 0),
(4, 22, 430, 0, 0),
(4, 22, 431, 0, 0),
(4, 22, 432, 0, 0),
(4, 22, 433, 0, 0),
(4, 22, 434, 0, 0),
(4, 22, 435, 0, 0),
(4, 23, 436, 0, 0),
(4, 23, 437, 0, 0),
(4, 23, 438, 0, 0),
(4, 23, 439, 0, 0),
(4, 23, 440, 0, 0),
(4, 23, 441, 0, 0),
(4, 23, 442, 0, 0),
(4, 23, 443, 0, 0),
(4, 23, 444, 0, 0),
(4, 23, 445, 0, 0),
(4, 23, 446, 0, 0),
(4, 23, 447, 0, 0),
(4, 23, 448, 0, 0),
(4, 23, 449, 0, 0),
(4, 23, 450, 0, 0),
(4, 23, 451, 0, 0),
(4, 23, 452, 0, 0),
(4, 23, 453, 0, 0),
(4, 23, 454, 0, 0),
(4, 23, 455, 0, 0),
(4, 23, 456, 0, 0),
(4, 23, 457, 0, 0),
(4, 23, 458, 0, 0),
(4, 23, 459, 0, 0),
(4, 23, 460, 0, 0),
(4, 23, 461, 0, 0),
(4, 23, 462, 0, 0),
(4, 23, 463, 0, 0),
(4, 23, 464, 0, 0),
(4, 23, 465, 0, 0),
(4, 23, 466, 0, 0),
(4, 23, 467, 0, 0),
(4, 23, 468, 0, 0),
(4, 23, 469, 0, 0),
(4, 23, 470, 0, 0),
(4, 23, 471, 0, 0),
(4, 23, 472, 0, 0),
(4, 23, 473, 0, 0),
(4, 23, 474, 0, 0),
(4, 10, 519, 0, 0),
(4, 10, 520, 0, 0),
(4, 10, 521, 0, 0),
(4, 10, 522, 0, 0),
(4, 10, 523, 0, 0),
(4, 10, 524, 0, 0),
(4, 32, 525, 0, 0),
(4, 32, 526, 0, 0),
(4, 32, 527, 0, 0),
(4, 32, 528, 0, 0),
(4, 32, 529, 0, 0),
(4, 32, 530, 0, 0),
(4, 32, 531, 0, 0),
(4, 32, 532, 0, 0),
(4, 32, 533, 0, 0),
(4, 32, 534, 0, 0),
(4, 32, 535, 0, 0),
(4, 32, 536, 0, 0),
(4, 32, 537, 0, 0),
(4, 32, 538, 0, 0),
(4, 32, 539, 0, 0),
(4, 32, 540, 0, 0),
(4, 32, 541, 0, 0),
(4, 32, 542, 0, 0),
(4, 32, 543, 0, 0),
(4, 38, 544, 0, 0),
(4, 38, 545, 0, 0),
(4, 38, 546, 0, 0),
(4, 38, 547, 0, 0),
(4, 38, 548, 0, 0),
(4, 38, 549, 0, 0),
(4, 38, 550, 0, 0),
(4, 38, 551, 0, 0),
(4, 38, 552, 0, 0),
(4, 38, 553, 0, 0),
(4, 38, 554, 0, 0),
(4, 38, 555, 0, 0),
(4, 38, 556, 0, 0),
(4, 38, 557, 0, 0),
(4, 38, 558, 0, 0),
(4, 38, 559, 0, 0),
(4, 38, 560, 0, 0),
(4, 38, 561, 0, 0),
(4, 38, 562, 0, 0),
(4, 40, 563, 0, 0),
(4, 40, 564, 0, 0),
(4, 40, 565, 0, 0),
(4, 40, 566, 0, 0),
(4, 42, 569, 0, 0),
(4, 42, 570, 0, 0),
(4, 42, 571, 0, 0),
(4, 42, 572, 0, 0),
(4, 42, 573, 0, 0),
(4, 42, 574, 0, 0),
(4, 42, 575, 0, 0),
(4, 44, 576, 0, 0),
(4, 44, 577, 0, 0),
(4, 44, 578, 0, 0),
(4, 44, 579, 0, 0),
(4, 44, 580, 0, 0),
(4, 44, 581, 0, 0),
(4, 44, 582, 0, 0),
(4, 44, 583, 0, 0),
(4, 44, 584, 0, 0),
(4, 44, 585, 0, 0),
(4, 44, 586, 0, 0),
(4, 44, 587, 0, 0),
(4, 44, 588, 0, 0),
(4, 44, 589, 0, 0),
(4, 44, 590, 0, 0),
(4, 44, 591, 0, 0),
(4, 44, 592, 0, 0),
(4, 47, 593, 0, 0),
(4, 47, 594, 0, 0),
(4, 47, 595, 0, 0),
(4, 47, 596, 0, 0),
(4, 47, 597, 0, 0),
(4, 50, 598, 0, 0),
(4, 50, 599, 0, 0),
(4, 50, 600, 0, 0),
(4, 50, 601, 0, 0),
(4, 50, 602, 0, 0),
(4, 50, 603, 0, 0),
(4, 50, 604, 0, 0),
(4, 50, 605, 0, 0),
(4, 50, 606, 0, 0),
(4, 50, 607, 0, 0),
(4, 51, 608, 0, 0),
(4, 51, 609, 0, 0),
(4, 51, 610, 0, 0),
(4, 51, 611, 0, 0),
(4, 51, 612, 0, 0),
(4, 51, 613, 0, 0),
(4, 51, 614, 0, 0),
(4, 51, 615, 0, 0),
(4, 51, 616, 0, 0),
(4, 51, 617, 0, 0),
(4, 51, 618, 0, 0),
(4, 51, 619, 0, 0),
(4, 51, 620, 0, 0),
(4, 51, 621, 0, 0),
(4, 51, 622, 0, 0),
(4, 52, 623, 0, 0),
(4, 52, 624, 0, 0),
(4, 52, 625, 0, 0),
(4, 52, 626, 0, 0),
(4, 52, 627, 0, 0),
(4, 52, 628, 0, 0),
(4, 52, 629, 0, 0),
(4, 52, 630, 0, 0),
(4, 52, 631, 0, 0),
(4, 52, 632, 0, 0),
(4, 52, 633, 0, 0),
(4, 52, 634, 0, 0),
(4, 52, 635, 0, 0),
(4, 52, 636, 0, 0),
(4, 52, 637, 0, 0),
(4, 52, 638, 0, 0),
(4, 52, 639, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2globalpermissions`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2globalpermissions` (
  `profileid` int(19) NOT NULL,
  `globalactionid` int(19) NOT NULL,
  `globalactionpermission` int(19) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`globalactionid`),
  KEY `idx_profile2globalpermissions` (`profileid`,`globalactionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2globalpermissions`
--

INSERT INTO `vtiger_profile2globalpermissions` (`profileid`, `globalactionid`, `globalactionpermission`) VALUES
(1, 1, 0),
(1, 2, 0),
(2, 1, 1),
(2, 2, 1),
(3, 1, 1),
(3, 2, 1),
(4, 1, 1),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2standardpermissions`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2standardpermissions` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) NOT NULL,
  `operation` int(10) NOT NULL,
  `permissions` int(1) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`tabid`,`operation`),
  KEY `profile2standardpermissions_profileid_tabid_operation_idx` (`profileid`,`tabid`,`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2standardpermissions`
--

INSERT INTO `vtiger_profile2standardpermissions` (`profileid`, `tabid`, `operation`, `permissions`) VALUES
(1, 2, 0, 0),
(1, 2, 1, 0),
(1, 2, 2, 0),
(1, 2, 3, 0),
(1, 2, 4, 0),
(1, 4, 0, 0),
(1, 4, 1, 0),
(1, 4, 2, 0),
(1, 4, 3, 0),
(1, 4, 4, 0),
(1, 6, 0, 0),
(1, 6, 1, 0),
(1, 6, 2, 0),
(1, 6, 3, 0),
(1, 6, 4, 0),
(1, 7, 0, 0),
(1, 7, 1, 0),
(1, 7, 2, 0),
(1, 7, 3, 0),
(1, 7, 4, 0),
(1, 8, 0, 0),
(1, 8, 1, 0),
(1, 8, 2, 0),
(1, 8, 3, 0),
(1, 8, 4, 0),
(1, 9, 0, 0),
(1, 9, 1, 0),
(1, 9, 2, 0),
(1, 9, 3, 0),
(1, 9, 4, 0),
(1, 13, 0, 0),
(1, 13, 1, 0),
(1, 13, 2, 0),
(1, 13, 3, 0),
(1, 13, 4, 0),
(1, 14, 0, 0),
(1, 14, 1, 0),
(1, 14, 2, 0),
(1, 14, 3, 0),
(1, 14, 4, 0),
(1, 15, 0, 0),
(1, 15, 1, 0),
(1, 15, 2, 0),
(1, 15, 3, 0),
(1, 15, 4, 0),
(1, 16, 0, 0),
(1, 16, 1, 0),
(1, 16, 2, 0),
(1, 16, 3, 0),
(1, 16, 4, 0),
(1, 18, 0, 0),
(1, 18, 1, 0),
(1, 18, 2, 0),
(1, 18, 3, 0),
(1, 18, 4, 0),
(1, 19, 0, 0),
(1, 19, 1, 0),
(1, 19, 2, 0),
(1, 19, 3, 0),
(1, 19, 4, 0),
(1, 20, 0, 0),
(1, 20, 1, 0),
(1, 20, 2, 0),
(1, 20, 3, 0),
(1, 20, 4, 0),
(1, 21, 0, 0),
(1, 21, 1, 0),
(1, 21, 2, 0),
(1, 21, 3, 0),
(1, 21, 4, 0),
(1, 22, 0, 0),
(1, 22, 1, 0),
(1, 22, 2, 0),
(1, 22, 3, 0),
(1, 22, 4, 0),
(1, 23, 0, 0),
(1, 23, 1, 0),
(1, 23, 2, 0),
(1, 23, 3, 0),
(1, 23, 4, 0),
(1, 26, 0, 0),
(1, 26, 1, 0),
(1, 26, 2, 0),
(1, 26, 3, 0),
(1, 26, 4, 0),
(1, 32, 0, 0),
(1, 32, 1, 0),
(1, 32, 2, 0),
(1, 32, 3, 0),
(1, 32, 4, 0),
(1, 38, 0, 0),
(1, 38, 1, 0),
(1, 38, 2, 0),
(1, 38, 3, 0),
(1, 38, 4, 0),
(1, 40, 0, 0),
(1, 40, 1, 0),
(1, 40, 2, 0),
(1, 40, 3, 0),
(1, 40, 4, 0),
(1, 42, 0, 0),
(1, 42, 1, 0),
(1, 42, 2, 0),
(1, 42, 3, 0),
(1, 42, 4, 0),
(1, 44, 0, 0),
(1, 44, 1, 0),
(1, 44, 2, 0),
(1, 44, 3, 0),
(1, 44, 4, 0),
(1, 47, 0, 0),
(1, 47, 1, 0),
(1, 47, 2, 0),
(1, 47, 3, 0),
(1, 47, 4, 0),
(1, 50, 0, 0),
(1, 50, 1, 0),
(1, 50, 2, 0),
(1, 50, 3, 0),
(1, 50, 4, 0),
(1, 51, 0, 0),
(1, 51, 1, 0),
(1, 51, 2, 0),
(1, 51, 3, 0),
(1, 51, 4, 0),
(1, 52, 0, 0),
(1, 52, 1, 0),
(1, 52, 2, 0),
(1, 52, 3, 0),
(1, 52, 4, 0),
(2, 2, 0, 0),
(2, 2, 1, 0),
(2, 2, 2, 0),
(2, 2, 3, 0),
(2, 2, 4, 0),
(2, 4, 0, 0),
(2, 4, 1, 0),
(2, 4, 2, 0),
(2, 4, 3, 0),
(2, 4, 4, 0),
(2, 6, 0, 0),
(2, 6, 1, 0),
(2, 6, 2, 0),
(2, 6, 3, 0),
(2, 6, 4, 0),
(2, 7, 0, 0),
(2, 7, 1, 0),
(2, 7, 2, 0),
(2, 7, 3, 0),
(2, 7, 4, 0),
(2, 8, 0, 0),
(2, 8, 1, 0),
(2, 8, 2, 0),
(2, 8, 3, 0),
(2, 8, 4, 0),
(2, 9, 0, 0),
(2, 9, 1, 0),
(2, 9, 2, 0),
(2, 9, 3, 0),
(2, 9, 4, 0),
(2, 13, 0, 1),
(2, 13, 1, 1),
(2, 13, 2, 1),
(2, 13, 3, 0),
(2, 13, 4, 0),
(2, 14, 0, 0),
(2, 14, 1, 0),
(2, 14, 2, 0),
(2, 14, 3, 0),
(2, 14, 4, 0),
(2, 15, 0, 0),
(2, 15, 1, 0),
(2, 15, 2, 0),
(2, 15, 3, 0),
(2, 15, 4, 0),
(2, 16, 0, 0),
(2, 16, 1, 0),
(2, 16, 2, 0),
(2, 16, 3, 0),
(2, 16, 4, 0),
(2, 18, 0, 0),
(2, 18, 1, 0),
(2, 18, 2, 0),
(2, 18, 3, 0),
(2, 18, 4, 0),
(2, 19, 0, 0),
(2, 19, 1, 0),
(2, 19, 2, 0),
(2, 19, 3, 0),
(2, 19, 4, 0),
(2, 20, 0, 0),
(2, 20, 1, 0),
(2, 20, 2, 0),
(2, 20, 3, 0),
(2, 20, 4, 0),
(2, 21, 0, 0),
(2, 21, 1, 0),
(2, 21, 2, 0),
(2, 21, 3, 0),
(2, 21, 4, 0),
(2, 22, 0, 0),
(2, 22, 1, 0),
(2, 22, 2, 0),
(2, 22, 3, 0),
(2, 22, 4, 0),
(2, 23, 0, 0),
(2, 23, 1, 0),
(2, 23, 2, 0),
(2, 23, 3, 0),
(2, 23, 4, 0),
(2, 26, 0, 0),
(2, 26, 1, 0),
(2, 26, 2, 0),
(2, 26, 3, 0),
(2, 26, 4, 0),
(2, 32, 0, 0),
(2, 32, 1, 0),
(2, 32, 2, 0),
(2, 32, 3, 0),
(2, 32, 4, 0),
(2, 38, 0, 0),
(2, 38, 1, 0),
(2, 38, 2, 0),
(2, 38, 3, 0),
(2, 38, 4, 0),
(2, 40, 0, 0),
(2, 40, 1, 0),
(2, 40, 2, 0),
(2, 40, 3, 0),
(2, 40, 4, 0),
(2, 42, 0, 0),
(2, 42, 1, 0),
(2, 42, 2, 0),
(2, 42, 3, 0),
(2, 42, 4, 0),
(2, 44, 0, 0),
(2, 44, 1, 0),
(2, 44, 2, 0),
(2, 44, 3, 0),
(2, 44, 4, 0),
(2, 47, 0, 0),
(2, 47, 1, 0),
(2, 47, 2, 0),
(2, 47, 3, 0),
(2, 47, 4, 0),
(2, 50, 0, 0),
(2, 50, 1, 0),
(2, 50, 2, 0),
(2, 50, 3, 0),
(2, 50, 4, 0),
(2, 51, 0, 0),
(2, 51, 1, 0),
(2, 51, 2, 0),
(2, 51, 3, 0),
(2, 51, 4, 0),
(2, 52, 0, 0),
(2, 52, 1, 0),
(2, 52, 2, 0),
(2, 52, 3, 0),
(2, 52, 4, 0),
(3, 2, 0, 1),
(3, 2, 1, 1),
(3, 2, 2, 1),
(3, 2, 3, 0),
(3, 2, 4, 0),
(3, 4, 0, 0),
(3, 4, 1, 0),
(3, 4, 2, 0),
(3, 4, 3, 0),
(3, 4, 4, 0),
(3, 6, 0, 0),
(3, 6, 1, 0),
(3, 6, 2, 0),
(3, 6, 3, 0),
(3, 6, 4, 0),
(3, 7, 0, 0),
(3, 7, 1, 0),
(3, 7, 2, 0),
(3, 7, 3, 0),
(3, 7, 4, 0),
(3, 8, 0, 0),
(3, 8, 1, 0),
(3, 8, 2, 0),
(3, 8, 3, 0),
(3, 8, 4, 0),
(3, 9, 0, 0),
(3, 9, 1, 0),
(3, 9, 2, 0),
(3, 9, 3, 0),
(3, 9, 4, 0),
(3, 13, 0, 0),
(3, 13, 1, 0),
(3, 13, 2, 0),
(3, 13, 3, 0),
(3, 13, 4, 0),
(3, 14, 0, 0),
(3, 14, 1, 0),
(3, 14, 2, 0),
(3, 14, 3, 0),
(3, 14, 4, 0),
(3, 15, 0, 0),
(3, 15, 1, 0),
(3, 15, 2, 0),
(3, 15, 3, 0),
(3, 15, 4, 0),
(3, 16, 0, 0),
(3, 16, 1, 0),
(3, 16, 2, 0),
(3, 16, 3, 0),
(3, 16, 4, 0),
(3, 18, 0, 0),
(3, 18, 1, 0),
(3, 18, 2, 0),
(3, 18, 3, 0),
(3, 18, 4, 0),
(3, 19, 0, 0),
(3, 19, 1, 0),
(3, 19, 2, 0),
(3, 19, 3, 0),
(3, 19, 4, 0),
(3, 20, 0, 0),
(3, 20, 1, 0),
(3, 20, 2, 0),
(3, 20, 3, 0),
(3, 20, 4, 0),
(3, 21, 0, 0),
(3, 21, 1, 0),
(3, 21, 2, 0),
(3, 21, 3, 0),
(3, 21, 4, 0),
(3, 22, 0, 0),
(3, 22, 1, 0),
(3, 22, 2, 0),
(3, 22, 3, 0),
(3, 22, 4, 0),
(3, 23, 0, 0),
(3, 23, 1, 0),
(3, 23, 2, 0),
(3, 23, 3, 0),
(3, 23, 4, 0),
(3, 26, 0, 0),
(3, 26, 1, 0),
(3, 26, 2, 0),
(3, 26, 3, 0),
(3, 26, 4, 0),
(3, 32, 0, 0),
(3, 32, 1, 0),
(3, 32, 2, 0),
(3, 32, 3, 0),
(3, 32, 4, 0),
(3, 38, 0, 0),
(3, 38, 1, 0),
(3, 38, 2, 0),
(3, 38, 3, 0),
(3, 38, 4, 0),
(3, 40, 0, 0),
(3, 40, 1, 0),
(3, 40, 2, 0),
(3, 40, 3, 0),
(3, 40, 4, 0),
(3, 42, 0, 0),
(3, 42, 1, 0),
(3, 42, 2, 0),
(3, 42, 3, 0),
(3, 42, 4, 0),
(3, 44, 0, 0),
(3, 44, 1, 0),
(3, 44, 2, 0),
(3, 44, 3, 0),
(3, 44, 4, 0),
(3, 47, 0, 0),
(3, 47, 1, 0),
(3, 47, 2, 0),
(3, 47, 3, 0),
(3, 47, 4, 0),
(3, 50, 0, 0),
(3, 50, 1, 0),
(3, 50, 2, 0),
(3, 50, 3, 0),
(3, 50, 4, 0),
(3, 51, 0, 0),
(3, 51, 1, 0),
(3, 51, 2, 0),
(3, 51, 3, 0),
(3, 51, 4, 0),
(3, 52, 0, 0),
(3, 52, 1, 0),
(3, 52, 2, 0),
(3, 52, 3, 0),
(3, 52, 4, 0),
(4, 2, 0, 1),
(4, 2, 1, 1),
(4, 2, 2, 1),
(4, 2, 3, 0),
(4, 2, 4, 0),
(4, 4, 0, 1),
(4, 4, 1, 1),
(4, 4, 2, 1),
(4, 4, 3, 0),
(4, 4, 4, 0),
(4, 6, 0, 1),
(4, 6, 1, 1),
(4, 6, 2, 1),
(4, 6, 3, 0),
(4, 6, 4, 0),
(4, 7, 0, 1),
(4, 7, 1, 1),
(4, 7, 2, 1),
(4, 7, 3, 0),
(4, 7, 4, 0),
(4, 8, 0, 1),
(4, 8, 1, 1),
(4, 8, 2, 1),
(4, 8, 3, 0),
(4, 8, 4, 0),
(4, 9, 0, 1),
(4, 9, 1, 1),
(4, 9, 2, 1),
(4, 9, 3, 0),
(4, 9, 4, 0),
(4, 13, 0, 1),
(4, 13, 1, 1),
(4, 13, 2, 1),
(4, 13, 3, 0),
(4, 13, 4, 0),
(4, 14, 0, 1),
(4, 14, 1, 1),
(4, 14, 2, 1),
(4, 14, 3, 0),
(4, 14, 4, 0),
(4, 15, 0, 1),
(4, 15, 1, 1),
(4, 15, 2, 1),
(4, 15, 3, 0),
(4, 15, 4, 0),
(4, 16, 0, 1),
(4, 16, 1, 1),
(4, 16, 2, 1),
(4, 16, 3, 0),
(4, 16, 4, 0),
(4, 18, 0, 1),
(4, 18, 1, 1),
(4, 18, 2, 1),
(4, 18, 3, 0),
(4, 18, 4, 0),
(4, 19, 0, 1),
(4, 19, 1, 1),
(4, 19, 2, 1),
(4, 19, 3, 0),
(4, 19, 4, 0),
(4, 20, 0, 1),
(4, 20, 1, 1),
(4, 20, 2, 1),
(4, 20, 3, 0),
(4, 20, 4, 0),
(4, 21, 0, 1),
(4, 21, 1, 1),
(4, 21, 2, 1),
(4, 21, 3, 0),
(4, 21, 4, 0),
(4, 22, 0, 1),
(4, 22, 1, 1),
(4, 22, 2, 1),
(4, 22, 3, 0),
(4, 22, 4, 0),
(4, 23, 0, 1),
(4, 23, 1, 1),
(4, 23, 2, 1),
(4, 23, 3, 0),
(4, 23, 4, 0),
(4, 26, 0, 1),
(4, 26, 1, 1),
(4, 26, 2, 1),
(4, 26, 3, 0),
(4, 26, 4, 0),
(4, 32, 0, 0),
(4, 32, 1, 0),
(4, 32, 2, 0),
(4, 32, 3, 0),
(4, 32, 4, 0),
(4, 38, 0, 0),
(4, 38, 1, 0),
(4, 38, 2, 0),
(4, 38, 3, 0),
(4, 38, 4, 0),
(4, 40, 0, 0),
(4, 40, 1, 0),
(4, 40, 2, 0),
(4, 40, 3, 0),
(4, 40, 4, 0),
(4, 42, 0, 0),
(4, 42, 1, 0),
(4, 42, 2, 0),
(4, 42, 3, 0),
(4, 42, 4, 0),
(4, 44, 0, 0),
(4, 44, 1, 0),
(4, 44, 2, 0),
(4, 44, 3, 0),
(4, 44, 4, 0),
(4, 47, 0, 0),
(4, 47, 1, 0),
(4, 47, 2, 0),
(4, 47, 3, 0),
(4, 47, 4, 0),
(4, 50, 0, 0),
(4, 50, 1, 0),
(4, 50, 2, 0),
(4, 50, 3, 0),
(4, 50, 4, 0),
(4, 51, 0, 0),
(4, 51, 1, 0),
(4, 51, 2, 0),
(4, 51, 3, 0),
(4, 51, 4, 0),
(4, 52, 0, 0),
(4, 52, 1, 0),
(4, 52, 2, 0),
(4, 52, 3, 0),
(4, 52, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2tab` (
  `profileid` int(11) DEFAULT NULL,
  `tabid` int(10) DEFAULT NULL,
  `permissions` int(10) NOT NULL DEFAULT '0',
  KEY `profile2tab_profileid_tabid_idx` (`profileid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2tab`
--

INSERT INTO `vtiger_profile2tab` (`profileid`, `tabid`, `permissions`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0),
(1, 13, 0),
(1, 14, 0),
(1, 15, 0),
(1, 16, 0),
(1, 18, 0),
(1, 19, 0),
(1, 20, 0),
(1, 21, 0),
(1, 22, 0),
(1, 23, 0),
(1, 24, 0),
(1, 25, 0),
(1, 26, 0),
(1, 27, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 6, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 13, 0),
(2, 14, 0),
(2, 15, 0),
(2, 16, 0),
(2, 18, 0),
(2, 19, 0),
(2, 20, 0),
(2, 21, 0),
(2, 22, 0),
(2, 23, 0),
(2, 24, 0),
(2, 25, 0),
(2, 26, 0),
(2, 27, 0),
(3, 1, 0),
(3, 2, 0),
(3, 3, 0),
(3, 4, 0),
(3, 6, 0),
(3, 7, 0),
(3, 8, 0),
(3, 9, 0),
(3, 10, 0),
(3, 13, 0),
(3, 14, 0),
(3, 15, 0),
(3, 16, 0),
(3, 18, 0),
(3, 19, 0),
(3, 20, 0),
(3, 21, 0),
(3, 22, 0),
(3, 23, 0),
(3, 24, 0),
(3, 25, 0),
(3, 26, 0),
(3, 27, 0),
(4, 1, 0),
(4, 2, 0),
(4, 3, 0),
(4, 4, 0),
(4, 6, 0),
(4, 7, 0),
(4, 8, 0),
(4, 9, 0),
(4, 10, 0),
(4, 13, 0),
(4, 14, 0),
(4, 15, 0),
(4, 16, 0),
(4, 18, 0),
(4, 19, 0),
(4, 20, 0),
(4, 21, 0),
(4, 22, 0),
(4, 23, 0),
(4, 24, 0),
(4, 25, 0),
(4, 26, 0),
(4, 27, 0),
(1, 30, 0),
(2, 30, 0),
(3, 30, 0),
(4, 30, 0),
(1, 31, 0),
(2, 31, 0),
(3, 31, 0),
(4, 31, 0),
(1, 32, 0),
(2, 32, 0),
(3, 32, 0),
(4, 32, 0),
(1, 33, 0),
(2, 33, 0),
(3, 33, 0),
(4, 33, 0),
(1, 34, 0),
(2, 34, 0),
(3, 34, 0),
(4, 34, 0),
(1, 35, 0),
(2, 35, 0),
(3, 35, 0),
(4, 35, 0),
(1, 36, 0),
(2, 36, 0),
(3, 36, 0),
(4, 36, 0),
(1, 37, 0),
(2, 37, 0),
(3, 37, 0),
(4, 37, 0),
(1, 38, 0),
(2, 38, 0),
(3, 38, 0),
(4, 38, 0),
(1, 39, 0),
(2, 39, 0),
(3, 39, 0),
(4, 39, 0),
(1, 40, 0),
(2, 40, 0),
(3, 40, 0),
(4, 40, 0),
(1, 41, 0),
(2, 41, 0),
(3, 41, 0),
(4, 41, 0),
(1, 42, 0),
(2, 42, 0),
(3, 42, 0),
(4, 42, 0),
(1, 43, 0),
(2, 43, 0),
(3, 43, 0),
(4, 43, 0),
(1, 44, 0),
(2, 44, 0),
(3, 44, 0),
(4, 44, 0),
(1, 46, 0),
(2, 46, 0),
(3, 46, 0),
(4, 46, 0),
(1, 47, 0),
(2, 47, 0),
(3, 47, 0),
(4, 47, 0),
(1, 48, 0),
(2, 48, 0),
(3, 48, 0),
(4, 48, 0),
(1, 49, 0),
(2, 49, 0),
(3, 49, 0),
(4, 49, 0),
(1, 50, 0),
(2, 50, 0),
(3, 50, 0),
(4, 50, 0),
(1, 51, 0),
(2, 51, 0),
(3, 51, 0),
(4, 51, 0),
(1, 52, 0),
(2, 52, 0),
(3, 52, 0),
(4, 52, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2utility`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2utility` (
  `profileid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `permission` int(1) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`tabid`,`activityid`),
  KEY `profile2utility_profileid_tabid_activityid_idx` (`profileid`,`tabid`,`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2utility`
--

INSERT INTO `vtiger_profile2utility` (`profileid`, `tabid`, `activityid`, `permission`) VALUES
(1, 2, 5, 0),
(1, 2, 6, 0),
(1, 2, 10, 0),
(1, 4, 5, 0),
(1, 4, 6, 0),
(1, 4, 8, 0),
(1, 4, 10, 0),
(1, 6, 5, 0),
(1, 6, 6, 0),
(1, 6, 8, 0),
(1, 6, 10, 0),
(1, 7, 5, 0),
(1, 7, 6, 0),
(1, 7, 8, 0),
(1, 7, 9, 0),
(1, 7, 10, 0),
(1, 8, 6, 0),
(1, 13, 5, 0),
(1, 13, 6, 0),
(1, 13, 8, 0),
(1, 13, 10, 0),
(1, 14, 5, 0),
(1, 14, 6, 0),
(1, 14, 10, 0),
(1, 18, 5, 0),
(1, 18, 6, 0),
(1, 18, 10, 0),
(1, 32, 5, 0),
(1, 32, 6, 0),
(1, 32, 10, 0),
(1, 38, 5, 0),
(1, 38, 6, 0),
(1, 38, 10, 0),
(1, 40, 5, 1),
(1, 40, 6, 1),
(1, 40, 8, 1),
(1, 44, 5, 0),
(1, 44, 6, 0),
(1, 44, 10, 0),
(1, 50, 5, 0),
(1, 50, 6, 0),
(1, 50, 10, 0),
(1, 51, 5, 0),
(1, 51, 6, 0),
(1, 51, 10, 0),
(1, 52, 5, 0),
(1, 52, 6, 0),
(1, 52, 10, 0),
(2, 2, 5, 1),
(2, 2, 6, 1),
(2, 2, 10, 0),
(2, 4, 5, 1),
(2, 4, 6, 1),
(2, 4, 8, 0),
(2, 4, 10, 0),
(2, 6, 5, 1),
(2, 6, 6, 1),
(2, 6, 8, 0),
(2, 6, 10, 0),
(2, 7, 5, 1),
(2, 7, 6, 1),
(2, 7, 8, 0),
(2, 7, 9, 0),
(2, 7, 10, 0),
(2, 8, 6, 1),
(2, 13, 5, 1),
(2, 13, 6, 1),
(2, 13, 8, 0),
(2, 13, 10, 0),
(2, 14, 5, 1),
(2, 14, 6, 1),
(2, 14, 10, 0),
(2, 18, 5, 1),
(2, 18, 6, 1),
(2, 18, 10, 0),
(2, 32, 5, 0),
(2, 32, 6, 0),
(2, 32, 10, 0),
(2, 38, 5, 0),
(2, 38, 6, 0),
(2, 38, 10, 0),
(2, 40, 5, 1),
(2, 40, 6, 1),
(2, 40, 8, 1),
(2, 44, 5, 0),
(2, 44, 6, 0),
(2, 44, 10, 0),
(2, 50, 5, 0),
(2, 50, 6, 0),
(2, 50, 10, 0),
(2, 51, 5, 0),
(2, 51, 6, 0),
(2, 51, 10, 0),
(2, 52, 5, 0),
(2, 52, 6, 0),
(2, 52, 10, 0),
(3, 2, 5, 1),
(3, 2, 6, 1),
(3, 2, 10, 0),
(3, 4, 5, 1),
(3, 4, 6, 1),
(3, 4, 8, 0),
(3, 4, 10, 0),
(3, 6, 5, 1),
(3, 6, 6, 1),
(3, 6, 8, 0),
(3, 6, 10, 0),
(3, 7, 5, 1),
(3, 7, 6, 1),
(3, 7, 8, 0),
(3, 7, 9, 0),
(3, 7, 10, 0),
(3, 8, 6, 1),
(3, 13, 5, 1),
(3, 13, 6, 1),
(3, 13, 8, 0),
(3, 13, 10, 0),
(3, 14, 5, 1),
(3, 14, 6, 1),
(3, 14, 10, 0),
(3, 18, 5, 1),
(3, 18, 6, 1),
(3, 18, 10, 0),
(3, 32, 5, 0),
(3, 32, 6, 0),
(3, 32, 10, 0),
(3, 38, 5, 0),
(3, 38, 6, 0),
(3, 38, 10, 0),
(3, 40, 5, 1),
(3, 40, 6, 1),
(3, 40, 8, 1),
(3, 44, 5, 0),
(3, 44, 6, 0),
(3, 44, 10, 0),
(3, 50, 5, 0),
(3, 50, 6, 0),
(3, 50, 10, 0),
(3, 51, 5, 0),
(3, 51, 6, 0),
(3, 51, 10, 0),
(3, 52, 5, 0),
(3, 52, 6, 0),
(3, 52, 10, 0),
(4, 2, 5, 1),
(4, 2, 6, 1),
(4, 2, 10, 0),
(4, 4, 5, 1),
(4, 4, 6, 1),
(4, 4, 8, 1),
(4, 4, 10, 0),
(4, 6, 5, 1),
(4, 6, 6, 1),
(4, 6, 8, 1),
(4, 6, 10, 0),
(4, 7, 5, 1),
(4, 7, 6, 1),
(4, 7, 8, 1),
(4, 7, 9, 0),
(4, 7, 10, 0),
(4, 8, 6, 1),
(4, 13, 5, 1),
(4, 13, 6, 1),
(4, 13, 8, 1),
(4, 13, 10, 0),
(4, 14, 5, 1),
(4, 14, 6, 1),
(4, 14, 10, 0),
(4, 18, 5, 1),
(4, 18, 6, 1),
(4, 18, 10, 0),
(4, 32, 5, 0),
(4, 32, 6, 0),
(4, 32, 10, 0),
(4, 38, 5, 0),
(4, 38, 6, 0),
(4, 38, 10, 0),
(4, 40, 5, 1),
(4, 40, 6, 1),
(4, 40, 8, 1),
(4, 44, 5, 0),
(4, 44, 6, 0),
(4, 44, 10, 0),
(4, 50, 5, 0),
(4, 50, 6, 0),
(4, 50, 10, 0),
(4, 51, 5, 0),
(4, 51, 6, 0),
(4, 51, 10, 0),
(4, 52, 5, 0),
(4, 52, 6, 0),
(4, 52, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile_seq`
--

INSERT INTO `vtiger_profile_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_progress`
--

CREATE TABLE IF NOT EXISTS `vtiger_progress` (
  `progressid` int(11) NOT NULL AUTO_INCREMENT,
  `progress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`progressid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `vtiger_progress`
--

INSERT INTO `vtiger_progress` (`progressid`, `progress`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 277),
(2, '10%', 1, 278),
(3, '20%', 1, 279),
(4, '30%', 1, 280),
(5, '40%', 1, 281),
(6, '50%', 1, 282),
(7, '60%', 1, 283),
(8, '70%', 1, 284),
(9, '80%', 1, 285),
(10, '90%', 1, 286),
(11, '100%', 1, 287);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_progress_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_progress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_progress_seq`
--

INSERT INTO `vtiger_progress_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_project`
--

CREATE TABLE IF NOT EXISTS `vtiger_project` (
  `projectid` int(11) DEFAULT NULL,
  `projectname` varchar(255) DEFAULT NULL,
  `project_no` varchar(100) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `targetenddate` date DEFAULT NULL,
  `actualenddate` date DEFAULT NULL,
  `targetbudget` varchar(255) DEFAULT NULL,
  `projecturl` varchar(255) DEFAULT NULL,
  `projectstatus` varchar(100) DEFAULT NULL,
  `projectpriority` varchar(100) DEFAULT NULL,
  `projecttype` varchar(100) DEFAULT NULL,
  `progress` varchar(100) DEFAULT NULL,
  `linktoaccountscontacts` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectcf` (
  `projectid` int(11) NOT NULL,
  PRIMARY KEY (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestone`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestone` (
  `projectmilestoneid` int(11) NOT NULL,
  `projectmilestonename` varchar(255) DEFAULT NULL,
  `projectmilestone_no` varchar(100) DEFAULT NULL,
  `projectmilestonedate` varchar(255) DEFAULT NULL,
  `projectid` varchar(100) DEFAULT NULL,
  `projectmilestonetype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`projectmilestoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestonecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonecf` (
  `projectmilestoneid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projectmilestoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestonetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonetype` (
  `projectmilestonetypeid` int(11) NOT NULL AUTO_INCREMENT,
  `projectmilestonetype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projectmilestonetypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_projectmilestonetype`
--

INSERT INTO `vtiger_projectmilestonetype` (`projectmilestonetypeid`, `projectmilestonetype`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 237),
(2, 'administrative', 1, 238),
(3, 'operative', 1, 239),
(4, 'other', 1, 240);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestonetype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonetype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectmilestonetype_seq`
--

INSERT INTO `vtiger_projectmilestonetype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectpriority` (
  `projectpriorityid` int(11) NOT NULL AUTO_INCREMENT,
  `projectpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projectpriorityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_projectpriority`
--

INSERT INTO `vtiger_projectpriority` (`projectpriorityid`, `projectpriority`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 273),
(2, 'low', 1, 274),
(3, 'normal', 1, 275),
(4, 'high', 1, 276);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectpriority_seq`
--

INSERT INTO `vtiger_projectpriority_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectstatus` (
  `projectstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `projectstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projectstatusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vtiger_projectstatus`
--

INSERT INTO `vtiger_projectstatus` (`projectstatusid`, `projectstatus`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 260),
(2, 'prospecting', 1, 261),
(3, 'initiated', 1, 262),
(4, 'in progress', 1, 263),
(5, 'waiting for feedback', 1, 264),
(6, 'on hold', 1, 265),
(7, 'completed', 1, 266),
(8, 'delivered', 1, 267),
(9, 'archived', 1, 268);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectstatus_seq`
--

INSERT INTO `vtiger_projectstatus_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttask`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttask` (
  `projecttaskid` int(11) NOT NULL,
  `projecttaskname` varchar(255) DEFAULT NULL,
  `projecttask_no` varchar(100) DEFAULT NULL,
  `projecttasktype` varchar(100) DEFAULT NULL,
  `projecttaskpriority` varchar(100) DEFAULT NULL,
  `projecttaskprogress` varchar(100) DEFAULT NULL,
  `projecttaskhours` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `projectid` varchar(100) DEFAULT NULL,
  `projecttasknumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`projecttaskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskcf` (
  `projecttaskid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projecttaskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskpriority` (
  `projecttaskpriorityid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttaskpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projecttaskpriorityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_projecttaskpriority`
--

INSERT INTO `vtiger_projecttaskpriority` (`projecttaskpriorityid`, `projecttaskpriority`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 245),
(2, 'low', 1, 246),
(3, 'normal', 1, 247),
(4, 'high', 1, 248);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskpriority_seq`
--

INSERT INTO `vtiger_projecttaskpriority_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskprogress`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskprogress` (
  `projecttaskprogressid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttaskprogress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projecttaskprogressid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `vtiger_projecttaskprogress`
--

INSERT INTO `vtiger_projecttaskprogress` (`projecttaskprogressid`, `projecttaskprogress`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 249),
(2, '10%', 1, 250),
(3, '20%', 1, 251),
(4, '30%', 1, 252),
(5, '40%', 1, 253),
(6, '50%', 1, 254),
(7, '60%', 1, 255),
(8, '70%', 1, 256),
(9, '80%', 1, 257),
(10, '90%', 1, 258),
(11, '100%', 1, 259);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskprogress_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskprogress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskprogress_seq`
--

INSERT INTO `vtiger_projecttaskprogress_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttasktype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttasktype` (
  `projecttasktypeid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttasktype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projecttasktypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_projecttasktype`
--

INSERT INTO `vtiger_projecttasktype` (`projecttasktypeid`, `projecttasktype`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 241),
(2, 'administrative', 1, 242),
(3, 'operative', 1, 243),
(4, 'other', 1, 244);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttasktype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttasktype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttasktype_seq`
--

INSERT INTO `vtiger_projecttasktype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttype` (
  `projecttypeid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projecttypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_projecttype`
--

INSERT INTO `vtiger_projecttype` (`projecttypeid`, `projecttype`, `presence`, `picklist_valueid`) VALUES
(1, '--none--', 1, 269),
(2, 'administrative', 1, 270),
(3, 'operative', 1, 271),
(4, 'other', 1, 272);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttype_seq`
--

INSERT INTO `vtiger_projecttype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_purchaseorder`
--

CREATE TABLE IF NOT EXISTS `vtiger_purchaseorder` (
  `purchaseorderid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `quoteid` int(19) DEFAULT NULL,
  `vendorid` int(19) DEFAULT NULL,
  `requisition_no` varchar(100) DEFAULT NULL,
  `purchaseorder_no` varchar(100) DEFAULT NULL,
  `tracking_no` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,3) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,3) DEFAULT NULL,
  `subtotal` decimal(25,3) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,3) DEFAULT NULL,
  `s_h_amount` decimal(25,3) DEFAULT NULL,
  `terms_conditions` text,
  `postatus` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  PRIMARY KEY (`purchaseorderid`),
  KEY `purchaseorder_vendorid_idx` (`vendorid`),
  KEY `purchaseorder_quoteid_idx` (`quoteid`),
  KEY `purchaseorder_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_purchaseordercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_purchaseordercf` (
  `purchaseorderid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`purchaseorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quickview`
--

CREATE TABLE IF NOT EXISTS `vtiger_quickview` (
  `fieldid` int(19) NOT NULL,
  `related_fieldid` int(19) NOT NULL,
  `sequence` int(19) NOT NULL,
  `currentview` int(19) NOT NULL,
  KEY `fk_1_vtiger_quickview` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotes`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotes` (
  `quoteid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `potentialid` int(19) DEFAULT NULL,
  `quotestage` varchar(200) DEFAULT NULL,
  `validtill` date DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `quote_no` varchar(100) DEFAULT NULL,
  `subtotal` decimal(25,3) DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `inventorymanager` int(19) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,3) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,3) DEFAULT NULL,
  `s_h_amount` decimal(25,3) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  PRIMARY KEY (`quoteid`),
  KEY `quote_quotestage_idx` (`quotestage`),
  KEY `quotes_potentialid_idx` (`potentialid`),
  KEY `quotes_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotesbillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotesbillads` (
  `quotebilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`quotebilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotescf`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotescf` (
  `quoteid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`quoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotesshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotesshipads` (
  `quoteshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`quoteshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotestage`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestage` (
  `quotestageid` int(19) NOT NULL AUTO_INCREMENT,
  `quotestage` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`quotestageid`),
  UNIQUE KEY `quotestage_quotestage_idx` (`quotestage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_quotestage`
--

INSERT INTO `vtiger_quotestage` (`quotestageid`, `quotestage`, `presence`, `picklist_valueid`) VALUES
(1, 'Created', 0, 139),
(2, 'Delivered', 0, 140),
(3, 'Reviewed', 0, 141),
(4, 'Accepted', 0, 142),
(5, 'Rejected', 0, 143);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotestagehistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestagehistory` (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `quoteid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `quotestage` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `quotestagehistory_quoteid_idx` (`quoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotestage_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_quotestage_seq`
--

INSERT INTO `vtiger_quotestage_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rating`
--

CREATE TABLE IF NOT EXISTS `vtiger_rating` (
  `rating_id` int(19) NOT NULL AUTO_INCREMENT,
  `rating` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_rating`
--

INSERT INTO `vtiger_rating` (`rating_id`, `rating`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 144),
(2, 'Acquired', 1, 145),
(3, 'Active', 1, 146),
(4, 'Market Failed', 1, 147),
(5, 'Project Cancelled', 1, 148),
(6, 'Shutdown', 1, 149);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rating_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_rating_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_rating_seq`
--

INSERT INTO `vtiger_rating_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurringevents`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringevents` (
  `recurringid` int(19) NOT NULL AUTO_INCREMENT,
  `activityid` int(19) NOT NULL,
  `recurringdate` date DEFAULT NULL,
  `recurringtype` varchar(30) DEFAULT NULL,
  `recurringfreq` int(19) DEFAULT NULL,
  `recurringinfo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`recurringid`),
  KEY `fk_1_vtiger_recurringevents` (`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurringtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringtype` (
  `recurringeventid` int(19) NOT NULL AUTO_INCREMENT,
  `recurringtype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`recurringeventid`),
  UNIQUE KEY `recurringtype_status_idx` (`recurringtype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_recurringtype`
--

INSERT INTO `vtiger_recurringtype` (`recurringeventid`, `recurringtype`, `sortorderid`, `presence`) VALUES
(1, '--None--', 0, 1),
(2, 'Daily', 1, 1),
(3, 'Weekly', 2, 1),
(4, 'Monthly', 3, 1),
(5, 'Yearly', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurringtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_recurringtype_seq`
--

INSERT INTO `vtiger_recurringtype_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurring_frequency`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurring_frequency` (
  `recurring_frequency_id` int(11) DEFAULT NULL,
  `recurring_frequency` varchar(200) DEFAULT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_recurring_frequency`
--

INSERT INTO `vtiger_recurring_frequency` (`recurring_frequency_id`, `recurring_frequency`, `sortorderid`, `presence`) VALUES
(1, '--None--', 0, 1),
(2, 'Daily', 1, 1),
(3, 'Weekly', 2, 1),
(4, 'Monthly', 3, 1),
(5, 'Quarterly', 4, 1),
(6, 'Yearly', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurring_frequency_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurring_frequency_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_recurring_frequency_seq`
--

INSERT INTO `vtiger_recurring_frequency_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relatedlists`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists` (
  `relation_id` int(19) NOT NULL,
  `tabid` int(10) DEFAULT NULL,
  `related_tabid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `presence` int(10) NOT NULL DEFAULT '0',
  `actions` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`relation_id`),
  KEY `relatedlists_relation_id_idx` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relatedlists`
--

INSERT INTO `vtiger_relatedlists` (`relation_id`, `tabid`, `related_tabid`, `name`, `sequence`, `label`, `presence`, `actions`) VALUES
(1, 6, 4, 'get_contacts', 1, 'Contacts', 0, 'add'),
(2, 6, 2, 'get_opportunities', 2, 'Potentials', 0, 'add'),
(3, 6, 20, 'get_quotes', 3, 'Quotes', 0, 'add'),
(4, 6, 22, 'get_salesorder', 4, 'Sales Order', 0, 'add'),
(5, 6, 23, 'get_invoices', 5, 'Invoice', 0, 'add'),
(6, 6, 9, 'get_activities', 6, 'Activities', 0, 'add'),
(7, 6, 10, 'get_emails', 7, 'Emails', 0, 'add'),
(8, 6, 9, 'get_history', 8, 'Activity History', 0, 'add'),
(9, 6, 8, 'get_attachments', 9, 'Documents', 0, 'add,select'),
(10, 6, 13, 'get_tickets', 10, 'HelpDesk', 0, 'add'),
(11, 6, 14, 'get_products', 11, 'Products', 0, 'select'),
(12, 7, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(13, 7, 10, 'get_emails', 2, 'Emails', 0, 'add'),
(14, 7, 9, 'get_history', 3, 'Activity History', 0, 'add'),
(15, 7, 8, 'get_attachments', 4, 'Documents', 0, 'add,select'),
(16, 7, 14, 'get_products', 5, 'Products', 0, 'select'),
(17, 7, 26, 'get_campaigns', 6, 'Campaigns', 0, 'select'),
(18, 4, 2, 'get_opportunities', 1, 'Potentials', 0, 'add'),
(19, 4, 9, 'get_activities', 2, 'Activities', 0, 'add'),
(20, 4, 10, 'get_emails', 3, 'Emails', 0, 'add'),
(21, 4, 13, 'get_tickets', 4, 'HelpDesk', 0, 'add'),
(22, 4, 20, 'get_quotes', 5, 'Quotes', 0, 'add'),
(23, 4, 21, 'get_purchase_orders', 6, 'Purchase Order', 0, 'add'),
(24, 4, 22, 'get_salesorder', 7, 'Sales Order', 0, 'add'),
(25, 4, 14, 'get_products', 8, 'Products', 0, 'select'),
(26, 4, 9, 'get_history', 9, 'Activity History', 0, 'add'),
(27, 4, 8, 'get_attachments', 10, 'Documents', 0, 'add,select'),
(28, 4, 26, 'get_campaigns', 11, 'Campaigns', 0, 'select'),
(29, 4, 23, 'get_invoices', 12, 'Invoice', 0, 'add'),
(30, 2, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(31, 2, 4, 'get_contacts', 2, 'Contacts', 0, 'select'),
(32, 2, 14, 'get_products', 3, 'Products', 0, 'select'),
(33, 2, 0, 'get_stage_history', 4, 'Sales Stage History', 0, ''),
(34, 2, 8, 'get_attachments', 5, 'Documents', 0, 'add,select'),
(35, 2, 20, 'get_Quotes', 6, 'Quotes', 0, 'add'),
(36, 2, 22, 'get_salesorder', 7, 'Sales Order', 0, 'add'),
(37, 2, 9, 'get_history', 8, 'Activity History', 0, ''),
(38, 14, 13, 'get_tickets', 1, 'HelpDesk', 0, 'add'),
(39, 14, 8, 'get_attachments', 3, 'Documents', 0, 'add,select'),
(40, 14, 20, 'get_quotes', 4, 'Quotes', 0, 'add'),
(41, 14, 21, 'get_purchase_orders', 5, 'Purchase Order', 0, 'add'),
(42, 14, 22, 'get_salesorder', 6, 'Sales Order', 0, 'add'),
(43, 14, 23, 'get_invoices', 7, 'Invoice', 0, 'add'),
(44, 14, 19, 'get_product_pricebooks', 8, 'PriceBooks', 0, 'add'),
(45, 14, 7, 'get_leads', 9, 'Leads', 0, 'select'),
(46, 14, 6, 'get_accounts', 10, 'Accounts', 0, 'select'),
(47, 14, 4, 'get_contacts', 11, 'Contacts', 0, 'select'),
(48, 14, 2, 'get_opportunities', 12, 'Potentials', 0, 'select'),
(49, 14, 14, 'get_products', 13, 'Product Bundles', 0, 'add,select'),
(50, 14, 14, 'get_parent_products', 14, 'Parent Product', 0, ''),
(51, 10, 4, 'get_contacts', 1, 'Contacts', 0, 'select,bulkmail'),
(52, 10, 0, 'get_users', 2, 'Users', 0, ''),
(53, 10, 8, 'get_attachments', 3, 'Documents', 0, 'add,select'),
(54, 13, 9, 'get_activities', 1, 'Activities', 0, 'add,select'),
(55, 13, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(56, 13, 0, 'get_ticket_history', 3, 'Ticket History', 0, ''),
(57, 13, 9, 'get_history', 4, 'Activity History', 0, ''),
(58, 19, 14, 'get_pricebook_products', 2, 'Products', 0, 'select'),
(59, 18, 14, 'get_products', 1, 'Products', 0, 'add,select'),
(60, 18, 21, 'get_purchase_orders', 2, 'Purchase Order', 0, 'add'),
(61, 18, 4, 'get_contacts', 3, 'Contacts', 0, 'select'),
(62, 18, 10, 'get_emails', 4, 'Emails', 0, 'add'),
(63, 20, 22, 'get_salesorder', 1, 'Sales Order', 0, ''),
(64, 20, 9, 'get_activities', 2, 'Activities', 0, 'add'),
(65, 20, 8, 'get_attachments', 3, 'Documents', 0, 'add,select'),
(66, 20, 9, 'get_history', 4, 'Activity History', 0, ''),
(67, 20, 0, 'get_quotestagehistory', 5, 'Quote Stage History', 0, ''),
(68, 21, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(69, 21, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(70, 21, 9, 'get_history', 3, 'Activity History', 0, ''),
(71, 21, 0, 'get_postatushistory', 4, 'PurchaseOrder Status History', 0, ''),
(72, 22, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(73, 22, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(74, 22, 23, 'get_invoices', 3, 'Invoice', 0, ''),
(75, 22, 9, 'get_history', 4, 'Activity History', 0, ''),
(76, 22, 0, 'get_sostatushistory', 5, 'SalesOrder Status History', 0, ''),
(77, 23, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(78, 23, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(79, 23, 9, 'get_history', 3, 'Activity History', 0, ''),
(80, 23, 0, 'get_invoicestatushistory', 4, 'Invoice Status History', 0, ''),
(81, 9, 0, 'get_users', 1, 'Users', 0, ''),
(82, 9, 4, 'get_contacts', 2, 'Contacts', 0, ''),
(83, 26, 4, 'get_contacts', 1, 'Contacts', 0, 'add,select'),
(84, 26, 7, 'get_leads', 2, 'Leads', 0, 'add,select'),
(85, 26, 2, 'get_opportunities', 3, 'Potentials', 0, 'add'),
(86, 26, 9, 'get_activities', 4, 'Activities', 0, 'add'),
(87, 6, 26, 'get_campaigns', 13, 'Campaigns', 0, 'select'),
(88, 26, 6, 'get_accounts', 5, 'Accounts', 0, 'add,select'),
(89, 15, 8, 'get_attachments', 1, 'Documents', 0, 'add,select'),
(90, 32, 13, 'get_related_list', 1, 'Service Requests', 0, 'ADD,SELECT'),
(91, 32, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT'),
(92, 6, 32, 'get_dependents_list', 14, 'Service Contracts', 0, 'ADD'),
(93, 4, 32, 'get_dependents_list', 13, 'Service Contracts', 0, 'ADD'),
(94, 13, 32, 'get_related_list', 5, 'Service Contracts', 0, 'ADD,SELECT'),
(95, 38, 13, 'get_related_list', 1, 'HelpDesk', 0, 'ADD,SELECT'),
(96, 38, 20, 'get_quotes', 2, 'Quotes', 0, 'ADD'),
(97, 38, 21, 'get_purchase_orders', 3, 'Purchase Order', 0, 'ADD'),
(98, 38, 22, 'get_salesorder', 4, 'Sales Order', 0, 'ADD'),
(99, 38, 23, 'get_invoices', 5, 'Invoice', 0, 'ADD'),
(100, 38, 19, 'get_service_pricebooks', 6, 'PriceBooks', 0, 'ADD'),
(101, 38, 7, 'get_related_list', 7, 'Leads', 0, 'SELECT'),
(102, 38, 6, 'get_related_list', 8, 'Accounts', 0, 'SELECT'),
(103, 38, 4, 'get_related_list', 9, 'Contacts', 0, 'SELECT'),
(104, 38, 2, 'get_related_list', 10, 'Potentials', 0, 'SELECT'),
(105, 38, 8, 'get_attachments', 11, 'Documents', 0, 'ADD,SELECT'),
(106, 13, 38, 'get_related_list', 6, 'Services', 0, 'SELECT'),
(107, 7, 38, 'get_related_list', 7, 'Services', 0, 'SELECT'),
(108, 6, 38, 'get_related_list', 15, 'Services', 0, 'SELECT'),
(109, 4, 38, 'get_related_list', 14, 'Services', 0, 'SELECT'),
(110, 2, 38, 'get_related_list', 9, 'Services', 0, 'SELECT'),
(111, 19, 38, 'get_pricebook_services', 3, 'Services', 0, 'SELECT'),
(112, 44, 13, 'get_related_list', 1, 'HelpDesk', 0, 'ADD,SELECT'),
(113, 44, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT'),
(114, 6, 44, 'get_dependents_list', 16, 'Assets', 0, 'ADD'),
(115, 14, 44, 'get_dependents_list', 15, 'Assets', 0, 'ADD'),
(116, 23, 44, 'get_dependents_list', 5, 'Assets', 0, 'ADD'),
(117, 47, 6, 'get_related_list', 1, 'Accounts', 0, ' '),
(118, 47, 4, 'get_related_list', 2, 'Contacts', 0, ' '),
(119, 47, 7, 'get_related_list', 3, 'Leads', 0, ' '),
(120, 51, 8, 'get_attachments', 1, 'Documents', 0, 'ADD,SELECT'),
(121, 52, 51, 'get_dependents_list', 1, 'Project Tasks', 0, 'ADD,SELECT'),
(122, 52, 50, 'get_dependents_list', 2, 'Project Milestones', 0, 'ADD,SELECT'),
(123, 52, 8, 'get_attachments', 3, 'Documents', 0, 'ADD,SELECT'),
(124, 52, 13, 'get_related_list', 4, 'Trouble Tickets', 0, 'ADD,SELECT'),
(125, 52, 0, 'get_gantt_chart', 5, 'Charts', 0, ''),
(126, 6, 52, 'get_dependents_list', 17, 'Projects', 0, 'ADD,SELECT'),
(127, 4, 52, 'get_dependents_list', 15, 'Projects', 0, 'ADD,SELECT'),
(128, 13, 52, 'get_related_list', 7, 'Projects', 0, 'SELECT');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relatedlists_rb`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists_rb` (
  `entityid` int(19) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `rel_table` varchar(200) DEFAULT NULL,
  `rel_column` varchar(200) DEFAULT NULL,
  `ref_column` varchar(200) DEFAULT NULL,
  `related_crm_ids` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relatedlists_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relatedlists_seq`
--

INSERT INTO `vtiger_relatedlists_seq` (`id`) VALUES
(128);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relcriteria`
--

CREATE TABLE IF NOT EXISTS `vtiger_relcriteria` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `comparator` varchar(10) DEFAULT '',
  `value` varchar(200) DEFAULT '',
  `groupid` int(11) DEFAULT '1',
  `column_condition` varchar(256) DEFAULT 'and',
  PRIMARY KEY (`queryid`,`columnindex`),
  KEY `relcriteria_queryid_idx` (`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relcriteria`
--

INSERT INTO `vtiger_relcriteria` (`queryid`, `columnindex`, `columnname`, `comparator`, `value`, `groupid`, `column_condition`) VALUES
(1, 0, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V', 'n', '', 1, 'and'),
(2, 0, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V', 'e', '', 1, 'and'),
(3, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V', 'n', '', 1, 'and'),
(7, 0, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V', 'e', 'Closed Won', 1, 'and'),
(12, 0, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V', 'n', 'Closed', 1, 'and'),
(15, 0, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V', 'n', 'Accepted', 1, 'and'),
(15, 1, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V', 'n', 'Rejected', 1, 'and');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relcriteria_grouping`
--

CREATE TABLE IF NOT EXISTS `vtiger_relcriteria_grouping` (
  `groupid` int(11) NOT NULL,
  `queryid` int(19) NOT NULL,
  `group_condition` varchar(256) DEFAULT NULL,
  `condition_expression` text,
  PRIMARY KEY (`groupid`,`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relcriteria_grouping`
--

INSERT INTO `vtiger_relcriteria_grouping` (`groupid`, `queryid`, `group_condition`, `condition_expression`) VALUES
(1, 1, '', '0'),
(1, 2, '', '0'),
(1, 3, '', '0'),
(1, 7, '', '0'),
(1, 12, '', '0'),
(1, 15, '', '0 and 1');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reminder_interval`
--

CREATE TABLE IF NOT EXISTS `vtiger_reminder_interval` (
  `reminder_intervalid` int(19) NOT NULL AUTO_INCREMENT,
  `reminder_interval` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL,
  `presence` int(1) NOT NULL,
  PRIMARY KEY (`reminder_intervalid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `vtiger_reminder_interval`
--

INSERT INTO `vtiger_reminder_interval` (`reminder_intervalid`, `reminder_interval`, `sortorderid`, `presence`) VALUES
(1, 'None', 0, 1),
(2, '1 Minute', 1, 1),
(3, '5 Minutes', 2, 1),
(4, '15 Minutes', 3, 1),
(5, '30 Minutes', 4, 1),
(6, '45 Minutes', 5, 1),
(7, '1 Hour', 6, 1),
(8, '1 Day', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reminder_interval_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_reminder_interval_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reminder_interval_seq`
--

INSERT INTO `vtiger_reminder_interval_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_report`
--

CREATE TABLE IF NOT EXISTS `vtiger_report` (
  `reportid` int(19) NOT NULL,
  `folderid` int(19) NOT NULL,
  `reportname` varchar(100) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `reporttype` varchar(50) DEFAULT '',
  `queryid` int(19) NOT NULL DEFAULT '0',
  `state` varchar(50) DEFAULT 'SAVED',
  `customizable` int(1) DEFAULT '1',
  `category` int(11) DEFAULT '1',
  `owner` int(11) DEFAULT '1',
  `sharingtype` varchar(200) DEFAULT 'Private',
  PRIMARY KEY (`reportid`),
  KEY `report_queryid_idx` (`queryid`),
  KEY `report_folderid_idx` (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_report`
--

INSERT INTO `vtiger_report` (`reportid`, `folderid`, `reportname`, `description`, `reporttype`, `queryid`, `state`, `customizable`, `category`, `owner`, `sharingtype`) VALUES
(1, 1, 'Contacts by Accounts', 'Contacts related to Accounts', 'tabular', 1, 'SAVED', 1, 1, 1, 'Public'),
(2, 1, 'Contacts without Accounts', 'Contacts not related to Accounts', 'tabular', 2, 'SAVED', 1, 1, 1, 'Public'),
(3, 1, 'Contacts by Potentials', 'Contacts related to Potentials', 'tabular', 3, 'SAVED', 1, 1, 1, 'Public'),
(4, 2, 'Lead by Source', 'Lead by Source', 'summary', 4, 'SAVED', 1, 1, 1, 'Public'),
(5, 2, 'Lead Status Report', 'Lead Status Report', 'summary', 5, 'SAVED', 1, 1, 1, 'Public'),
(6, 3, 'Potential Pipeline', 'Potential Pipeline', 'summary', 6, 'SAVED', 1, 1, 1, 'Public'),
(7, 3, 'Closed Potentials', 'Potential that have Won', 'tabular', 7, 'SAVED', 1, 1, 1, 'Public'),
(8, 4, 'Last Month Activities', 'Last Month Activities', 'tabular', 8, 'SAVED', 1, 1, 1, 'Public'),
(9, 4, 'This Month Activities', 'This Month Activities', 'tabular', 9, 'SAVED', 1, 1, 1, 'Public'),
(10, 5, 'Tickets by Products', 'Tickets related to Products', 'tabular', 10, 'SAVED', 1, 1, 1, 'Public'),
(11, 5, 'Tickets by Priority', 'Tickets by Priority', 'summary', 11, 'SAVED', 1, 1, 1, 'Public'),
(12, 5, 'Open Tickets', 'Tickets that are Open', 'tabular', 12, 'SAVED', 1, 1, 1, 'Public'),
(13, 6, 'Product Details', 'Product Detailed Report', 'tabular', 13, 'SAVED', 1, 1, 1, 'Public'),
(14, 6, 'Products by Contacts', 'Products related to Contacts', 'tabular', 14, 'SAVED', 1, 1, 1, 'Public'),
(15, 7, 'Open Quotes', 'Quotes that are Open', 'tabular', 15, 'SAVED', 1, 1, 1, 'Public'),
(16, 7, 'Quotes Detailed Report', 'Quotes Detailed Report', 'tabular', 16, 'SAVED', 1, 1, 1, 'Public'),
(17, 8, 'PurchaseOrder by Contacts', 'PurchaseOrder related to Contacts', 'tabular', 17, 'SAVED', 1, 1, 1, 'Public'),
(18, 8, 'PurchaseOrder Detailed Report', 'PurchaseOrder Detailed Report', 'tabular', 18, 'SAVED', 1, 1, 1, 'Public'),
(19, 9, 'Invoice Detailed Report', 'Invoice Detailed Report', 'tabular', 19, 'SAVED', 1, 1, 1, 'Public'),
(20, 10, 'SalesOrder Detailed Report', 'SalesOrder Detailed Report', 'tabular', 20, 'SAVED', 1, 1, 1, 'Public'),
(21, 11, 'Campaign Expectations and Actuals', 'Campaign Expectations and Actuals', 'tabular', 21, 'SAVED', 1, 1, 1, 'Public');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportdatefilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportdatefilter` (
  `datefilterid` int(19) NOT NULL,
  `datecolumnname` varchar(250) DEFAULT '',
  `datefilter` varchar(250) DEFAULT '',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`datefilterid`),
  KEY `reportdatefilter_datefilterid_idx` (`datefilterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportdatefilter`
--

INSERT INTO `vtiger_reportdatefilter` (`datefilterid`, `datecolumnname`, `datefilter`, `startdate`, `enddate`) VALUES
(8, 'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time', 'lastmonth', '2005-05-01', '2005-05-31'),
(9, 'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time', 'thismonth', '2005-06-01', '2005-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportfilters`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportfilters` (
  `filterid` int(19) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportfilters`
--

INSERT INTO `vtiger_reportfilters` (`filterid`, `name`) VALUES
(1, 'Private'),
(2, 'Public'),
(3, 'Shared');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportfolder`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportfolder` (
  `folderid` int(19) NOT NULL AUTO_INCREMENT,
  `foldername` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `state` varchar(50) DEFAULT 'SAVED',
  PRIMARY KEY (`folderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `vtiger_reportfolder`
--

INSERT INTO `vtiger_reportfolder` (`folderid`, `foldername`, `description`, `state`) VALUES
(1, 'Account and Contact Reports', 'Account and Contact Reports', 'SAVED'),
(2, 'Lead Reports', 'Lead Reports', 'SAVED'),
(3, 'Potential Reports', 'Potential Reports', 'SAVED'),
(4, 'Activity Reports', 'Activity Reports', 'SAVED'),
(5, 'HelpDesk Reports', 'HelpDesk Reports', 'SAVED'),
(6, 'Product Reports', 'Product Reports', 'SAVED'),
(7, 'Quote Reports', 'Quote Reports', 'SAVED'),
(8, 'PurchaseOrder Reports', 'PurchaseOrder Reports', 'SAVED'),
(9, 'Invoice Reports', 'Invoice Reports', 'SAVED'),
(10, 'SalesOrder Reports', 'SalesOrder Reports', 'SAVED'),
(11, 'Campaign Reports', 'Campaign Reports', 'SAVED');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportgroupbycolumn`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportgroupbycolumn` (
  `reportid` int(19) DEFAULT NULL,
  `sortid` int(19) DEFAULT NULL,
  `sortcolname` varchar(250) DEFAULT NULL,
  `dategroupbycriteria` varchar(250) DEFAULT NULL,
  KEY `fk_1_vtiger_reportgroupbycolumn` (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportmodules`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportmodules` (
  `reportmodulesid` int(19) NOT NULL,
  `primarymodule` varchar(50) NOT NULL DEFAULT '',
  `secondarymodules` varchar(250) DEFAULT '',
  PRIMARY KEY (`reportmodulesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportmodules`
--

INSERT INTO `vtiger_reportmodules` (`reportmodulesid`, `primarymodule`, `secondarymodules`) VALUES
(1, 'Contacts', 'Accounts'),
(2, 'Contacts', 'Accounts'),
(3, 'Contacts', 'Potentials'),
(4, 'Leads', ''),
(5, 'Leads', ''),
(6, 'Potentials', ''),
(7, 'Potentials', ''),
(8, 'Calendar', ''),
(9, 'Calendar', ''),
(10, 'HelpDesk', 'Products'),
(11, 'HelpDesk', ''),
(12, 'HelpDesk', ''),
(13, 'Products', ''),
(14, 'Products', 'Contacts'),
(15, 'Quotes', ''),
(16, 'Quotes', ''),
(17, 'PurchaseOrder', 'Contacts'),
(18, 'PurchaseOrder', ''),
(19, 'Invoice', ''),
(20, 'SalesOrder', ''),
(21, 'Campaigns', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportsharing`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsharing` (
  `reportid` int(19) NOT NULL,
  `shareid` int(19) NOT NULL,
  `setype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportsortcol`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsortcol` (
  `sortcolid` int(19) NOT NULL,
  `reportid` int(19) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `sortorder` varchar(250) DEFAULT 'Asc',
  PRIMARY KEY (`sortcolid`,`reportid`),
  KEY `fk_1_vtiger_reportsortcol` (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportsortcol`
--

INSERT INTO `vtiger_reportsortcol` (`sortcolid`, `reportid`, `columnname`, `sortorder`) VALUES
(1, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V', 'Ascending'),
(1, 5, 'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V', 'Ascending'),
(1, 6, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V', 'Ascending'),
(1, 11, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V', 'Ascending');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportsummary`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsummary` (
  `reportsummaryid` int(19) NOT NULL,
  `summarytype` int(19) NOT NULL,
  `columnname` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`reportsummaryid`,`summarytype`,`columnname`),
  KEY `reportsummary_reportsummaryid_idx` (`reportsummaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_revenuetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_revenuetype` (
  `revenuetypeid` int(19) NOT NULL AUTO_INCREMENT,
  `revenuetype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`revenuetypeid`),
  UNIQUE KEY `revenuetype_revenuetype_idx` (`revenuetype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role`
--

CREATE TABLE IF NOT EXISTS `vtiger_role` (
  `roleid` varchar(255) NOT NULL,
  `rolename` varchar(200) DEFAULT NULL,
  `parentrole` varchar(255) DEFAULT NULL,
  `depth` int(19) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role`
--

INSERT INTO `vtiger_role` (`roleid`, `rolename`, `parentrole`, `depth`) VALUES
('H1', 'Organisation', 'H1', 0),
('H2', 'CEO', 'H1::H2', 1),
('H3', 'Vice President', 'H1::H2::H3', 2),
('H4', 'Sales Manager', 'H1::H2::H3::H4', 3),
('H5', 'Sales Man', 'H1::H2::H3::H4::H5', 4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role2picklist`
--

CREATE TABLE IF NOT EXISTS `vtiger_role2picklist` (
  `roleid` varchar(255) NOT NULL,
  `picklistvalueid` int(11) NOT NULL,
  `picklistid` int(11) NOT NULL,
  `sortid` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleid`,`picklistvalueid`,`picklistid`),
  KEY `role2picklist_roleid_picklistid_idx` (`roleid`,`picklistid`,`picklistvalueid`),
  KEY `fk_2_vtiger_role2picklist` (`picklistid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role2picklist`
--

INSERT INTO `vtiger_role2picklist` (`roleid`, `picklistvalueid`, `picklistid`, `sortid`) VALUES
('H1', 1, 1, 0),
('H1', 2, 1, 1),
('H1', 3, 1, 2),
('H1', 4, 1, 3),
('H1', 5, 1, 4),
('H1', 6, 1, 5),
('H1', 7, 1, 6),
('H1', 8, 1, 7),
('H1', 9, 1, 8),
('H1', 10, 1, 9),
('H1', 11, 1, 10),
('H1', 12, 2, 0),
('H1', 13, 2, 1),
('H1', 14, 3, 0),
('H1', 15, 3, 1),
('H1', 16, 3, 2),
('H1', 17, 3, 3),
('H1', 18, 3, 4),
('H1', 19, 3, 5),
('H1', 20, 4, 0),
('H1', 21, 4, 1),
('H1', 22, 4, 2),
('H1', 23, 4, 3),
('H1', 24, 4, 4),
('H1', 25, 4, 5),
('H1', 26, 4, 6),
('H1', 27, 4, 7),
('H1', 28, 4, 8),
('H1', 29, 4, 9),
('H1', 30, 4, 10),
('H1', 31, 4, 11),
('H1', 32, 4, 12),
('H1', 33, 5, 0),
('H1', 34, 5, 1),
('H1', 35, 5, 2),
('H1', 36, 5, 3),
('H1', 37, 5, 4),
('H1', 38, 6, 0),
('H1', 39, 6, 1),
('H1', 40, 6, 2),
('H1', 41, 7, 0),
('H1', 42, 7, 1),
('H1', 43, 7, 2),
('H1', 44, 7, 3),
('H1', 45, 7, 4),
('H1', 46, 8, 0),
('H1', 47, 9, 0),
('H1', 48, 9, 1),
('H1', 49, 9, 2),
('H1', 50, 9, 3),
('H1', 51, 10, 0),
('H1', 52, 10, 1),
('H1', 53, 10, 2),
('H1', 54, 10, 3),
('H1', 55, 10, 4),
('H1', 56, 10, 5),
('H1', 57, 10, 6),
('H1', 58, 10, 7),
('H1', 59, 10, 8),
('H1', 60, 11, 0),
('H1', 61, 11, 1),
('H1', 62, 11, 2),
('H1', 63, 11, 3),
('H1', 64, 11, 4),
('H1', 65, 11, 5),
('H1', 66, 11, 6),
('H1', 67, 11, 7),
('H1', 68, 11, 8),
('H1', 69, 11, 9),
('H1', 70, 11, 10),
('H1', 71, 11, 11),
('H1', 72, 11, 12),
('H1', 73, 11, 13),
('H1', 74, 11, 14),
('H1', 75, 11, 15),
('H1', 76, 11, 16),
('H1', 77, 11, 17),
('H1', 78, 11, 18),
('H1', 79, 11, 19),
('H1', 80, 11, 20),
('H1', 81, 11, 21),
('H1', 82, 11, 22),
('H1', 83, 11, 23),
('H1', 84, 11, 24),
('H1', 85, 11, 25),
('H1', 86, 11, 26),
('H1', 87, 11, 27),
('H1', 88, 11, 28),
('H1', 89, 11, 29),
('H1', 90, 11, 30),
('H1', 91, 11, 31),
('H1', 92, 12, 0),
('H1', 93, 12, 1),
('H1', 94, 12, 2),
('H1', 95, 12, 3),
('H1', 96, 12, 4),
('H1', 97, 12, 5),
('H1', 98, 13, 0),
('H1', 99, 13, 1),
('H1', 100, 13, 2),
('H1', 101, 13, 3),
('H1', 102, 13, 4),
('H1', 103, 13, 5),
('H1', 104, 13, 6),
('H1', 105, 13, 7),
('H1', 106, 13, 8),
('H1', 107, 13, 9),
('H1', 108, 13, 10),
('H1', 109, 13, 11),
('H1', 110, 13, 12),
('H1', 111, 14, 0),
('H1', 112, 14, 1),
('H1', 113, 14, 2),
('H1', 114, 14, 3),
('H1', 115, 14, 4),
('H1', 116, 14, 5),
('H1', 117, 14, 6),
('H1', 118, 14, 7),
('H1', 119, 14, 8),
('H1', 120, 14, 9),
('H1', 121, 14, 10),
('H1', 122, 14, 11),
('H1', 123, 15, 0),
('H1', 124, 15, 1),
('H1', 125, 15, 2),
('H1', 126, 15, 3),
('H1', 127, 16, 0),
('H1', 128, 16, 1),
('H1', 129, 16, 2),
('H1', 130, 17, 0),
('H1', 131, 17, 1),
('H1', 132, 17, 2),
('H1', 133, 17, 3),
('H1', 134, 17, 4),
('H1', 135, 18, 0),
('H1', 136, 18, 1),
('H1', 137, 18, 2),
('H1', 138, 18, 3),
('H1', 139, 19, 0),
('H1', 140, 19, 1),
('H1', 141, 19, 2),
('H1', 142, 19, 3),
('H1', 143, 19, 4),
('H1', 144, 20, 0),
('H1', 145, 20, 1),
('H1', 146, 20, 2),
('H1', 147, 20, 3),
('H1', 148, 20, 4),
('H1', 149, 20, 5),
('H1', 150, 21, 0),
('H1', 151, 21, 1),
('H1', 152, 21, 2),
('H1', 153, 21, 3),
('H1', 154, 21, 4),
('H1', 155, 21, 5),
('H1', 156, 21, 6),
('H1', 157, 21, 7),
('H1', 158, 21, 8),
('H1', 159, 21, 9),
('H1', 160, 22, 0),
('H1', 161, 22, 1),
('H1', 162, 22, 2),
('H1', 163, 22, 3),
('H1', 164, 22, 4),
('H1', 165, 22, 5),
('H1', 166, 23, 0),
('H1', 167, 23, 1),
('H1', 168, 23, 2),
('H1', 169, 23, 3),
('H1', 170, 24, 0),
('H1', 171, 24, 1),
('H1', 172, 24, 2),
('H1', 173, 25, 0),
('H1', 174, 25, 1),
('H1', 175, 25, 2),
('H1', 176, 25, 3),
('H1', 177, 25, 4),
('H1', 178, 25, 5),
('H1', 179, 26, 0),
('H1', 180, 26, 1),
('H1', 181, 26, 2),
('H1', 182, 27, 0),
('H1', 183, 27, 1),
('H1', 184, 27, 2),
('H1', 185, 27, 3),
('H1', 186, 28, 0),
('H1', 187, 28, 1),
('H1', 188, 28, 2),
('H1', 189, 28, 3),
('H1', 190, 29, 0),
('H1', 191, 29, 1),
('H1', 192, 29, 2),
('H1', 193, 29, 3),
('H1', 194, 30, 0),
('H1', 195, 30, 1),
('H1', 196, 30, 2),
('H1', 197, 30, 3),
('H1', 198, 30, 4),
('H1', 199, 30, 5),
('H1', 200, 30, 6),
('H1', 201, 30, 7),
('H1', 202, 30, 8),
('H1', 203, 30, 9),
('H1', 204, 30, 10),
('H1', 205, 30, 11),
('H1', 206, 30, 12),
('H1', 207, 30, 13),
('H1', 208, 30, 14),
('H1', 209, 30, 15),
('H1', 210, 31, 1),
('H1', 211, 31, 2),
('H1', 212, 31, 3),
('H1', 213, 31, 4),
('H1', 214, 32, 1),
('H1', 215, 32, 2),
('H1', 216, 32, 3),
('H1', 217, 32, 4),
('H1', 218, 32, 5),
('H1', 219, 32, 6),
('H1', 220, 33, 1),
('H1', 221, 33, 2),
('H1', 222, 33, 3),
('H1', 223, 34, 1),
('H1', 224, 34, 2),
('H1', 225, 34, 3),
('H1', 226, 35, 1),
('H1', 227, 35, 2),
('H1', 228, 35, 3),
('H1', 229, 36, 1),
('H1', 230, 36, 2),
('H1', 231, 36, 3),
('H1', 232, 36, 4),
('H1', 233, 36, 5),
('H1', 234, 36, 6),
('H1', 235, 37, 1),
('H1', 236, 37, 2),
('H1', 237, 38, 1),
('H1', 238, 38, 2),
('H1', 239, 38, 3),
('H1', 240, 38, 4),
('H1', 241, 39, 1),
('H1', 242, 39, 2),
('H1', 243, 39, 3),
('H1', 244, 39, 4),
('H1', 245, 40, 1),
('H1', 246, 40, 2),
('H1', 247, 40, 3),
('H1', 248, 40, 4),
('H1', 249, 41, 1),
('H1', 250, 41, 2),
('H1', 251, 41, 3),
('H1', 252, 41, 4),
('H1', 253, 41, 5),
('H1', 254, 41, 6),
('H1', 255, 41, 7),
('H1', 256, 41, 8),
('H1', 257, 41, 9),
('H1', 258, 41, 10),
('H1', 259, 41, 11),
('H1', 260, 42, 1),
('H1', 261, 42, 2),
('H1', 262, 42, 3),
('H1', 263, 42, 4),
('H1', 264, 42, 5),
('H1', 265, 42, 6),
('H1', 266, 42, 7),
('H1', 267, 42, 8),
('H1', 268, 42, 9),
('H1', 269, 43, 1),
('H1', 270, 43, 2),
('H1', 271, 43, 3),
('H1', 272, 43, 4),
('H1', 273, 44, 1),
('H1', 274, 44, 2),
('H1', 275, 44, 3),
('H1', 276, 44, 4),
('H1', 277, 45, 1),
('H1', 278, 45, 2),
('H1', 279, 45, 3),
('H1', 280, 45, 4),
('H1', 281, 45, 5),
('H1', 282, 45, 6),
('H1', 283, 45, 7),
('H1', 284, 45, 8),
('H1', 285, 45, 9),
('H1', 286, 45, 10),
('H1', 287, 45, 11),
('H2', 1, 1, 0),
('H2', 2, 1, 1),
('H2', 3, 1, 2),
('H2', 4, 1, 3),
('H2', 5, 1, 4),
('H2', 6, 1, 5),
('H2', 7, 1, 6),
('H2', 8, 1, 7),
('H2', 9, 1, 8),
('H2', 10, 1, 9),
('H2', 11, 1, 10),
('H2', 12, 2, 0),
('H2', 13, 2, 1),
('H2', 14, 3, 0),
('H2', 15, 3, 1),
('H2', 16, 3, 2),
('H2', 17, 3, 3),
('H2', 18, 3, 4),
('H2', 19, 3, 5),
('H2', 20, 4, 0),
('H2', 21, 4, 1),
('H2', 22, 4, 2),
('H2', 23, 4, 3),
('H2', 24, 4, 4),
('H2', 25, 4, 5),
('H2', 26, 4, 6),
('H2', 27, 4, 7),
('H2', 28, 4, 8),
('H2', 29, 4, 9),
('H2', 30, 4, 10),
('H2', 31, 4, 11),
('H2', 32, 4, 12),
('H2', 33, 5, 0),
('H2', 34, 5, 1),
('H2', 35, 5, 2),
('H2', 36, 5, 3),
('H2', 37, 5, 4),
('H2', 38, 6, 0),
('H2', 39, 6, 1),
('H2', 40, 6, 2),
('H2', 41, 7, 0),
('H2', 42, 7, 1),
('H2', 43, 7, 2),
('H2', 44, 7, 3),
('H2', 45, 7, 4),
('H2', 46, 8, 0),
('H2', 47, 9, 0),
('H2', 48, 9, 1),
('H2', 49, 9, 2),
('H2', 50, 9, 3),
('H2', 51, 10, 0),
('H2', 52, 10, 1),
('H2', 53, 10, 2),
('H2', 54, 10, 3),
('H2', 55, 10, 4),
('H2', 56, 10, 5),
('H2', 57, 10, 6),
('H2', 58, 10, 7),
('H2', 59, 10, 8),
('H2', 60, 11, 0),
('H2', 61, 11, 1),
('H2', 62, 11, 2),
('H2', 63, 11, 3),
('H2', 64, 11, 4),
('H2', 65, 11, 5),
('H2', 66, 11, 6),
('H2', 67, 11, 7),
('H2', 68, 11, 8),
('H2', 69, 11, 9),
('H2', 70, 11, 10),
('H2', 71, 11, 11),
('H2', 72, 11, 12),
('H2', 73, 11, 13),
('H2', 74, 11, 14),
('H2', 75, 11, 15),
('H2', 76, 11, 16),
('H2', 77, 11, 17),
('H2', 78, 11, 18),
('H2', 79, 11, 19),
('H2', 80, 11, 20),
('H2', 81, 11, 21),
('H2', 82, 11, 22),
('H2', 83, 11, 23),
('H2', 84, 11, 24),
('H2', 85, 11, 25),
('H2', 86, 11, 26),
('H2', 87, 11, 27),
('H2', 88, 11, 28),
('H2', 89, 11, 29),
('H2', 90, 11, 30),
('H2', 91, 11, 31),
('H2', 92, 12, 0),
('H2', 93, 12, 1),
('H2', 94, 12, 2),
('H2', 95, 12, 3),
('H2', 96, 12, 4),
('H2', 97, 12, 5),
('H2', 98, 13, 0),
('H2', 99, 13, 1),
('H2', 100, 13, 2),
('H2', 101, 13, 3),
('H2', 102, 13, 4),
('H2', 103, 13, 5),
('H2', 104, 13, 6),
('H2', 105, 13, 7),
('H2', 106, 13, 8),
('H2', 107, 13, 9),
('H2', 108, 13, 10),
('H2', 109, 13, 11),
('H2', 110, 13, 12),
('H2', 111, 14, 0),
('H2', 112, 14, 1),
('H2', 113, 14, 2),
('H2', 114, 14, 3),
('H2', 115, 14, 4),
('H2', 116, 14, 5),
('H2', 117, 14, 6),
('H2', 118, 14, 7),
('H2', 119, 14, 8),
('H2', 120, 14, 9),
('H2', 121, 14, 10),
('H2', 122, 14, 11),
('H2', 123, 15, 0),
('H2', 124, 15, 1),
('H2', 125, 15, 2),
('H2', 126, 15, 3),
('H2', 127, 16, 0),
('H2', 128, 16, 1),
('H2', 129, 16, 2),
('H2', 130, 17, 0),
('H2', 131, 17, 1),
('H2', 132, 17, 2),
('H2', 133, 17, 3),
('H2', 134, 17, 4),
('H2', 135, 18, 0),
('H2', 136, 18, 1),
('H2', 137, 18, 2),
('H2', 138, 18, 3),
('H2', 139, 19, 0),
('H2', 140, 19, 1),
('H2', 141, 19, 2),
('H2', 142, 19, 3),
('H2', 143, 19, 4),
('H2', 144, 20, 0),
('H2', 145, 20, 1),
('H2', 146, 20, 2),
('H2', 147, 20, 3),
('H2', 148, 20, 4),
('H2', 149, 20, 5),
('H2', 150, 21, 0),
('H2', 151, 21, 1),
('H2', 152, 21, 2),
('H2', 153, 21, 3),
('H2', 154, 21, 4),
('H2', 155, 21, 5),
('H2', 156, 21, 6),
('H2', 157, 21, 7),
('H2', 158, 21, 8),
('H2', 159, 21, 9),
('H2', 160, 22, 0),
('H2', 161, 22, 1),
('H2', 162, 22, 2),
('H2', 163, 22, 3),
('H2', 164, 22, 4),
('H2', 165, 22, 5),
('H2', 166, 23, 0),
('H2', 167, 23, 1),
('H2', 168, 23, 2),
('H2', 169, 23, 3),
('H2', 170, 24, 0),
('H2', 171, 24, 1),
('H2', 172, 24, 2),
('H2', 173, 25, 0),
('H2', 174, 25, 1),
('H2', 175, 25, 2),
('H2', 176, 25, 3),
('H2', 177, 25, 4),
('H2', 178, 25, 5),
('H2', 179, 26, 0),
('H2', 180, 26, 1),
('H2', 181, 26, 2),
('H2', 182, 27, 0),
('H2', 183, 27, 1),
('H2', 184, 27, 2),
('H2', 185, 27, 3),
('H2', 186, 28, 0),
('H2', 187, 28, 1),
('H2', 188, 28, 2),
('H2', 189, 28, 3),
('H2', 190, 29, 0),
('H2', 191, 29, 1),
('H2', 192, 29, 2),
('H2', 193, 29, 3),
('H2', 194, 30, 0),
('H2', 195, 30, 1),
('H2', 196, 30, 2),
('H2', 197, 30, 3),
('H2', 198, 30, 4),
('H2', 199, 30, 5),
('H2', 200, 30, 6),
('H2', 201, 30, 7),
('H2', 202, 30, 8),
('H2', 203, 30, 9),
('H2', 204, 30, 10),
('H2', 205, 30, 11),
('H2', 206, 30, 12),
('H2', 207, 30, 13),
('H2', 208, 30, 14),
('H2', 209, 30, 15),
('H2', 210, 31, 1),
('H2', 211, 31, 2),
('H2', 212, 31, 3),
('H2', 213, 31, 4),
('H2', 214, 32, 1),
('H2', 215, 32, 2),
('H2', 216, 32, 3),
('H2', 217, 32, 4),
('H2', 218, 32, 5),
('H2', 219, 32, 6),
('H2', 220, 33, 1),
('H2', 221, 33, 2),
('H2', 222, 33, 3),
('H2', 223, 34, 1),
('H2', 224, 34, 2),
('H2', 225, 34, 3),
('H2', 226, 35, 1),
('H2', 227, 35, 2),
('H2', 228, 35, 3),
('H2', 229, 36, 1),
('H2', 230, 36, 2),
('H2', 231, 36, 3),
('H2', 232, 36, 4),
('H2', 233, 36, 5),
('H2', 234, 36, 6),
('H2', 235, 37, 1),
('H2', 236, 37, 2),
('H2', 237, 38, 1),
('H2', 238, 38, 2),
('H2', 239, 38, 3),
('H2', 240, 38, 4),
('H2', 241, 39, 1),
('H2', 242, 39, 2),
('H2', 243, 39, 3),
('H2', 244, 39, 4),
('H2', 245, 40, 1),
('H2', 246, 40, 2),
('H2', 247, 40, 3),
('H2', 248, 40, 4),
('H2', 249, 41, 1),
('H2', 250, 41, 2),
('H2', 251, 41, 3),
('H2', 252, 41, 4),
('H2', 253, 41, 5),
('H2', 254, 41, 6),
('H2', 255, 41, 7),
('H2', 256, 41, 8),
('H2', 257, 41, 9),
('H2', 258, 41, 10),
('H2', 259, 41, 11),
('H2', 260, 42, 1),
('H2', 261, 42, 2),
('H2', 262, 42, 3),
('H2', 263, 42, 4),
('H2', 264, 42, 5),
('H2', 265, 42, 6),
('H2', 266, 42, 7),
('H2', 267, 42, 8),
('H2', 268, 42, 9),
('H2', 269, 43, 1),
('H2', 270, 43, 2),
('H2', 271, 43, 3),
('H2', 272, 43, 4),
('H2', 273, 44, 1),
('H2', 274, 44, 2),
('H2', 275, 44, 3),
('H2', 276, 44, 4),
('H2', 277, 45, 1),
('H2', 278, 45, 2),
('H2', 279, 45, 3),
('H2', 280, 45, 4),
('H2', 281, 45, 5),
('H2', 282, 45, 6),
('H2', 283, 45, 7),
('H2', 284, 45, 8),
('H2', 285, 45, 9),
('H2', 286, 45, 10),
('H2', 287, 45, 11),
('H3', 1, 1, 0),
('H3', 2, 1, 1),
('H3', 3, 1, 2),
('H3', 4, 1, 3),
('H3', 5, 1, 4),
('H3', 6, 1, 5),
('H3', 7, 1, 6),
('H3', 8, 1, 7),
('H3', 9, 1, 8),
('H3', 10, 1, 9),
('H3', 11, 1, 10),
('H3', 12, 2, 0),
('H3', 13, 2, 1),
('H3', 14, 3, 0),
('H3', 15, 3, 1),
('H3', 16, 3, 2),
('H3', 17, 3, 3),
('H3', 18, 3, 4),
('H3', 19, 3, 5),
('H3', 20, 4, 0),
('H3', 21, 4, 1),
('H3', 22, 4, 2),
('H3', 23, 4, 3),
('H3', 24, 4, 4),
('H3', 25, 4, 5),
('H3', 26, 4, 6),
('H3', 27, 4, 7),
('H3', 28, 4, 8),
('H3', 29, 4, 9),
('H3', 30, 4, 10),
('H3', 31, 4, 11),
('H3', 32, 4, 12),
('H3', 33, 5, 0),
('H3', 34, 5, 1),
('H3', 35, 5, 2),
('H3', 36, 5, 3),
('H3', 37, 5, 4),
('H3', 38, 6, 0),
('H3', 39, 6, 1),
('H3', 40, 6, 2),
('H3', 41, 7, 0),
('H3', 42, 7, 1),
('H3', 43, 7, 2),
('H3', 44, 7, 3),
('H3', 45, 7, 4),
('H3', 46, 8, 0),
('H3', 47, 9, 0),
('H3', 48, 9, 1),
('H3', 49, 9, 2),
('H3', 50, 9, 3),
('H3', 51, 10, 0),
('H3', 52, 10, 1),
('H3', 53, 10, 2),
('H3', 54, 10, 3),
('H3', 55, 10, 4),
('H3', 56, 10, 5),
('H3', 57, 10, 6),
('H3', 58, 10, 7),
('H3', 59, 10, 8),
('H3', 60, 11, 0),
('H3', 61, 11, 1),
('H3', 62, 11, 2),
('H3', 63, 11, 3),
('H3', 64, 11, 4),
('H3', 65, 11, 5),
('H3', 66, 11, 6),
('H3', 67, 11, 7),
('H3', 68, 11, 8),
('H3', 69, 11, 9),
('H3', 70, 11, 10),
('H3', 71, 11, 11),
('H3', 72, 11, 12),
('H3', 73, 11, 13),
('H3', 74, 11, 14),
('H3', 75, 11, 15),
('H3', 76, 11, 16),
('H3', 77, 11, 17),
('H3', 78, 11, 18),
('H3', 79, 11, 19),
('H3', 80, 11, 20),
('H3', 81, 11, 21),
('H3', 82, 11, 22),
('H3', 83, 11, 23),
('H3', 84, 11, 24),
('H3', 85, 11, 25),
('H3', 86, 11, 26),
('H3', 87, 11, 27),
('H3', 88, 11, 28),
('H3', 89, 11, 29),
('H3', 90, 11, 30),
('H3', 91, 11, 31),
('H3', 92, 12, 0),
('H3', 93, 12, 1),
('H3', 94, 12, 2),
('H3', 95, 12, 3),
('H3', 96, 12, 4),
('H3', 97, 12, 5),
('H3', 98, 13, 0),
('H3', 99, 13, 1),
('H3', 100, 13, 2),
('H3', 101, 13, 3),
('H3', 102, 13, 4),
('H3', 103, 13, 5),
('H3', 104, 13, 6),
('H3', 105, 13, 7),
('H3', 106, 13, 8),
('H3', 107, 13, 9),
('H3', 108, 13, 10),
('H3', 109, 13, 11),
('H3', 110, 13, 12),
('H3', 111, 14, 0),
('H3', 112, 14, 1),
('H3', 113, 14, 2),
('H3', 114, 14, 3),
('H3', 115, 14, 4),
('H3', 116, 14, 5),
('H3', 117, 14, 6),
('H3', 118, 14, 7),
('H3', 119, 14, 8),
('H3', 120, 14, 9),
('H3', 121, 14, 10),
('H3', 122, 14, 11),
('H3', 123, 15, 0),
('H3', 124, 15, 1),
('H3', 125, 15, 2),
('H3', 126, 15, 3),
('H3', 127, 16, 0),
('H3', 128, 16, 1),
('H3', 129, 16, 2),
('H3', 130, 17, 0),
('H3', 131, 17, 1),
('H3', 132, 17, 2),
('H3', 133, 17, 3),
('H3', 134, 17, 4),
('H3', 135, 18, 0),
('H3', 136, 18, 1),
('H3', 137, 18, 2),
('H3', 138, 18, 3),
('H3', 139, 19, 0),
('H3', 140, 19, 1),
('H3', 141, 19, 2),
('H3', 142, 19, 3),
('H3', 143, 19, 4),
('H3', 144, 20, 0),
('H3', 145, 20, 1),
('H3', 146, 20, 2),
('H3', 147, 20, 3),
('H3', 148, 20, 4),
('H3', 149, 20, 5),
('H3', 150, 21, 0),
('H3', 151, 21, 1),
('H3', 152, 21, 2),
('H3', 153, 21, 3),
('H3', 154, 21, 4),
('H3', 155, 21, 5),
('H3', 156, 21, 6),
('H3', 157, 21, 7),
('H3', 158, 21, 8),
('H3', 159, 21, 9),
('H3', 160, 22, 0),
('H3', 161, 22, 1),
('H3', 162, 22, 2),
('H3', 163, 22, 3),
('H3', 164, 22, 4),
('H3', 165, 22, 5),
('H3', 166, 23, 0),
('H3', 167, 23, 1),
('H3', 168, 23, 2),
('H3', 169, 23, 3),
('H3', 170, 24, 0),
('H3', 171, 24, 1),
('H3', 172, 24, 2),
('H3', 173, 25, 0),
('H3', 174, 25, 1),
('H3', 175, 25, 2),
('H3', 176, 25, 3),
('H3', 177, 25, 4),
('H3', 178, 25, 5),
('H3', 179, 26, 0),
('H3', 180, 26, 1),
('H3', 181, 26, 2),
('H3', 182, 27, 0),
('H3', 183, 27, 1),
('H3', 184, 27, 2),
('H3', 185, 27, 3),
('H3', 186, 28, 0),
('H3', 187, 28, 1),
('H3', 188, 28, 2),
('H3', 189, 28, 3),
('H3', 190, 29, 0),
('H3', 191, 29, 1),
('H3', 192, 29, 2),
('H3', 193, 29, 3),
('H3', 194, 30, 0),
('H3', 195, 30, 1),
('H3', 196, 30, 2),
('H3', 197, 30, 3),
('H3', 198, 30, 4),
('H3', 199, 30, 5),
('H3', 200, 30, 6),
('H3', 201, 30, 7),
('H3', 202, 30, 8),
('H3', 203, 30, 9),
('H3', 204, 30, 10),
('H3', 205, 30, 11),
('H3', 206, 30, 12),
('H3', 207, 30, 13),
('H3', 208, 30, 14),
('H3', 209, 30, 15),
('H3', 210, 31, 1),
('H3', 211, 31, 2),
('H3', 212, 31, 3),
('H3', 213, 31, 4),
('H3', 214, 32, 1),
('H3', 215, 32, 2),
('H3', 216, 32, 3),
('H3', 217, 32, 4),
('H3', 218, 32, 5),
('H3', 219, 32, 6),
('H3', 220, 33, 1),
('H3', 221, 33, 2),
('H3', 222, 33, 3),
('H3', 223, 34, 1),
('H3', 224, 34, 2),
('H3', 225, 34, 3),
('H3', 226, 35, 1),
('H3', 227, 35, 2),
('H3', 228, 35, 3),
('H3', 229, 36, 1),
('H3', 230, 36, 2),
('H3', 231, 36, 3),
('H3', 232, 36, 4),
('H3', 233, 36, 5),
('H3', 234, 36, 6),
('H3', 235, 37, 1),
('H3', 236, 37, 2),
('H3', 237, 38, 1),
('H3', 238, 38, 2),
('H3', 239, 38, 3),
('H3', 240, 38, 4),
('H3', 241, 39, 1),
('H3', 242, 39, 2),
('H3', 243, 39, 3),
('H3', 244, 39, 4),
('H3', 245, 40, 1),
('H3', 246, 40, 2),
('H3', 247, 40, 3),
('H3', 248, 40, 4),
('H3', 249, 41, 1),
('H3', 250, 41, 2),
('H3', 251, 41, 3),
('H3', 252, 41, 4),
('H3', 253, 41, 5),
('H3', 254, 41, 6),
('H3', 255, 41, 7),
('H3', 256, 41, 8),
('H3', 257, 41, 9),
('H3', 258, 41, 10),
('H3', 259, 41, 11),
('H3', 260, 42, 1),
('H3', 261, 42, 2),
('H3', 262, 42, 3),
('H3', 263, 42, 4),
('H3', 264, 42, 5),
('H3', 265, 42, 6),
('H3', 266, 42, 7),
('H3', 267, 42, 8),
('H3', 268, 42, 9),
('H3', 269, 43, 1),
('H3', 270, 43, 2),
('H3', 271, 43, 3),
('H3', 272, 43, 4),
('H3', 273, 44, 1),
('H3', 274, 44, 2),
('H3', 275, 44, 3),
('H3', 276, 44, 4),
('H3', 277, 45, 1),
('H3', 278, 45, 2),
('H3', 279, 45, 3),
('H3', 280, 45, 4),
('H3', 281, 45, 5),
('H3', 282, 45, 6),
('H3', 283, 45, 7),
('H3', 284, 45, 8),
('H3', 285, 45, 9),
('H3', 286, 45, 10),
('H3', 287, 45, 11),
('H4', 1, 1, 0),
('H4', 2, 1, 1),
('H4', 3, 1, 2),
('H4', 4, 1, 3),
('H4', 5, 1, 4),
('H4', 6, 1, 5),
('H4', 7, 1, 6),
('H4', 8, 1, 7),
('H4', 9, 1, 8),
('H4', 10, 1, 9),
('H4', 11, 1, 10),
('H4', 12, 2, 0),
('H4', 13, 2, 1),
('H4', 14, 3, 0),
('H4', 15, 3, 1),
('H4', 16, 3, 2),
('H4', 17, 3, 3),
('H4', 18, 3, 4),
('H4', 19, 3, 5),
('H4', 20, 4, 0),
('H4', 21, 4, 1),
('H4', 22, 4, 2),
('H4', 23, 4, 3),
('H4', 24, 4, 4),
('H4', 25, 4, 5),
('H4', 26, 4, 6),
('H4', 27, 4, 7),
('H4', 28, 4, 8),
('H4', 29, 4, 9),
('H4', 30, 4, 10),
('H4', 31, 4, 11),
('H4', 32, 4, 12),
('H4', 33, 5, 0),
('H4', 34, 5, 1),
('H4', 35, 5, 2),
('H4', 36, 5, 3),
('H4', 37, 5, 4),
('H4', 38, 6, 0),
('H4', 39, 6, 1),
('H4', 40, 6, 2),
('H4', 41, 7, 0),
('H4', 42, 7, 1),
('H4', 43, 7, 2),
('H4', 44, 7, 3),
('H4', 45, 7, 4),
('H4', 46, 8, 0),
('H4', 47, 9, 0),
('H4', 48, 9, 1),
('H4', 49, 9, 2),
('H4', 50, 9, 3),
('H4', 51, 10, 0),
('H4', 52, 10, 1),
('H4', 53, 10, 2),
('H4', 54, 10, 3),
('H4', 55, 10, 4),
('H4', 56, 10, 5),
('H4', 57, 10, 6),
('H4', 58, 10, 7),
('H4', 59, 10, 8),
('H4', 60, 11, 0),
('H4', 61, 11, 1),
('H4', 62, 11, 2),
('H4', 63, 11, 3),
('H4', 64, 11, 4),
('H4', 65, 11, 5),
('H4', 66, 11, 6),
('H4', 67, 11, 7),
('H4', 68, 11, 8),
('H4', 69, 11, 9),
('H4', 70, 11, 10),
('H4', 71, 11, 11),
('H4', 72, 11, 12),
('H4', 73, 11, 13),
('H4', 74, 11, 14),
('H4', 75, 11, 15),
('H4', 76, 11, 16),
('H4', 77, 11, 17),
('H4', 78, 11, 18),
('H4', 79, 11, 19),
('H4', 80, 11, 20),
('H4', 81, 11, 21),
('H4', 82, 11, 22),
('H4', 83, 11, 23),
('H4', 84, 11, 24),
('H4', 85, 11, 25),
('H4', 86, 11, 26),
('H4', 87, 11, 27),
('H4', 88, 11, 28),
('H4', 89, 11, 29),
('H4', 90, 11, 30),
('H4', 91, 11, 31),
('H4', 92, 12, 0),
('H4', 93, 12, 1),
('H4', 94, 12, 2),
('H4', 95, 12, 3),
('H4', 96, 12, 4),
('H4', 97, 12, 5),
('H4', 98, 13, 0),
('H4', 99, 13, 1),
('H4', 100, 13, 2),
('H4', 101, 13, 3),
('H4', 102, 13, 4),
('H4', 103, 13, 5),
('H4', 104, 13, 6),
('H4', 105, 13, 7),
('H4', 106, 13, 8),
('H4', 107, 13, 9),
('H4', 108, 13, 10),
('H4', 109, 13, 11),
('H4', 110, 13, 12),
('H4', 111, 14, 0),
('H4', 112, 14, 1),
('H4', 113, 14, 2),
('H4', 114, 14, 3),
('H4', 115, 14, 4),
('H4', 116, 14, 5),
('H4', 117, 14, 6),
('H4', 118, 14, 7),
('H4', 119, 14, 8),
('H4', 120, 14, 9),
('H4', 121, 14, 10),
('H4', 122, 14, 11),
('H4', 123, 15, 0),
('H4', 124, 15, 1),
('H4', 125, 15, 2),
('H4', 126, 15, 3),
('H4', 127, 16, 0),
('H4', 128, 16, 1),
('H4', 129, 16, 2),
('H4', 130, 17, 0),
('H4', 131, 17, 1),
('H4', 132, 17, 2),
('H4', 133, 17, 3),
('H4', 134, 17, 4),
('H4', 135, 18, 0),
('H4', 136, 18, 1),
('H4', 137, 18, 2),
('H4', 138, 18, 3),
('H4', 139, 19, 0),
('H4', 140, 19, 1),
('H4', 141, 19, 2),
('H4', 142, 19, 3),
('H4', 143, 19, 4),
('H4', 144, 20, 0),
('H4', 145, 20, 1),
('H4', 146, 20, 2),
('H4', 147, 20, 3),
('H4', 148, 20, 4),
('H4', 149, 20, 5),
('H4', 150, 21, 0),
('H4', 151, 21, 1),
('H4', 152, 21, 2),
('H4', 153, 21, 3),
('H4', 154, 21, 4),
('H4', 155, 21, 5),
('H4', 156, 21, 6),
('H4', 157, 21, 7),
('H4', 158, 21, 8),
('H4', 159, 21, 9),
('H4', 160, 22, 0),
('H4', 161, 22, 1),
('H4', 162, 22, 2),
('H4', 163, 22, 3),
('H4', 164, 22, 4),
('H4', 165, 22, 5),
('H4', 166, 23, 0),
('H4', 167, 23, 1),
('H4', 168, 23, 2),
('H4', 169, 23, 3),
('H4', 170, 24, 0),
('H4', 171, 24, 1),
('H4', 172, 24, 2),
('H4', 173, 25, 0),
('H4', 174, 25, 1),
('H4', 175, 25, 2),
('H4', 176, 25, 3),
('H4', 177, 25, 4),
('H4', 178, 25, 5),
('H4', 179, 26, 0),
('H4', 180, 26, 1),
('H4', 181, 26, 2),
('H4', 182, 27, 0),
('H4', 183, 27, 1),
('H4', 184, 27, 2),
('H4', 185, 27, 3),
('H4', 186, 28, 0),
('H4', 187, 28, 1),
('H4', 188, 28, 2),
('H4', 189, 28, 3),
('H4', 190, 29, 0),
('H4', 191, 29, 1),
('H4', 192, 29, 2),
('H4', 193, 29, 3),
('H4', 194, 30, 0),
('H4', 195, 30, 1),
('H4', 196, 30, 2),
('H4', 197, 30, 3),
('H4', 198, 30, 4),
('H4', 199, 30, 5),
('H4', 200, 30, 6),
('H4', 201, 30, 7),
('H4', 202, 30, 8),
('H4', 203, 30, 9),
('H4', 204, 30, 10),
('H4', 205, 30, 11),
('H4', 206, 30, 12),
('H4', 207, 30, 13),
('H4', 208, 30, 14),
('H4', 209, 30, 15),
('H4', 210, 31, 1),
('H4', 211, 31, 2),
('H4', 212, 31, 3),
('H4', 213, 31, 4),
('H4', 214, 32, 1),
('H4', 215, 32, 2),
('H4', 216, 32, 3),
('H4', 217, 32, 4),
('H4', 218, 32, 5),
('H4', 219, 32, 6),
('H4', 220, 33, 1),
('H4', 221, 33, 2),
('H4', 222, 33, 3),
('H4', 223, 34, 1),
('H4', 224, 34, 2),
('H4', 225, 34, 3),
('H4', 226, 35, 1),
('H4', 227, 35, 2),
('H4', 228, 35, 3),
('H4', 229, 36, 1),
('H4', 230, 36, 2),
('H4', 231, 36, 3),
('H4', 232, 36, 4),
('H4', 233, 36, 5),
('H4', 234, 36, 6),
('H4', 235, 37, 1),
('H4', 236, 37, 2),
('H4', 237, 38, 1),
('H4', 238, 38, 2),
('H4', 239, 38, 3),
('H4', 240, 38, 4),
('H4', 241, 39, 1),
('H4', 242, 39, 2),
('H4', 243, 39, 3),
('H4', 244, 39, 4),
('H4', 245, 40, 1),
('H4', 246, 40, 2),
('H4', 247, 40, 3),
('H4', 248, 40, 4),
('H4', 249, 41, 1),
('H4', 250, 41, 2),
('H4', 251, 41, 3),
('H4', 252, 41, 4),
('H4', 253, 41, 5),
('H4', 254, 41, 6),
('H4', 255, 41, 7),
('H4', 256, 41, 8),
('H4', 257, 41, 9),
('H4', 258, 41, 10),
('H4', 259, 41, 11),
('H4', 260, 42, 1),
('H4', 261, 42, 2),
('H4', 262, 42, 3),
('H4', 263, 42, 4),
('H4', 264, 42, 5),
('H4', 265, 42, 6),
('H4', 266, 42, 7),
('H4', 267, 42, 8),
('H4', 268, 42, 9),
('H4', 269, 43, 1),
('H4', 270, 43, 2),
('H4', 271, 43, 3),
('H4', 272, 43, 4),
('H4', 273, 44, 1),
('H4', 274, 44, 2),
('H4', 275, 44, 3),
('H4', 276, 44, 4),
('H4', 277, 45, 1),
('H4', 278, 45, 2),
('H4', 279, 45, 3),
('H4', 280, 45, 4),
('H4', 281, 45, 5),
('H4', 282, 45, 6),
('H4', 283, 45, 7),
('H4', 284, 45, 8),
('H4', 285, 45, 9),
('H4', 286, 45, 10),
('H4', 287, 45, 11),
('H5', 1, 1, 0),
('H5', 2, 1, 1),
('H5', 3, 1, 2),
('H5', 4, 1, 3),
('H5', 5, 1, 4),
('H5', 6, 1, 5),
('H5', 7, 1, 6),
('H5', 8, 1, 7),
('H5', 9, 1, 8),
('H5', 10, 1, 9),
('H5', 11, 1, 10),
('H5', 12, 2, 0),
('H5', 13, 2, 1),
('H5', 14, 3, 0),
('H5', 15, 3, 1),
('H5', 16, 3, 2),
('H5', 17, 3, 3),
('H5', 18, 3, 4),
('H5', 19, 3, 5),
('H5', 20, 4, 0),
('H5', 21, 4, 1),
('H5', 22, 4, 2),
('H5', 23, 4, 3),
('H5', 24, 4, 4),
('H5', 25, 4, 5),
('H5', 26, 4, 6),
('H5', 27, 4, 7),
('H5', 28, 4, 8),
('H5', 29, 4, 9),
('H5', 30, 4, 10),
('H5', 31, 4, 11),
('H5', 32, 4, 12),
('H5', 33, 5, 0),
('H5', 34, 5, 1),
('H5', 35, 5, 2),
('H5', 36, 5, 3),
('H5', 37, 5, 4),
('H5', 38, 6, 0),
('H5', 39, 6, 1),
('H5', 40, 6, 2),
('H5', 41, 7, 0),
('H5', 42, 7, 1),
('H5', 43, 7, 2),
('H5', 44, 7, 3),
('H5', 45, 7, 4),
('H5', 46, 8, 0),
('H5', 47, 9, 0),
('H5', 48, 9, 1),
('H5', 49, 9, 2),
('H5', 50, 9, 3),
('H5', 51, 10, 0),
('H5', 52, 10, 1),
('H5', 53, 10, 2),
('H5', 54, 10, 3),
('H5', 55, 10, 4),
('H5', 56, 10, 5),
('H5', 57, 10, 6),
('H5', 58, 10, 7),
('H5', 59, 10, 8),
('H5', 60, 11, 0),
('H5', 61, 11, 1),
('H5', 62, 11, 2),
('H5', 63, 11, 3),
('H5', 64, 11, 4),
('H5', 65, 11, 5),
('H5', 66, 11, 6),
('H5', 67, 11, 7),
('H5', 68, 11, 8),
('H5', 69, 11, 9),
('H5', 70, 11, 10),
('H5', 71, 11, 11),
('H5', 72, 11, 12),
('H5', 73, 11, 13),
('H5', 74, 11, 14),
('H5', 75, 11, 15),
('H5', 76, 11, 16),
('H5', 77, 11, 17),
('H5', 78, 11, 18),
('H5', 79, 11, 19),
('H5', 80, 11, 20),
('H5', 81, 11, 21),
('H5', 82, 11, 22),
('H5', 83, 11, 23),
('H5', 84, 11, 24),
('H5', 85, 11, 25),
('H5', 86, 11, 26),
('H5', 87, 11, 27),
('H5', 88, 11, 28),
('H5', 89, 11, 29),
('H5', 90, 11, 30),
('H5', 91, 11, 31),
('H5', 92, 12, 0),
('H5', 93, 12, 1),
('H5', 94, 12, 2),
('H5', 95, 12, 3),
('H5', 96, 12, 4),
('H5', 97, 12, 5),
('H5', 98, 13, 0),
('H5', 99, 13, 1),
('H5', 100, 13, 2),
('H5', 101, 13, 3),
('H5', 102, 13, 4),
('H5', 103, 13, 5),
('H5', 104, 13, 6),
('H5', 105, 13, 7),
('H5', 106, 13, 8),
('H5', 107, 13, 9),
('H5', 108, 13, 10),
('H5', 109, 13, 11),
('H5', 110, 13, 12),
('H5', 111, 14, 0),
('H5', 112, 14, 1),
('H5', 113, 14, 2),
('H5', 114, 14, 3),
('H5', 115, 14, 4),
('H5', 116, 14, 5),
('H5', 117, 14, 6),
('H5', 118, 14, 7),
('H5', 119, 14, 8),
('H5', 120, 14, 9),
('H5', 121, 14, 10),
('H5', 122, 14, 11),
('H5', 123, 15, 0),
('H5', 124, 15, 1),
('H5', 125, 15, 2),
('H5', 126, 15, 3),
('H5', 127, 16, 0),
('H5', 128, 16, 1),
('H5', 129, 16, 2),
('H5', 130, 17, 0),
('H5', 131, 17, 1),
('H5', 132, 17, 2),
('H5', 133, 17, 3),
('H5', 134, 17, 4),
('H5', 135, 18, 0),
('H5', 136, 18, 1),
('H5', 137, 18, 2),
('H5', 138, 18, 3),
('H5', 139, 19, 0),
('H5', 140, 19, 1),
('H5', 141, 19, 2),
('H5', 142, 19, 3),
('H5', 143, 19, 4),
('H5', 144, 20, 0),
('H5', 145, 20, 1),
('H5', 146, 20, 2),
('H5', 147, 20, 3),
('H5', 148, 20, 4),
('H5', 149, 20, 5),
('H5', 150, 21, 0),
('H5', 151, 21, 1),
('H5', 152, 21, 2),
('H5', 153, 21, 3),
('H5', 154, 21, 4),
('H5', 155, 21, 5),
('H5', 156, 21, 6),
('H5', 157, 21, 7),
('H5', 158, 21, 8),
('H5', 159, 21, 9),
('H5', 160, 22, 0),
('H5', 161, 22, 1),
('H5', 162, 22, 2),
('H5', 163, 22, 3),
('H5', 164, 22, 4),
('H5', 165, 22, 5),
('H5', 166, 23, 0),
('H5', 167, 23, 1),
('H5', 168, 23, 2),
('H5', 169, 23, 3),
('H5', 170, 24, 0),
('H5', 171, 24, 1),
('H5', 172, 24, 2),
('H5', 173, 25, 0),
('H5', 174, 25, 1),
('H5', 175, 25, 2),
('H5', 176, 25, 3),
('H5', 177, 25, 4),
('H5', 178, 25, 5),
('H5', 179, 26, 0),
('H5', 180, 26, 1),
('H5', 181, 26, 2),
('H5', 182, 27, 0),
('H5', 183, 27, 1),
('H5', 184, 27, 2),
('H5', 185, 27, 3),
('H5', 186, 28, 0),
('H5', 187, 28, 1),
('H5', 188, 28, 2),
('H5', 189, 28, 3),
('H5', 190, 29, 0),
('H5', 191, 29, 1),
('H5', 192, 29, 2),
('H5', 193, 29, 3),
('H5', 194, 30, 0),
('H5', 195, 30, 1),
('H5', 196, 30, 2),
('H5', 197, 30, 3),
('H5', 198, 30, 4),
('H5', 199, 30, 5),
('H5', 200, 30, 6),
('H5', 201, 30, 7),
('H5', 202, 30, 8),
('H5', 203, 30, 9),
('H5', 204, 30, 10),
('H5', 205, 30, 11),
('H5', 206, 30, 12),
('H5', 207, 30, 13),
('H5', 208, 30, 14),
('H5', 209, 30, 15),
('H5', 210, 31, 1),
('H5', 211, 31, 2),
('H5', 212, 31, 3),
('H5', 213, 31, 4),
('H5', 214, 32, 1),
('H5', 215, 32, 2),
('H5', 216, 32, 3),
('H5', 217, 32, 4),
('H5', 218, 32, 5),
('H5', 219, 32, 6),
('H5', 220, 33, 1),
('H5', 221, 33, 2),
('H5', 222, 33, 3),
('H5', 223, 34, 1),
('H5', 224, 34, 2),
('H5', 225, 34, 3),
('H5', 226, 35, 1),
('H5', 227, 35, 2),
('H5', 228, 35, 3),
('H5', 229, 36, 1),
('H5', 230, 36, 2),
('H5', 231, 36, 3),
('H5', 232, 36, 4),
('H5', 233, 36, 5),
('H5', 234, 36, 6),
('H5', 235, 37, 1),
('H5', 236, 37, 2),
('H5', 237, 38, 1),
('H5', 238, 38, 2),
('H5', 239, 38, 3),
('H5', 240, 38, 4),
('H5', 241, 39, 1),
('H5', 242, 39, 2),
('H5', 243, 39, 3),
('H5', 244, 39, 4),
('H5', 245, 40, 1),
('H5', 246, 40, 2),
('H5', 247, 40, 3),
('H5', 248, 40, 4),
('H5', 249, 41, 1),
('H5', 250, 41, 2),
('H5', 251, 41, 3),
('H5', 252, 41, 4),
('H5', 253, 41, 5),
('H5', 254, 41, 6),
('H5', 255, 41, 7),
('H5', 256, 41, 8),
('H5', 257, 41, 9),
('H5', 258, 41, 10),
('H5', 259, 41, 11),
('H5', 260, 42, 1),
('H5', 261, 42, 2),
('H5', 262, 42, 3),
('H5', 263, 42, 4),
('H5', 264, 42, 5),
('H5', 265, 42, 6),
('H5', 266, 42, 7),
('H5', 267, 42, 8),
('H5', 268, 42, 9),
('H5', 269, 43, 1),
('H5', 270, 43, 2),
('H5', 271, 43, 3),
('H5', 272, 43, 4),
('H5', 273, 44, 1),
('H5', 274, 44, 2),
('H5', 275, 44, 3),
('H5', 276, 44, 4),
('H5', 277, 45, 1),
('H5', 278, 45, 2),
('H5', 279, 45, 3),
('H5', 280, 45, 4),
('H5', 281, 45, 5),
('H5', 282, 45, 6),
('H5', 283, 45, 7),
('H5', 284, 45, 8),
('H5', 285, 45, 9),
('H5', 286, 45, 10),
('H5', 287, 45, 11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role2profile`
--

CREATE TABLE IF NOT EXISTS `vtiger_role2profile` (
  `roleid` varchar(255) NOT NULL,
  `profileid` int(11) NOT NULL,
  PRIMARY KEY (`roleid`,`profileid`),
  KEY `role2profile_roleid_profileid_idx` (`roleid`,`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role2profile`
--

INSERT INTO `vtiger_role2profile` (`roleid`, `profileid`) VALUES
('H2', 1),
('H3', 2),
('H4', 2),
('H5', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_role_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role_seq`
--

INSERT INTO `vtiger_role_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rss`
--

CREATE TABLE IF NOT EXISTS `vtiger_rss` (
  `rssid` int(19) NOT NULL,
  `rssurl` varchar(200) NOT NULL DEFAULT '',
  `rsstitle` varchar(200) DEFAULT NULL,
  `rsstype` int(10) DEFAULT '0',
  `starred` int(1) DEFAULT '0',
  PRIMARY KEY (`rssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesmanactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanactivityrel` (
  `smid` int(19) NOT NULL DEFAULT '0',
  `activityid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`smid`,`activityid`),
  KEY `salesmanactivityrel_activityid_idx` (`activityid`),
  KEY `salesmanactivityrel_smid_idx` (`smid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesmanattachmentsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanattachmentsrel` (
  `smid` int(19) NOT NULL DEFAULT '0',
  `attachmentsid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`smid`,`attachmentsid`),
  KEY `salesmanattachmentsrel_smid_idx` (`smid`),
  KEY `salesmanattachmentsrel_attachmentsid_idx` (`attachmentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesmanticketrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanticketrel` (
  `smid` int(19) NOT NULL DEFAULT '0',
  `id` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`smid`,`id`),
  KEY `salesmanticketrel_smid_idx` (`smid`),
  KEY `salesmanticketrel_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesorder`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesorder` (
  `salesorderid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `potentialid` int(19) DEFAULT NULL,
  `customerno` varchar(100) DEFAULT NULL,
  `salesorder_no` varchar(100) DEFAULT NULL,
  `quoteid` int(19) DEFAULT NULL,
  `vendorterms` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `vendorid` int(19) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `pending` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,3) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,3) DEFAULT NULL,
  `subtotal` decimal(25,3) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,3) DEFAULT NULL,
  `s_h_amount` decimal(25,3) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text,
  `purchaseorder` varchar(200) DEFAULT NULL,
  `sostatus` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  `enable_recurring` int(11) DEFAULT '0',
  PRIMARY KEY (`salesorderid`),
  KEY `salesorder_vendorid_idx` (`vendorid`),
  KEY `salesorder_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesordercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesordercf` (
  `salesorderid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`salesorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sales_stage`
--

CREATE TABLE IF NOT EXISTS `vtiger_sales_stage` (
  `sales_stage_id` int(19) NOT NULL AUTO_INCREMENT,
  `sales_stage` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sales_stage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `vtiger_sales_stage`
--

INSERT INTO `vtiger_sales_stage` (`sales_stage_id`, `sales_stage`, `presence`, `picklist_valueid`) VALUES
(1, 'Prospecting', 1, 150),
(2, 'Qualification', 1, 151),
(3, 'Needs Analysis', 1, 152),
(4, 'Value Proposition', 1, 153),
(5, 'Id. Decision Makers', 1, 154),
(6, 'Perception Analysis', 1, 155),
(7, 'Proposal/Price Quote', 1, 156),
(8, 'Negotiation/Review', 1, 157),
(9, 'Closed Won', 0, 158),
(10, 'Closed Lost', 0, 159);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sales_stage_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_sales_stage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_sales_stage_seq`
--

INSERT INTO `vtiger_sales_stage_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salutationtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_salutationtype` (
  `salutationid` int(19) NOT NULL AUTO_INCREMENT,
  `salutationtype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`salutationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_salutationtype`
--

INSERT INTO `vtiger_salutationtype` (`salutationid`, `salutationtype`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 160),
(2, 'Mr.', 1, 161),
(3, 'Ms.', 1, 162),
(4, 'Mrs.', 1, 163),
(5, 'Dr.', 1, 164),
(6, 'Prof.', 1, 165);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salutationtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_salutationtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_salutationtype_seq`
--

INSERT INTO `vtiger_salutationtype_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_scheduled_reports`
--

CREATE TABLE IF NOT EXISTS `vtiger_scheduled_reports` (
  `reportid` int(11) NOT NULL,
  `recipients` text,
  `schedule` text,
  `format` varchar(10) DEFAULT NULL,
  `next_trigger_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seactivityrel` (
  `crmid` int(19) NOT NULL,
  `activityid` int(19) NOT NULL,
  PRIMARY KEY (`crmid`,`activityid`),
  KEY `seactivityrel_activityid_idx` (`activityid`),
  KEY `seactivityrel_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seactivityrel_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_seactivityrel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_seactivityrel_seq`
--

INSERT INTO `vtiger_seactivityrel_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seattachmentsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seattachmentsrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `attachmentsid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`crmid`,`attachmentsid`),
  KEY `seattachmentsrel_attachmentsid_idx` (`attachmentsid`),
  KEY `seattachmentsrel_crmid_idx` (`crmid`),
  KEY `seattachmentsrel_attachmentsid_crmid_idx` (`attachmentsid`,`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_selectcolumn`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectcolumn` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL DEFAULT '0',
  `columnname` varchar(250) DEFAULT '',
  PRIMARY KEY (`queryid`,`columnindex`),
  KEY `selectcolumn_queryid_idx` (`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_selectcolumn`
--

INSERT INTO `vtiger_selectcolumn` (`queryid`, `columnindex`, `columnname`) VALUES
(1, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(1, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(1, 2, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(1, 3, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(1, 4, 'vtiger_account:industry:Accounts_industry:industry:V'),
(1, 5, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(2, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(2, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(2, 2, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(2, 3, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(2, 4, 'vtiger_account:industry:Accounts_industry:industry:V'),
(2, 5, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(3, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(3, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(3, 2, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(3, 3, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(3, 4, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(3, 5, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(4, 0, 'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),
(4, 1, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(4, 2, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(4, 3, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(4, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),
(5, 0, 'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),
(5, 1, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(5, 2, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(5, 3, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(5, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),
(5, 5, 'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V'),
(6, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(6, 1, 'vtiger_potential:amount:Potentials_Amount:amount:N'),
(6, 2, 'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),
(6, 3, 'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),
(6, 4, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(7, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(7, 1, 'vtiger_potential:amount:Potentials_Amount:amount:N'),
(7, 2, 'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),
(7, 3, 'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),
(7, 4, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(8, 0, 'vtiger_activity:subject:Calendar_Subject:subject:V'),
(8, 1, 'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),
(8, 2, 'vtiger_activity:status:Calendar_Status:taskstatus:V'),
(8, 3, 'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),
(8, 4, 'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),
(9, 0, 'vtiger_activity:subject:Calendar_Subject:subject:V'),
(9, 1, 'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),
(9, 2, 'vtiger_activity:status:Calendar_Status:taskstatus:V'),
(9, 3, 'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),
(9, 4, 'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),
(10, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(10, 1, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(10, 2, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(10, 3, 'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),
(10, 4, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(10, 5, 'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),
(11, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(11, 1, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),
(11, 2, 'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),
(11, 3, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(11, 4, 'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),
(11, 5, 'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),
(12, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(12, 1, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),
(12, 2, 'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),
(12, 3, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(12, 4, 'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),
(12, 5, 'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),
(13, 0, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(13, 1, 'vtiger_products:productcode:Products_Product_Code:productcode:V'),
(13, 2, 'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),
(13, 3, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(13, 4, 'vtiger_products:website:Products_Website:website:V'),
(13, 5, 'vtiger_vendorRelProducts:vendorname:Products_Vendor_Name:vendor_id:I'),
(13, 6, 'vtiger_products:mfr_part_no:Products_Mfr_PartNo:mfr_part_no:V'),
(14, 0, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(14, 1, 'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),
(14, 2, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(14, 3, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(14, 4, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(14, 5, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(15, 0, 'vtiger_quotes:subject:Quotes_Subject:subject:V'),
(15, 1, 'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),
(15, 2, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),
(15, 3, 'vtiger_quotes:contactid:Quotes_Contact_Name:contact_id:V'),
(15, 4, 'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),
(15, 5, 'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),
(16, 0, 'vtiger_quotes:subject:Quotes_Subject:subject:V'),
(16, 1, 'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),
(16, 2, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),
(16, 3, 'vtiger_quotes:contactid:Quotes_Contact_Name:contact_id:V'),
(16, 4, 'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),
(16, 5, 'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),
(16, 6, 'vtiger_quotes:carrier:Quotes_Carrier:carrier:V'),
(16, 7, 'vtiger_quotes:shipping:Quotes_Shipping:shipping:V'),
(17, 0, 'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),
(17, 1, 'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),
(17, 2, 'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),
(17, 3, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(17, 4, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(17, 5, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(17, 6, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(18, 0, 'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),
(18, 1, 'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),
(18, 2, 'vtiger_purchaseorder:requisition_no:PurchaseOrder_Requisition_No:requisition_no:V'),
(18, 3, 'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),
(18, 4, 'vtiger_contactdetailsPurchaseOrder:lastname:PurchaseOrder_Contact_Name:contact_id:I'),
(18, 5, 'vtiger_purchaseorder:carrier:PurchaseOrder_Carrier:carrier:V'),
(18, 6, 'vtiger_purchaseorder:salescommission:PurchaseOrder_Sales_Commission:salescommission:N'),
(18, 7, 'vtiger_purchaseorder:exciseduty:PurchaseOrder_Excise_Duty:exciseduty:N'),
(18, 8, 'vtiger_usersPurchaseOrder:user_name:PurchaseOrder_Assigned_To:assigned_user_id:V'),
(19, 0, 'vtiger_invoice:subject:Invoice_Subject:subject:V'),
(19, 1, 'vtiger_invoice:salesorderid:Invoice_Sales_Order:salesorder_id:I'),
(19, 2, 'vtiger_invoice:customerno:Invoice_Customer_No:customerno:V'),
(19, 3, 'vtiger_invoice:exciseduty:Invoice_Excise_Duty:exciseduty:N'),
(19, 4, 'vtiger_invoice:salescommission:Invoice_Sales_Commission:salescommission:N'),
(19, 5, 'vtiger_accountInvoice:accountname:Invoice_Account_Name:account_id:I'),
(20, 0, 'vtiger_salesorder:subject:SalesOrder_Subject:subject:V'),
(20, 1, 'vtiger_quotesSalesOrder:subject:SalesOrder_Quote_Name:quote_id:I'),
(20, 2, 'vtiger_contactdetailsSalesOrder:lastname:SalesOrder_Contact_Name:contact_id:I'),
(20, 3, 'vtiger_salesorder:duedate:SalesOrder_Due_Date:duedate:D'),
(20, 4, 'vtiger_salesorder:carrier:SalesOrder_Carrier:carrier:V'),
(20, 5, 'vtiger_salesorder:sostatus:SalesOrder_Status:sostatus:V'),
(20, 6, 'vtiger_accountSalesOrder:accountname:SalesOrder_Account_Name:account_id:I'),
(20, 7, 'vtiger_salesorder:salescommission:SalesOrder_Sales_Commission:salescommission:N'),
(20, 8, 'vtiger_salesorder:exciseduty:SalesOrder_Excise_Duty:exciseduty:N'),
(20, 9, 'vtiger_usersSalesOrder:user_name:SalesOrder_Assigned_To:assigned_user_id:V'),
(21, 0, 'vtiger_campaign:campaignname:Campaigns_Campaign_Name:campaignname:V'),
(21, 1, 'vtiger_campaign:campaigntype:Campaigns_Campaign_Type:campaigntype:V'),
(21, 2, 'vtiger_campaign:targetaudience:Campaigns_Target_Audience:targetaudience:V'),
(21, 3, 'vtiger_campaign:budgetcost:Campaigns_Budget_Cost:budgetcost:I'),
(21, 4, 'vtiger_campaign:actualcost:Campaigns_Actual_Cost:actualcost:I'),
(21, 5, 'vtiger_campaign:expectedrevenue:Campaigns_Expected_Revenue:expectedrevenue:I'),
(21, 6, 'vtiger_campaign:expectedsalescount:Campaigns_Expected_Sales_Count:expectedsalescount:N'),
(21, 7, 'vtiger_campaign:actualsalescount:Campaigns_Actual_Sales_Count:actualsalescount:N'),
(21, 8, 'vtiger_usersCampaigns:user_name:Campaigns_Assigned_To:assigned_user_id:V');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_selectquery`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectquery` (
  `queryid` int(19) NOT NULL,
  `startindex` int(19) DEFAULT '0',
  `numofobjects` int(19) DEFAULT '0',
  PRIMARY KEY (`queryid`),
  KEY `selectquery_queryid_idx` (`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_selectquery`
--

INSERT INTO `vtiger_selectquery` (`queryid`, `startindex`, `numofobjects`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(20, 0, 0),
(21, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_selectquery_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectquery_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_selectquery_seq`
--

INSERT INTO `vtiger_selectquery_seq` (`id`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_senotesrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_senotesrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `notesid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`crmid`,`notesid`),
  KEY `senotesrel_notesid_idx` (`notesid`),
  KEY `senotesrel_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seproductsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seproductsrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `productid` int(19) NOT NULL DEFAULT '0',
  `setype` varchar(30) NOT NULL,
  PRIMARY KEY (`crmid`,`productid`),
  KEY `seproductsrel_productid_idx` (`productid`),
  KEY `seproductrel_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_service`
--

CREATE TABLE IF NOT EXISTS `vtiger_service` (
  `serviceid` int(11) NOT NULL,
  `service_no` varchar(100) NOT NULL,
  `servicename` varchar(50) NOT NULL,
  `servicecategory` varchar(200) DEFAULT NULL,
  `qty_per_unit` decimal(11,2) DEFAULT '0.00',
  `unit_price` decimal(25,2) DEFAULT NULL,
  `sales_start_date` date DEFAULT NULL,
  `sales_end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT '0',
  `service_usageunit` varchar(200) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `taxclass` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `commissionrate` decimal(7,3) DEFAULT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecategory`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecategory` (
  `servicecategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `servicecategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicecategoryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_servicecategory`
--

INSERT INTO `vtiger_servicecategory` (`servicecategoryid`, `servicecategory`, `presence`, `picklist_valueid`) VALUES
(1, '--None--', 1, 229),
(2, 'Support', 1, 230),
(3, 'Installation', 1, 231),
(4, 'Migration', 1, 232),
(5, 'Customization', 1, 233),
(6, 'Training', 1, 234);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecategory_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_servicecategory_seq`
--

INSERT INTO `vtiger_servicecategory_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecf` (
  `serviceid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecontracts`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecontracts` (
  `servicecontractsid` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sc_related_to` int(11) DEFAULT NULL,
  `tracking_unit` varchar(100) DEFAULT NULL,
  `total_units` decimal(5,2) DEFAULT NULL,
  `used_units` decimal(5,2) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `planned_duration` varchar(256) DEFAULT NULL,
  `actual_duration` varchar(256) DEFAULT NULL,
  `contract_status` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `contract_type` varchar(200) DEFAULT NULL,
  `progress` decimal(5,2) DEFAULT NULL,
  `contract_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecontractscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecontractscf` (
  `servicecontractsid` int(11) NOT NULL,
  PRIMARY KEY (`servicecontractsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_service_usageunit`
--

CREATE TABLE IF NOT EXISTS `vtiger_service_usageunit` (
  `service_usageunitid` int(11) NOT NULL AUTO_INCREMENT,
  `service_usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_usageunitid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_service_usageunit`
--

INSERT INTO `vtiger_service_usageunit` (`service_usageunitid`, `service_usageunit`, `presence`, `picklist_valueid`) VALUES
(1, 'Hours', 1, 226),
(2, 'Days', 1, 227),
(3, 'Incidents', 1, 228);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_service_usageunit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_service_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_service_usageunit_seq`
--

INSERT INTO `vtiger_service_usageunit_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seticketsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seticketsrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `ticketid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`crmid`,`ticketid`),
  KEY `seticketsrel_crmid_idx` (`crmid`),
  KEY `seticketsrel_ticketid_idx` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_blocks`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_blocks` (
  `blockid` int(19) NOT NULL,
  `label` varchar(250) DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL,
  PRIMARY KEY (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_blocks`
--

INSERT INTO `vtiger_settings_blocks` (`blockid`, `label`, `sequence`) VALUES
(1, 'LBL_MODULE_MANAGER', 1),
(2, 'LBL_USER_MANAGEMENT', 2),
(3, 'LBL_STUDIO', 3),
(4, 'LBL_COMMUNICATION_TEMPLATES', 4),
(5, 'LBL_OTHER_SETTINGS', 5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_blocks_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_blocks_seq`
--

INSERT INTO `vtiger_settings_blocks_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_field` (
  `fieldid` int(19) NOT NULL,
  `blockid` int(19) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `iconpath` varchar(300) DEFAULT NULL,
  `description` text,
  `linkto` text,
  `sequence` int(19) DEFAULT NULL,
  `active` int(19) DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `fk_1_vtiger_settings_field` (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_field`
--

INSERT INTO `vtiger_settings_field` (`fieldid`, `blockid`, `name`, `iconpath`, `description`, `linkto`, `sequence`, `active`) VALUES
(1, 2, 'LBL_USERS', 'ico-users.gif', 'LBL_USER_DESCRIPTION', 'index.php?module=Administration&action=index&parenttab=Settings', 1, 0),
(2, 2, 'LBL_ROLES', 'ico-roles.gif', 'LBL_ROLE_DESCRIPTION', 'index.php?module=Settings&action=listroles&parenttab=Settings', 2, 0),
(3, 2, 'LBL_PROFILES', 'ico-profile.gif', 'LBL_PROFILE_DESCRIPTION', 'index.php?module=Settings&action=ListProfiles&parenttab=Settings', 3, 0),
(4, 2, 'USERGROUPLIST', 'ico-groups.gif', 'LBL_GROUP_DESCRIPTION', 'index.php?module=Settings&action=listgroups&parenttab=Settings', 4, 0),
(5, 2, 'LBL_SHARING_ACCESS', 'shareaccess.gif', 'LBL_SHARING_ACCESS_DESCRIPTION', 'index.php?module=Settings&action=OrgSharingDetailView&parenttab=Settings', 5, 0),
(6, 2, 'LBL_FIELDS_ACCESS', 'orgshar.gif', 'LBL_SHARING_FIELDS_DESCRIPTION', 'index.php?module=Settings&action=DefaultFieldPermissions&parenttab=Settings', 6, 0),
(7, 2, 'LBL_AUDIT_TRAIL', 'audit.gif', 'LBL_AUDIT_DESCRIPTION', 'index.php?module=Settings&action=AuditTrailList&parenttab=Settings', 7, 0),
(8, 2, 'LBL_LOGIN_HISTORY_DETAILS', 'set-IcoLoginHistory.gif', 'LBL_LOGIN_HISTORY_DESCRIPTION', 'index.php?module=Settings&action=ListLoginHistory&parenttab=Settings', 8, 0),
(9, 3, 'VTLIB_LBL_MODULE_MANAGER', 'vtlib_modmng.gif', 'VTLIB_LBL_MODULE_MANAGER_DESCRIPTION', 'index.php?module=Settings&action=ModuleManager&parenttab=Settings', 1, 0),
(10, 3, 'LBL_PICKLIST_EDITOR', 'picklist.gif', 'LBL_PICKLIST_DESCRIPTION', 'index.php?module=PickList&action=PickList&parenttab=Settings', 2, 0),
(11, 3, 'LBL_PICKLIST_DEPENDENCY_SETUP', 'picklistdependency.gif', 'LBL_PICKLIST_DEPENDENCY_DESCRIPTION', 'index.php?module=PickList&action=PickListDependencySetup&parenttab=Settings', 3, 0),
(12, 4, 'EMAILTEMPLATES', 'ViewTemplate.gif', 'LBL_EMAIL_TEMPLATE_DESCRIPTION', 'index.php?module=Settings&action=listemailtemplates&parenttab=Settings', 4, 0),
(13, 4, 'LBL_MAIL_MERGE', 'mailmarge.gif', 'LBL_MAIL_MERGE_DESCRIPTION', 'index.php?module=Settings&action=listwordtemplates&parenttab=Settings', 1, 0),
(14, 4, 'NOTIFICATIONSCHEDULERS', 'notification.gif', 'LBL_NOTIF_SCHED_DESCRIPTION', 'index.php?module=Settings&action=listnotificationschedulers&parenttab=Settings', 2, 0),
(15, 4, 'INVENTORYNOTIFICATION', 'inventory.gif', 'LBL_INV_NOTIF_DESCRIPTION', 'index.php?module=Settings&action=listinventorynotifications&parenttab=Settings', 3, 0),
(16, 4, 'LBL_COMPANY_DETAILS', 'company.gif', 'LBL_COMPANY_DESCRIPTION', 'index.php?module=Settings&action=OrganizationConfig&parenttab=Settings', 4, 0),
(17, 5, 'LBL_MAIL_SERVER_SETTINGS', 'ogmailserver.gif', 'LBL_MAIL_SERVER_DESCRIPTION', 'index.php?module=Settings&action=EmailConfig&parenttab=Settings', 5, 0),
(18, 5, 'LBL_BACKUP_SERVER_SETTINGS', 'backupserver.gif', 'LBL_BACKUP_SERVER_DESCRIPTION', 'index.php?module=Settings&action=BackupServerConfig&parenttab=Settings', 6, 0),
(19, 5, 'LBL_CURRENCY_SETTINGS', 'currency.gif', 'LBL_CURRENCY_DESCRIPTION', 'index.php?module=Settings&action=CurrencyListView&parenttab=Settings', 1, 0),
(20, 5, 'LBL_TAX_SETTINGS', 'taxConfiguration.gif', 'LBL_TAX_DESCRIPTION', 'index.php?module=Settings&action=TaxConfig&parenttab=Settings', 2, 0),
(21, 5, 'LBL_SYSTEM_INFO', 'system.gif', 'LBL_SYSTEM_DESCRIPTION', 'index.php?module=System&action=listsysconfig&parenttab=Settings', 3, 1),
(22, 5, 'LBL_PROXY_SETTINGS', 'proxy.gif', 'LBL_PROXY_DESCRIPTION', 'index.php?module=Settings&action=ProxyServerConfig&parenttab=Settings', 4, 0),
(23, 5, 'LBL_ANNOUNCEMENT', 'announ.gif', 'LBL_ANNOUNCEMENT_DESCRIPTION', 'index.php?module=Settings&action=Announcements&parenttab=Settings', 5, 0),
(24, 5, 'LBL_DEFAULT_MODULE_VIEW', 'set-IcoTwoTabConfig.gif', 'LBL_DEFAULT_MODULE_VIEW_DESC', 'index.php?module=Settings&action=DefModuleView&parenttab=Settings', 6, 0),
(25, 5, 'INVENTORYTERMSANDCONDITIONS', 'terms.gif', 'LBL_INV_TANDC_DESCRIPTION', 'index.php?module=Settings&action=OrganizationTermsandConditions&parenttab=Settings', 7, 0),
(26, 5, 'LBL_CUSTOMIZE_MODENT_NUMBER', 'settingsInvNumber.gif', 'LBL_CUSTOMIZE_MODENT_NUMBER_DESCRIPTION', 'index.php?module=Settings&action=CustomModEntityNo&parenttab=Settings', 8, 0),
(27, 5, 'LBL_MAIL_SCANNER', 'mailScanner.gif', 'LBL_MAIL_SCANNER_DESCRIPTION', 'index.php?module=Settings&action=MailScanner&parenttab=Settings', 9, 0),
(28, 5, 'LBL_LIST_WORKFLOWS', 'settingsWorkflow.png', 'LBL_LIST_WORKFLOWS_DESCRIPTION', 'index.php?module=com_vtiger_workflow&action=workflowlist&parenttab=Settings', 10, 0),
(29, 3, 'LBL_MENU_EDITOR', 'menueditor.png', 'LBL_MENU_DESC', 'index.php?module=Settings&action=MenuEditor&parenttab=Settings', 11, 0),
(30, 1, 'LBL_WORKFLOW_LIST', 'settingsWorkflow.png', 'LBL_AVAILABLE_WORKLIST_LIST', 'index.php?module=com_vtiger_workflow&action=workflowlist', 1, 0),
(31, 5, 'Configuration Editor', 'migrate.gif', 'Update configuration file of the application', 'index.php?module=ConfigEditor&action=index', 11, 0),
(32, 5, 'ModTracker', 'set-IcoLoginHistory.gif', 'LBL_MODTRACKER_DESCRIPTION', 'index.php?module=ModTracker&action=BasicSettings&parenttab=Settings&formodule=ModTracker', 12, 0),
(33, 1, 'LBL_TOOLTIP_MANAGEMENT', 'quickview.png', 'LBL_TOOLTIP_MANAGEMENT_DESCRIPTION', 'index.php?module=Tooltip&action=QuickView&parenttab=Settings', NULL, 0),
(34, 1, 'LBL_FIELDFORMULAS', 'modules/FieldFormulas/resources/FieldFormulas.png', 'LBL_FIELDFORMULAS_DESCRIPTION', 'index.php?module=FieldFormulas&action=index&parenttab=Settings', 13, 0),
(35, 5, 'Webforms', 'modules/Webforms/img/Webform.png', 'Allows you to manage Webforms', 'index.php?module=Webforms&action=index&parenttab=Settings', 13, 0),
(36, 5, 'Scheduler', 'Cron.png', 'Allows you to Configure Cron Task', 'index.php?module=CronTasks&action=ListCronJobs&parenttab=Settings', 14, 0),
(37, 5, 'LBL_CUSTOMER_PORTAL', 'portal_icon.png', 'PORTAL_EXTENSION_DESCRIPTION', 'index.php?module=CustomerPortal&action=index&parenttab=Settings', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_field_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_field_seq`
--

INSERT INTO `vtiger_settings_field_seq` (`id`) VALUES
(37);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sharedcalendar`
--

CREATE TABLE IF NOT EXISTS `vtiger_sharedcalendar` (
  `userid` int(19) NOT NULL,
  `sharedid` int(19) NOT NULL,
  PRIMARY KEY (`userid`,`sharedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_shippingtaxinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_shippingtaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) DEFAULT NULL,
  `taxlabel` varchar(50) DEFAULT NULL,
  `percentage` decimal(7,3) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  PRIMARY KEY (`taxid`),
  KEY `shippingtaxinfo_taxname_idx` (`taxname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_shippingtaxinfo`
--

INSERT INTO `vtiger_shippingtaxinfo` (`taxid`, `taxname`, `taxlabel`, `percentage`, `deleted`) VALUES
(1, 'shtax1', 'VAT', '4.500', 0),
(2, 'shtax2', 'Sales', '10.000', 0),
(3, 'shtax3', 'Service', '12.500', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_shippingtaxinfo_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_shippingtaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_shippingtaxinfo_seq`
--

INSERT INTO `vtiger_shippingtaxinfo_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifier`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier` (
  `smsnotifierid` int(11) DEFAULT NULL,
  `message` text,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifiercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifiercf` (
  `smsnotifierid` int(11) NOT NULL,
  PRIMARY KEY (`smsnotifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifier_servers`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  `providertype` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `parameters` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifier_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier_status` (
  `smsnotifierid` int(11) DEFAULT NULL,
  `tonumber` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `smsmessageid` varchar(50) DEFAULT NULL,
  `needlookup` int(1) DEFAULT '1',
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `statusmessage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_soapservice`
--

CREATE TABLE IF NOT EXISTS `vtiger_soapservice` (
  `id` int(19) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `sessionid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sobillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_sobillads` (
  `sobilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sobilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_soshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_soshipads` (
  `soshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`soshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sostatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatus` (
  `sostatusid` int(19) NOT NULL AUTO_INCREMENT,
  `sostatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sostatusid`),
  UNIQUE KEY `sostatus_sostatus_idx` (`sostatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_sostatus`
--

INSERT INTO `vtiger_sostatus` (`sostatusid`, `sostatus`, `presence`, `picklist_valueid`) VALUES
(1, 'Created', 0, 166),
(2, 'Approved', 0, 167),
(3, 'Delivered', 0, 168),
(4, 'Cancelled', 0, 169);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sostatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatushistory` (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `salesorderid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `sostatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `sostatushistory_salesorderid_idx` (`salesorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sostatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_sostatus_seq`
--

INSERT INTO `vtiger_sostatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_status` (
  `statusid` int(19) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vtiger_status`
--

INSERT INTO `vtiger_status` (`statusid`, `status`, `presence`, `picklist_valueid`) VALUES
(1, 'Active', 0, 1),
(2, 'Inactive', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_status_seq`
--

INSERT INTO `vtiger_status_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_systems`
--

CREATE TABLE IF NOT EXISTS `vtiger_systems` (
  `id` int(19) NOT NULL,
  `server` varchar(100) DEFAULT NULL,
  `server_port` int(19) DEFAULT NULL,
  `server_username` varchar(100) DEFAULT NULL,
  `server_password` varchar(100) DEFAULT NULL,
  `server_type` varchar(20) DEFAULT NULL,
  `smtp_auth` varchar(5) DEFAULT NULL,
  `server_path` varchar(256) DEFAULT NULL,
  `from_email_field` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_tab` (
  `tabid` int(19) NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL,
  `presence` int(19) NOT NULL DEFAULT '1',
  `tabsequence` int(10) DEFAULT NULL,
  `tablabel` varchar(25) NOT NULL,
  `modifiedby` int(19) DEFAULT NULL,
  `modifiedtime` int(19) DEFAULT NULL,
  `customized` int(19) DEFAULT NULL,
  `ownedby` int(19) DEFAULT NULL,
  `isentitytype` int(11) NOT NULL DEFAULT '1',
  `version` varchar(10) DEFAULT NULL,
  `parent` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tabid`),
  UNIQUE KEY `tab_name_idx` (`name`),
  KEY `tab_modifiedby_idx` (`modifiedby`),
  KEY `tab_tabid_idx` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_tab`
--

INSERT INTO `vtiger_tab` (`tabid`, `name`, `presence`, `tabsequence`, `tablabel`, `modifiedby`, `modifiedtime`, `customized`, `ownedby`, `isentitytype`, `version`, `parent`) VALUES
(1, 'Dashboard', 0, 9, 'Dashboards', NULL, NULL, 0, 1, 0, NULL, 'Analytics'),
(2, 'Potentials', 0, 2, 'Potentials', NULL, NULL, 0, 0, 1, NULL, 'Sales'),
(3, 'Home', 0, -1, 'Home', NULL, NULL, 0, 1, 0, NULL, NULL),
(4, 'Contacts', 0, 3, 'Contacts', NULL, NULL, 0, 0, 1, NULL, 'Sales'),
(6, 'Accounts', 0, -1, 'Accounts', NULL, NULL, 0, 0, 1, NULL, 'Sales'),
(7, 'Leads', 0, 1, 'Leads', NULL, NULL, 0, 0, 1, NULL, 'Sales'),
(8, 'Documents', 0, -1, 'Documents', NULL, NULL, 0, 0, 1, NULL, 'Tools'),
(9, 'Calendar', 0, 8, 'Calendar', NULL, NULL, 0, 0, 1, NULL, 'Tools'),
(10, 'Emails', 0, -1, 'Emails', NULL, NULL, 0, 1, 1, NULL, 'Tools'),
(13, 'HelpDesk', 0, 7, 'HelpDesk', NULL, NULL, 0, 0, 1, NULL, 'Support'),
(14, 'Products', 0, -1, 'Products', NULL, NULL, 0, 0, 1, NULL, 'Inventory'),
(15, 'Faq', 0, -1, 'Faq', NULL, NULL, 0, 1, 1, NULL, 'Support'),
(16, 'Events', 2, -1, 'Events', NULL, NULL, 0, 0, 1, NULL, NULL),
(18, 'Vendors', 0, -1, 'Vendors', NULL, NULL, 0, 1, 1, NULL, 'Inventory'),
(19, 'PriceBooks', 0, -1, 'PriceBooks', NULL, NULL, 0, 1, 1, NULL, 'Inventory'),
(20, 'Quotes', 0, 4, 'Quotes', NULL, NULL, 0, 0, 1, NULL, 'Sales'),
(21, 'PurchaseOrder', 0, 6, 'PurchaseOrder', NULL, NULL, 0, 0, 1, NULL, 'Inventory'),
(22, 'SalesOrder', 0, 5, 'SalesOrder', NULL, NULL, 0, 0, 1, NULL, 'Sales'),
(23, 'Invoice', 0, -1, 'Invoice', NULL, NULL, 0, 0, 1, NULL, 'Sales'),
(24, 'Rss', 0, -1, 'Rss', NULL, NULL, 0, 1, 0, NULL, 'Tools'),
(25, 'Reports', 0, -1, 'Reports', NULL, NULL, 0, 1, 0, NULL, 'Analytics'),
(26, 'Campaigns', 0, -1, 'Campaigns', NULL, NULL, 0, 0, 1, NULL, 'Marketing'),
(27, 'Portal', 0, -1, 'Portal', NULL, NULL, 0, 1, 0, NULL, 'Tools'),
(28, 'Webmails', 0, -1, 'Webmails', NULL, NULL, 0, 1, 1, NULL, NULL),
(29, 'Users', 0, -1, 'Users', NULL, NULL, 0, 1, 0, NULL, NULL),
(30, 'MailManager', 0, -1, 'MailManager', NULL, NULL, 1, 0, 0, '1.4', 'Tools'),
(31, 'Integration', 0, -1, 'Integration', NULL, NULL, 1, 0, 0, '1.0', 'Tools'),
(32, 'ServiceContracts', 0, -1, 'Service Contracts', NULL, NULL, 0, 0, 1, '2.1', 'Support'),
(33, 'ConfigEditor', 0, -1, 'ConfigEditor', NULL, NULL, 1, 0, 0, '1.9', ''),
(34, 'Mobile', 0, -1, 'Mobile', NULL, NULL, 1, 0, 0, '1.6', ''),
(35, 'VtigerBackup', 0, -1, 'Vtiger Backup', NULL, NULL, 0, 0, 0, '1.2', ''),
(36, 'ModTracker', 0, -1, 'ModTracker', NULL, NULL, 0, 0, 0, '1.0', ''),
(37, 'Import', 0, -1, 'Import', NULL, NULL, 1, 0, 0, '1.2', ''),
(38, 'Services', 0, -1, 'Services', NULL, NULL, 0, 0, 1, '2.2', 'Inventory'),
(39, 'WSAPP', 0, -1, 'WSAPP', NULL, NULL, 1, 0, 0, '3.4.4', ''),
(40, 'PBXManager', 0, -1, 'PBXManager', NULL, NULL, 0, 0, 1, '1.7', 'Tools'),
(41, 'RecycleBin', 0, -1, 'Recycle Bin', NULL, NULL, 0, 0, 0, '1.5', 'Tools'),
(42, 'ModComments', 0, -1, 'Comments', NULL, NULL, 0, 0, 1, '1.9', 'Tools'),
(43, 'Tooltip', 0, -1, 'Tool Tip', NULL, NULL, 0, 0, 0, '1.2', ''),
(44, 'Assets', 0, -1, 'Assets', NULL, NULL, 0, 0, 1, '1.6', 'Inventory'),
(45, 'FieldFormulas', 0, -1, 'Field Formulas', NULL, NULL, 0, 0, 0, '1.2', ''),
(46, 'Webforms', 0, -1, 'Webforms', NULL, NULL, 0, 0, 0, '1.2', ''),
(47, 'SMSNotifier', 0, -1, 'SMSNotifier', NULL, NULL, 0, 0, 1, '1.8', 'Tools'),
(48, 'CronTasks', 0, -1, 'CronTasks', NULL, NULL, 1, 0, 0, '1.1', ''),
(49, 'CustomerPortal', 0, -1, 'CustomerPortal', NULL, NULL, 0, 0, 0, '1.4', ''),
(50, 'ProjectMilestone', 0, -1, 'ProjectMilestone', NULL, NULL, 0, 0, 1, '2.7', 'Support'),
(51, 'ProjectTask', 0, -1, 'ProjectTask', NULL, NULL, 0, 0, 1, '2.7', 'Support'),
(52, 'Project', 0, -1, 'Project', NULL, NULL, 0, 0, 1, '2.7', 'Support');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tab_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_tab_info` (
  `tabid` int(19) DEFAULT NULL,
  `prefname` varchar(256) DEFAULT NULL,
  `prefvalue` varchar(256) DEFAULT NULL,
  KEY `fk_1_vtiger_tab_info` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_tab_info`
--

INSERT INTO `vtiger_tab_info` (`tabid`, `prefname`, `prefvalue`) VALUES
(30, 'vtiger_min_version', '5.2.0'),
(31, 'vtiger_min_version', '5.1.0'),
(32, 'vtiger_min_version', '5.1.0'),
(32, 'vtiger_max_version', '5.*'),
(33, 'vtiger_min_version', '5.1.0'),
(33, 'vtiger_max_version', '5.*'),
(34, 'vtiger_min_version', '5.3.4'),
(35, 'vtiger_min_version', '5.1.0'),
(36, 'vtiger_min_version', '5.1.0'),
(37, 'vtiger_min_version', '5.3.0'),
(37, 'vtiger_max_version', '5.*'),
(38, 'vtiger_min_version', '5.1.0'),
(38, 'vtiger_max_version', '5.*'),
(39, 'vtiger_min_version', '5.1.0'),
(40, 'vtiger_min_version', '5.1.0'),
(40, 'vtiger_max_version', '5.*'),
(41, 'vtiger_min_version', '5.1.0'),
(41, 'vtiger_max_version', '5.*'),
(42, 'vtiger_min_version', '5.1.0'),
(42, 'vtiger_max_version', '5.*'),
(43, 'vtiger_min_version', '5.1.0'),
(43, 'vtiger_max_version', '5.*'),
(44, 'vtiger_min_version', '5.1.0'),
(44, 'vtiger_max_version', '5.*'),
(45, 'vtiger_min_version', '5.1.0'),
(45, 'vtiger_max_version', '5.*'),
(46, 'vtiger_min_version', '5.3.0'),
(46, 'vtiger_max_version', '5.*'),
(47, 'vtiger_min_version', '5.1.0'),
(47, 'vtiger_max_version', '5.*'),
(48, 'vtiger_min_version', '5.3.1'),
(48, 'vtiger_max_version', '5.*'),
(49, 'vtiger_min_version', '5.1.0'),
(49, 'vtiger_max_version', '5.*'),
(50, 'vtiger_min_version', '5.2.0'),
(51, 'vtiger_min_version', '5.2.0'),
(52, 'vtiger_min_version', '5.2.0');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskpriority` (
  `taskpriorityid` int(19) NOT NULL AUTO_INCREMENT,
  `taskpriority` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`taskpriorityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_taskpriority`
--

INSERT INTO `vtiger_taskpriority` (`taskpriorityid`, `taskpriority`, `presence`, `picklist_valueid`) VALUES
(1, 'High', 1, 170),
(2, 'Medium', 1, 171),
(3, 'Low', 1, 172);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taskpriority_seq`
--

INSERT INTO `vtiger_taskpriority_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskstatus` (
  `taskstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `taskstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`taskstatusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_taskstatus`
--

INSERT INTO `vtiger_taskstatus` (`taskstatusid`, `taskstatus`, `presence`, `picklist_valueid`) VALUES
(1, 'Not Started', 0, 173),
(2, 'In Progress', 0, 174),
(3, 'Completed', 0, 175),
(4, 'Pending Input', 0, 176),
(5, 'Deferred', 0, 177),
(6, 'Planned', 0, 178);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taskstatus_seq`
--

INSERT INTO `vtiger_taskstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taxclass`
--

CREATE TABLE IF NOT EXISTS `vtiger_taxclass` (
  `taxclassid` int(19) NOT NULL AUTO_INCREMENT,
  `taxclass` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`taxclassid`),
  UNIQUE KEY `taxclass_carrier_idx` (`taxclass`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vtiger_taxclass`
--

INSERT INTO `vtiger_taxclass` (`taxclassid`, `taxclass`, `sortorderid`, `presence`) VALUES
(1, 'SalesTax', 0, 1),
(2, 'Vat', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taxclass_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taxclass_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taxclass_seq`
--

INSERT INTO `vtiger_taxclass_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcategories`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcategories` (
  `ticketcategories_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketcategories` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketcategories_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vtiger_ticketcategories`
--

INSERT INTO `vtiger_ticketcategories` (`ticketcategories_id`, `ticketcategories`, `presence`, `picklist_valueid`) VALUES
(1, 'Big Problem', 1, 179),
(2, 'Small Problem', 1, 180),
(3, 'Other Problem', 1, 181);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcategories_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketcategories_seq`
--

INSERT INTO `vtiger_ticketcategories_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcf` (
  `ticketid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcomments` (
  `commentid` int(19) NOT NULL AUTO_INCREMENT,
  `ticketid` int(19) DEFAULT NULL,
  `comments` text,
  `ownerid` int(19) NOT NULL DEFAULT '0',
  `ownertype` varchar(10) DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `ticketcomments_ticketid_idx` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketpriorities`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketpriorities` (
  `ticketpriorities_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketpriorities` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketpriorities_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_ticketpriorities`
--

INSERT INTO `vtiger_ticketpriorities` (`ticketpriorities_id`, `ticketpriorities`, `presence`, `picklist_valueid`) VALUES
(1, 'Low', 1, 182),
(2, 'Normal', 1, 183),
(3, 'High', 1, 184),
(4, 'Urgent', 1, 185);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketpriorities_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketpriorities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketpriorities_seq`
--

INSERT INTO `vtiger_ticketpriorities_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketseverities`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketseverities` (
  `ticketseverities_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketseverities` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketseverities_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_ticketseverities`
--

INSERT INTO `vtiger_ticketseverities` (`ticketseverities_id`, `ticketseverities`, `presence`, `picklist_valueid`) VALUES
(1, 'Minor', 1, 186),
(2, 'Major', 1, 187),
(3, 'Feature', 1, 188),
(4, 'Critical', 1, 189);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketseverities_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketseverities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketseverities_seq`
--

INSERT INTO `vtiger_ticketseverities_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketstatus` (
  `ticketstatus_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketstatus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_ticketstatus`
--

INSERT INTO `vtiger_ticketstatus` (`ticketstatus_id`, `ticketstatus`, `presence`, `picklist_valueid`) VALUES
(1, 'Open', 0, 190),
(2, 'In Progress', 0, 191),
(3, 'Wait For Response', 0, 192),
(4, 'Closed', 0, 193);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketstatus_seq`
--

INSERT INTO `vtiger_ticketstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketstracktime`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketstracktime` (
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `supporter_id` int(11) NOT NULL DEFAULT '0',
  `minutes` int(11) DEFAULT '0',
  `date_logged` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticket_id`),
  KEY `ticketstracktime_ticket_id_idx` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_time_zone`
--

CREATE TABLE IF NOT EXISTS `vtiger_time_zone` (
  `time_zoneid` int(19) NOT NULL AUTO_INCREMENT,
  `time_zone` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`time_zoneid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `vtiger_time_zone`
--

INSERT INTO `vtiger_time_zone` (`time_zoneid`, `time_zone`, `sortorderid`, `presence`) VALUES
(1, 'Pacific/Midway', 0, 1),
(2, 'Pacific/Samoa', 1, 1),
(3, 'Pacific/Honolulu', 2, 1),
(4, 'America/Anchorage', 3, 1),
(5, 'America/Los_Angeles', 4, 1),
(6, 'America/Tijuana', 5, 1),
(7, 'America/Denver', 6, 1),
(8, 'America/Chihuahua', 7, 1),
(9, 'America/Mazatlan', 8, 1),
(10, 'America/Phoenix', 9, 1),
(11, 'America/Regina', 10, 1),
(12, 'America/Tegucigalpa', 11, 1),
(13, 'America/Chicago', 12, 1),
(14, 'America/Mexico_City', 13, 1),
(15, 'America/Monterrey', 14, 1),
(16, 'America/New_York', 15, 1),
(17, 'America/Bogota', 16, 1),
(18, 'America/Lima', 17, 1),
(19, 'America/Rio_Branco', 18, 1),
(20, 'America/Indiana/Indianapolis', 19, 1),
(21, 'America/Caracas', 20, 1),
(22, 'America/Halifax', 21, 1),
(23, 'America/Manaus', 22, 1),
(24, 'America/Santiago', 23, 1),
(25, 'America/La_Paz', 24, 1),
(26, 'America/Cuiaba', 25, 1),
(27, 'America/Asuncion', 26, 1),
(28, 'America/St_Johns', 27, 1),
(29, 'America/Argentina/Buenos_Aires', 28, 1),
(30, 'America/Sao_Paulo', 29, 1),
(31, 'America/Godthab', 30, 1),
(32, 'America/Montevideo', 31, 1),
(33, 'Atlantic/South_Georgia', 32, 1),
(34, 'Atlantic/Azores', 33, 1),
(35, 'Atlantic/Cape_Verde', 34, 1),
(36, 'Europe/London', 35, 1),
(37, 'UTC', 36, 1),
(38, 'Africa/Monrovia', 37, 1),
(39, 'Africa/Casablanca', 38, 1),
(40, 'Europe/Belgrade', 39, 1),
(41, 'Europe/Sarajevo', 40, 1),
(42, 'Europe/Brussels', 41, 1),
(43, 'Africa/Algiers', 42, 1),
(44, 'Europe/Amsterdam', 43, 1),
(45, 'Europe/Minsk', 44, 1),
(46, 'Africa/Cairo', 45, 1),
(47, 'Europe/Helsinki', 46, 1),
(48, 'Europe/Athens', 47, 1),
(49, 'Europe/Istanbul', 48, 1),
(50, 'Asia/Jerusalem', 49, 1),
(51, 'Asia/Amman', 50, 1),
(52, 'Asia/Beirut', 51, 1),
(53, 'Africa/Windhoek', 52, 1),
(54, 'Africa/Harare', 53, 1),
(55, 'Asia/Kuwait', 54, 1),
(56, 'Asia/Baghdad', 55, 1),
(57, 'Africa/Nairobi', 56, 1),
(58, 'Asia/Tehran', 57, 1),
(59, 'Asia/Tbilisi', 58, 1),
(60, 'Europe/Moscow', 59, 1),
(61, 'Asia/Muscat', 60, 1),
(62, 'Asia/Baku', 61, 1),
(63, 'Asia/Yerevan', 62, 1),
(64, 'Asia/Karachi', 63, 1),
(65, 'Asia/Tashkent', 64, 1),
(66, 'Asia/Kolkata', 65, 1),
(67, 'Asia/Colombo', 66, 1),
(68, 'Asia/Katmandu', 67, 1),
(69, 'Asia/Dhaka', 68, 1),
(70, 'Asia/Almaty', 69, 1),
(71, 'Asia/Yekaterinburg', 70, 1),
(72, 'Asia/Rangoon', 71, 1),
(73, 'Asia/Novosibirsk', 72, 1),
(74, 'Asia/Bangkok', 73, 1),
(75, 'Asia/Brunei', 74, 1),
(76, 'Asia/Krasnoyarsk', 75, 1),
(77, 'Asia/Ulaanbaatar', 76, 1),
(78, 'Asia/Kuala_Lumpur', 77, 1),
(79, 'Asia/Taipei', 78, 1),
(80, 'Australia/Perth', 79, 1),
(81, 'Asia/Irkutsk', 80, 1),
(82, 'Asia/Seoul', 81, 1),
(83, 'Asia/Tokyo', 82, 1),
(84, 'Australia/Darwin', 83, 1),
(85, 'Australia/Adelaide', 84, 1),
(86, 'Australia/Canberra', 85, 1),
(87, 'Australia/Brisbane', 86, 1),
(88, 'Australia/Hobart', 87, 1),
(89, 'Asia/Vladivostok', 88, 1),
(90, 'Pacific/Guam', 89, 1),
(91, 'Asia/Yakutsk', 90, 1),
(92, 'Pacific/Fiji', 91, 1),
(93, 'Asia/Kamchatka', 92, 1),
(94, 'Pacific/Auckland', 93, 1),
(95, 'Asia/Magadan', 94, 1),
(96, 'Pacific/Tongatapu', 95, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_time_zone_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_time_zone_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_time_zone_seq`
--

INSERT INTO `vtiger_time_zone_seq` (`id`) VALUES
(96);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_group_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`),
  KEY `tmp_read_group_rel_sharing_per_userid_sharedgroupid_tabid` (`userid`,`sharedgroupid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_group_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`sharedgroupid`),
  KEY `tmp_read_group_sharing_per_userid_sharedgroupid_idx` (`userid`,`sharedgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_user_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`shareduserid`),
  KEY `tmp_read_user_rel_sharing_per_userid_shared_reltabid_idx` (`userid`,`shareduserid`,`relatedtabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_user_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`shareduserid`),
  KEY `tmp_read_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_group_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`),
  KEY `tmp_write_group_rel_sharing_per_userid_sharedgroupid_tabid_idx` (`userid`,`sharedgroupid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_group_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`sharedgroupid`),
  KEY `tmp_write_group_sharing_per_UK1` (`userid`,`sharedgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_user_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`shareduserid`),
  KEY `tmp_write_user_rel_sharing_per_userid_sharduserid_tabid_idx` (`userid`,`shareduserid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_user_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`shareduserid`),
  KEY `tmp_write_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tracker`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(25) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vtiger_tracker`
--

INSERT INTO `vtiger_tracker` (`id`, `user_id`, `module_name`, `item_id`, `item_summary`) VALUES
(6, '1', 'Users', '1', ' Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tracking_unit`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracking_unit` (
  `tracking_unitid` int(11) NOT NULL AUTO_INCREMENT,
  `tracking_unit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tracking_unitid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vtiger_tracking_unit`
--

INSERT INTO `vtiger_tracking_unit` (`tracking_unitid`, `tracking_unit`, `presence`, `picklist_valueid`) VALUES
(1, 'None', 1, 210),
(2, 'Hours', 1, 211),
(3, 'Days', 1, 212),
(4, 'Incidents', 1, 213);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tracking_unit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracking_unit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_tracking_unit_seq`
--

INSERT INTO `vtiger_tracking_unit_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_troubletickets`
--

CREATE TABLE IF NOT EXISTS `vtiger_troubletickets` (
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) NOT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `severity` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `solution` text,
  `update_log` text,
  `version_id` int(11) DEFAULT NULL,
  `hours` varchar(200) DEFAULT NULL,
  `days` varchar(200) DEFAULT NULL,
  `from_portal` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ticketid`),
  KEY `troubletickets_ticketid_idx` (`ticketid`),
  KEY `troubletickets_status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_usageunit`
--

CREATE TABLE IF NOT EXISTS `vtiger_usageunit` (
  `usageunitid` int(19) NOT NULL AUTO_INCREMENT,
  `usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usageunitid`),
  UNIQUE KEY `usageunit_usageunit_idx` (`usageunit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `vtiger_usageunit`
--

INSERT INTO `vtiger_usageunit` (`usageunitid`, `usageunit`, `presence`, `picklist_valueid`) VALUES
(1, 'Box', 1, 194),
(2, 'Carton', 1, 195),
(3, 'Dozen', 1, 196),
(4, 'Each', 1, 197),
(5, 'Hours', 1, 198),
(6, 'Impressions', 1, 199),
(7, 'Lb', 1, 200),
(8, 'M', 1, 201),
(9, 'Pack', 1, 202),
(10, 'Pages', 1, 203),
(11, 'Pieces', 1, 204),
(12, 'Quantity', 1, 205),
(13, 'Reams', 1, 206),
(14, 'Sheet', 1, 207),
(15, 'Spiral Binder', 1, 208),
(16, 'Sq Ft', 1, 209);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_usageunit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_usageunit_seq`
--

INSERT INTO `vtiger_usageunit_seq` (`id`) VALUES
(16);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_user2mergefields`
--

CREATE TABLE IF NOT EXISTS `vtiger_user2mergefields` (
  `userid` int(11) DEFAULT NULL,
  `tabid` int(19) DEFAULT NULL,
  `fieldid` int(19) DEFAULT NULL,
  `visible` int(2) DEFAULT NULL,
  KEY `userid_tabid_idx` (`userid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_user2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_user2role` (
  `userid` int(11) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `user2role_roleid_idx` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_user2role`
--

INSERT INTO `vtiger_user2role` (`userid`, `roleid`) VALUES
(1, 'H2');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users`
--

CREATE TABLE IF NOT EXISTS `vtiger_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_hash` varchar(32) DEFAULT NULL,
  `cal_color` varchar(25) DEFAULT '#E6FAD8',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `reports_to_id` varchar(36) DEFAULT NULL,
  `is_admin` varchar(3) DEFAULT '0',
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `description` text,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` varchar(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `signature` varchar(1000) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(25) DEFAULT NULL,
  `address_postalcode` varchar(9) DEFAULT NULL,
  `user_preferences` text,
  `tz` varchar(30) DEFAULT NULL,
  `holidays` varchar(60) DEFAULT NULL,
  `namedays` varchar(60) DEFAULT NULL,
  `workdays` varchar(30) DEFAULT NULL,
  `weekstart` int(11) DEFAULT NULL,
  `date_format` varchar(200) DEFAULT NULL,
  `hour_format` varchar(30) DEFAULT 'am/pm',
  `start_hour` varchar(30) DEFAULT '10:00',
  `end_hour` varchar(30) DEFAULT '23:00',
  `activity_view` varchar(200) DEFAULT 'Today',
  `lead_view` varchar(200) DEFAULT 'Today',
  `imagename` varchar(250) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `confirm_password` varchar(300) DEFAULT NULL,
  `internal_mailer` varchar(3) NOT NULL DEFAULT '1',
  `reminder_interval` varchar(100) DEFAULT NULL,
  `reminder_next_time` varchar(100) DEFAULT NULL,
  `crypt_type` varchar(20) NOT NULL DEFAULT 'MD5',
  `accesskey` varchar(36) DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `language` varchar(36) DEFAULT NULL,
  `time_zone` varchar(200) DEFAULT NULL,
  `currency_grouping_pattern` varchar(100) DEFAULT NULL,
  `currency_decimal_separator` varchar(2) DEFAULT NULL,
  `currency_grouping_separator` varchar(2) DEFAULT NULL,
  `currency_symbol_placement` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_user_name_idx` (`user_name`),
  KEY `user_user_password_idx` (`user_password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vtiger_users`
--

INSERT INTO `vtiger_users` (`id`, `user_name`, `user_password`, `user_hash`, `cal_color`, `first_name`, `last_name`, `reports_to_id`, `is_admin`, `currency_id`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `title`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `email1`, `email2`, `secondaryemail`, `status`, `signature`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `user_preferences`, `tz`, `holidays`, `namedays`, `workdays`, `weekstart`, `date_format`, `hour_format`, `start_hour`, `end_hour`, `activity_view`, `lead_view`, `imagename`, `deleted`, `confirm_password`, `internal_mailer`, `reminder_interval`, `reminder_next_time`, `crypt_type`, `accesskey`, `theme`, `language`, `time_zone`, `currency_grouping_pattern`, `currency_decimal_separator`, `currency_grouping_separator`, `currency_symbol_placement`) VALUES
(1, 'admin', '$1$ad000000$hzXFXvL3XVlnUE/X.1n9t/', '21232f297a57a5a743894a0e4a801fc3', '#E6FAD8', '', 'Administrator', '', 'on', 1, '', '2013-07-23 11:49:17', '0000-00-00 00:00:00', NULL, '', '', '', '', '', '', '', 'admin@acube.co', '', '', 'Active', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'yyyy-mm-dd', 'am/pm', '08:00', '', 'This Week', 'Today', '', 0, '$1$ad000000$nYTnfhTZRmUP.wQT9y1AE.', '1', '1 Minute', NULL, 'PHP5.3MD5', 'nUuyQKnpMFNXgCRq', 'woodspice', 'en_us', 'UTC', '123,456,789', '.', ',', '$1.0');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users2group`
--

CREATE TABLE IF NOT EXISTS `vtiger_users2group` (
  `groupid` int(19) NOT NULL,
  `userid` int(19) NOT NULL,
  PRIMARY KEY (`groupid`,`userid`),
  KEY `users2group_groupname_uerid_idx` (`groupid`,`userid`),
  KEY `fk_2_vtiger_users2group` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_users2group`
--

INSERT INTO `vtiger_users2group` (`groupid`, `userid`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users_last_import`
--

CREATE TABLE IF NOT EXISTS `vtiger_users_last_import` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_users_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_users_seq`
--

INSERT INTO `vtiger_users_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_usertype`
--

CREATE TABLE IF NOT EXISTS `vtiger_usertype` (
  `usertypeid` int(19) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`usertypeid`),
  UNIQUE KEY `usertype_usertype_idx` (`usertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_user_module_preferences`
--

CREATE TABLE IF NOT EXISTS `vtiger_user_module_preferences` (
  `userid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `default_cvid` int(19) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`),
  KEY `fk_2_vtiger_user_module_preferences` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_vendor`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendor` (
  `vendorid` int(19) NOT NULL DEFAULT '0',
  `vendor_no` varchar(100) NOT NULL,
  `vendorname` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `glacct` varchar(200) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `street` text,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `pobox` varchar(30) DEFAULT NULL,
  `postalcode` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_vendorcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendorcf` (
  `vendorid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_vendorcontactrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendorcontactrel` (
  `vendorid` int(19) NOT NULL DEFAULT '0',
  `contactid` int(19) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vendorid`,`contactid`),
  KEY `vendorcontactrel_vendorid_idx` (`vendorid`),
  KEY `vendorcontactrel_contact_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_version`
--

CREATE TABLE IF NOT EXISTS `vtiger_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_version` varchar(30) DEFAULT NULL,
  `current_version` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vtiger_version`
--

INSERT INTO `vtiger_version` (`id`, `old_version`, `current_version`) VALUES
(1, '5.4.0', '5.4.0');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_version_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_version_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_version_seq`
--

INSERT INTO `vtiger_version_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_visibility`
--

CREATE TABLE IF NOT EXISTS `vtiger_visibility` (
  `visibilityid` int(19) NOT NULL AUTO_INCREMENT,
  `visibility` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`visibilityid`),
  UNIQUE KEY `visibility_visibility_idx` (`visibility`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vtiger_visibility`
--

INSERT INTO `vtiger_visibility` (`visibilityid`, `visibility`, `sortorderid`, `presence`) VALUES
(1, 'Private', 0, 1),
(2, 'Public', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_visibility_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_visibility_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_visibility_seq`
--

INSERT INTO `vtiger_visibility_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_webforms`
--

CREATE TABLE IF NOT EXISTS `vtiger_webforms` (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `publicid` varchar(100) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `targetmodule` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `ownerid` int(19) NOT NULL,
  `returnurl` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webformname` (`name`),
  UNIQUE KEY `publicid` (`id`),
  KEY `webforms_webforms_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_webforms_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_webforms_field` (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `webformid` int(19) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `neutralizedfield` varchar(50) NOT NULL,
  `defaultvalue` varchar(200) DEFAULT NULL,
  `required` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `webforms_webforms_field_idx` (`id`),
  KEY `fk_1_vtiger_webforms_field` (`webformid`),
  KEY `fk_2_vtiger_webforms_field` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wordtemplates`
--

CREATE TABLE IF NOT EXISTS `vtiger_wordtemplates` (
  `templateid` int(19) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `module` varchar(30) NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_type` varchar(50) NOT NULL,
  `data` longblob,
  `description` text,
  `filesize` varchar(50) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp` (
  `appid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `appkey` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vtiger_wsapp`
--

INSERT INTO `vtiger_wsapp` (`appid`, `name`, `appkey`, `type`) VALUES
(1, 'vtigerCRM', '51ee60dd789c0', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_handlerdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_handlerdetails` (
  `type` varchar(200) NOT NULL,
  `handlerclass` varchar(100) DEFAULT NULL,
  `handlerpath` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_wsapp_handlerdetails`
--

INSERT INTO `vtiger_wsapp_handlerdetails` (`type`, `handlerclass`, `handlerpath`) VALUES
('Outlook', 'OutlookHandler', 'modules/WSAPP/Handlers/OutlookHandler.php'),
('vtigerCRM', 'vtigerCRMHandler', 'modules/WSAPP/Handlers/vtigerCRMHandler.php');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_queuerecords`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_queuerecords` (
  `syncserverid` int(19) DEFAULT NULL,
  `details` varchar(300) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `appid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_recordmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_recordmapping` (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `serverid` varchar(10) DEFAULT NULL,
  `clientid` varchar(255) DEFAULT NULL,
  `clientmodifiedtime` datetime DEFAULT NULL,
  `appid` int(11) DEFAULT NULL,
  `servermodifiedtime` datetime DEFAULT NULL,
  `serverappid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_sync_state`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_sync_state` (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `stateencodedvalues` varchar(300) NOT NULL,
  `userid` int(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_class` varchar(64) NOT NULL,
  `ismodule` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `vtiger_ws_entity`
--

INSERT INTO `vtiger_ws_entity` (`id`, `name`, `handler_path`, `handler_class`, `ismodule`) VALUES
(1, 'Campaigns', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(2, 'Vendors', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(3, 'Faq', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(4, 'Quotes', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(5, 'PurchaseOrder', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(6, 'SalesOrder', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(7, 'Invoice', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(8, 'PriceBooks', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(9, 'Calendar', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(10, 'Leads', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(11, 'Accounts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(12, 'Contacts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(13, 'Potentials', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(14, 'Products', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(15, 'Documents', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(16, 'Emails', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(17, 'HelpDesk', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(18, 'Events', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(19, 'Users', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(20, 'Groups', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(21, 'Currency', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(22, 'DocumentFolders', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(23, 'CompanyDetails', 'include/Webservices/VtigerCompanyDetails.php', 'VtigerCompanyDetails', 0),
(24, 'ServiceContracts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(25, 'Services', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(26, 'PBXManager', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(27, 'ModComments', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(28, 'Assets', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(29, 'SMSNotifier', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(30, 'ProjectMilestone', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(31, 'ProjectTask', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(32, 'Project', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_fieldtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_fieldtype` (
  `fieldtypeid` int(19) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `fieldtype` varchar(200) NOT NULL,
  PRIMARY KEY (`fieldtypeid`),
  UNIQUE KEY `vtiger_idx_1_tablename_fieldname` (`table_name`,`field_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vtiger_ws_entity_fieldtype`
--

INSERT INTO `vtiger_ws_entity_fieldtype` (`fieldtypeid`, `table_name`, `field_name`, `fieldtype`) VALUES
(1, 'vtiger_attachmentsfolder', 'createdby', 'reference'),
(2, 'vtiger_organizationdetails', 'logoname', 'file'),
(3, 'vtiger_organizationdetails', 'phone', 'phone'),
(4, 'vtiger_organizationdetails', 'fax', 'phone'),
(5, 'vtiger_organizationdetails', 'website', 'url');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_fieldtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_fieldtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_fieldtype_seq`
--

INSERT INTO `vtiger_ws_entity_fieldtype_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_name`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_name` (
  `entity_id` int(11) NOT NULL,
  `name_fields` varchar(50) NOT NULL,
  `index_field` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_name`
--

INSERT INTO `vtiger_ws_entity_name` (`entity_id`, `name_fields`, `index_field`, `table_name`) VALUES
(20, 'groupname', 'groupid', 'vtiger_groups'),
(21, 'currency_name', 'id', 'vtiger_currency_info'),
(22, 'foldername', 'folderid', 'vtiger_attachmentsfolder'),
(23, 'organizationname', 'groupid', 'vtiger_organizationdetails');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_referencetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`fieldtypeid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_referencetype`
--

INSERT INTO `vtiger_ws_entity_referencetype` (`fieldtypeid`, `type`) VALUES
(5, 'Users');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_seq`
--

INSERT INTO `vtiger_ws_entity_seq` (`id`) VALUES
(32);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_tables`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_tables` (
  `webservice_entity_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  PRIMARY KEY (`webservice_entity_id`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_tables`
--

INSERT INTO `vtiger_ws_entity_tables` (`webservice_entity_id`, `table_name`) VALUES
(20, 'vtiger_groups'),
(21, 'vtiger_currency_info'),
(22, 'vtiger_attachmentsfolder'),
(23, 'vtiger_organizationdetails');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_fieldinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_fieldinfo` (
  `id` varchar(64) NOT NULL,
  `property_name` varchar(32) DEFAULT NULL,
  `property_value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_fieldinfo`
--

INSERT INTO `vtiger_ws_fieldinfo` (`id`, `property_name`, `property_value`) VALUES
('vtiger_organizationdetails.organization_id', 'upload.path', '1');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_fieldtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_fieldtype` (
  `fieldtypeid` int(19) NOT NULL AUTO_INCREMENT,
  `uitype` varchar(30) NOT NULL,
  `fieldtype` varchar(200) NOT NULL,
  PRIMARY KEY (`fieldtypeid`),
  UNIQUE KEY `uitype_idx` (`uitype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `vtiger_ws_fieldtype`
--

INSERT INTO `vtiger_ws_fieldtype` (`fieldtypeid`, `uitype`, `fieldtype`) VALUES
(1, '15', 'picklist'),
(2, '16', 'picklist'),
(3, '19', 'text'),
(4, '20', 'text'),
(5, '21', 'text'),
(6, '24', 'text'),
(7, '3', 'autogenerated'),
(8, '11', 'phone'),
(9, '33', 'multipicklist'),
(10, '17', 'url'),
(11, '85', 'skype'),
(12, '56', 'boolean'),
(13, '156', 'boolean'),
(14, '53', 'owner'),
(15, '61', 'file'),
(16, '28', 'file'),
(17, '13', 'email'),
(18, '71', 'currency'),
(19, '72', 'currency'),
(20, '50', 'reference'),
(21, '51', 'reference'),
(22, '57', 'reference'),
(23, '58', 'reference'),
(24, '73', 'reference'),
(25, '75', 'reference'),
(26, '76', 'reference'),
(27, '78', 'reference'),
(28, '80', 'reference'),
(29, '81', 'reference'),
(30, '101', 'reference'),
(31, '52', 'reference'),
(32, '357', 'reference'),
(33, '59', 'reference'),
(34, '66', 'reference'),
(35, '77', 'reference'),
(36, '68', 'reference'),
(37, '117', 'reference'),
(38, '26', 'reference'),
(39, '10', 'reference');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_operation`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation` (
  `operationid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_method` varchar(64) NOT NULL,
  `type` varchar(8) NOT NULL,
  `prelogin` int(3) NOT NULL,
  PRIMARY KEY (`operationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `vtiger_ws_operation`
--

INSERT INTO `vtiger_ws_operation` (`operationid`, `name`, `handler_path`, `handler_method`, `type`, `prelogin`) VALUES
(1, 'login', 'include/Webservices/Login.php', 'vtws_login', 'POST', 1),
(2, 'retrieve', 'include/Webservices/Retrieve.php', 'vtws_retrieve', 'GET', 0),
(3, 'create', 'include/Webservices/Create.php', 'vtws_create', 'POST', 0),
(4, 'update', 'include/Webservices/Update.php', 'vtws_update', 'POST', 0),
(5, 'delete', 'include/Webservices/Delete.php', 'vtws_delete', 'POST', 0),
(6, 'sync', 'include/Webservices/GetUpdates.php', 'vtws_sync', 'GET', 0),
(7, 'query', 'include/Webservices/Query.php', 'vtws_query', 'GET', 0),
(8, 'logout', 'include/Webservices/Logout.php', 'vtws_logout', 'POST', 0),
(9, 'listtypes', 'include/Webservices/ModuleTypes.php', 'vtws_listtypes', 'GET', 0),
(10, 'getchallenge', 'include/Webservices/AuthToken.php', 'vtws_getchallenge', 'GET', 1),
(11, 'describe', 'include/Webservices/DescribeObject.php', 'vtws_describe', 'GET', 0),
(12, 'extendsession', 'include/Webservices/ExtendSession.php', 'vtws_extendSession', 'POST', 1),
(13, 'convertlead', 'include/Webservices/ConvertLead.php', 'vtws_convertlead', 'POST', 0),
(14, 'revise', 'include/Webservices/Revise.php', 'vtws_revise', 'POST', 0),
(15, 'changePassword', 'include/Webservices/ChangePassword.php', 'vtws_changePassword', 'POST', 0),
(16, 'deleteUser', 'include/Webservices/DeleteUser.php', 'vtws_deleteUser', 'POST', 0),
(17, 'mobile.fetchallalerts', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchAllAlerts', 'POST', 0),
(18, 'mobile.alertdetailswithmessage', 'modules/Mobile/api/wsapi.php', 'mobile_ws_alertDetailsWithMessage', 'POST', 0),
(19, 'mobile.fetchmodulefilters', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchModuleFilters', 'POST', 0),
(20, 'mobile.fetchrecord', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchRecord', 'POST', 0),
(21, 'mobile.fetchrecordwithgrouping', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchRecordWithGrouping', 'POST', 0),
(22, 'mobile.filterdetailswithcount', 'modules/Mobile/api/wsapi.php', 'mobile_ws_filterDetailsWithCount', 'POST', 0),
(23, 'mobile.listmodulerecords', 'modules/Mobile/api/wsapi.php', 'mobile_ws_listModuleRecords', 'POST', 0),
(24, 'mobile.saverecord', 'modules/Mobile/api/wsapi.php', 'mobile_ws_saveRecord', 'POST', 0),
(25, 'mobile.syncModuleRecords', 'modules/Mobile/api/wsapi.php', 'mobile_ws_syncModuleRecords', 'POST', 0),
(26, 'mobile.query', 'modules/Mobile/api/wsapi.php', 'mobile_ws_query', 'POST', 0),
(27, 'mobile.querywithgrouping', 'modules/Mobile/api/wsapi.php', 'mobile_ws_queryWithGrouping', 'POST', 0),
(28, 'wsapp_register', 'modules/WSAPP/api/ws/Register.php', 'wsapp_register', 'POST', 0),
(29, 'wsapp_deregister', 'modules/WSAPP/api/ws/DeRegister.php', 'wsapp_deregister', 'POST', 0),
(30, 'wsapp_get', 'modules/WSAPP/api/ws/Get.php', 'wsapp_get', 'POST', 0),
(31, 'wsapp_put', 'modules/WSAPP/api/ws/Put.php', 'wsapp_put', 'POST', 0),
(32, 'wsapp_map', 'modules/WSAPP/api/ws/Map.php', 'wsapp_map', 'POST', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_operation_parameters`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation_parameters` (
  `operationid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`operationid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `vtiger_ws_operation_parameters`
--

INSERT INTO `vtiger_ws_operation_parameters` (`operationid`, `name`, `type`, `sequence`) VALUES
(1, 'accessKey', 'String', 2),
(1, 'username', 'String', 1),
(2, 'id', 'String', 1),
(3, 'element', 'encoded', 2),
(3, 'elementType', 'String', 1),
(4, 'element', 'encoded', 1),
(5, 'id', 'String', 1),
(6, 'elementType', 'String', 2),
(6, 'modifiedTime', 'DateTime', 1),
(7, 'query', 'String', 1),
(8, 'sessionName', 'String', 1),
(9, 'fieldTypeList', 'encoded', 1),
(10, 'username', 'String', 1),
(11, 'elementType', 'String', 1),
(13, 'accountName', 'String', 3),
(13, 'assignedTo', 'String', 2),
(13, 'avoidPotential', 'Boolean', 4),
(13, 'leadId', 'String', 1),
(13, 'potential', 'Encoded', 5),
(14, 'element', 'Encoded', 1),
(15, 'confirmPassword', 'String', 4),
(15, 'id', 'String', 1),
(15, 'newPassword', 'String', 3),
(15, 'oldPassword', 'String', 2),
(16, 'id', 'String', 1),
(16, 'newOwnerId', 'String', 2),
(18, 'alertid', 'string', 1),
(19, 'module', 'string', 1),
(20, 'record', 'string', 1),
(21, 'record', 'string', 1),
(22, 'filterid', 'string', 1),
(23, 'elements', 'encoded', 1),
(24, 'module', 'string', 1),
(24, 'record', 'string', 2),
(24, 'values', 'encoded', 3),
(25, 'module', 'string', 1),
(25, 'page', 'string', 3),
(25, 'syncToken', 'string', 2),
(26, 'module', 'string', 1),
(26, 'page', 'string', 3),
(26, 'query', 'string', 2),
(27, 'module', 'string', 1),
(27, 'page', 'string', 3),
(27, 'query', 'string', 2),
(28, 'synctype', 'string', 2),
(28, 'type', 'string', 1),
(29, 'key', 'string', 2),
(29, 'type', 'string', 1),
(30, 'key', 'string', 1),
(30, 'module', 'string', 2),
(30, 'token', 'string', 3),
(31, 'element', 'encoded', 2),
(31, 'key', 'string', 1),
(32, 'element', 'encoded', 2),
(32, 'key', 'string', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_operation_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_operation_seq`
--

INSERT INTO `vtiger_ws_operation_seq` (`id`) VALUES
(32);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_referencetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`fieldtypeid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_referencetype`
--

INSERT INTO `vtiger_ws_referencetype` (`fieldtypeid`, `type`) VALUES
(20, 'Accounts'),
(21, 'Accounts'),
(22, 'Contacts'),
(23, 'Campaigns'),
(24, 'Accounts'),
(25, 'Vendors'),
(26, 'Potentials'),
(27, 'Quotes'),
(28, 'SalesOrder'),
(29, 'Vendors'),
(30, 'Users'),
(31, 'Users'),
(32, 'Accounts'),
(32, 'Contacts'),
(32, 'Leads'),
(32, 'Users'),
(32, 'Vendors'),
(33, 'Products'),
(34, 'Accounts'),
(34, 'HelpDesk'),
(34, 'Leads'),
(34, 'Potentials'),
(35, 'Users'),
(36, 'Accounts'),
(36, 'Contacts'),
(37, 'Currency'),
(38, 'DocumentFolders');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_userauthtoken`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_userauthtoken` (
  `userid` int(19) NOT NULL,
  `token` varchar(36) NOT NULL,
  `expiretime` int(19) NOT NULL,
  PRIMARY KEY (`userid`,`expiretime`),
  UNIQUE KEY `userid_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vtiger_account`
--
ALTER TABLE `vtiger_account`
  ADD CONSTRAINT `fk_1_vtiger_account` FOREIGN KEY (`accountid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_accountbillads`
--
ALTER TABLE `vtiger_accountbillads`
  ADD CONSTRAINT `fk_1_vtiger_accountbillads` FOREIGN KEY (`accountaddressid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_accountscf`
--
ALTER TABLE `vtiger_accountscf`
  ADD CONSTRAINT `fk_1_vtiger_accountscf` FOREIGN KEY (`accountid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_accountshipads`
--
ALTER TABLE `vtiger_accountshipads`
  ADD CONSTRAINT `fk_1_vtiger_accountshipads` FOREIGN KEY (`accountaddressid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_activity`
--
ALTER TABLE `vtiger_activity`
  ADD CONSTRAINT `fk_1_vtiger_activity` FOREIGN KEY (`activityid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_activityproductrel`
--
ALTER TABLE `vtiger_activityproductrel`
  ADD CONSTRAINT `fk_2_vtiger_activityproductrel` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_assets`
--
ALTER TABLE `vtiger_assets`
  ADD CONSTRAINT `fk_1_vtiger_assets` FOREIGN KEY (`assetsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_attachments`
--
ALTER TABLE `vtiger_attachments`
  ADD CONSTRAINT `fk_1_vtiger_attachments` FOREIGN KEY (`attachmentsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_blocks`
--
ALTER TABLE `vtiger_blocks`
  ADD CONSTRAINT `fk_1_vtiger_blocks` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_campaigncontrel`
--
ALTER TABLE `vtiger_campaigncontrel`
  ADD CONSTRAINT `fk_2_vtiger_campaigncontrel` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_campaignleadrel`
--
ALTER TABLE `vtiger_campaignleadrel`
  ADD CONSTRAINT `fk_2_vtiger_campaignleadrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_campaignscf`
--
ALTER TABLE `vtiger_campaignscf`
  ADD CONSTRAINT `fk_1_vtiger_campaignscf` FOREIGN KEY (`campaignid`) REFERENCES `vtiger_campaign` (`campaignid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_chat_msg`
--
ALTER TABLE `vtiger_chat_msg`
  ADD CONSTRAINT `fk_1_vtiger_chat_msg` FOREIGN KEY (`chat_from`) REFERENCES `vtiger_chat_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_chat_pchat`
--
ALTER TABLE `vtiger_chat_pchat`
  ADD CONSTRAINT `fk_1_vtiger_chat_pchat` FOREIGN KEY (`msg`) REFERENCES `vtiger_chat_msg` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_chat_pvchat`
--
ALTER TABLE `vtiger_chat_pvchat`
  ADD CONSTRAINT `fk_1_vtiger_chat_pvchat` FOREIGN KEY (`msg`) REFERENCES `vtiger_chat_msg` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_cntactivityrel`
--
ALTER TABLE `vtiger_cntactivityrel`
  ADD CONSTRAINT `fk_2_vtiger_cntactivityrel` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_competitor`
--
ALTER TABLE `vtiger_competitor`
  ADD CONSTRAINT `fk_1_vtiger_competitor` FOREIGN KEY (`competitorid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_contactaddress`
--
ALTER TABLE `vtiger_contactaddress`
  ADD CONSTRAINT `fk_1_vtiger_contactaddress` FOREIGN KEY (`contactaddressid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_contactdetails`
--
ALTER TABLE `vtiger_contactdetails`
  ADD CONSTRAINT `fk_1_vtiger_contactdetails` FOREIGN KEY (`contactid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_contactscf`
--
ALTER TABLE `vtiger_contactscf`
  ADD CONSTRAINT `fk_1_vtiger_contactscf` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_contactsubdetails`
--
ALTER TABLE `vtiger_contactsubdetails`
  ADD CONSTRAINT `fk_1_vtiger_contactsubdetails` FOREIGN KEY (`contactsubscriptionid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_contpotentialrel`
--
ALTER TABLE `vtiger_contpotentialrel`
  ADD CONSTRAINT `fk_2_vtiger_contpotentialrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_crmentitynotesrel`
--
ALTER TABLE `vtiger_crmentitynotesrel`
  ADD CONSTRAINT `fk_2_vtiger_crmentitynotesrel` FOREIGN KEY (`notesid`) REFERENCES `vtiger_notes` (`notesid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_customaction`
--
ALTER TABLE `vtiger_customaction`
  ADD CONSTRAINT `fk_1_vtiger_customaction` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_customerdetails`
--
ALTER TABLE `vtiger_customerdetails`
  ADD CONSTRAINT `fk_1_vtiger_customerdetails` FOREIGN KEY (`customerid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_customview`
--
ALTER TABLE `vtiger_customview`
  ADD CONSTRAINT `fk_1_vtiger_customview` FOREIGN KEY (`entitytype`) REFERENCES `vtiger_tab` (`name`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_cvadvfilter`
--
ALTER TABLE `vtiger_cvadvfilter`
  ADD CONSTRAINT `fk_1_vtiger_cvadvfilter` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_cvcolumnlist`
--
ALTER TABLE `vtiger_cvcolumnlist`
  ADD CONSTRAINT `fk_1_vtiger_cvcolumnlist` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_cvstdfilter`
--
ALTER TABLE `vtiger_cvstdfilter`
  ADD CONSTRAINT `fk_1_vtiger_cvstdfilter` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_grp2grp`
--
ALTER TABLE `vtiger_datashare_grp2grp`
  ADD CONSTRAINT `fk_3_vtiger_datashare_grp2grp` FOREIGN KEY (`to_groupid`) REFERENCES `vtiger_groups` (`groupid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_grp2role`
--
ALTER TABLE `vtiger_datashare_grp2role`
  ADD CONSTRAINT `fk_3_vtiger_datashare_grp2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_grp2rs`
--
ALTER TABLE `vtiger_datashare_grp2rs`
  ADD CONSTRAINT `fk_3_vtiger_datashare_grp2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_module_rel`
--
ALTER TABLE `vtiger_datashare_module_rel`
  ADD CONSTRAINT `fk_1_vtiger_datashare_module_rel` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_relatedmodules`
--
ALTER TABLE `vtiger_datashare_relatedmodules`
  ADD CONSTRAINT `fk_2_vtiger_datashare_relatedmodules` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_role2group`
--
ALTER TABLE `vtiger_datashare_role2group`
  ADD CONSTRAINT `fk_3_vtiger_datashare_role2group` FOREIGN KEY (`share_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_role2role`
--
ALTER TABLE `vtiger_datashare_role2role`
  ADD CONSTRAINT `fk_3_vtiger_datashare_role2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_role2rs`
--
ALTER TABLE `vtiger_datashare_role2rs`
  ADD CONSTRAINT `fk_3_vtiger_datashare_role2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_rs2grp`
--
ALTER TABLE `vtiger_datashare_rs2grp`
  ADD CONSTRAINT `fk_3_vtiger_datashare_rs2grp` FOREIGN KEY (`share_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_rs2role`
--
ALTER TABLE `vtiger_datashare_rs2role`
  ADD CONSTRAINT `fk_3_vtiger_datashare_rs2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_datashare_rs2rs`
--
ALTER TABLE `vtiger_datashare_rs2rs`
  ADD CONSTRAINT `fk_3_vtiger_datashare_rs2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_defaultcv`
--
ALTER TABLE `vtiger_defaultcv`
  ADD CONSTRAINT `fk_1_vtiger_defaultcv` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_def_org_share`
--
ALTER TABLE `vtiger_def_org_share`
  ADD CONSTRAINT `fk_1_vtiger_def_org_share` FOREIGN KEY (`permission`) REFERENCES `vtiger_org_share_action_mapping` (`share_action_id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_entityname`
--
ALTER TABLE `vtiger_entityname`
  ADD CONSTRAINT `fk_1_vtiger_entityname` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_faq`
--
ALTER TABLE `vtiger_faq`
  ADD CONSTRAINT `fk_1_vtiger_faq` FOREIGN KEY (`id`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_faqcomments`
--
ALTER TABLE `vtiger_faqcomments`
  ADD CONSTRAINT `fk_1_vtiger_faqcomments` FOREIGN KEY (`faqid`) REFERENCES `vtiger_faq` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_field`
--
ALTER TABLE `vtiger_field`
  ADD CONSTRAINT `fk_1_vtiger_field` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_group2grouprel`
--
ALTER TABLE `vtiger_group2grouprel`
  ADD CONSTRAINT `fk_2_vtiger_group2grouprel` FOREIGN KEY (`groupid`) REFERENCES `vtiger_groups` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vtiger_group2role`
--
ALTER TABLE `vtiger_group2role`
  ADD CONSTRAINT `fk_2_vtiger_group2role` FOREIGN KEY (`roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_group2rs`
--
ALTER TABLE `vtiger_group2rs`
  ADD CONSTRAINT `fk_2_vtiger_group2rs` FOREIGN KEY (`roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_homedashbd`
--
ALTER TABLE `vtiger_homedashbd`
  ADD CONSTRAINT `fk_1_vtiger_homedashbd` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_homedefault`
--
ALTER TABLE `vtiger_homedefault`
  ADD CONSTRAINT `fk_1_vtiger_homedefault` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_homemodule`
--
ALTER TABLE `vtiger_homemodule`
  ADD CONSTRAINT `fk_1_vtiger_homemodule` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_homemoduleflds`
--
ALTER TABLE `vtiger_homemoduleflds`
  ADD CONSTRAINT `fk_1_vtiger_homemoduleflds` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homemodule` (`stuffid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_homerss`
--
ALTER TABLE `vtiger_homerss`
  ADD CONSTRAINT `fk_1_vtiger_homerss` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_homestuff`
--
ALTER TABLE `vtiger_homestuff`
  ADD CONSTRAINT `fk_1_vtiger_homestuff` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_invoice`
--
ALTER TABLE `vtiger_invoice`
  ADD CONSTRAINT `fk_2_vtiger_invoice` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_invoicebillads`
--
ALTER TABLE `vtiger_invoicebillads`
  ADD CONSTRAINT `fk_1_vtiger_invoicebillads` FOREIGN KEY (`invoicebilladdressid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_invoicecf`
--
ALTER TABLE `vtiger_invoicecf`
  ADD CONSTRAINT `fk_1_vtiger_invoicecf` FOREIGN KEY (`invoiceid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_invoiceshipads`
--
ALTER TABLE `vtiger_invoiceshipads`
  ADD CONSTRAINT `fk_1_vtiger_invoiceshipads` FOREIGN KEY (`invoiceshipaddressid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_invoicestatushistory`
--
ALTER TABLE `vtiger_invoicestatushistory`
  ADD CONSTRAINT `fk_1_vtiger_invoicestatushistory` FOREIGN KEY (`invoiceid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_lar`
--
ALTER TABLE `vtiger_lar`
  ADD CONSTRAINT `fk_1_vtiger_lar` FOREIGN KEY (`createdby`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_leadacctrel`
--
ALTER TABLE `vtiger_leadacctrel`
  ADD CONSTRAINT `fk_2_vtiger_leadacctrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_leadaddress`
--
ALTER TABLE `vtiger_leadaddress`
  ADD CONSTRAINT `fk_1_vtiger_leadaddress` FOREIGN KEY (`leadaddressid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_leadcontrel`
--
ALTER TABLE `vtiger_leadcontrel`
  ADD CONSTRAINT `fk_2_vtiger_leadcontrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_leaddetails`
--
ALTER TABLE `vtiger_leaddetails`
  ADD CONSTRAINT `fk_1_vtiger_leaddetails` FOREIGN KEY (`leadid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_leadpotrel`
--
ALTER TABLE `vtiger_leadpotrel`
  ADD CONSTRAINT `fk_2_vtiger_leadpotrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_leadscf`
--
ALTER TABLE `vtiger_leadscf`
  ADD CONSTRAINT `fk_1_vtiger_leadscf` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_leadsubdetails`
--
ALTER TABLE `vtiger_leadsubdetails`
  ADD CONSTRAINT `fk_1_vtiger_leadsubdetails` FOREIGN KEY (`leadsubscriptionid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_notes`
--
ALTER TABLE `vtiger_notes`
  ADD CONSTRAINT `fk_1_vtiger_notes` FOREIGN KEY (`notesid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_org_share_action2tab`
--
ALTER TABLE `vtiger_org_share_action2tab`
  ADD CONSTRAINT `fk_2_vtiger_org_share_action2tab` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_parenttabrel`
--
ALTER TABLE `vtiger_parenttabrel`
  ADD CONSTRAINT `fk_1_vtiger_parenttabrel` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_2_vtiger_parenttabrel` FOREIGN KEY (`parenttabid`) REFERENCES `vtiger_parenttab` (`parenttabid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_pobillads`
--
ALTER TABLE `vtiger_pobillads`
  ADD CONSTRAINT `fk_1_vtiger_pobillads` FOREIGN KEY (`pobilladdressid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_portalinfo`
--
ALTER TABLE `vtiger_portalinfo`
  ADD CONSTRAINT `fk_1_vtiger_portalinfo` FOREIGN KEY (`id`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_poshipads`
--
ALTER TABLE `vtiger_poshipads`
  ADD CONSTRAINT `fk_1_vtiger_poshipads` FOREIGN KEY (`poshipaddressid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_postatushistory`
--
ALTER TABLE `vtiger_postatushistory`
  ADD CONSTRAINT `fk_1_vtiger_postatushistory` FOREIGN KEY (`purchaseorderid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_potcompetitorrel`
--
ALTER TABLE `vtiger_potcompetitorrel`
  ADD CONSTRAINT `fk_2_vtiger_potcompetitorrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_potential`
--
ALTER TABLE `vtiger_potential`
  ADD CONSTRAINT `fk_1_vtiger_potential` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_potentialscf`
--
ALTER TABLE `vtiger_potentialscf`
  ADD CONSTRAINT `fk_1_vtiger_potentialscf` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_potstagehistory`
--
ALTER TABLE `vtiger_potstagehistory`
  ADD CONSTRAINT `fk_1_vtiger_potstagehistory` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_pricebook`
--
ALTER TABLE `vtiger_pricebook`
  ADD CONSTRAINT `fk_1_vtiger_pricebook` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_pricebookcf`
--
ALTER TABLE `vtiger_pricebookcf`
  ADD CONSTRAINT `fk_1_vtiger_pricebookcf` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_pricebook` (`pricebookid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_pricebookproductrel`
--
ALTER TABLE `vtiger_pricebookproductrel`
  ADD CONSTRAINT `fk_1_vtiger_pricebookproductrel` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_pricebook` (`pricebookid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_productcf`
--
ALTER TABLE `vtiger_productcf`
  ADD CONSTRAINT `fk_1_vtiger_productcf` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_productcollaterals`
--
ALTER TABLE `vtiger_productcollaterals`
  ADD CONSTRAINT `fk_1_vtiger_productcollaterals` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_products`
--
ALTER TABLE `vtiger_products`
  ADD CONSTRAINT `fk_1_vtiger_products` FOREIGN KEY (`productid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_profile2globalpermissions`
--
ALTER TABLE `vtiger_profile2globalpermissions`
  ADD CONSTRAINT `fk_1_vtiger_profile2globalpermissions` FOREIGN KEY (`profileid`) REFERENCES `vtiger_profile` (`profileid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_purchaseorder`
--
ALTER TABLE `vtiger_purchaseorder`
  ADD CONSTRAINT `fk_4_vtiger_purchaseorder` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_purchaseordercf`
--
ALTER TABLE `vtiger_purchaseordercf`
  ADD CONSTRAINT `fk_1_vtiger_purchaseordercf` FOREIGN KEY (`purchaseorderid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_quickview`
--
ALTER TABLE `vtiger_quickview`
  ADD CONSTRAINT `fk_1_vtiger_quickview` FOREIGN KEY (`fieldid`) REFERENCES `vtiger_field` (`fieldid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_quotes`
--
ALTER TABLE `vtiger_quotes`
  ADD CONSTRAINT `fk_3_vtiger_quotes` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_quotesbillads`
--
ALTER TABLE `vtiger_quotesbillads`
  ADD CONSTRAINT `fk_1_vtiger_quotesbillads` FOREIGN KEY (`quotebilladdressid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_quotescf`
--
ALTER TABLE `vtiger_quotescf`
  ADD CONSTRAINT `fk_1_vtiger_quotescf` FOREIGN KEY (`quoteid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_quotesshipads`
--
ALTER TABLE `vtiger_quotesshipads`
  ADD CONSTRAINT `fk_1_vtiger_quotesshipads` FOREIGN KEY (`quoteshipaddressid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_quotestagehistory`
--
ALTER TABLE `vtiger_quotestagehistory`
  ADD CONSTRAINT `fk_1_vtiger_quotestagehistory` FOREIGN KEY (`quoteid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_recurringevents`
--
ALTER TABLE `vtiger_recurringevents`
  ADD CONSTRAINT `fk_1_vtiger_recurringevents` FOREIGN KEY (`activityid`) REFERENCES `vtiger_activity` (`activityid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_relcriteria`
--
ALTER TABLE `vtiger_relcriteria`
  ADD CONSTRAINT `fk_1_vtiger_relcriteria` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_report`
--
ALTER TABLE `vtiger_report`
  ADD CONSTRAINT `fk_2_vtiger_report` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_reportdatefilter`
--
ALTER TABLE `vtiger_reportdatefilter`
  ADD CONSTRAINT `fk_1_vtiger_reportdatefilter` FOREIGN KEY (`datefilterid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_reportgroupbycolumn`
--
ALTER TABLE `vtiger_reportgroupbycolumn`
  ADD CONSTRAINT `fk_1_vtiger_reportgroupbycolumn` FOREIGN KEY (`reportid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_reportmodules`
--
ALTER TABLE `vtiger_reportmodules`
  ADD CONSTRAINT `fk_1_vtiger_reportmodules` FOREIGN KEY (`reportmodulesid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_reportsortcol`
--
ALTER TABLE `vtiger_reportsortcol`
  ADD CONSTRAINT `fk_1_vtiger_reportsortcol` FOREIGN KEY (`reportid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_reportsummary`
--
ALTER TABLE `vtiger_reportsummary`
  ADD CONSTRAINT `fk_1_vtiger_reportsummary` FOREIGN KEY (`reportsummaryid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_role2picklist`
--
ALTER TABLE `vtiger_role2picklist`
  ADD CONSTRAINT `fk_1_vtiger_role2picklist` FOREIGN KEY (`roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_2_vtiger_role2picklist` FOREIGN KEY (`picklistid`) REFERENCES `vtiger_picklist` (`picklistid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_salesmanactivityrel`
--
ALTER TABLE `vtiger_salesmanactivityrel`
  ADD CONSTRAINT `fk_2_vtiger_salesmanactivityrel` FOREIGN KEY (`smid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_salesmanattachmentsrel`
--
ALTER TABLE `vtiger_salesmanattachmentsrel`
  ADD CONSTRAINT `fk_2_vtiger_salesmanattachmentsrel` FOREIGN KEY (`attachmentsid`) REFERENCES `vtiger_attachments` (`attachmentsid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_salesmanticketrel`
--
ALTER TABLE `vtiger_salesmanticketrel`
  ADD CONSTRAINT `fk_2_vtiger_salesmanticketrel` FOREIGN KEY (`smid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_salesorder`
--
ALTER TABLE `vtiger_salesorder`
  ADD CONSTRAINT `fk_3_vtiger_salesorder` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_salesordercf`
--
ALTER TABLE `vtiger_salesordercf`
  ADD CONSTRAINT `fk_1_vtiger_salesordercf` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_seactivityrel`
--
ALTER TABLE `vtiger_seactivityrel`
  ADD CONSTRAINT `fk_2_vtiger_seactivityrel` FOREIGN KEY (`crmid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_seattachmentsrel`
--
ALTER TABLE `vtiger_seattachmentsrel`
  ADD CONSTRAINT `fk_2_vtiger_seattachmentsrel` FOREIGN KEY (`crmid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_selectcolumn`
--
ALTER TABLE `vtiger_selectcolumn`
  ADD CONSTRAINT `fk_1_vtiger_selectcolumn` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_senotesrel`
--
ALTER TABLE `vtiger_senotesrel`
  ADD CONSTRAINT `fk_2_vtiger_senotesrel` FOREIGN KEY (`notesid`) REFERENCES `vtiger_notes` (`notesid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_seproductsrel`
--
ALTER TABLE `vtiger_seproductsrel`
  ADD CONSTRAINT `fk_2_vtiger_seproductsrel` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_service`
--
ALTER TABLE `vtiger_service`
  ADD CONSTRAINT `fk_1_vtiger_service` FOREIGN KEY (`serviceid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_seticketsrel`
--
ALTER TABLE `vtiger_seticketsrel`
  ADD CONSTRAINT `fk_2_vtiger_seticketsrel` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_settings_field`
--
ALTER TABLE `vtiger_settings_field`
  ADD CONSTRAINT `fk_1_vtiger_settings_field` FOREIGN KEY (`blockid`) REFERENCES `vtiger_settings_blocks` (`blockid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_sobillads`
--
ALTER TABLE `vtiger_sobillads`
  ADD CONSTRAINT `fk_1_vtiger_sobillads` FOREIGN KEY (`sobilladdressid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_soshipads`
--
ALTER TABLE `vtiger_soshipads`
  ADD CONSTRAINT `fk_1_vtiger_soshipads` FOREIGN KEY (`soshipaddressid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_sostatushistory`
--
ALTER TABLE `vtiger_sostatushistory`
  ADD CONSTRAINT `fk_1_vtiger_sostatushistory` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tab_info`
--
ALTER TABLE `vtiger_tab_info`
  ADD CONSTRAINT `fk_1_vtiger_tab_info` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vtiger_ticketcf`
--
ALTER TABLE `vtiger_ticketcf`
  ADD CONSTRAINT `fk_1_vtiger_ticketcf` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_ticketcomments`
--
ALTER TABLE `vtiger_ticketcomments`
  ADD CONSTRAINT `fk_1_vtiger_ticketcomments` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_read_group_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_group_rel_sharing_per`
  ADD CONSTRAINT `fk_4_vtiger_tmp_read_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_read_group_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_group_sharing_per`
  ADD CONSTRAINT `fk_3_vtiger_tmp_read_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_read_user_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_user_rel_sharing_per`
  ADD CONSTRAINT `fk_4_vtiger_tmp_read_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_read_user_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_user_sharing_per`
  ADD CONSTRAINT `fk_3_vtiger_tmp_read_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_write_group_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_group_rel_sharing_per`
  ADD CONSTRAINT `fk_4_vtiger_tmp_write_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_write_group_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_group_sharing_per`
  ADD CONSTRAINT `fk_3_vtiger_tmp_write_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_write_user_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_user_rel_sharing_per`
  ADD CONSTRAINT `fk_4_vtiger_tmp_write_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_tmp_write_user_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_user_sharing_per`
  ADD CONSTRAINT `fk_3_vtiger_tmp_write_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_troubletickets`
--
ALTER TABLE `vtiger_troubletickets`
  ADD CONSTRAINT `fk_1_vtiger_troubletickets` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_user2role`
--
ALTER TABLE `vtiger_user2role`
  ADD CONSTRAINT `fk_2_vtiger_user2role` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_users2group`
--
ALTER TABLE `vtiger_users2group`
  ADD CONSTRAINT `fk_2_vtiger_users2group` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_user_module_preferences`
--
ALTER TABLE `vtiger_user_module_preferences`
  ADD CONSTRAINT `fk_2_vtiger_user_module_preferences` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vtiger_vendor`
--
ALTER TABLE `vtiger_vendor`
  ADD CONSTRAINT `fk_1_vtiger_vendor` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_vendorcf`
--
ALTER TABLE `vtiger_vendorcf`
  ADD CONSTRAINT `fk_1_vtiger_vendorcf` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_vendorcontactrel`
--
ALTER TABLE `vtiger_vendorcontactrel`
  ADD CONSTRAINT `fk_2_vtiger_vendorcontactrel` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_webforms_field`
--
ALTER TABLE `vtiger_webforms_field`
  ADD CONSTRAINT `fk_1_vtiger_webforms_field` FOREIGN KEY (`webformid`) REFERENCES `vtiger_webforms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_3_vtiger_webforms_field` FOREIGN KEY (`fieldname`) REFERENCES `vtiger_field` (`fieldname`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_ws_entity_referencetype`
--
ALTER TABLE `vtiger_ws_entity_referencetype`
  ADD CONSTRAINT `vtiger_fk_1_actors_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES `vtiger_ws_entity_fieldtype` (`fieldtypeid`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_ws_entity_tables`
--
ALTER TABLE `vtiger_ws_entity_tables`
  ADD CONSTRAINT `fk_1_vtiger_ws_actor_tables` FOREIGN KEY (`webservice_entity_id`) REFERENCES `vtiger_ws_entity` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtiger_ws_referencetype`
--
ALTER TABLE `vtiger_ws_referencetype`
  ADD CONSTRAINT `fk_1_vtiger_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES `vtiger_ws_fieldtype` (`fieldtypeid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
