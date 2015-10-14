SET NAMES 'utf8';
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS = 0;

/*!40000 ALTER TABLE `s_core_auth` DISABLE KEYS */;
TRUNCATE TABLE `s_core_auth`;
INSERT INTO `s_core_auth` (`id`, `roleID`, `username`, `password`, `apiKey`, `localeID`, `sessionID`, `lastlogin`, `name`, `email`, `active`, `failedlogins`, `lockeduntil`, `extended_editor`, `disabled_cache`) VALUES
(NULL, 1, 'demo', '84c2ef7bb215395c80119636233765f0', NULL, 1, '', '2012-08-31 11:39:28', 'sfxonline Admin', 'debug@sfxonline.de', 1, 1, '0000-00-00 00:00:00', 0, 0);
/*!40000 ALTER TABLE `s_core_auth` ENABLE KEYS */;

/*!40000 ALTER TABLE `s_core_config_values` DISABLE KEYS */;
TRUNCATE TABLE `s_core_config_values`;
INSERT INTO `s_core_config_values` (`id`, `element_id`, `shop_id`, `value`) VALUES
	(NULL, 674, 1, 's:19:"your.email@shop.com";'),
	(NULL, 673, 1, 's:8:"Demoshop";');
/*!40000 ALTER TABLE `s_core_config_values` ENABLE KEYS */;

/*!40000 ALTER TABLE `s_core_multilanguage` DISABLE KEYS */;
TRUNCATE TABLE `s_core_multilanguage`;
INSERT INTO `s_core_multilanguage` (`id`, `mainID`, `isocode`, `locale`, `parentID`, `flagstorefront`, `flagbackend`, `skipbackend`, `name`, `defaultcustomergroup`, `template`, `doc_template`, `separate_numbers`, `domainaliase`, `defaultcurrency`, `default`, `switchCurrencies`, `switchLanguages`, `scoped_registration`, `fallback`, `navigation`) VALUES
	(1, NULL, '1', 1, 3, '', 'de.png', 1, 'sfxonline Testshop', 'EK', 'orange', 'orange', 0, '33.33.33.10', 1, 1, '1|2', '1|6', NULL, 0, '');
/*!40000 ALTER TABLE `s_core_multilanguage` ENABLE KEYS */;

/*!40000 ALTER TABLE `s_core_shops` DISABLE KEYS */;
TRUNCATE TABLE `s_core_shops`;
INSERT INTO `s_core_shops` (`id`, `main_id`, `name`, `title`, `position`, `host`, `base_path`, `base_url`, `hosts`, `secure`, `secure_host`, `secure_base_path`, `template_id`, `document_template_id`, `category_id`, `locale_id`, `currency_id`, `customer_group_id`, `fallback_id`, `customer_scope`, `default`, `active`, `always_secure`) VALUES
	(1, NULL, 'sfxonline Testshop', NULL, 0, '33.33.33.10', '/shopware5', NULL, '33.33.33.10', 0, NULL, NULL, 23, 23, 3, 1, 1, 1, NULL, 0, 1, 1, 0);
/*!40000 ALTER TABLE `s_core_shops` ENABLE KEYS */;

SET FOREIGN_KEY_CHECKS = 1;