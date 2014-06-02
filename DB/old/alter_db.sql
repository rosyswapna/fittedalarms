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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



-- Table structure for table `ft_product_package`
--

CREATE TABLE IF NOT EXISTS `ft_product_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `packages` text NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



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
TRUNCATE TABLE `ft_product_type` ;

INSERT INTO `ft_product_type` (`type_id`, `product_type`) VALUES
(1, 'Normal Product'),
(2, 'Add ons'),
(3, 'Service'),
(4, 'Express Installation Service');



Product table alteration



ALTER TABLE `ft_product` ADD `add_on` INT NOT NULL DEFAULT '0' AFTER `sort_order` ,
ADD `parent_product_id` TEXT NULL AFTER `add_on` ;



ALTER TABLE `ft_product` ADD `product_type` INT NOT NULL DEFAULT '1' AFTER `add_on` ;


-- Table structure for table `ft_product_recommended_for`
--

CREATE TABLE IF NOT EXISTS `ft_product_recommended_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `recommendations` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



ALTER TABLE `ft_product_recommended_for` ADD `sort_order` INT NOT NULL AFTER `recommendations`; 

ALTER TABLE ft_product ADD video VARCHAR(60) AFTER stock_status_id;


--
-- Table structure for table `ft_product_faqs`
--

CREATE TABLE IF NOT EXISTS `ft_product_faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


ALTER TABLE `ft_product_description` ADD `more_info` TEXT NULL AFTER `meta_keyword` ;


CREATE TABLE IF NOT EXISTS `ft_feature_images` (
  `feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `image` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`feature_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ft_product_features` (
  `product_feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_feature_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


ALTER TABLE `ft_customer` ADD `mobile` VARCHAR( 32 ) NOT NULL AFTER `telephone` 
