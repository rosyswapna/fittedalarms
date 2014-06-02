CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates` (
  `foldername` varchar(100) default NULL,
  `templatename` varchar(100) default NULL,
  `subject` varchar(100) default NULL,
  `description` text,
  `body` text,
  `deleted` int(1) NOT NULL default '0',
  `templateid` int(19) NOT NULL auto_increment,
  `module` varchar(255) default NULL,
  `owner` int( 11 ) NOT NULL DEFAULT '1',
  `sharingtype` char( 7 ) NOT NULL DEFAULT 'public',
  PRIMARY KEY  (`templateid`),
  KEY `emakertemplates_foldernamd_templatename_subject_idx` (`foldername`,`templatename`,`subject`)
) ENGINE=InnoDB AUTO_INCREMENT=0 ;



CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_attch` (
  `attid` int(11) NOT NULL auto_increment,
  `esentid` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_desc` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY  (`attid`),
  KEY `attid` (`attid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_emails` (
  `emailid` int(11) NOT NULL auto_increment,
  `esentid` int(11) NOT NULL,
  `pid` int(11) default NULL,
  `email` varchar(255) NOT NULL,
  `cc` longtext,
  `bcc` longtext,
  `status` int(2) NOT NULL default '0',
  `parent_id` int(11) default NULL,
  `error` text,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_sent` (
  `esentid` int(11) NOT NULL auto_increment,
  `from_name` varchar(255) default NULL,
  `from_email` varchar(255) default NULL,
  `subject` varchar(255) default NULL,
  `body` longtext,
  `type` int(5) NOT NULL,
  `pdf_template_ids` varchar(255) default NULL,
  `pdf_language` varchar(255) default NULL,
  `total_emails` int(11) default '0',
  `userid` int(11) NOT NULL,
  `attachments` int(2) default '0',
  `att_documents` text,
  `send_date` datetime default NULL,
  PRIMARY KEY  (`esentid`)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_settings` (
  `decimals` tinyint(2) NOT NULL,
  `decimal_point` char(2) NOT NULL,
  `thousands_separator` char(2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_relblocks` (
  `relblockid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `secmodule` varchar(255) NOT NULL,
  `block` longtext NOT NULL,
  PRIMARY KEY  (`relblockid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_relblocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_relblockcol` (
  `colid` int(19) NOT NULL,
  `relblockid` int(19) NOT NULL,
  `columnname` varchar(250) NOT NULL,
  `sortorder` varchar(250) NOT NULL,
  PRIMARY KEY  (`relblockid`,`colid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_relblockcriteria` (
  `relblockid` int(11) NOT NULL,
  `colid` int(11) NOT NULL,
  `columnname` varchar(250) NOT NULL,
  `comparator` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `groupid` int(11) NOT NULL,
  `column_condition` varchar(250) NOT NULL,
  PRIMARY KEY  (`relblockid`,`colid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_relblockcriteria_g` (
  `groupid` int(11) NOT NULL,
  `relblockid` int(11) NOT NULL,
  `group_condition` varchar(250) default NULL,
  `condition_expression` text,
  PRIMARY KEY  (`groupid`,`relblockid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_relblockdatefilter` (
  `datefilterid` int(11) NOT NULL,
  `datecolumnname` varchar(250) NOT NULL,
  `datefilter` varchar(250) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  PRIMARY KEY  (`datefilterid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_productbloc_tpl` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_ignorepicklistvalues` (
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`value`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_license` (
  `version_type` varchar(255) NOT NULL,
  `license_key` varchar(255) NOT NULL,
  UNIQUE KEY `version_type` (`version_type`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_version` (
  `version` varchar(10) NOT NULL,
  `license` varchar(255) NOT NULL,
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vtiger_emakertemplates_profilespermissions` (
  `profileid` int(11) NOT NULL,
  `operation` int(11) NOT NULL,
  `permissions` int(1) NOT NULL,
  PRIMARY KEY  (`profileid`,`operation`)
) ENGINE=InnoDB;


INSERT INTO `vtiger_tab` (`tabid`, `name`, `presence`, `tabsequence`, `tablabel`, `modifiedby`, `modifiedtime`, `customized`, `ownedby`, `isentitytype`, `version`, `parent`) VALUES
(53, 'EMAILMaker', 0, -1, 'EMAIL Maker', NULL, NULL, 1, 0, 0, '540.00.08', 'Tools');
