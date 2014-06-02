TRUNCATE TABLE `vtiger_webforms` ;

INSERT INTO `vtiger_webforms` (`id`, `name`, `publicid`, `enabled`, `targetmodule`, `description`, `ownerid`, `returnurl`) VALUES
(1, 'Request A Call Back', '9bf7f030983a37e0d3401eb8c063aa2a', 1, 'Leads', '', 1, 'http://fittedalarms.acubedemo.com'),
(2, 'Get a Quote', '1b4f80b3e54c8d2bf6b325987952e45f', 1, 'Leads', '', 1, 'http://fittedalarms.acubedemo.com'),
(3, 'Contact us', 'b8051cb070f69dbff213b17c89c7fff2', 1, 'Leads', '', 1, 'http://fittedalarms.acubedemo.com');

TRUNCATE TABLE `vtiger_webforms_field` ;

INSERT INTO `vtiger_webforms_field` (`id`, `webformid`, `fieldname`, `neutralizedfield`, `defaultvalue`, `required`) VALUES
(71, 1, 'phone', 'phone', '', 0),
(72, 1, 'lastname', 'lastname', '', 1),
(73, 1, 'company', 'company', '', 1),
(74, 1, 'email', 'email', '', 0),
(75, 1, 'leadsource', 'leadsource', 'Web Site', 0),
(76, 1, 'code', 'code', '', 0),
(77, 1, 'description', 'description', '', 0),
(85, 2, 'phone', 'phone', '', 0),
(86, 2, 'lastname', 'lastname', '', 1),
(87, 2, 'company', 'company', '', 1),
(88, 2, 'email', 'email', '', 0),
(89, 2, 'leadsource', 'leadsource', 'Web Site', 0),
(90, 2, 'code', 'code', '', 0),
(91, 2, 'description', 'description', '', 0),
(92, 3, 'phone', 'phone', '', 0),
(93, 3, 'lastname', 'lastname', '', 1),
(94, 3, 'company', 'company', '', 1),
(95, 3, 'email', 'email', '', 0),
(96, 3, 'leadsource', 'leadsource', '', 0),
(97, 3, 'code', 'code', '', 0),
(98, 3, 'description', 'description', '', 0);

