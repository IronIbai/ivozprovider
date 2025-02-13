-- MySQL dump 10.13  Distrib 8.0.25-15, for Linux (x86_64)
--
-- Host: localhost    Database: ivozprovider
-- ------------------------------------------------------
-- Server version	8.0.25-15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `AdministratorRelPublicEntities`
--

DROP TABLE IF EXISTS `AdministratorRelPublicEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdministratorRelPublicEntities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `administratorId` int unsigned NOT NULL,
  `publicEntityId` int unsigned NOT NULL,
  `create` tinyint(1) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `update` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `administratorRelPublicEntity_administrator_publicEntity` (`administratorId`,`publicEntityId`),
  KEY `IDX_76F8BC9320C8F565` (`publicEntityId`),
  CONSTRAINT `FK_76F8BC9320C8F565` FOREIGN KEY (`publicEntityId`) REFERENCES `PublicEntities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_76F8BC93607ED20D` FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdministratorRelPublicEntities`
--

LOCK TABLES `AdministratorRelPublicEntities` WRITE;
/*!40000 ALTER TABLE `AdministratorRelPublicEntities` DISABLE KEYS */;
INSERT INTO `AdministratorRelPublicEntities` VALUES (1,0,150,0,1,0,0),(2,1,150,0,1,0,0);
/*!40000 ALTER TABLE `AdministratorRelPublicEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrators`
--

DROP TABLE IF EXISTS `Administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrators` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(65) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '[password]',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `timezoneId` int unsigned DEFAULT NULL,
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrator_username` (`username`),
  KEY `IDX_CA5E09B79CBEC244` (`brandId`),
  KEY `IDX_CA5E09B731D2BA8E` (`timezoneId`),
  KEY `IDX_CA5E09B72480E723` (`companyId`),
  CONSTRAINT `FK_CA5E09B72480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CA5E09B731D2BA8E` FOREIGN KEY (`timezoneId`) REFERENCES `Timezones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA5E09B79CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrators`
--

LOCK TABLES `Administrators` WRITE;
/*!40000 ALTER TABLE `Administrators` DISABLE KEYS */;
INSERT INTO `Administrators` VALUES (0,'privateAdmin','','',0,NULL,NULL,NULL,NULL,145,0),(1,'admin','$2a$08$ToDhikHKFDznPJVrbPGpeONfmbr3Y9dIrvnyNgN8S7QZ918SeCF0W','admin@example.com',1,'admin','ivozprovider',NULL,NULL,145,0);
/*!40000 ALTER TABLE `Administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ApplicationServers`
--

DROP TABLE IF EXISTS `ApplicationServers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApplicationServers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `applicationServer_ip` (`ip`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicationServers`
--

LOCK TABLES `ApplicationServers` WRITE;
/*!40000 ALTER TABLE `ApplicationServers` DISABLE KEYS */;
INSERT INTO `ApplicationServers` VALUES (1,'127.0.0.1','as001');
/*!40000 ALTER TABLE `ApplicationServers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BalanceMovements`
--

DROP TABLE IF EXISTS `BalanceMovements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BalanceMovements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,4) DEFAULT '0.0000',
  `balance` decimal(10,4) DEFAULT '0.0000',
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `companyId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A8AD782F2480E723` (`companyId`),
  KEY `IDX_A8AD782F6709B1C` (`carrierId`),
  CONSTRAINT `FK_A8AD782F2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A8AD782F6709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BalanceMovements`
--

LOCK TABLES `BalanceMovements` WRITE;
/*!40000 ALTER TABLE `BalanceMovements` DISABLE KEYS */;
/*!40000 ALTER TABLE `BalanceMovements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BalanceNotifications`
--

DROP TABLE IF EXISTS `BalanceNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BalanceNotifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `toAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `threshold` decimal(10,4) DEFAULT '0.0000',
  `lastSent` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `companyId` int unsigned DEFAULT NULL,
  `notificationTemplateId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DD0872322480E723` (`companyId`),
  KEY `IDX_DD0872321333F77D` (`notificationTemplateId`),
  KEY `IDX_DD0872326709B1C` (`carrierId`),
  CONSTRAINT `FK_DD0872321333F77D` FOREIGN KEY (`notificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DD0872322480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DD0872326709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BalanceNotifications`
--

LOCK TABLES `BalanceNotifications` WRITE;
/*!40000 ALTER TABLE `BalanceNotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `BalanceNotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BannedAddresses`
--

DROP TABLE IF EXISTS `BannedAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BannedAddresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocker` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '[enum:antiflood|ipfilter|antibruteforce]',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastTimeBanned` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `aor` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_63B7B3C79CBEC244` (`brandId`),
  KEY `IDX_63B7B3C72480E723` (`companyId`),
  KEY `bannedAddress_lastTimeBanned` (`lastTimeBanned`),
  KEY `bannedAddress_ip_blocker` (`ip`,`blocker`),
  CONSTRAINT `FK_63B7B3C72480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_63B7B3C79CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BannedAddresses`
--

LOCK TABLES `BannedAddresses` WRITE;
/*!40000 ALTER TABLE `BannedAddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `BannedAddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BillableCallHistorics`
--

DROP TABLE IF EXISTS `BillableCallHistorics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BillableCallHistorics` (
  `id` int unsigned NOT NULL,
  `callid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `startTime` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `duration` double NOT NULL DEFAULT '0',
  `caller` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `callee` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` decimal(20,4) DEFAULT NULL COMMENT '(DC2Type:decimal)',
  `price` decimal(20,4) DEFAULT NULL COMMENT '(DC2Type:decimal)',
  `priceDetails` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `carrierName` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `destinationName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ratingPlanName` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  `destinationId` int unsigned DEFAULT NULL,
  `ratingPlanGroupId` int unsigned DEFAULT NULL,
  `invoiceId` int unsigned DEFAULT NULL,
  `trunksCdrId` int unsigned DEFAULT NULL,
  `endpointType` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '[enum:RetailAccount|ResidentialDevice|User|Friend|Fax]',
  `endpointId` int unsigned DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'outbound' COMMENT '[enum:inbound|outbound]',
  `ddiId` int unsigned DEFAULT NULL,
  `ddiProviderId` int unsigned DEFAULT NULL,
  `endpointName` varchar(65) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`startTime`),
  KEY `billableCallHistoric_startTime_idx` (`startTime`),
  KEY `billableCallHistoric_callid_idx` (`callid`),
  KEY `billableCallHistoric_caller_idx` (`caller`),
  KEY `billableCallHistoric_callee_idx` (`callee`),
  KEY `billableCallHistoric_brand_company_idx` (`brandId`,`companyId`),
  KEY `billableCallHistoric_company_idx` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci
/*!50100 PARTITION BY HASH (year(`startTime`))
PARTITIONS 6 */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillableCallHistorics`
--

LOCK TABLES `BillableCallHistorics` WRITE;
/*!40000 ALTER TABLE `BillableCallHistorics` DISABLE KEYS */;
/*!40000 ALTER TABLE `BillableCallHistorics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BillableCalls`
--

DROP TABLE IF EXISTS `BillableCalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BillableCalls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `callid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `startTime` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `duration` double NOT NULL DEFAULT '0',
  `caller` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `callee` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` decimal(20,4) DEFAULT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `priceDetails` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `carrierName` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `destinationName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ratingPlanName` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  `destinationId` int unsigned DEFAULT NULL,
  `ratingPlanGroupId` int unsigned DEFAULT NULL,
  `invoiceId` int unsigned DEFAULT NULL,
  `trunksCdrId` int unsigned DEFAULT NULL,
  `endpointType` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '[enum:RetailAccount|ResidentialDevice|User|Friend|Fax]',
  `endpointId` int unsigned DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'outbound' COMMENT '[enum:inbound|outbound]',
  `ddiId` int unsigned DEFAULT NULL,
  `ddiProviderId` int unsigned DEFAULT NULL,
  `endpointName` varchar(65) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E6F2DA352480E723` (`companyId`),
  KEY `IDX_E6F2DA356709B1C` (`carrierId`),
  KEY `IDX_E6F2DA35BF3434FC` (`destinationId`),
  KEY `IDX_E6F2DA353D7BDC51` (`invoiceId`),
  KEY `IDX_E6F2DA353B9439A5` (`trunksCdrId`),
  KEY `IDX_E6F2DA356A765F36` (`ratingPlanGroupId`),
  KEY `billableCall_startTime_idx` (`startTime`),
  KEY `billableCall_callid_idx` (`callid`),
  KEY `IDX_E6F2DA3532B6E766` (`ddiId`),
  KEY `IDX_E6F2DA3553615680` (`ddiProviderId`),
  KEY `billableCall_caller_idx` (`caller`),
  KEY `billableCall_callee_idx` (`callee`),
  KEY `billableCall_brand_company_idx` (`brandId`,`companyId`),
  CONSTRAINT `FK_E6F2DA352480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA3532B6E766` FOREIGN KEY (`ddiId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA353B9439A5` FOREIGN KEY (`trunksCdrId`) REFERENCES `kam_trunks_cdrs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA353D7BDC51` FOREIGN KEY (`invoiceId`) REFERENCES `Invoices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA3553615680` FOREIGN KEY (`ddiProviderId`) REFERENCES `DDIProviders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA356709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA356A765F36` FOREIGN KEY (`ratingPlanGroupId`) REFERENCES `RatingPlanGroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA359CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E6F2DA35BF3434FC` FOREIGN KEY (`destinationId`) REFERENCES `Destinations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillableCalls`
--

LOCK TABLES `BillableCalls` WRITE;
/*!40000 ALTER TABLE `BillableCalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `BillableCalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BrandServices`
--

DROP TABLE IF EXISTS `BrandServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BrandServices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `serviceId` int unsigned NOT NULL,
  `brandId` int unsigned NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brandService_brand_service` (`brandId`,`serviceId`),
  KEY `IDX_AA498CCC89697FA8` (`serviceId`),
  CONSTRAINT `BrandServices_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `BrandServices_ibfk_2` FOREIGN KEY (`serviceId`) REFERENCES `Services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrandServices`
--

LOCK TABLES `BrandServices` WRITE;
/*!40000 ALTER TABLE `BrandServices` DISABLE KEYS */;
INSERT INTO `BrandServices` VALUES (1,1,1,'94'),(2,2,1,'95'),(3,3,1,'93'),(4,4,1,'00'),(5,5,1,'70'),(6,6,1,'71'),(7,7,1,'72');
/*!40000 ALTER TABLE `BrandServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brands`
--

DROP TABLE IF EXISTS `Brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `domainId` int unsigned DEFAULT NULL,
  `nif` varchar(25) NOT NULL,
  `domain_users` varchar(190) DEFAULT NULL,
  `defaultTimezoneId` int unsigned NOT NULL,
  `logoFileSize` int unsigned DEFAULT NULL COMMENT '[FSO]',
  `logoMimeType` varchar(80) DEFAULT NULL,
  `logoBaseName` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `town` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `registryData` varchar(1024) DEFAULT NULL,
  `languageId` int unsigned DEFAULT NULL,
  `recordingsLimitMB` int DEFAULT NULL,
  `recordingsLimitEmail` varchar(250) DEFAULT NULL,
  `maxCalls` int unsigned NOT NULL DEFAULT '0',
  `currencyId` int unsigned NOT NULL,
  `vmNotificationTemplateId` int unsigned DEFAULT NULL,
  `faxNotificationTemplateId` int unsigned DEFAULT NULL,
  `invoiceNotificationTemplateId` int unsigned DEFAULT NULL,
  `callCsvNotificationTemplateId` int unsigned DEFAULT NULL,
  `maxDailyUsageNotificationTemplateId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_name` (`name`),
  KEY `IDX_790E4102A27130E4` (`defaultTimezoneId`),
  KEY `IDX_790E4102940D8C7E` (`languageId`),
  KEY `IDX_790E4102334600F3` (`domainId`),
  KEY `IDX_790E410291000B8A` (`currencyId`),
  KEY `IDX_790E41021BA12A15` (`vmNotificationTemplateId`),
  KEY `IDX_790E4102E559D278` (`faxNotificationTemplateId`),
  KEY `IDX_790E4102A29D8295` (`invoiceNotificationTemplateId`),
  KEY `IDX_790E410274EE731B` (`callCsvNotificationTemplateId`),
  KEY `IDX_790E4102E81EFEBD` (`maxDailyUsageNotificationTemplateId`),
  CONSTRAINT `Brands_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_790E41021BA12A15` FOREIGN KEY (`vmNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_790E4102334600F3` FOREIGN KEY (`domainId`) REFERENCES `Domains` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_790E410274EE731B` FOREIGN KEY (`callCsvNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_790E410291000B8A` FOREIGN KEY (`currencyId`) REFERENCES `Currencies` (`id`),
  CONSTRAINT `FK_790E4102A27130E4` FOREIGN KEY (`defaultTimezoneId`) REFERENCES `Timezones` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_790E4102A29D8295` FOREIGN KEY (`invoiceNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_790E4102E559D278` FOREIGN KEY (`faxNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_790E4102E81EFEBD` FOREIGN KEY (`maxDailyUsageNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brands`
--

LOCK TABLES `Brands` WRITE;
/*!40000 ALTER TABLE `Brands` DISABLE KEYS */;
INSERT INTO `Brands` VALUES (1,'DemoBrand',4,'1234567890','brand.domain.invalid',145,NULL,NULL,NULL,'Demo Postal Address','12345','DemoTown','DemoProvince','DemoCountry','Demo Registry Data',1,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarPeriods`
--

DROP TABLE IF EXISTS `CalendarPeriods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CalendarPeriods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `routeType` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `numberValue` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendarId` int unsigned NOT NULL,
  `locutionId` int unsigned DEFAULT NULL,
  `extensionId` int unsigned DEFAULT NULL,
  `voiceMailUserId` int unsigned DEFAULT NULL,
  `numberCountryId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_733A607F2D4F56A6` (`calendarId`),
  KEY `IDX_733A607F54690B0` (`locutionId`),
  KEY `IDX_733A607F12AB7F65` (`extensionId`),
  KEY `IDX_733A607FAF230FFD` (`voiceMailUserId`),
  KEY `IDX_733A607FD7819488` (`numberCountryId`),
  CONSTRAINT `FK_733A607F12AB7F65` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_733A607F2D4F56A6` FOREIGN KEY (`calendarId`) REFERENCES `Calendars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_733A607F54690B0` FOREIGN KEY (`locutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_733A607FAF230FFD` FOREIGN KEY (`voiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_733A607FD7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarPeriods`
--

LOCK TABLES `CalendarPeriods` WRITE;
/*!40000 ALTER TABLE `CalendarPeriods` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarPeriods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarPeriodsRelSchedules`
--

DROP TABLE IF EXISTS `CalendarPeriodsRelSchedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CalendarPeriodsRelSchedules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conditionId` int unsigned NOT NULL,
  `scheduleId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A4FBF3A7128AE9F0` (`conditionId`),
  KEY `IDX_A4FBF3A7B745014E` (`scheduleId`),
  CONSTRAINT `FK_A4FBF3A7128AE9F0` FOREIGN KEY (`conditionId`) REFERENCES `CalendarPeriods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A4FBF3A7B745014E` FOREIGN KEY (`scheduleId`) REFERENCES `Schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarPeriodsRelSchedules`
--

LOCK TABLES `CalendarPeriodsRelSchedules` WRITE;
/*!40000 ALTER TABLE `CalendarPeriodsRelSchedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarPeriodsRelSchedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendars`
--

DROP TABLE IF EXISTS `Calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calendars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_name_company` (`name`,`companyId`),
  KEY `IDX_62E00AC2480E723` (`companyId`),
  CONSTRAINT `Calendars_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendars`
--

LOCK TABLES `Calendars` WRITE;
/*!40000 ALTER TABLE `Calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallACL`
--

DROP TABLE IF EXISTS `CallACL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CallACL` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `defaultPolicy` varchar(10) NOT NULL COMMENT '[enum:allow|deny]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CallAcl_company_name` (`companyId`,`name`),
  CONSTRAINT `CallAcl_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallACL`
--

LOCK TABLES `CallACL` WRITE;
/*!40000 ALTER TABLE `CallACL` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallACL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallAclRelMatchLists`
--

DROP TABLE IF EXISTS `CallAclRelMatchLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CallAclRelMatchLists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `priority` smallint NOT NULL,
  `policy` varchar(25) NOT NULL COMMENT '[enum:allow|deny]',
  `CallAclId` int unsigned NOT NULL,
  `matchListId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_callAclId_priority` (`CallAclId`,`priority`),
  KEY `IDX_9BCB3376283E7346` (`matchListId`),
  CONSTRAINT `FK_A09BB695283E7346` FOREIGN KEY (`matchListId`) REFERENCES `MatchLists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A09BB69548DE28A4` FOREIGN KEY (`CallAclId`) REFERENCES `CallACL` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallAclRelMatchLists`
--

LOCK TABLES `CallAclRelMatchLists` WRITE;
/*!40000 ALTER TABLE `CallAclRelMatchLists` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallAclRelMatchLists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallCsvReports`
--

DROP TABLE IF EXISTS `CallCsvReports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CallCsvReports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sentTo` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inDate` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `outDate` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `createdOn` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `csvFileSize` int unsigned DEFAULT NULL COMMENT '[FSO]',
  `csvMimeType` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `csvBaseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `callCsvSchedulerId` int unsigned DEFAULT NULL,
  `brandId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3DC217432480E723` (`companyId`),
  KEY `IDX_3DC217431A2D1FF1` (`callCsvSchedulerId`),
  KEY `IDX_3DC217439CBEC244` (`brandId`),
  CONSTRAINT `FK_3DC217431A2D1FF1` FOREIGN KEY (`callCsvSchedulerId`) REFERENCES `CallCsvSchedulers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3DC217432480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3DC217439CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallCsvReports`
--

LOCK TABLES `CallCsvReports` WRITE;
/*!40000 ALTER TABLE `CallCsvReports` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallCsvReports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallCsvSchedulers`
--

DROP TABLE IF EXISTS `CallCsvSchedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CallCsvSchedulers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month' COMMENT '[enum:day|week|month]',
  `frequency` smallint unsigned NOT NULL,
  `email` varchar(140) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastExecution` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `nextExecution` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `lastExecutionError` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `callCsvNotificationTemplateId` int unsigned DEFAULT NULL,
  `callDirection` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'outbound' COMMENT '[enum:inbound|outbound]',
  `ddiId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  `retailAccountId` int unsigned DEFAULT NULL,
  `residentialDeviceId` int unsigned DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `faxId` int unsigned DEFAULT NULL,
  `friendId` int unsigned DEFAULT NULL,
  `ddiProviderId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CallCsvScheduler_brand_name` (`brandId`,`name`),
  KEY `IDX_100E171E2480E723` (`companyId`),
  KEY `IDX_100E171E74EE731B` (`callCsvNotificationTemplateId`),
  KEY `IDX_100E171E32B6E766` (`ddiId`),
  KEY `IDX_100E171E6709B1C` (`carrierId`),
  KEY `IDX_100E171E5EA9D64D` (`retailAccountId`),
  KEY `IDX_100E171E8B329DCD` (`residentialDeviceId`),
  KEY `IDX_100E171E64B64DCC` (`userId`),
  KEY `IDX_100E171E624C8D73` (`faxId`),
  KEY `IDX_100E171E893BA339` (`friendId`),
  KEY `IDX_100E171E53615680` (`ddiProviderId`),
  CONSTRAINT `FK_100E171E2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_100E171E32B6E766` FOREIGN KEY (`ddiId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E53615680` FOREIGN KEY (`ddiProviderId`) REFERENCES `DDIProviders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E5EA9D64D` FOREIGN KEY (`retailAccountId`) REFERENCES `RetailAccounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E624C8D73` FOREIGN KEY (`faxId`) REFERENCES `Faxes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E64B64DCC` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E6709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E74EE731B` FOREIGN KEY (`callCsvNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E893BA339` FOREIGN KEY (`friendId`) REFERENCES `Friends` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E8B329DCD` FOREIGN KEY (`residentialDeviceId`) REFERENCES `ResidentialDevices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_100E171E9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallCsvSchedulers`
--

LOCK TABLES `CallCsvSchedulers` WRITE;
/*!40000 ALTER TABLE `CallCsvSchedulers` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallCsvSchedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallForwardSettings`
--

DROP TABLE IF EXISTS `CallForwardSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CallForwardSettings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userId` int unsigned DEFAULT NULL,
  `callTypeFilter` varchar(25) NOT NULL COMMENT '[enum:internal|external|both]',
  `callForwardType` varchar(25) NOT NULL COMMENT '[enum:inconditional|noAnswer|busy|userNotRegistered]',
  `targetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail|retail]',
  `numberCountryId` int unsigned DEFAULT NULL,
  `numberValue` varchar(25) DEFAULT NULL,
  `extensionId` int unsigned DEFAULT NULL,
  `voiceMailUserId` int unsigned DEFAULT NULL,
  `noAnswerTimeout` smallint NOT NULL DEFAULT '10',
  `enabled` tinyint unsigned NOT NULL DEFAULT '1',
  `residentialDeviceId` int unsigned DEFAULT NULL,
  `retailAccountId` int unsigned DEFAULT NULL,
  `cfwToRetailAccountId` int unsigned DEFAULT NULL,
  `ddiId` int unsigned DEFAULT NULL,
  `friendId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E71B58A464B64DCC` (`userId`),
  KEY `IDX_E71B58A412AB7F65` (`extensionId`),
  KEY `IDX_E71B58A4AF230FFD` (`voiceMailUserId`),
  KEY `IDX_E71B58A4D7819488` (`numberCountryId`),
  KEY `IDX_E71B58A48B329DCD` (`residentialDeviceId`),
  KEY `IDX_E71B58A45EA9D64D` (`retailAccountId`),
  KEY `IDX_E71B58A4DE65F396` (`cfwToRetailAccountId`),
  KEY `IDX_E71B58A432B6E766` (`ddiId`),
  KEY `IDX_E71B58A4893BA339` (`friendId`),
  CONSTRAINT `CallForwardSettings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CallForwardSettings_ibfk_2` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CallForwardSettings_ibfk_3` FOREIGN KEY (`voiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E71B58A432B6E766` FOREIGN KEY (`ddiId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E71B58A45EA9D64D` FOREIGN KEY (`retailAccountId`) REFERENCES `RetailAccounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E71B58A4893BA339` FOREIGN KEY (`friendId`) REFERENCES `Friends` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E71B58A48B329DCD` FOREIGN KEY (`residentialDeviceId`) REFERENCES `ResidentialDevices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E71B58A4D7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E71B58A4DE65F396` FOREIGN KEY (`cfwToRetailAccountId`) REFERENCES `RetailAccounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallForwardSettings`
--

LOCK TABLES `CallForwardSettings` WRITE;
/*!40000 ALTER TABLE `CallForwardSettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallForwardSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarrierServers`
--

DROP TABLE IF EXISTS `CarrierServers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CarrierServers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `hostname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` smallint unsigned DEFAULT NULL,
  `uriScheme` smallint unsigned DEFAULT NULL,
  `transport` smallint unsigned DEFAULT NULL,
  `sendPAI` tinyint unsigned DEFAULT '0',
  `sendRPID` tinyint unsigned DEFAULT '0',
  `authNeeded` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `authUser` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `authPassword` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sipProxy` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `outboundProxy` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromUser` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromDomain` varchar(190) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `carrierId` int unsigned NOT NULL,
  `brandId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_991132C66709B1C` (`carrierId`),
  KEY `IDX_991132C69CBEC244` (`brandId`),
  CONSTRAINT `FK_991132C66709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_991132C69CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarrierServers`
--

LOCK TABLES `CarrierServers` WRITE;
/*!40000 ALTER TABLE `CarrierServers` DISABLE KEYS */;
/*!40000 ALTER TABLE `CarrierServers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carriers`
--

DROP TABLE IF EXISTS `Carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carriers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `externallyRated` tinyint unsigned DEFAULT '0',
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  `balance` decimal(10,4) DEFAULT '0.0000',
  `calculateCost` tinyint unsigned DEFAULT '0',
  `currencyId` int unsigned DEFAULT NULL,
  `proxyTrunkId` int unsigned DEFAULT NULL,
  `mediaRelaySetsId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carrier_nameBrand` (`name`,`brandId`),
  KEY `IDX_F63EC8E39CBEC244` (`brandId`),
  KEY `IDX_F63EC8E32FECF701` (`transformationRuleSetId`),
  KEY `IDX_F63EC8E391000B8A` (`currencyId`),
  KEY `IDX_F63EC8E37504E30F` (`proxyTrunkId`),
  KEY `IDX_F63EC8E3C8555117` (`mediaRelaySetsId`),
  CONSTRAINT `FK_F63EC8E32FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F63EC8E37504E30F` FOREIGN KEY (`proxyTrunkId`) REFERENCES `ProxyTrunks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F63EC8E391000B8A` FOREIGN KEY (`currencyId`) REFERENCES `Currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F63EC8E39CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F63EC8E3C8555117` FOREIGN KEY (`mediaRelaySetsId`) REFERENCES `MediaRelaySets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carriers`
--

LOCK TABLES `Carriers` WRITE;
/*!40000 ALTER TABLE `Carriers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Changelog`
--

DROP TABLE IF EXISTS `Changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Changelog` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `entity` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `entityId` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `createdOn` datetime NOT NULL,
  `commandId` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `microtime` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4AB3A4A28F36C645` (`commandId`),
  KEY `changelog_createdOn` (`createdOn`),
  KEY `changelog_entity_id_idx` (`entity`,`entityId`),
  KEY `changelog_entity_createdOn` (`entity`,`createdOn`),
  CONSTRAINT `FK_4AB3A4A28F36C645` FOREIGN KEY (`commandId`) REFERENCES `Commandlog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Changelog`
--

LOCK TABLES `Changelog` WRITE;
/*!40000 ALTER TABLE `Changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `Changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Codecs`
--

DROP TABLE IF EXISTS `Codecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Codecs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'audio' COMMENT '[enum:audio|video]',
  `iden` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Codecs`
--

LOCK TABLES `Codecs` WRITE;
/*!40000 ALTER TABLE `Codecs` DISABLE KEYS */;
INSERT INTO `Codecs` VALUES (1,'audio','PCMA','G.711 a-law'),(2,'audio','PCMU','G.711 u-law'),(3,'audio','GSM','GSM'),(4,'audio','G729','G.729A'),(5,'audio','opus','Opus'),(6,'audio','G723','G.723.1'),(7,'audio','G722','G.722'),(8,'audio','speex','Speex'),(9,'audio','iLBC','iLBC'),(10,'audio','AMR','AMR'),(11,'audio','AMR-WB','AMR-WB');
/*!40000 ALTER TABLE `Codecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commandlog`
--

DROP TABLE IF EXISTS `Commandlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commandlog` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `requestId` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `class` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `arguments` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `createdOn` datetime NOT NULL,
  `microtime` smallint NOT NULL,
  `agent` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `commandlog_requestId` (`requestId`),
  KEY `commandlog_createdOn` (`createdOn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commandlog`
--

LOCK TABLES `Commandlog` WRITE;
/*!40000 ALTER TABLE `Commandlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `Commandlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Companies`
--

DROP TABLE IF EXISTS `Companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned NOT NULL,
  `type` varchar(25) NOT NULL DEFAULT 'vpbx' COMMENT '[enum:vpbx|retail|wholesale|residential]',
  `name` varchar(80) NOT NULL,
  `domainId` int unsigned DEFAULT NULL,
  `domain_users` varchar(190) DEFAULT NULL,
  `nif` varchar(25) NOT NULL,
  `defaultTimezoneId` int unsigned DEFAULT NULL,
  `distributeMethod` varchar(25) NOT NULL DEFAULT 'hash' COMMENT '[enum:static|rr|hash]',
  `applicationServerId` int unsigned DEFAULT NULL,
  `maxCalls` int unsigned NOT NULL DEFAULT '0',
  `postalAddress` varchar(255) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `town` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `countryId` int unsigned NOT NULL,
  `languageId` int unsigned DEFAULT NULL,
  `mediaRelaySetsId` int unsigned DEFAULT NULL,
  `ipFilter` tinyint(1) DEFAULT '1',
  `onDemandRecord` smallint DEFAULT '0',
  `onDemandRecordCode` varchar(3) DEFAULT NULL,
  `externallyExtraOpts` text,
  `recordingsLimitMB` int DEFAULT NULL,
  `recordingsLimitEmail` varchar(250) DEFAULT NULL,
  `outgoingDDIId` int unsigned DEFAULT NULL,
  `outgoingDDIRuleId` int unsigned DEFAULT NULL,
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  `vmNotificationTemplateId` int unsigned DEFAULT NULL,
  `faxNotificationTemplateId` int unsigned DEFAULT NULL,
  `billingMethod` varchar(25) NOT NULL DEFAULT 'postpaid' COMMENT '[enum:postpaid|prepaid|pseudoprepaid]',
  `balance` decimal(10,4) DEFAULT '0.0000',
  `invoiceNotificationTemplateId` int unsigned DEFAULT NULL,
  `showInvoices` tinyint(1) DEFAULT '0',
  `callCsvNotificationTemplateId` int unsigned DEFAULT NULL,
  `currencyId` int unsigned DEFAULT NULL,
  `maxDailyUsage` int unsigned NOT NULL DEFAULT '1000000',
  `allowRecordingRemoval` tinyint(1) NOT NULL DEFAULT '1',
  `currentDayUsage` decimal(10,4) DEFAULT '0.0000' COMMENT '(DC2Type:decimal)',
  `maxDailyUsageEmail` varchar(100) DEFAULT NULL,
  `maxDailyUsageNotificationTemplateId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name_brand` (`name`,`brandId`),
  UNIQUE KEY `domain_unique` (`domain_users`),
  KEY `IDX_B528999CBEC244` (`brandId`),
  KEY `IDX_B52899A27130E4` (`defaultTimezoneId`),
  KEY `IDX_B52899F862FFE7` (`applicationServerId`),
  KEY `IDX_B52899FBA2A6B4` (`countryId`),
  KEY `IDX_B52899940D8C7E` (`languageId`),
  KEY `IDX_B52899C8555117` (`mediaRelaySetsId`),
  KEY `IDX_B52899508D43B5` (`outgoingDDIId`),
  KEY `IDX_B52899FC6BB9C8` (`outgoingDDIRuleId`),
  KEY `IDX_B528992FECF701` (`transformationRuleSetId`),
  KEY `IDX_B52899334600F3` (`domainId`),
  KEY `IDX_B528991BA12A15` (`vmNotificationTemplateId`),
  KEY `IDX_B52899E559D278` (`faxNotificationTemplateId`),
  KEY `IDX_B52899A29D8295` (`invoiceNotificationTemplateId`),
  KEY `IDX_B5289974EE731B` (`callCsvNotificationTemplateId`),
  KEY `IDX_B5289991000B8A` (`currencyId`),
  KEY `IDX_B52899E81EFEBD` (`maxDailyUsageNotificationTemplateId`),
  CONSTRAINT `Companies_ibfk_10` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Companies_ibfk_12` FOREIGN KEY (`defaultTimezoneId`) REFERENCES `Timezones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Companies_ibfk_13` FOREIGN KEY (`outgoingDDIId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Companies_ibfk_14` FOREIGN KEY (`outgoingDDIRuleId`) REFERENCES `OutgoingDDIRules` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Companies_ibfk_4` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Companies_ibfk_5` FOREIGN KEY (`applicationServerId`) REFERENCES `ApplicationServers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B528991BA12A15` FOREIGN KEY (`vmNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B528992FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B52899334600F3` FOREIGN KEY (`domainId`) REFERENCES `Domains` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B5289974EE731B` FOREIGN KEY (`callCsvNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B5289991000B8A` FOREIGN KEY (`currencyId`) REFERENCES `Currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B52899A29D8295` FOREIGN KEY (`invoiceNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B52899C8555117` FOREIGN KEY (`mediaRelaySetsId`) REFERENCES `MediaRelaySets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B52899E559D278` FOREIGN KEY (`faxNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B52899E81EFEBD` FOREIGN KEY (`maxDailyUsageNotificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B52899FBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companies`
--

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;
INSERT INTO `Companies` VALUES (1,1,'vpbx','DemoCompany',3,'127.0.0.1','12345678A',145,'hash',NULL,0,'Company Address','54321','Company Town','Company Province','Company Country',70,1,NULL,0,0,'',NULL,NULL,NULL,NULL,NULL,70,NULL,NULL,'postpaid',0.0000,NULL,0,NULL,NULL,1000000,1,0.0000,NULL,NULL);
/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompaniesRelCodecs`
--

DROP TABLE IF EXISTS `CompaniesRelCodecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CompaniesRelCodecs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `codecId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BF72F1B22480E723` (`companyId`),
  KEY `IDX_BF72F1B29F2FC641` (`codecId`),
  CONSTRAINT `FK_BF72F1B22480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BF72F1B29F2FC641` FOREIGN KEY (`codecId`) REFERENCES `Codecs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompaniesRelCodecs`
--

LOCK TABLES `CompaniesRelCodecs` WRITE;
/*!40000 ALTER TABLE `CompaniesRelCodecs` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompaniesRelCodecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompaniesRelGeoIPCountries`
--

DROP TABLE IF EXISTS `CompaniesRelGeoIPCountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CompaniesRelGeoIPCountries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `countryId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4A16E7792480E723` (`companyId`),
  KEY `IDX_4A16E779FBA2A6B4` (`countryId`),
  CONSTRAINT `FK_4A16E7792480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4A16E779FBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompaniesRelGeoIPCountries`
--

LOCK TABLES `CompaniesRelGeoIPCountries` WRITE;
/*!40000 ALTER TABLE `CompaniesRelGeoIPCountries` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompaniesRelGeoIPCountries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompaniesRelRoutingTags`
--

DROP TABLE IF EXISTS `CompaniesRelRoutingTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CompaniesRelRoutingTags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `routingTagId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1CE5AE3C2480E723` (`companyId`),
  KEY `IDX_1CE5AE3CA48EA1F0` (`routingTagId`),
  CONSTRAINT `FK_1CE5AE3C2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1CE5AE3CA48EA1F0` FOREIGN KEY (`routingTagId`) REFERENCES `RoutingTags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompaniesRelRoutingTags`
--

LOCK TABLES `CompaniesRelRoutingTags` WRITE;
/*!40000 ALTER TABLE `CompaniesRelRoutingTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompaniesRelRoutingTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyServices`
--

DROP TABLE IF EXISTS `CompanyServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CompanyServices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `serviceId` int unsigned NOT NULL,
  `companyId` int unsigned NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyService_company_service` (`companyId`,`serviceId`),
  KEY `IDX_569B460B89697FA8` (`serviceId`),
  CONSTRAINT `CompanyServices_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CompanyServices_ibfk_2` FOREIGN KEY (`serviceId`) REFERENCES `Services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyServices`
--

LOCK TABLES `CompanyServices` WRITE;
/*!40000 ALTER TABLE `CompanyServices` DISABLE KEYS */;
INSERT INTO `CompanyServices` VALUES (1,1,1,'94'),(2,2,1,'95'),(3,3,1,'93'),(4,4,1,'00'),(5,5,1,'70'),(6,6,1,'71'),(7,7,1,'72');
/*!40000 ALTER TABLE `CompanyServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConditionalRoutes`
--

DROP TABLE IF EXISTS `ConditionalRoutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConditionalRoutes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `locutionId` int unsigned DEFAULT NULL,
  `routeType` varchar(25) DEFAULT NULL COMMENT '[enum:user|number|ivr|huntGroup|voicemail|friend|queue|conferenceRoom|extension]',
  `huntGroupId` int unsigned DEFAULT NULL,
  `voiceMailUserId` int unsigned DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `numberCountryId` int unsigned DEFAULT NULL,
  `numberValue` varchar(25) DEFAULT NULL,
  `friendValue` varchar(25) DEFAULT NULL,
  `queueId` int unsigned DEFAULT NULL,
  `conferenceRoomId` int unsigned DEFAULT NULL,
  `extensionId` int unsigned DEFAULT NULL,
  `ivrId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AFB65F0D2480E723` (`companyId`),
  KEY `IDX_AFB65F0D54690B0` (`locutionId`),
  KEY `IDX_AFB65F0D921B2343` (`huntGroupId`),
  KEY `IDX_AFB65F0DAF230FFD` (`voiceMailUserId`),
  KEY `IDX_AFB65F0D64B64DCC` (`userId`),
  KEY `IDX_AFB65F0DA4D768C6` (`queueId`),
  KEY `IDX_AFB65F0D23E42D0D` (`conferenceRoomId`),
  KEY `IDX_AFB65F0D12AB7F65` (`extensionId`),
  KEY `IDX_AFB65F0DD7819488` (`numberCountryId`),
  KEY `IDX_AFB65F0D2045F052` (`ivrId`),
  CONSTRAINT `ConditionalRoutes_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ConditionalRoutes_ibfk_10` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutes_ibfk_4` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutes_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutes_ibfk_7` FOREIGN KEY (`queueId`) REFERENCES `Queues` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutes_ibfk_8` FOREIGN KEY (`locutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutes_ibfk_9` FOREIGN KEY (`conferenceRoomId`) REFERENCES `ConferenceRooms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AFB65F0D2045F052` FOREIGN KEY (`ivrId`) REFERENCES `IVRs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AFB65F0DAF230FFD` FOREIGN KEY (`voiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AFB65F0DD7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConditionalRoutes`
--

LOCK TABLES `ConditionalRoutes` WRITE;
/*!40000 ALTER TABLE `ConditionalRoutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConditionalRoutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConditionalRoutesConditions`
--

DROP TABLE IF EXISTS `ConditionalRoutesConditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConditionalRoutesConditions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conditionalRouteId` int unsigned NOT NULL,
  `priority` smallint NOT NULL DEFAULT '1',
  `locutionId` int unsigned DEFAULT NULL,
  `routeType` varchar(25) DEFAULT NULL COMMENT '[enum:user|number|ivr|huntGroup|voicemail|friend|queue|conferenceRoom|extension]',
  `huntGroupId` int unsigned DEFAULT NULL,
  `voiceMailUserId` int unsigned DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `numberCountryId` int unsigned DEFAULT NULL,
  `numberValue` varchar(25) DEFAULT NULL,
  `friendValue` varchar(25) DEFAULT NULL,
  `queueId` int unsigned DEFAULT NULL,
  `conferenceRoomId` int unsigned DEFAULT NULL,
  `extensionId` int unsigned DEFAULT NULL,
  `ivrId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conditionalRouteId` (`conditionalRouteId`,`priority`),
  KEY `IDX_425473C954690B0` (`locutionId`),
  KEY `IDX_425473C9921B2343` (`huntGroupId`),
  KEY `IDX_425473C9AF230FFD` (`voiceMailUserId`),
  KEY `IDX_425473C964B64DCC` (`userId`),
  KEY `IDX_425473C9A4D768C6` (`queueId`),
  KEY `IDX_425473C923E42D0D` (`conferenceRoomId`),
  KEY `IDX_425473C912AB7F65` (`extensionId`),
  KEY `IDX_425473C9D7819488` (`numberCountryId`),
  KEY `IDX_425473C92045F052` (`ivrId`),
  CONSTRAINT `ConditionalRoutesConditions_ibfk_1` FOREIGN KEY (`conditionalRouteId`) REFERENCES `ConditionalRoutes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ConditionalRoutesConditions_ibfk_10` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutesConditions_ibfk_4` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutesConditions_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutesConditions_ibfk_7` FOREIGN KEY (`queueId`) REFERENCES `Queues` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutesConditions_ibfk_8` FOREIGN KEY (`locutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ConditionalRoutesConditions_ibfk_9` FOREIGN KEY (`conferenceRoomId`) REFERENCES `ConferenceRooms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_425473C92045F052` FOREIGN KEY (`ivrId`) REFERENCES `IVRs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_425473C9AF230FFD` FOREIGN KEY (`voiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_425473C9D7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConditionalRoutesConditions`
--

LOCK TABLES `ConditionalRoutesConditions` WRITE;
/*!40000 ALTER TABLE `ConditionalRoutesConditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConditionalRoutesConditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConditionalRoutesConditionsRelCalendars`
--

DROP TABLE IF EXISTS `ConditionalRoutesConditionsRelCalendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConditionalRoutesConditionsRelCalendars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conditionId` int unsigned NOT NULL,
  `calendarId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4BBC13BA128AE9F0` (`conditionId`),
  KEY `IDX_4BBC13BA2D4F56A6` (`calendarId`),
  CONSTRAINT `ConditionalRoutesConditionsRelCalendars_ibfk_1` FOREIGN KEY (`conditionId`) REFERENCES `ConditionalRoutesConditions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ConditionalRoutesConditionsRelCalendars_ibfk_2` FOREIGN KEY (`calendarId`) REFERENCES `Calendars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConditionalRoutesConditionsRelCalendars`
--

LOCK TABLES `ConditionalRoutesConditionsRelCalendars` WRITE;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelCalendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelCalendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConditionalRoutesConditionsRelMatchLists`
--

DROP TABLE IF EXISTS `ConditionalRoutesConditionsRelMatchLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConditionalRoutesConditionsRelMatchLists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conditionId` int unsigned NOT NULL,
  `matchListId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4E69555A128AE9F0` (`conditionId`),
  KEY `IDX_4E69555A283E7346` (`matchListId`),
  CONSTRAINT `ConditionalRoutesConditionsRelMatchLists_ibfk_1` FOREIGN KEY (`conditionId`) REFERENCES `ConditionalRoutesConditions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ConditionalRoutesConditionsRelMatchLists_ibfk_2` FOREIGN KEY (`matchListId`) REFERENCES `MatchLists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConditionalRoutesConditionsRelMatchLists`
--

LOCK TABLES `ConditionalRoutesConditionsRelMatchLists` WRITE;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelMatchLists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelMatchLists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConditionalRoutesConditionsRelRouteLocks`
--

DROP TABLE IF EXISTS `ConditionalRoutesConditionsRelRouteLocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConditionalRoutesConditionsRelRouteLocks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conditionId` int unsigned NOT NULL,
  `routeLockId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7654179F128AE9F0` (`conditionId`),
  KEY `IDX_7654179FC308783B` (`routeLockId`),
  CONSTRAINT `FK_7654179F128AE9F0` FOREIGN KEY (`conditionId`) REFERENCES `ConditionalRoutesConditions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7654179FC308783B` FOREIGN KEY (`routeLockId`) REFERENCES `RouteLocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConditionalRoutesConditionsRelRouteLocks`
--

LOCK TABLES `ConditionalRoutesConditionsRelRouteLocks` WRITE;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelRouteLocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelRouteLocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConditionalRoutesConditionsRelSchedules`
--

DROP TABLE IF EXISTS `ConditionalRoutesConditionsRelSchedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConditionalRoutesConditionsRelSchedules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conditionId` int unsigned NOT NULL,
  `scheduleId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FE584D3B128AE9F0` (`conditionId`),
  KEY `IDX_FE584D3BB745014E` (`scheduleId`),
  CONSTRAINT `ConditionalRoutesConditionsRelSchedules_ibfk_1` FOREIGN KEY (`conditionId`) REFERENCES `ConditionalRoutesConditions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ConditionalRoutesConditionsRelSchedules_ibfk_2` FOREIGN KEY (`scheduleId`) REFERENCES `Schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConditionalRoutesConditionsRelSchedules`
--

LOCK TABLES `ConditionalRoutesConditionsRelSchedules` WRITE;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelSchedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConditionalRoutesConditionsRelSchedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConferenceRooms`
--

DROP TABLE IF EXISTS `ConferenceRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConferenceRooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `pinProtected` tinyint unsigned NOT NULL DEFAULT '0',
  `pinCode` varchar(6) DEFAULT NULL,
  `maxMembers` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ConferenceRoomsUniqueCompanyname` (`companyId`,`name`),
  CONSTRAINT `ConferenceRooms_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConferenceRooms`
--

LOCK TABLES `ConferenceRooms` WRITE;
/*!40000 ALTER TABLE `ConferenceRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConferenceRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL DEFAULT '',
  `name_en` varchar(100) DEFAULT NULL,
  `name_es` varchar(100) DEFAULT NULL,
  `name_ca` varchar(100) DEFAULT NULL,
  `name_it` varchar(100) DEFAULT NULL,
  `zone_en` varchar(55) NOT NULL DEFAULT '',
  `zone_es` varchar(55) NOT NULL DEFAULT '',
  `zone_ca` varchar(55) NOT NULL DEFAULT '',
  `zone_it` varchar(55) NOT NULL DEFAULT '',
  `countryCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languageCode` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'AD','Andorra','Andorra','Andorra','Andorra','Europe','Europa','Europa','Europe','+376'),(2,'AE','United Arab Emirates','Emiratos Árabes Unidos','Emiratos Árabes Unidos','United Arab Emirates','Asia','Asia','Asia','Asia','+971'),(3,'AF','Afghanistan','Afganistán','Afganistán','Afghanistan','Asia','Asia','Asia','Asia','+93'),(4,'AG','Antigua and Barbuda','Antigua y Barbuda','Antigua y Barbuda','Antigua and Barbuda','North america','América del norte','América del norte','North america','+1268'),(5,'AI','Anguilla','Anguila','Anguila','Anguilla','North america','América del norte','América del norte','North america','+1264'),(6,'AL','Albania','Albania','Albania','Albania','Europe','Europa','Europa','Europe','+355'),(7,'AM','Armenia','Armenia','Armenia','Armenia','Asia','Asia','Asia','Asia','+374'),(8,'AO','Angola','Angola','Angola','Angola','Africa','África','África','Africa','+244'),(9,'AQ','Antarctica','Antártida','Antártida','Antarctica','Antarctica','Antártida','Antártida','Antarctica','+672'),(10,'AR','Argentina','Argentina','Argentina','Argentina','South america','América del sur','América del sur','South america','+54'),(11,'AS','American Samoa','Samoa Americana','Samoa Americana','American Samoa','Oceania','Oceanía','Oceanía','Oceania','+1684'),(12,'AT','Austria','Austria','Austria','Austria','Europe','Europa','Europa','Europe','+43'),(13,'AU','Australia','Australia','Australia','Australia','Oceania','Oceanía','Oceanía','Oceania','+61'),(14,'AW','Aruba','Aruba','Aruba','Aruba','North america','América del norte','América del norte','North america','+297'),(15,'AX','Åland Islands','Islas de Åland','Islas de Åland','Åland Islands','Europe','Europa','Europa','Europe','+358'),(16,'AZ','Azerbaijan','Azerbayán','Azerbayán','Azerbaijan','Asia','Asia','Asia','Asia','+994'),(17,'BA','Bosnia and Herzegovina','Bosnia y Herzegovina','Bosnia y Herzegovina','Bosnia and Herzegovina','Europe','Europa','Europa','Europe','+387'),(18,'BB','Barbados','Barbados','Barbados','Barbados','North america','América del norte','América del norte','North america','+1246'),(19,'BD','Bangladesh','Bangladesh','Bangladesh','Bangladesh','Asia','Asia','Asia','Asia','+880'),(20,'BE','Belgium','Bélgica','Bélgica','Belgium','Europe','Europa','Europa','Europe','+32'),(21,'BF','Burkina Faso','Burkina Faso','Burkina Faso','Burkina Faso','Africa','África','África','Africa','+226'),(22,'BG','Bulgaria','Bulgaria','Bulgaria','Bulgaria','Europe','Europa','Europa','Europe','+359'),(23,'BH','Bahrain','Bahrein','Bahrein','Bahrain','Asia','Asia','Asia','Asia','+973'),(24,'BI','Burundi','Burundi','Burundi','Burundi','Africa','África','África','Africa','+257'),(25,'BJ','Benin','Benín','Benín','Benin','Africa','África','África','Africa','+229'),(26,'BL','Saint Barthélemy','San Bartolomé','San Bartolomé','Saint Barthélemy','North america','América del norte','América del norte','North america','+590'),(27,'BM','Bermuda Islands','Islas Bermudas','Islas Bermudas','Bermuda Islands','North america','América del norte','América del norte','North america','+1441'),(28,'BN','Brunei','Brunéi','Brunéi','Brunei','Asia','Asia','Asia','Asia','+673'),(29,'BO','Bolivia','Bolivia','Bolivia','Bolivia','South america','América del sur','América del sur','South america','+591'),(30,'BQ','Bonaire','Bonaire','Bonaire','Bonaire','South america','América del sur','América del sur','South america','+599'),(31,'BR','Brazil','Brasil','Brasil','Brazil','South america','América del sur','América del sur','South america','+55'),(32,'BS','Bahamas','Bahamas','Bahamas','Bahamas','North america','América del norte','América del norte','North america','+1242'),(33,'BT','Bhutan','Bhután','Bhután','Bhutan','Asia','Asia','Asia','Asia','+975'),(34,'BV','Bouvet Island','Isla Bouvet','Isla Bouvet','Bouvet Island','Antarctica','Antártida','Antártida','Antarctica','+47'),(35,'BW','Botswana','Botsuana','Botsuana','Botswana','Africa','África','África','Africa','+267'),(36,'BY','Belarus','Bielorrusia','Bielorrusia','Belarus','Europe','Europa','Europa','Europe','+375'),(37,'BZ','Belize','Belice','Belice','Belize','North america','América del norte','América del norte','North america','+501'),(38,'CA','Canada','Canadá','Canadá','Canada','North america','América del norte','América del norte','North america','+1'),(39,'CC','Cocos (Keeling) Islands','Islas Cocos (Keeling)','Islas Cocos (Keeling)','Cocos (Keeling) Islands','Asia','Asia','Asia','Asia','+61'),(40,'CD','Congo','Congo','Congo','Congo','Africa','África','África','Africa','+243'),(41,'CF','Central African Republic','República Centroafricana','República Centroafricana','Central African Republic','Africa','África','África','Africa','+236'),(42,'CG','Congo','Congo','Congo','Congo','Africa','África','África','Africa','+242'),(43,'CH','Switzerland','Suiza','Suiza','Switzerland','Europe','Europa','Europa','Europe','+41'),(44,'CI','Ivory Coast','Costa de Marfil','Costa de Marfil','Ivory Coast','Africa','África','África','Africa','+225'),(45,'CK','Cook Islands','Islas Cook','Islas Cook','Cook Islands','Oceania','Oceanía','Oceanía','Oceania','+682'),(46,'CL','Chile','Chile','Chile','Chile','South america','América del sur','América del sur','South america','+56'),(47,'CM','Cameroon','Camerún','Camerún','Cameroon','Africa','África','África','Africa','+237'),(48,'CN','China','China','China','China','Asia','Asia','Asia','Asia','+86'),(49,'CO','Colombia','Colombia','Colombia','Colombia','South america','América del sur','América del sur','South america','+57'),(50,'CR','Costa Rica','Costa Rica','Costa Rica','Costa Rica','North america','América del norte','América del norte','North america','+506'),(51,'CU','Cuba','Cuba','Cuba','Cuba','North america','América del norte','América del norte','North america','+53'),(52,'CV','Cape Verde','Cabo Verde','Cabo Verde','Cape Verde','Africa','África','África','Africa','+238'),(53,'CW','Curaçao','Curaçao','Curaçao','Curaçao','South america','América del sur','América del sur','South america','+599'),(54,'CX','Christmas Island','Isla de Navidad','Isla de Navidad','Christmas Island','Asia','Asia','Asia','Asia','+61'),(55,'CY','Cyprus','Chipre','Chipre','Cyprus','Asia','Asia','Asia','Asia','+357'),(56,'CZ','Czech Republic','República Checa','República Checa','Czech Republic','Europe','Europa','Europa','Europe','+420'),(57,'DE','Germany','Alemania','Alemania','Germany','Europe','Europa','Europa','Europe','+49'),(58,'DJ','Djibouti','Yibuti','Yibuti','Djibouti','Africa','África','África','Africa','+253'),(59,'DK','Denmark','Dinamarca','Dinamarca','Denmark','Europe','Europa','Europa','Europe','+45'),(60,'DM','Dominica','Dominica','Dominica','Dominica','North america','América del norte','América del norte','North america','+1767'),(61,'DO','Dominican Republic','República Dominicana','República Dominicana','Dominican Republic','North america','América del norte','América del norte','North america','+1809'),(64,'DZ','Algeria','Algeria','Algeria','Algeria','Africa','África','África','Africa','+213'),(65,'EC','Ecuador','Ecuador','Ecuador','Ecuador','South america','América del sur','América del sur','South america','+593'),(66,'EE','Estonia','Estonia','Estonia','Estonia','Europe','Europa','Europa','Europe','+372'),(67,'EG','Egypt','Egipto','Egipto','Egypt','Africa','África','África','Africa','+20'),(68,'EH','Western Sahara','Sahara Occidental','Sahara Occidental','Western Sahara','Africa','África','África','Africa','+212'),(69,'ER','Eritrea','Eritrea','Eritrea','Eritrea','Africa','África','África','Africa','+291'),(70,'ES','Spain','España','España','Spain','Europe','Europa','Europa','Europe','+34'),(71,'ET','Ethiopia','Etiopía','Etiopía','Ethiopia','Africa','África','África','Africa','+251'),(72,'FI','Finland','Finlandia','Finlandia','Finland','Europe','Europa','Europa','Europe','+358'),(73,'FJ','Fiji','Fiyi','Fiyi','Fiji','Oceania','Oceanía','Oceanía','Oceania','+679'),(74,'FK','Falkland Islands (Malvinas)','Islas Malvinas','Islas Malvinas','Falkland Islands (Malvinas)','South america','América del sur','América del sur','South america','+500'),(75,'FM','Estados Federados de','Micronesia','Micronesia','Estados Federados de','Oceania','Oceanía','Oceanía','Oceania','+691'),(76,'FO','Faroe Islands','Islas Feroe','Islas Feroe','Faroe Islands','Europe','Europa','Europa','Europe','+298'),(77,'FR','France','Francia','Francia','France','Europe','Europa','Europa','Europe','+33'),(78,'GA','Gabon','Gabón','Gabón','Gabon','Africa','África','África','Africa','+241'),(79,'GB','United Kingdom','Reino Unido','Reino Unido','United Kingdom','Europe','Europa','Europa','Europe','+44'),(80,'GD','Grenada','Granada','Granada','Grenada','North america','América del norte','América del norte','North america','+1473'),(81,'GE','Georgia','Georgia','Georgia','Georgia','Asia','Asia','Asia','Asia','+995'),(82,'GF','French Guiana','Guayana Francesa','Guayana Francesa','French Guiana','South america','América del sur','América del sur','South america','+594'),(83,'GG','Guernsey','Guernsey','Guernsey','Guernsey','Europe','Europa','Europa','Europe','+44'),(84,'GH','Ghana','Ghana','Ghana','Ghana','Africa','África','África','Africa','+233'),(85,'GI','Gibraltar','Gibraltar','Gibraltar','Gibraltar','Europe','Europa','Europa','Europe','+350'),(86,'GL','Greenland','Groenlandia','Groenlandia','Greenland','North america','América del norte','América del norte','North america','+299'),(87,'GM','Gambia','Gambia','Gambia','Gambia','Africa','África','África','Africa','+220'),(88,'GN','Guinea','Guinea','Guinea','Guinea','Africa','África','África','Africa','+224'),(89,'GP','Guadeloupe','Guadalupe','Guadalupe','Guadeloupe','North america','América del norte','América del norte','North america','+590'),(90,'GQ','Equatorial Guinea','Guinea Ecuatorial','Guinea Ecuatorial','Equatorial Guinea','Africa','África','África','Africa','+240'),(91,'GR','Greece','Grecia','Grecia','Greece','Europe','Europa','Europa','Europe','+30'),(92,'GS','South Georgia and the South Sandwich Islands','Islas Georgias del Sur y Sandwich del Sur','Islas Georgias del Sur y Sandwich del Sur','South Georgia and the South Sandwich Islands','Antarctica','Antártida','Antártida','Antarctica','+500'),(93,'GT','Guatemala','Guatemala','Guatemala','Guatemala','North america','América del norte','América del norte','North america','+502'),(94,'GU','Guam','Guam','Guam','Guam','Oceania','Oceanía','Oceanía','Oceania','+1671'),(95,'GW','Guinea-Bissau','Guinea-Bissau','Guinea-Bissau','Guinea-Bissau','Africa','África','África','Africa','+245'),(96,'GY','Guyana','Guyana','Guyana','Guyana','South america','América del sur','América del sur','South america','+592'),(97,'HK','Hong Kong','Hong kong','Hong kong','Hong Kong','Asia','Asia','Asia','Asia','+852'),(98,'HM','Heard Island and McDonald Islands','Islas Heard y McDonald','Islas Heard y McDonald','Heard Island and McDonald Islands','Antarctica','Antártida','Antártida','Antarctica','+672'),(99,'HN','Honduras','Honduras','Honduras','Honduras','North america','América del norte','América del norte','North america','+504'),(100,'HR','Croatia','Croacia','Croacia','Croatia','Europe','Europa','Europa','Europe','+385'),(101,'HT','Haiti','Haití','Haití','Haiti','North america','América del norte','América del norte','North america','+509'),(102,'HU','Hungary','Hungría','Hungría','Hungary','Europe','Europa','Europa','Europe','+36'),(103,'ID','Indonesia','Indonesia','Indonesia','Indonesia','Asia','Asia','Asia','Asia','+62'),(104,'IE','Ireland','Irlanda','Irlanda','Ireland','Europe','Europa','Europa','Europe','+353'),(105,'IL','Israel','Israel','Israel','Israel','Asia','Asia','Asia','Asia','+972'),(106,'IM','Isle of Man','Isla de Man','Isla de Man','Isle of Man','Europe','Europa','Europa','Europe','+44'),(107,'IN','India','India','India','India','Asia','Asia','Asia','Asia','+91'),(108,'IO','British Indian Ocean Territory','Territorio Británico del Océano Índico','Territorio Británico del Océano Índico','British Indian Ocean Territory','Asia','Asia','Asia','Asia','+246'),(109,'IQ','Iraq','Irak','Irak','Iraq','Asia','Asia','Asia','Asia','+964'),(110,'IR','Iran','Irán','Irán','Iran','Asia','Asia','Asia','Asia','+98'),(111,'IS','Iceland','Islandia','Islandia','Iceland','Europe','Europa','Europa','Europe','+354'),(112,'IT','Italy','Italia','Italia','Italy','Europe','Europa','Europa','Europe','+39'),(113,'JE','Jersey','Jersey','Jersey','Jersey','Europe','Europa','Europa','Europe','+44'),(114,'JM','Jamaica','Jamaica','Jamaica','Jamaica','North america','América del norte','América del norte','North america','+1876'),(115,'JO','Jordan','Jordania','Jordania','Jordan','Asia','Asia','Asia','Asia','+962'),(116,'JP','Japan','Japón','Japón','Japan','Asia','Asia','Asia','Asia','+81'),(117,'KE','Kenya','Kenia','Kenia','Kenya','Africa','África','África','Africa','+254'),(118,'KG','Kyrgyzstan','Kirgizstán','Kirgizstán','Kyrgyzstan','Asia','Asia','Asia','Asia','+996'),(119,'KH','Cambodia','Camboya','Camboya','Cambodia','Asia','Asia','Asia','Asia','+855'),(120,'KI','Kiribati','Kiribati','Kiribati','Kiribati','Oceania','Oceanía','Oceanía','Oceania','+686'),(121,'KM','Comoros','Comoras','Comoras','Comoros','Africa','África','África','Africa','+269'),(122,'KN','Saint Kitts and Nevis','San Cristóbal y Nieves','San Cristóbal y Nieves','Saint Kitts and Nevis','North america','América del norte','América del norte','North america','+1869'),(123,'KP','North Korea','Corea del Norte','Corea del Norte','North Korea','Asia','Asia','Asia','Asia','+850'),(124,'KR','South Korea','Corea del Sur','Corea del Sur','South Korea','Asia','Asia','Asia','Asia','+82'),(125,'KW','Kuwait','Kuwait','Kuwait','Kuwait','Asia','Asia','Asia','Asia','+965'),(126,'KY','Cayman Islands','Islas Caimán','Islas Caimán','Cayman Islands','North america','América del norte','América del norte','North america','+1345'),(127,'KZ','Kazakhstan','Kazajistán','Kazajistán','Kazakhstan','Asia','Asia','Asia','Asia','+7'),(128,'LA','Laos','Laos','Laos','Laos','Asia','Asia','Asia','Asia','+856'),(129,'LB','Lebanon','Líbano','Líbano','Lebanon','Asia','Asia','Asia','Asia','+961'),(130,'LC','Saint Lucia','Santa Lucía','Santa Lucía','Saint Lucia','North america','América del norte','América del norte','North america','+1758'),(131,'LI','Liechtenstein','Liechtenstein','Liechtenstein','Liechtenstein','Europe','Europa','Europa','Europe','+423'),(132,'LK','Sri Lanka','Sri lanka','Sri lanka','Sri Lanka','Asia','Asia','Asia','Asia','+94'),(133,'LR','Liberia','Liberia','Liberia','Liberia','Africa','África','África','Africa','+231'),(134,'LS','Lesotho','Lesoto','Lesoto','Lesotho','Africa','África','África','Africa','+266'),(135,'LT','Lithuania','Lituania','Lituania','Lithuania','Europe','Europa','Europa','Europe','+370'),(136,'LU','Luxembourg','Luxemburgo','Luxemburgo','Luxembourg','Europe','Europa','Europa','Europe','+352'),(137,'LV','Latvia','Letonia','Letonia','Latvia','Europe','Europa','Europa','Europe','+371'),(138,'LY','Libya','Libia','Libia','Libya','Africa','África','África','Africa','+218'),(139,'MA','Morocco','Marruecos','Marruecos','Morocco','Africa','África','África','Africa','+212'),(140,'MC','Monaco','Mónaco','Mónaco','Monaco','Europe','Europa','Europa','Europe','+377'),(141,'MD','Moldova','Moldavia','Moldavia','Moldova','Europe','Europa','Europa','Europe','+373'),(142,'ME','Montenegro','Montenegro','Montenegro','Montenegro','Europe','Europa','Europa','Europe','+382'),(143,'MF','Saint Martin (French part)','San Martín (Francia)','San Martín (Francia)','Saint Martin (French part)','North america','América del norte','América del norte','North america','+1599'),(144,'MG','Madagascar','Madagascar','Madagascar','Madagascar','Africa','África','África','Africa','+261'),(145,'MH','Marshall Islands','Islas Marshall','Islas Marshall','Marshall Islands','Oceania','Oceanía','Oceanía','Oceania','+692'),(146,'MK','Macedonia','Macedônia','Macedônia','Macedonia','Europe','Europa','Europa','Europe','+389'),(147,'ML','Mali','Mali','Mali','Mali','Africa','África','África','Africa','+223'),(148,'MM','Myanmar','Birmania','Birmania','Myanmar','Asia','Asia','Asia','Asia','+95'),(149,'MN','Mongolia','Mongolia','Mongolia','Mongolia','Asia','Asia','Asia','Asia','+976'),(150,'MO','Macao','Macao','Macao','Macao','Asia','Asia','Asia','Asia','+853'),(151,'MP','Northern Mariana Islands','Islas Marianas del Norte','Islas Marianas del Norte','Northern Mariana Islands','Oceania','Oceanía','Oceanía','Oceania','+1670'),(152,'MQ','Martinique','Martinica','Martinica','Martinique','North america','América del norte','América del norte','North america','+596'),(153,'MR','Mauritania','Mauritania','Mauritania','Mauritania','Africa','África','África','Africa','+222'),(154,'MS','Montserrat','Montserrat','Montserrat','Montserrat','North america','América del norte','América del norte','North america','+1664'),(155,'MT','Malta','Malta','Malta','Malta','Europe','Europa','Europa','Europe','+356'),(156,'MU','Mauritius','Mauricio','Mauricio','Mauritius','Africa','África','África','Africa','+230'),(157,'MV','Maldives','Islas Maldivas','Islas Maldivas','Maldives','Asia','Asia','Asia','Asia','+960'),(158,'MW','Malawi','Malawi','Malawi','Malawi','Africa','África','África','Africa','+265'),(159,'MX','Mexico','México','México','Mexico','North america','América del norte','América del norte','North america','+52'),(160,'MY','Malaysia','Malasia','Malasia','Malaysia','Asia','Asia','Asia','Asia','+60'),(161,'MZ','Mozambique','Mozambique','Mozambique','Mozambique','Africa','África','África','Africa','+258'),(162,'NA','Namibia','Namibia','Namibia','Namibia','Africa','África','África','Africa','+264'),(163,'NC','New Caledonia','Nueva Caledonia','Nueva Caledonia','New Caledonia','Oceania','Oceanía','Oceanía','Oceania','+687'),(164,'NE','Niger','Niger','Niger','Niger','Africa','África','África','Africa','+227'),(165,'NF','Norfolk Island','Isla Norfolk','Isla Norfolk','Norfolk Island','Oceania','Oceanía','Oceanía','Oceania','+672'),(166,'NG','Nigeria','Nigeria','Nigeria','Nigeria','Africa','África','África','Africa','+234'),(167,'NI','Nicaragua','Nicaragua','Nicaragua','Nicaragua','North america','América del norte','América del norte','North america','+505'),(168,'NL','Netherlands','Países Bajos','Países Bajos','Netherlands','Europe','Europa','Europa','Europe','+31'),(169,'NO','Norway','Noruega','Noruega','Norway','Europe','Europa','Europa','Europe','+47'),(170,'NP','Nepal','Nepal','Nepal','Nepal','Asia','Asia','Asia','Asia','+977'),(171,'NR','Nauru','Nauru','Nauru','Nauru','Oceania','Oceanía','Oceanía','Oceania','+674'),(172,'NU','Niue','Niue','Niue','Niue','Oceania','Oceanía','Oceanía','Oceania','+683'),(173,'NZ','New Zealand','Nueva Zelanda','Nueva Zelanda','New Zealand','Oceania','Oceanía','Oceanía','Oceania','+64'),(174,'OM','Oman','Omán','Omán','Oman','Asia','Asia','Asia','Asia','+968'),(175,'PA','Panama','Panamá','Panamá','Panama','North america','América del norte','América del norte','North america','+507'),(176,'PE','Peru','Perú','Perú','Peru','South america','América del sur','América del sur','South america','+51'),(177,'PF','French Polynesia','Polinesia Francesa','Polinesia Francesa','French Polynesia','Oceania','Oceanía','Oceanía','Oceania','+689'),(178,'PG','Papua New Guinea','Papúa Nueva Guinea','Papúa Nueva Guinea','Papua New Guinea','Oceania','Oceanía','Oceanía','Oceania','+675'),(179,'PH','Philippines','Filipinas','Filipinas','Philippines','Asia','Asia','Asia','Asia','+63'),(180,'PK','Pakistan','Pakistán','Pakistán','Pakistan','Asia','Asia','Asia','Asia','+92'),(181,'PL','Poland','Polonia','Polonia','Poland','Europe','Europa','Europa','Europe','+48'),(182,'PM','Saint Pierre and Miquelon','San Pedro y Miquelón','San Pedro y Miquelón','Saint Pierre and Miquelon','North america','América del norte','América del norte','North america','+508'),(183,'PN','Pitcairn Islands','Islas Pitcairn','Islas Pitcairn','Pitcairn Islands','Oceania','Oceanía','Oceanía','Oceania','+870'),(184,'PR','Puerto Rico','Puerto Rico','Puerto Rico','Puerto Rico','North america','América del norte','América del norte','North america','+1'),(185,'PS','Palestine','Palestina','Palestina','Palestine','Asia','Asia','Asia','Asia','+970'),(186,'PT','Portugal','Portugal','Portugal','Portugal','Europe','Europa','Europa','Europe','+351'),(187,'PW','Palau','Palau','Palau','Palau','Oceania','Oceanía','Oceanía','Oceania','+680'),(188,'PY','Paraguay','Paraguay','Paraguay','Paraguay','South america','América del sur','América del sur','South america','+595'),(189,'QA','Qatar','Qatar','Qatar','Qatar','Asia','Asia','Asia','Asia','+974'),(190,'RE','Réunion','Reunión','Reunión','Réunion','Africa','África','África','Africa','+262'),(191,'RO','Romania','Rumanía','Rumanía','Romania','Europe','Europa','Europa','Europe','+40'),(192,'RS','Serbia','Serbia','Serbia','Serbia','Europe','Europa','Europa','Europe','+381'),(193,'RU','Russia','Rusia','Rusia','Russia','Europe','Europa','Europa','Europe','+7'),(194,'RW','Rwanda','Ruanda','Ruanda','Rwanda','Africa','África','África','Africa','+250'),(195,'SA','Saudi Arabia','Arabia Saudita','Arabia Saudita','Saudi Arabia','Asia','Asia','Asia','Asia','+966'),(196,'SB','Solomon Islands','Islas Salomón','Islas Salomón','Solomon Islands','Oceania','Oceanía','Oceanía','Oceania','+677'),(197,'SC','Seychelles','Seychelles','Seychelles','Seychelles','Africa','África','África','Africa','+248'),(198,'SD','Sudan','Sudán','Sudán','Sudan','Africa','África','África','Africa','+249'),(199,'SE','Sweden','Suecia','Suecia','Sweden','Europe','Europa','Europa','Europe','+46'),(200,'SG','Singapore','Singapur','Singapur','Singapore','Asia','Asia','Asia','Asia','+65'),(201,'SH','Ascensión y Tristán de Acuña','Santa Elena','Santa Elena','Ascensión y Tristán de Acuña','Africa','África','África','Africa','+290'),(202,'SI','Slovenia','Eslovenia','Eslovenia','Slovenia','Europe','Europa','Europa','Europe','+386'),(203,'SJ','Svalbard and Jan Mayen','Svalbard y Jan Mayen','Svalbard y Jan Mayen','Svalbard and Jan Mayen','Europe','Europa','Europa','Europe','+47'),(204,'SK','Slovakia','Eslovaquia','Eslovaquia','Slovakia','Europe','Europa','Europa','Europe','+421'),(205,'SL','Sierra Leone','Sierra Leona','Sierra Leona','Sierra Leone','Africa','África','África','Africa','+232'),(206,'SM','San Marino','San Marino','San Marino','San Marino','Europe','Europa','Europa','Europe','+378'),(207,'SN','Senegal','Senegal','Senegal','Senegal','Africa','África','África','Africa','+221'),(208,'SO','Somalia','Somalia','Somalia','Somalia','Africa','África','África','Africa','+252'),(209,'SR','Suriname','Surinám','Surinám','Suriname','South america','América del sur','América del sur','South america','+597'),(210,'SS','South Sudan','Sudán del Sur','Sudán del Sur','South Sudan','Africa','África','África','Africa','+211'),(211,'ST','Sao Tome and Principe','Santo Tomé y Príncipe','Santo Tomé y Príncipe','Sao Tome and Principe','Africa','África','África','Africa','+239'),(212,'SV','El Salvador','El Salvador','El Salvador','El Salvador','North america','América del norte','América del norte','North america','+503'),(213,'SX','Sint Maarten (Dutch part)','Sint Maarten (parte neerlandesa)','Sint Maarten (parte neerlandesa)','Sint Maarten (Dutch part)','North america','América del norte','América del norte','North america','+1721'),(214,'SY','Syria','Siria','Siria','Syria','Asia','Asia','Asia','Asia','+963'),(215,'SZ','Swaziland','Swazilandia','Swazilandia','Swaziland','Africa','África','África','Africa','+268'),(216,'TC','Turks and Caicos Islands','Islas Turcas y Caicos','Islas Turcas y Caicos','Turks and Caicos Islands','North america','América del norte','América del norte','North america','+1649'),(217,'TD','Chad','Chad','Chad','Chad','Africa','África','África','Africa','+235'),(218,'TF','French Southern Territories','Territorios Australes y Antárticas Franceses','Territorios Australes y Antárticas Franceses','French Southern Territories','Antarctica','Antártida','Antártida','Antarctica','+262'),(219,'TG','Togo','Togo','Togo','Togo','Africa','África','África','Africa','+228'),(220,'TH','Thailand','Tailandia','Tailandia','Thailand','Asia','Asia','Asia','Asia','+66'),(221,'TJ','Tajikistan','Tadjikistán','Tadjikistán','Tajikistan','Asia','Asia','Asia','Asia','+992'),(222,'TK','Tokelau','Tokelau','Tokelau','Tokelau','Oceania','Oceanía','Oceanía','Oceania','+690'),(223,'TL','East Timor','Timor Oriental','Timor Oriental','East Timor','Asia','Asia','Asia','Asia','+670'),(224,'TM','Turkmenistan','Turkmenistán','Turkmenistán','Turkmenistan','Asia','Asia','Asia','Asia','+993'),(225,'TN','Tunisia','Tunez','Tunez','Tunisia','Africa','África','África','Africa','+216'),(226,'TO','Tonga','Tonga','Tonga','Tonga','Oceania','Oceanía','Oceanía','Oceania','+676'),(227,'TR','Turkey','Turquía','Turquía','Turkey','Europe','Europa','Europa','Europe','+90'),(228,'TT','Trinidad and Tobago','Trinidad y Tobago','Trinidad y Tobago','Trinidad and Tobago','North america','América del norte','América del norte','North america','+1868'),(229,'TV','Tuvalu','Tuvalu','Tuvalu','Tuvalu','Oceania','Oceanía','Oceanía','Oceania','+688'),(230,'TW','Taiwan','Taiwán','Taiwán','Taiwan','Asia','Asia','Asia','Asia','+886'),(231,'TZ','Tanzania','Tanzania','Tanzania','Tanzania','Africa','África','África','Africa','+255'),(232,'UA','Ukraine','Ucrania','Ucrania','Ukraine','Europe','Europa','Europa','Europe','+380'),(233,'UG','Uganda','Uganda','Uganda','Uganda','Africa','África','África','Africa','+256'),(234,'UM','United States Minor Outlying Islands','Islas Ultramarinas Menores de Estados Unidos','Islas Ultramarinas Menores de Estados Unidos','United States Minor Outlying Islands','Oceania','Oceanía','Oceanía','Oceania','+1'),(235,'US','United States of America','Estados Unidos de América','Estados Unidos de América','United States of America','North america','América del norte','América del norte','North america','+1'),(236,'UY','Uruguay','Uruguay','Uruguay','Uruguay','South america','América del sur','América del sur','South america','+598'),(237,'UZ','Uzbekistan','Uzbekistán','Uzbekistán','Uzbekistan','Asia','Asia','Asia','Asia','+998'),(238,'VA','Vatican City State','Ciudad del Vaticano','Ciudad del Vaticano','Vatican City State','Europe','Europa','Europa','Europe','+39'),(239,'VC','Saint Vincent and the Grenadines','San Vicente y las Granadinas','San Vicente y las Granadinas','Saint Vincent and the Grenadines','North america','América del norte','América del norte','North america','+1784'),(240,'VE','Venezuela','Venezuela','Venezuela','Venezuela','South america','América del sur','América del sur','South america','+58'),(241,'VG','Virgin Islands','Islas Vírgenes Británicas','Islas Vírgenes Británicas','Virgin Islands','North america','América del norte','América del norte','North america','+1284'),(242,'VI','United States Virgin Islands','Islas Vírgenes de los Estados Unidos','Islas Vírgenes de los Estados Unidos','United States Virgin Islands','North america','América del norte','América del norte','North america','+1340'),(243,'VN','Vietnam','Vietnam','Vietnam','Vietnam','Asia','Asia','Asia','Asia','+84'),(244,'VU','Vanuatu','Vanuatu','Vanuatu','Vanuatu','Oceania','Oceanía','Oceanía','Oceania','+678'),(245,'WF','Wallis and Futuna','Wallis y Futuna','Wallis y Futuna','Wallis and Futuna','Oceania','Oceanía','Oceanía','Oceania','+681'),(246,'WS','Samoa','Samoa','Samoa','Samoa','Oceania','Oceanía','Oceanía','Oceania','+685'),(247,'YE','Yemen','Yemen','Yemen','Yemen','Asia','Asia','Asia','Asia','+967'),(248,'YT','Mayotte','Mayotte','Mayotte','Mayotte','Africa','África','África','Africa','+262'),(249,'ZA','South Africa','Sudáfrica','Sudáfrica','South Africa','Africa','África','África','Africa','+27'),(250,'ZM','Zambia','Zambia','Zambia','Zambia','Africa','África','África','Africa','+260'),(251,'ZW','Zimbabwe','Zimbabue','Zimbabue','Zimbabwe','Africa','África','África','Africa','+263'),(252,'UIFN','Universal International Freephone Number','Números gratuitos universales','Números internacionals gratuïts','Numeri gratuiti internazionali','Universal','Universal','Universal','Universal','+800');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Currencies`
--

DROP TABLE IF EXISTS `Currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `iden` varchar(10) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `name_en` varchar(25) NOT NULL DEFAULT '',
  `name_es` varchar(25) NOT NULL DEFAULT '',
  `name_ca` varchar(25) NOT NULL DEFAULT '',
  `name_it` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencyIden` (`iden`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Currencies`
--

LOCK TABLES `Currencies` WRITE;
/*!40000 ALTER TABLE `Currencies` DISABLE KEYS */;
INSERT INTO `Currencies` VALUES (1,'EUR','€','Euro','Euro','Euro','Euro'),(2,'USD','$','Dollar','Dólar','Dólar','Dollar'),(3,'GBP','£','Pound','Libra','Libra','Pound');
/*!40000 ALTER TABLE `Currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DDIProviderAddresses`
--

DROP TABLE IF EXISTS `DDIProviderAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DDIProviderAddresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ddiProviderId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEDB46FE53615680` (`ddiProviderId`),
  CONSTRAINT `FK_FEDB46FE53615680` FOREIGN KEY (`ddiProviderId`) REFERENCES `DDIProviders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DDIProviderAddresses`
--

LOCK TABLES `DDIProviderAddresses` WRITE;
/*!40000 ALTER TABLE `DDIProviderAddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `DDIProviderAddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DDIProviderRegistrations`
--

DROP TABLE IF EXISTS `DDIProviderRegistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DDIProviderRegistrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `domain` varchar(190) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `realm` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authUsername` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authPassword` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authProxy` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int NOT NULL DEFAULT '0',
  `multiDdi` tinyint unsigned DEFAULT '0',
  `contactUsername` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ddiProviderId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ddiProviderRegistration_username_domain` (`username`,`domain`),
  KEY `IDX_B2E9E33B53615680` (`ddiProviderId`),
  CONSTRAINT `FK_BBD03C6953615680` FOREIGN KEY (`ddiProviderId`) REFERENCES `DDIProviders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DDIProviderRegistrations`
--

LOCK TABLES `DDIProviderRegistrations` WRITE;
/*!40000 ALTER TABLE `DDIProviderRegistrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `DDIProviderRegistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DDIProviders`
--

DROP TABLE IF EXISTS `DDIProviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DDIProviders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `externallyRated` tinyint unsigned DEFAULT '0',
  `brandId` int unsigned NOT NULL,
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  `proxyTrunkId` int unsigned DEFAULT NULL,
  `mediaRelaySetsId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ddiProvider_nameBrand` (`name`,`brandId`),
  KEY `IDX_CA534EFD9CBEC244` (`brandId`),
  KEY `IDX_CA534EFD2FECF701` (`transformationRuleSetId`),
  KEY `IDX_CA534EFD7504E30F` (`proxyTrunkId`),
  KEY `IDX_CA534EFDC8555117` (`mediaRelaySetsId`),
  CONSTRAINT `FK_CA534EFD2FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA534EFD7504E30F` FOREIGN KEY (`proxyTrunkId`) REFERENCES `ProxyTrunks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA534EFD9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CA534EFDC8555117` FOREIGN KEY (`mediaRelaySetsId`) REFERENCES `MediaRelaySets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DDIProviders`
--

LOCK TABLES `DDIProviders` WRITE;
/*!40000 ALTER TABLE `DDIProviders` DISABLE KEYS */;
/*!40000 ALTER TABLE `DDIProviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DDIs`
--

DROP TABLE IF EXISTS `DDIs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DDIs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned NOT NULL,
  `companyId` int unsigned NOT NULL,
  `DDI` varchar(25) NOT NULL,
  `DDIE164` varchar(25) DEFAULT NULL,
  `externalCallFilterId` int unsigned DEFAULT NULL,
  `recordCalls` varchar(25) NOT NULL DEFAULT 'none' COMMENT '[enum:none|all|inbound|outbound]',
  `displayName` varchar(50) DEFAULT NULL,
  `routeType` varchar(25) DEFAULT NULL COMMENT '[enum:user|ivr|huntGroup|fax|conferenceRoom|friend|queue|conditional|residential|retail]',
  `userId` int unsigned DEFAULT NULL,
  `huntGroupId` int unsigned DEFAULT NULL,
  `faxId` int unsigned DEFAULT NULL,
  `conferenceRoomId` int unsigned DEFAULT NULL,
  `residentialDeviceId` int unsigned DEFAULT NULL,
  `ddiProviderId` int unsigned DEFAULT NULL,
  `countryId` int unsigned DEFAULT NULL,
  `billInboundCalls` tinyint unsigned NOT NULL DEFAULT '0',
  `friendValue` varchar(25) DEFAULT NULL,
  `languageId` int unsigned DEFAULT NULL,
  `queueId` int unsigned DEFAULT NULL,
  `conditionalRouteId` int unsigned DEFAULT NULL,
  `ivrId` int unsigned DEFAULT NULL,
  `retailAccountId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DDIcountry` (`DDI`,`countryId`),
  KEY `IDX_AA16E1A02480E723` (`companyId`),
  KEY `IDX_AA16E1A058D52220` (`externalCallFilterId`),
  KEY `IDX_AA16E1A064B64DCC` (`userId`),
  KEY `IDX_AA16E1A0921B2343` (`huntGroupId`),
  KEY `IDX_AA16E1A0624C8D73` (`faxId`),
  KEY `IDX_AA16E1A0FBA2A6B4` (`countryId`),
  KEY `IDX_AA16E1A09CBEC244` (`brandId`),
  KEY `IDX_AA16E1A023E42D0D` (`conferenceRoomId`),
  KEY `IDX_AA16E1A0940D8C7E` (`languageId`),
  KEY `IDX_AA16E1A0A4D768C6` (`queueId`),
  KEY `IDX_AA16E1A09E2CE667` (`conditionalRouteId`),
  KEY `IDX_AA16E1A02045F052` (`ivrId`),
  KEY `IDX_AA16E1A08B329DCD` (`residentialDeviceId`),
  KEY `IDX_AA16E1A053615680` (`ddiProviderId`),
  KEY `IDX_AA16E1A05EA9D64D` (`retailAccountId`),
  KEY `ddi_ddiE164` (`DDIE164`),
  CONSTRAINT `DDIs_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `DDIs_ibfk_10` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `DDIs_ibfk_12` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_13` FOREIGN KEY (`queueId`) REFERENCES `Queues` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_15` FOREIGN KEY (`conditionalRouteId`) REFERENCES `ConditionalRoutes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_2` FOREIGN KEY (`externalCallFilterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_6` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_7` FOREIGN KEY (`faxId`) REFERENCES `Faxes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA16E1A02045F052` FOREIGN KEY (`ivrId`) REFERENCES `IVRs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA16E1A023E42D0D` FOREIGN KEY (`conferenceRoomId`) REFERENCES `ConferenceRooms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA16E1A053615680` FOREIGN KEY (`ddiProviderId`) REFERENCES `DDIProviders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA16E1A05EA9D64D` FOREIGN KEY (`retailAccountId`) REFERENCES `RetailAccounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA16E1A08B329DCD` FOREIGN KEY (`residentialDeviceId`) REFERENCES `ResidentialDevices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA16E1A0FBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DDIs`
--

LOCK TABLES `DDIs` WRITE;
/*!40000 ALTER TABLE `DDIs` DISABLE KEYS */;
/*!40000 ALTER TABLE `DDIs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DestinationRateGroups`
--

DROP TABLE IF EXISTS `DestinationRateGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DestinationRateGroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '[enum:waiting|inProgress|imported|error]',
  `name_en` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_es` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_ca` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_it` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_es` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_ca` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_it` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO]',
  `fileMimeType` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileBaseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileImporterArguments` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `brandId` int unsigned NOT NULL,
  `currencyId` int unsigned DEFAULT NULL,
  `deductibleConnectionFee` tinyint unsigned NOT NULL DEFAULT '0',
  `lastExecutionError` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2930FE169CBEC244` (`brandId`),
  KEY `IDX_2930FE1691000B8A` (`currencyId`),
  CONSTRAINT `FK_2930FE1691000B8A` FOREIGN KEY (`currencyId`) REFERENCES `Currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_2930FE169CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DestinationRateGroups`
--

LOCK TABLES `DestinationRateGroups` WRITE;
/*!40000 ALTER TABLE `DestinationRateGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `DestinationRateGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DestinationRates`
--

DROP TABLE IF EXISTS `DestinationRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DestinationRates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `destinationRateGroupId` int unsigned NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  `connectFee` decimal(10,4) NOT NULL,
  `rateIncrement` varchar(16) NOT NULL,
  `groupIntervalStart` varchar(16) NOT NULL DEFAULT '0s',
  `destinationId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `destinationRate_destination` (`destinationRateGroupId`,`destinationId`),
  KEY `IDX_6CAE066FBF3434FC` (`destinationId`),
  CONSTRAINT `FK_6CAE066FBF3434FC` FOREIGN KEY (`destinationId`) REFERENCES `Destinations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6CAE066FC11683D9` FOREIGN KEY (`destinationRateGroupId`) REFERENCES `DestinationRateGroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DestinationRates`
--

LOCK TABLES `DestinationRates` WRITE;
/*!40000 ALTER TABLE `DestinationRates` DISABLE KEYS */;
/*!40000 ALTER TABLE `DestinationRates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destinations`
--

DROP TABLE IF EXISTS `Destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destinations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(24) NOT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `name_es` varchar(100) DEFAULT NULL,
  `name_ca` varchar(100) DEFAULT NULL,
  `name_it` varchar(100) DEFAULT NULL,
  `brandId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `destination_prefix_brand` (`prefix`,`brandId`),
  KEY `IDX_3502983B9CBEC244` (`brandId`),
  CONSTRAINT `FK_3502983B9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destinations`
--

LOCK TABLES `Destinations` WRITE;
/*!40000 ALTER TABLE `Destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Domains`
--

DROP TABLE IF EXISTS `Domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(190) NOT NULL,
  `pointsTo` enum('proxyusers','proxytrunks') NOT NULL DEFAULT 'proxyusers',
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Domains`
--

LOCK TABLES `Domains` WRITE;
/*!40000 ALTER TABLE `Domains` DISABLE KEYS */;
INSERT INTO `Domains` VALUES (1,'users.ivozprovider.local','proxyusers','Minimal proxyusers global domain'),(2,'trunks.ivozprovider.local','proxytrunks','Minimal proxytrunks global domain'),(3,'127.0.0.1','proxyusers','DemoCompany proxyusers domain'),(4,'brand.domain.invalid','proxyusers','DemoBrand proxyusers domain');
/*!40000 ALTER TABLE `Domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Extensions`
--

DROP TABLE IF EXISTS `Extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Extensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `number` varchar(10) NOT NULL,
  `routeType` varchar(25) DEFAULT NULL COMMENT '[enum:user|number|ivr|huntGroup|conferenceRoom|friend|queue|conditional]',
  `huntGroupId` int unsigned DEFAULT NULL,
  `conferenceRoomId` int unsigned DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `numberCountryId` int unsigned DEFAULT NULL,
  `numberValue` varchar(25) DEFAULT NULL,
  `friendValue` varchar(25) DEFAULT NULL,
  `queueId` int unsigned DEFAULT NULL,
  `conditionalRouteId` int unsigned DEFAULT NULL,
  `ivrId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extension_company_number` (`companyId`,`number`),
  KEY `IDX_9AAD9F79921B2343` (`huntGroupId`),
  KEY `IDX_9AAD9F7923E42D0D` (`conferenceRoomId`),
  KEY `IDX_9AAD9F7964B64DCC` (`userId`),
  KEY `IDX_9AAD9F79A4D768C6` (`queueId`),
  KEY `IDX_9AAD9F799E2CE667` (`conditionalRouteId`),
  KEY `IDX_9AAD9F79D7819488` (`numberCountryId`),
  KEY `IDX_9AAD9F792045F052` (`ivrId`),
  CONSTRAINT `Extensions_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Extensions_ibfk_4` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Extensions_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Extensions_ibfk_7` FOREIGN KEY (`queueId`) REFERENCES `Queues` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Extensions_ibfk_8` FOREIGN KEY (`conditionalRouteId`) REFERENCES `ConditionalRoutes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9AAD9F792045F052` FOREIGN KEY (`ivrId`) REFERENCES `IVRs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9AAD9F7923E42D0D` FOREIGN KEY (`conferenceRoomId`) REFERENCES `ConferenceRooms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9AAD9F79D7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Extensions`
--

LOCK TABLES `Extensions` WRITE;
/*!40000 ALTER TABLE `Extensions` DISABLE KEYS */;
INSERT INTO `Extensions` VALUES (1,1,'101','user',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'102','user',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilterBlackLists`
--

DROP TABLE IF EXISTS `ExternalCallFilterBlackLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExternalCallFilterBlackLists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filterId` int unsigned NOT NULL,
  `matchListId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3088282B2E051C4F` (`filterId`),
  KEY `IDX_3088282B283E7346` (`matchListId`),
  CONSTRAINT `ExternalCallFilterBlackLists_ibfk_1` FOREIGN KEY (`filterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilterBlackLists_ibfk_2` FOREIGN KEY (`matchListId`) REFERENCES `MatchLists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilterBlackLists`
--

LOCK TABLES `ExternalCallFilterBlackLists` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilterBlackLists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilterBlackLists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilterRelCalendars`
--

DROP TABLE IF EXISTS `ExternalCallFilterRelCalendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExternalCallFilterRelCalendars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filterId` int unsigned NOT NULL,
  `calendarId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_283700E12E051C4F` (`filterId`),
  KEY `IDX_283700E12D4F56A6` (`calendarId`),
  CONSTRAINT `ExternalCallFilterRelCalendars_ibfk_1` FOREIGN KEY (`filterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilterRelCalendars_ibfk_2` FOREIGN KEY (`calendarId`) REFERENCES `Calendars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilterRelCalendars`
--

LOCK TABLES `ExternalCallFilterRelCalendars` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilterRelCalendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilterRelCalendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilterRelSchedules`
--

DROP TABLE IF EXISTS `ExternalCallFilterRelSchedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExternalCallFilterRelSchedules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filterId` int unsigned NOT NULL,
  `scheduleId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9DD35E602E051C4F` (`filterId`),
  KEY `IDX_9DD35E60B745014E` (`scheduleId`),
  CONSTRAINT `ExternalCallFilterRelSchedules_ibfk_1` FOREIGN KEY (`filterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilterRelSchedules_ibfk_2` FOREIGN KEY (`scheduleId`) REFERENCES `Schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilterRelSchedules`
--

LOCK TABLES `ExternalCallFilterRelSchedules` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilterRelSchedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilterRelSchedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilterWhiteLists`
--

DROP TABLE IF EXISTS `ExternalCallFilterWhiteLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExternalCallFilterWhiteLists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filterId` int unsigned NOT NULL,
  `matchListId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E775EB0E2E051C4F` (`filterId`),
  KEY `IDX_E775EB0E283E7346` (`matchListId`),
  CONSTRAINT `ExternalCallFilterWhiteLists_ibfk_1` FOREIGN KEY (`filterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilterWhiteLists_ibfk_2` FOREIGN KEY (`matchListId`) REFERENCES `MatchLists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilterWhiteLists`
--

LOCK TABLES `ExternalCallFilterWhiteLists` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilterWhiteLists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilterWhiteLists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilters`
--

DROP TABLE IF EXISTS `ExternalCallFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExternalCallFilters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `welcomeLocutionId` int unsigned DEFAULT NULL,
  `holidayLocutionId` int unsigned DEFAULT NULL,
  `outOfScheduleLocutionId` int unsigned DEFAULT NULL,
  `holidayTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `holidayNumberCountryId` int unsigned DEFAULT NULL,
  `holidayNumberValue` varchar(25) DEFAULT NULL,
  `holidayExtensionId` int unsigned DEFAULT NULL,
  `holidayVoiceMailUserId` int unsigned DEFAULT NULL,
  `outOfScheduleTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `outOfScheduleNumberCountryId` int unsigned DEFAULT NULL,
  `outOfScheduleNumberValue` varchar(25) DEFAULT NULL,
  `outOfScheduleExtensionId` int unsigned DEFAULT NULL,
  `outOfScheduleVoiceMailUserId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `externalCallFilter_name_company` (`name`,`companyId`),
  KEY `IDX_528CEED92480E723` (`companyId`),
  KEY `IDX_528CEED92ECAF600` (`welcomeLocutionId`),
  KEY `IDX_528CEED99FB29831` (`holidayLocutionId`),
  KEY `IDX_528CEED9D4FFE2F7` (`outOfScheduleLocutionId`),
  KEY `IDX_528CEED9888E38DB` (`holidayExtensionId`),
  KEY `IDX_528CEED9FAC21224` (`outOfScheduleExtensionId`),
  KEY `IDX_528CEED9DF7207AC` (`holidayVoiceMailUserId`),
  KEY `IDX_528CEED9D66AD272` (`outOfScheduleVoiceMailUserId`),
  KEY `IDX_528CEED9A7D09CD9` (`holidayNumberCountryId`),
  KEY `IDX_528CEED9AEC84907` (`outOfScheduleNumberCountryId`),
  CONSTRAINT `ExternalCallFilters_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilters_ibfk_2` FOREIGN KEY (`welcomeLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_4` FOREIGN KEY (`outOfScheduleLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_5` FOREIGN KEY (`holidayExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_6` FOREIGN KEY (`outOfScheduleExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_7` FOREIGN KEY (`holidayVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_8` FOREIGN KEY (`outOfScheduleVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_528CEED99FB29831` FOREIGN KEY (`holidayLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_528CEED9A7D09CD9` FOREIGN KEY (`holidayNumberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_528CEED9AEC84907` FOREIGN KEY (`outOfScheduleNumberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilters`
--

LOCK TABLES `ExternalCallFilters` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilters` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faxes`
--

DROP TABLE IF EXISTS `Faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sendByEmail` tinyint unsigned NOT NULL DEFAULT '1',
  `outgoingDDIId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Fax_companyId_name` (`companyId`,`name`),
  KEY `IDX_196F4C1E508D43B5` (`outgoingDDIId`),
  CONSTRAINT `Faxes_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Faxes_ibfk_2` FOREIGN KEY (`outgoingDDIId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faxes`
--

LOCK TABLES `Faxes` WRITE;
/*!40000 ALTER TABLE `Faxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FaxesInOut`
--

DROP TABLE IF EXISTS `FaxesInOut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FaxesInOut` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `calldate` datetime NOT NULL,
  `faxId` int unsigned NOT NULL,
  `src` varchar(128) DEFAULT NULL,
  `dstCountryId` int unsigned DEFAULT NULL,
  `dst` varchar(128) DEFAULT NULL,
  `type` varchar(20) DEFAULT 'Out' COMMENT '[enum:In|Out]',
  `pages` varchar(64) DEFAULT NULL,
  `status` enum('error','pending','inprogress','completed') DEFAULT NULL,
  `fileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO]',
  `fileMimeType` varchar(80) DEFAULT NULL,
  `fileBaseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E047541D624C8D73` (`faxId`),
  KEY `IDX_E047541D57B9B0B1` (`dstCountryId`),
  CONSTRAINT `FaxesInOut_ibfk_2` FOREIGN KEY (`faxId`) REFERENCES `Faxes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E047541D57B9B0B1` FOREIGN KEY (`dstCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FaxesInOut`
--

LOCK TABLES `FaxesInOut` WRITE;
/*!40000 ALTER TABLE `FaxesInOut` DISABLE KEYS */;
/*!40000 ALTER TABLE `FaxesInOut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Features`
--

DROP TABLE IF EXISTS `Features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Features` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `iden` varchar(100) NOT NULL,
  `name_en` varchar(50) NOT NULL DEFAULT '',
  `name_es` varchar(50) NOT NULL DEFAULT '',
  `name_ca` varchar(50) NOT NULL DEFAULT '',
  `name_it` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `featureIden` (`iden`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Features`
--

LOCK TABLES `Features` WRITE;
/*!40000 ALTER TABLE `Features` DISABLE KEYS */;
INSERT INTO `Features` VALUES (1,'queues','Queues','Colas','Colas','Queues'),(2,'recordings','Recordings','Grabaciones','Grabaciones','Recordings'),(3,'faxes','Faxes','Fax Virtual','Fax Virtual','Faxes'),(4,'friends','Friends','Friends','Friends','Friends'),(5,'conferences','Conferences','Conferencias','Conferencias','Conferences'),(6,'billing','Billing','Tarificador','Tarificador','Billing'),(7,'invoices','Invoices','Facturador','Facturador','Invoices'),(8,'progress','Voice Notifications','Notificaciones de voz','Notificaciones de voz','Voice Notifications'),(9,'residential','Residential Clients','Clientes Residencial','Clientes Residencial','Residential Clients'),(10,'wholesale','Wholesale Clients','Clientes Wholesale','Clientes Wholesale','Wholesale Clients'),(11,'retail','Retail Clients','Clientes Retail','Clientes Retail','Retail Clients'),(12,'vpbx','vPBX Clients','Clientes vPBX','Clientes vPBX','vPBX Clients');
/*!40000 ALTER TABLE `Features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeaturesRelBrands`
--

DROP TABLE IF EXISTS `FeaturesRelBrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FeaturesRelBrands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned NOT NULL,
  `featureId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `featureRelBrand_feature_brand` (`featureId`,`brandId`),
  KEY `IDX_6BA104879CBEC244` (`brandId`),
  CONSTRAINT `FeaturesRelBrands_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FeaturesRelBrands_ibfk_2` FOREIGN KEY (`featureId`) REFERENCES `Features` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeaturesRelBrands`
--

LOCK TABLES `FeaturesRelBrands` WRITE;
/*!40000 ALTER TABLE `FeaturesRelBrands` DISABLE KEYS */;
INSERT INTO `FeaturesRelBrands` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(9,1,8),(10,1,9),(12,1,10),(11,1,11),(8,1,12);
/*!40000 ALTER TABLE `FeaturesRelBrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeaturesRelCompanies`
--

DROP TABLE IF EXISTS `FeaturesRelCompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FeaturesRelCompanies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `featureId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `featureRelCompany_feature_brand` (`featureId`,`companyId`),
  KEY `IDX_2C2CF4D92480E723` (`companyId`),
  CONSTRAINT `FeaturesRelCompanies_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FeaturesRelCompanies_ibfk_2` FOREIGN KEY (`featureId`) REFERENCES `Features` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeaturesRelCompanies`
--

LOCK TABLES `FeaturesRelCompanies` WRITE;
/*!40000 ALTER TABLE `FeaturesRelCompanies` DISABLE KEYS */;
INSERT INTO `FeaturesRelCompanies` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5);
/*!40000 ALTER TABLE `FeaturesRelCompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FixedCosts`
--

DROP TABLE IF EXISTS `FixedCosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FixedCosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `cost` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descBrand` (`brandId`,`name`),
  CONSTRAINT `FixedCosts_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FixedCosts`
--

LOCK TABLES `FixedCosts` WRITE;
/*!40000 ALTER TABLE `FixedCosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `FixedCosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FixedCostsRelInvoiceSchedulers`
--

DROP TABLE IF EXISTS `FixedCostsRelInvoiceSchedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FixedCostsRelInvoiceSchedulers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned DEFAULT NULL,
  `fixedCostId` int unsigned NOT NULL,
  `invoiceSchedulerId` int unsigned NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static' COMMENT '[enum:static|maxcalls|ddis]',
  `ddisCountryMatch` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'all' COMMENT '[enum:all|national|international|specific]',
  `ddisCountryId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FixedCostsRelInvoiceScheduler_invoiceScheduler_fixedCost` (`invoiceSchedulerId`,`fixedCostId`),
  KEY `IDX_D9D0952B81256364` (`fixedCostId`),
  KEY `IDX_D9D0952B43D707A2` (`ddisCountryId`),
  CONSTRAINT `FK_D9D0952B1D113CF5` FOREIGN KEY (`invoiceSchedulerId`) REFERENCES `InvoiceSchedulers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D9D0952B43D707A2` FOREIGN KEY (`ddisCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D9D0952B81256364` FOREIGN KEY (`fixedCostId`) REFERENCES `FixedCosts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FixedCostsRelInvoiceSchedulers`
--

LOCK TABLES `FixedCostsRelInvoiceSchedulers` WRITE;
/*!40000 ALTER TABLE `FixedCostsRelInvoiceSchedulers` DISABLE KEYS */;
/*!40000 ALTER TABLE `FixedCostsRelInvoiceSchedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FixedCostsRelInvoices`
--

DROP TABLE IF EXISTS `FixedCostsRelInvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FixedCostsRelInvoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fixedCostId` int unsigned NOT NULL,
  `invoiceId` int unsigned NOT NULL,
  `quantity` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1374A9A581256364` (`fixedCostId`),
  KEY `IDX_1374A9A53D7BDC51` (`invoiceId`),
  CONSTRAINT `FixedCostsRelInvoices_ibfk_2` FOREIGN KEY (`fixedCostId`) REFERENCES `FixedCosts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FixedCostsRelInvoices_ibfk_3` FOREIGN KEY (`invoiceId`) REFERENCES `Invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FixedCostsRelInvoices`
--

LOCK TABLES `FixedCostsRelInvoices` WRITE;
/*!40000 ALTER TABLE `FixedCostsRelInvoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `FixedCostsRelInvoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friends`
--

DROP TABLE IF EXISTS `Friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Friends` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(65) NOT NULL,
  `domainId` int unsigned DEFAULT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `transport` varchar(25) DEFAULT NULL COMMENT '[enum:udp|tcp|tls]',
  `ip` varchar(50) DEFAULT NULL,
  `port` smallint unsigned DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `callACLId` int unsigned DEFAULT NULL,
  `outgoingDDIId` int unsigned DEFAULT NULL,
  `priority` smallint NOT NULL DEFAULT '1',
  `disallow` varchar(200) NOT NULL DEFAULT 'all',
  `allow` varchar(200) NOT NULL DEFAULT 'alaw',
  `direct_media_method` enum('invite','update') NOT NULL DEFAULT 'update' COMMENT '[enum:invite|update]',
  `callerid_update_header` enum('pai','rpid') NOT NULL DEFAULT 'pai' COMMENT '[enum:pai|rpid]',
  `update_callerid` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no]',
  `from_domain` varchar(190) DEFAULT NULL,
  `directConnectivity` varchar(20) NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no|intervpbx]',
  `languageId` int unsigned DEFAULT NULL,
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  `ddiIn` varchar(255) NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no]',
  `interCompanyId` int unsigned DEFAULT NULL,
  `t38Passthrough` varchar(255) NOT NULL DEFAULT 'no' COMMENT '[enum:yes|no]',
  `alwaysApplyTransformations` tinyint(1) NOT NULL DEFAULT '0',
  `rtpEncryption` tinyint(1) NOT NULL DEFAULT '0',
  `from_user` varchar(190) DEFAULT NULL,
  `multiContact` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyPrio` (`companyId`,`priority`),
  UNIQUE KEY `name_domain` (`name`,`domainId`),
  KEY `IDX_EE5349F5CA2FAA07` (`callACLId`),
  KEY `IDX_EE5349F5508D43B5` (`outgoingDDIId`),
  KEY `IDX_EE5349F5940D8C7E` (`languageId`),
  KEY `IDX_EE5349F52FECF701` (`transformationRuleSetId`),
  KEY `IDX_EE5349F5334600F3` (`domainId`),
  KEY `IDX_EE5349F5B32E7B3A` (`interCompanyId`),
  CONSTRAINT `FK_EE5349F52FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EE5349F5334600F3` FOREIGN KEY (`domainId`) REFERENCES `Domains` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EE5349F5B32E7B3A` FOREIGN KEY (`interCompanyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Friends_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Friends_ibfk_3` FOREIGN KEY (`callACLId`) REFERENCES `CallACL` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Friends_ibfk_4` FOREIGN KEY (`outgoingDDIId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Friends_ibfk_5` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friends`
--

LOCK TABLES `Friends` WRITE;
/*!40000 ALTER TABLE `Friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `Friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FriendsPatterns`
--

DROP TABLE IF EXISTS `FriendsPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FriendsPatterns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `friendId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `regExp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_933D96E5893BA339` (`friendId`),
  CONSTRAINT `FriendsPatterns_ibfk_1` FOREIGN KEY (`friendId`) REFERENCES `Friends` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FriendsPatterns`
--

LOCK TABLES `FriendsPatterns` WRITE;
/*!40000 ALTER TABLE `FriendsPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `FriendsPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HolidayDates`
--

DROP TABLE IF EXISTS `HolidayDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HolidayDates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `calendarId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `eventDate` date NOT NULL,
  `locutionId` int unsigned DEFAULT NULL,
  `wholeDayEvent` tinyint(1) NOT NULL DEFAULT '1',
  `timeIn` time DEFAULT NULL,
  `timeOut` time DEFAULT NULL,
  `routeType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `numberValue` varchar(25) DEFAULT NULL,
  `extensionId` int unsigned DEFAULT NULL,
  `voiceMailUserId` int unsigned DEFAULT NULL,
  `numberCountryId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C5712802D4F56A6` (`calendarId`),
  KEY `IDX_4C57128054690B0` (`locutionId`),
  KEY `IDX_4C57128012AB7F65` (`extensionId`),
  KEY `IDX_4C571280AF230FFD` (`voiceMailUserId`),
  KEY `IDX_4C571280D7819488` (`numberCountryId`),
  CONSTRAINT `FK_4C57128012AB7F65` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C571280AF230FFD` FOREIGN KEY (`voiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C571280D7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `HolidayDates_ibfk_1` FOREIGN KEY (`calendarId`) REFERENCES `Calendars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HolidayDates_ibfk_2` FOREIGN KEY (`locutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HolidayDates`
--

LOCK TABLES `HolidayDates` WRITE;
/*!40000 ALTER TABLE `HolidayDates` DISABLE KEYS */;
/*!40000 ALTER TABLE `HolidayDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HuntGroups`
--

DROP TABLE IF EXISTS `HuntGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HuntGroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `companyId` int unsigned NOT NULL,
  `strategy` varchar(25) NOT NULL COMMENT '[enum:ringAll|linear|roundRobin|random]',
  `ringAllTimeout` smallint DEFAULT NULL,
  `noAnswerLocutionId` int unsigned DEFAULT NULL,
  `noAnswerTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `noAnswerNumberCountryId` int unsigned DEFAULT NULL,
  `noAnswerNumberValue` varchar(25) DEFAULT NULL,
  `noAnswerExtensionId` int unsigned DEFAULT NULL,
  `noAnswerVoiceMailUserId` int unsigned DEFAULT NULL,
  `preventMissedCalls` int unsigned NOT NULL DEFAULT '1',
  `allowCallForwards` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `huntGroup_name_company` (`name`,`companyId`),
  KEY `IDX_4F9672EC2480E723` (`companyId`),
  KEY `IDX_4F9672ECED66ACCC` (`noAnswerLocutionId`),
  KEY `IDX_4F9672EC4BF0624E` (`noAnswerExtensionId`),
  KEY `IDX_4F9672EC87167A2E` (`noAnswerVoiceMailUserId`),
  KEY `IDX_4F9672ECFFB4E15B` (`noAnswerNumberCountryId`),
  CONSTRAINT `FK_4F9672ECD7819488` FOREIGN KEY (`noAnswerNumberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `HuntGroups_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HuntGroups_ibfk_2` FOREIGN KEY (`noAnswerLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `HuntGroups_ibfk_3` FOREIGN KEY (`noAnswerExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `HuntGroups_ibfk_4` FOREIGN KEY (`noAnswerVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HuntGroups`
--

LOCK TABLES `HuntGroups` WRITE;
/*!40000 ALTER TABLE `HuntGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `HuntGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HuntGroupsRelUsers`
--

DROP TABLE IF EXISTS `HuntGroupsRelUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HuntGroupsRelUsers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `huntGroupId` int unsigned NOT NULL,
  `userId` int unsigned DEFAULT NULL,
  `timeoutTime` smallint DEFAULT NULL,
  `priority` smallint DEFAULT NULL,
  `routeType` varchar(25) NOT NULL COMMENT '[enum:number|user]',
  `numberValue` varchar(25) DEFAULT NULL,
  `numberCountryId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userHuntgroup` (`userId`,`huntGroupId`),
  UNIQUE KEY `prioHuntgroup` (`priority`,`huntGroupId`),
  KEY `IDX_79ED31AB921B2343` (`huntGroupId`),
  KEY `IDX_79ED31ABD7819488` (`numberCountryId`),
  CONSTRAINT `FK_79ED31ABD7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `HuntGroupsRelUsers_ibfk_1` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HuntGroupsRelUsers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HuntGroupsRelUsers`
--

LOCK TABLES `HuntGroupsRelUsers` WRITE;
/*!40000 ALTER TABLE `HuntGroupsRelUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `HuntGroupsRelUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IVREntries`
--

DROP TABLE IF EXISTS `IVREntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IVREntries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ivrId` int unsigned NOT NULL,
  `entry` varchar(40) NOT NULL,
  `welcomeLocutionId` int unsigned DEFAULT NULL,
  `routeType` varchar(25) NOT NULL COMMENT '[enum:number|extension|voicemail|conditional]',
  `numberCountryId` int unsigned DEFAULT NULL,
  `numberValue` varchar(25) DEFAULT NULL,
  `extensionId` int unsigned DEFAULT NULL,
  `voiceMailUserId` int unsigned DEFAULT NULL,
  `conditionalRouteId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIVRCutomIdAndEntry` (`ivrId`,`entry`),
  KEY `IDX_E847DD7C2ECAF600` (`welcomeLocutionId`),
  KEY `IDX_E847DD7C12AB7F65` (`extensionId`),
  KEY `IDX_E847DD7CAF230FFD` (`voiceMailUserId`),
  KEY `IDX_E847DD7C9E2CE667` (`conditionalRouteId`),
  KEY `IDX_E847DD7CD7819488` (`numberCountryId`),
  CONSTRAINT `FK_E847DD7C12AB7F65` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E847DD7C2045F052` FOREIGN KEY (`ivrId`) REFERENCES `IVRs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E847DD7C2ECAF600` FOREIGN KEY (`welcomeLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E847DD7C9E2CE667` FOREIGN KEY (`conditionalRouteId`) REFERENCES `ConditionalRoutes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E847DD7CAF230FFD` FOREIGN KEY (`voiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E847DD7CD7819488` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IVREntries`
--

LOCK TABLES `IVREntries` WRITE;
/*!40000 ALTER TABLE `IVREntries` DISABLE KEYS */;
/*!40000 ALTER TABLE `IVREntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IVRExcludedExtensions`
--

DROP TABLE IF EXISTS `IVRExcludedExtensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IVRExcludedExtensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ivrId` int unsigned NOT NULL,
  `extensionId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueExtension` (`ivrId`,`extensionId`),
  KEY `IDX_36E264F212AB7F65` (`extensionId`),
  CONSTRAINT `FK_36E264F212AB7F65` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_36E264F22045F052` FOREIGN KEY (`ivrId`) REFERENCES `IVRs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IVRExcludedExtensions`
--

LOCK TABLES `IVRExcludedExtensions` WRITE;
/*!40000 ALTER TABLE `IVRExcludedExtensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `IVRExcludedExtensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IVRs`
--

DROP TABLE IF EXISTS `IVRs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IVRs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `timeout` smallint unsigned NOT NULL,
  `maxDigits` smallint unsigned NOT NULL,
  `welcomeLocutionId` int unsigned DEFAULT NULL,
  `successLocutionId` int unsigned DEFAULT NULL,
  `allowExtensions` tinyint unsigned NOT NULL DEFAULT '0',
  `noInputLocutionId` int unsigned DEFAULT NULL,
  `noInputRouteType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `noInputNumberCountryId` int unsigned DEFAULT NULL,
  `noInputNumberValue` varchar(25) DEFAULT NULL,
  `noInputExtensionId` int unsigned DEFAULT NULL,
  `noInputVoiceMailUserId` int unsigned DEFAULT NULL,
  `errorLocutionId` int unsigned DEFAULT NULL,
  `errorRouteType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `errorNumberCountryId` int unsigned DEFAULT NULL,
  `errorNumberValue` varchar(25) DEFAULT NULL,
  `errorExtensionId` int unsigned DEFAULT NULL,
  `errorVoiceMailUserId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ivr_name_company` (`name`,`companyId`),
  KEY `IDX_EEE885F92ECAF600` (`welcomeLocutionId`),
  KEY `IDX_EEE885F976587A80` (`successLocutionId`),
  KEY `IDX_EEE885F9563D5224` (`noInputLocutionId`),
  KEY `IDX_EEE885F9E59A53FA` (`noInputExtensionId`),
  KEY `IDX_EEE885F99ED32186` (`noInputVoiceMailUserId`),
  KEY `IDX_EEE885F9E671BAF3` (`noInputNumberCountryId`),
  KEY `IDX_EEE885F922DAA5F5` (`errorLocutionId`),
  KEY `IDX_EEE885F9143A564F` (`errorExtensionId`),
  KEY `IDX_EEE885F9D60923A6` (`errorVoiceMailUserId`),
  KEY `IDX_EEE885F9AEABB8D3` (`errorNumberCountryId`),
  KEY `IDX_EEE885F92480E723` (`companyId`),
  CONSTRAINT `FK_EEE885F9143A564F` FOREIGN KEY (`errorExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F922DAA5F5` FOREIGN KEY (`errorLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F92480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EEE885F92ECAF600` FOREIGN KEY (`welcomeLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F9563D5224` FOREIGN KEY (`noInputLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F976587A80` FOREIGN KEY (`successLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F99ED32186` FOREIGN KEY (`noInputVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F9AEABB8D3` FOREIGN KEY (`errorNumberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F9D60923A6` FOREIGN KEY (`errorVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F9E59A53FA` FOREIGN KEY (`noInputExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EEE885F9E671BAF3` FOREIGN KEY (`noInputNumberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IVRs`
--

LOCK TABLES `IVRs` WRITE;
/*!40000 ALTER TABLE `IVRs` DISABLE KEYS */;
/*!40000 ALTER TABLE `IVRs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceNumberSequences`
--

DROP TABLE IF EXISTS `InvoiceNumberSequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvoiceNumberSequences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequenceLength` smallint unsigned NOT NULL,
  `increment` smallint unsigned NOT NULL,
  `latestValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `iteration` smallint unsigned NOT NULL DEFAULT '0',
  `version` int NOT NULL DEFAULT '1',
  `brandId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoiceNumberSequence_name_brand` (`name`,`brandId`),
  KEY `IDX_A7624D1E9CBEC244` (`brandId`),
  CONSTRAINT `FK_A7624D1E9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceNumberSequences`
--

LOCK TABLES `InvoiceNumberSequences` WRITE;
/*!40000 ALTER TABLE `InvoiceNumberSequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceNumberSequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceSchedulers`
--

DROP TABLE IF EXISTS `InvoiceSchedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvoiceSchedulers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month' COMMENT '[enum:week|month|year]',
  `frequency` smallint unsigned NOT NULL,
  `email` varchar(140) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastExecution` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `brandId` int unsigned NOT NULL,
  `invoiceNumberSequenceId` int unsigned DEFAULT NULL,
  `nextExecution` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `taxRate` decimal(10,3) DEFAULT NULL,
  `invoiceTemplateId` int unsigned DEFAULT NULL,
  `companyId` int unsigned NOT NULL,
  `lastExecutionError` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoiceScheduler_name_brand` (`name`,`brandId`),
  UNIQUE KEY `invoiceScheduler_company` (`companyId`),
  KEY `IDX_41E90A1A9CBEC244` (`brandId`),
  KEY `IDX_41E90A1A4539C703` (`invoiceNumberSequenceId`),
  KEY `IDX_41E90A1AD07541BE` (`invoiceTemplateId`),
  CONSTRAINT `FK_41E90A1A2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_41E90A1A4539C703` FOREIGN KEY (`invoiceNumberSequenceId`) REFERENCES `InvoiceNumberSequences` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_41E90A1A9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_41E90A1AD07541BE` FOREIGN KEY (`invoiceTemplateId`) REFERENCES `InvoiceTemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceSchedulers`
--

LOCK TABLES `InvoiceSchedulers` WRITE;
/*!40000 ALTER TABLE `InvoiceSchedulers` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceSchedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceTemplates`
--

DROP TABLE IF EXISTS `InvoiceTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvoiceTemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `template` text NOT NULL,
  `templateHeader` text,
  `templateFooter` text,
  `brandId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoiceTemplate_name_brand` (`name`,`brandId`),
  KEY `IDX_CB0E9B689CBEC244` (`brandId`),
  CONSTRAINT `InvoiceTemplates_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceTemplates`
--

LOCK TABLES `InvoiceTemplates` WRITE;
/*!40000 ALTER TABLE `InvoiceTemplates` DISABLE KEYS */;
INSERT INTO `InvoiceTemplates` VALUES (1,'Basic','Basic invoice template','<!DOCTYPE HTML>\n<html>\n<head>\n    <style>\n        body {\n            font-size: 14px;\n            font-family: \'DejaVu Sans\',Helvetica,Arial,sans-serif;\n        }\n        h2 {\n            font-size: 18px;\n        }\n        div{\n            page-break-inside: avoid;\n        }\n        div.theader {\n            width: 100%;\n            text-align: center;\n            margin: 25px 0 0;\n            font-weight: bold;\n            font-size: 23px;\n            border: none;\n            padding-bottom: 5px;\n            border-bottom: 1px solid black;\n        }\n        div.table {\n            display: table;\n            margin-bottom: 5px;\n            text-align: center;\n            border: none;\n            border-collapse: collapse;\n            width: 100%;\n            table-layout: fixed;\n        }\n        div.tbody {\n            display: table-row-group;\n        }\n        div.table div.tr {\n            display: table-row;\n            border: 1px solid black;\n            page-break-inside: avoid;\n        }\n        div.table div.th {\n            display: table-cell;\n            border-right: 1px solid black;\n            background-color: black;\n            border-bottom: 1px solid black;\n            color: white;\n            font-weight: bold;\n            padding: 5px 0 2px;\n        }\n        div.table div.tr:not(:last-child) div.th {\n            border-bottom: 1px solid white;\n        }\n        div.table div.tr div.th:not(:last-child) {\n            border-right: 1px solid white;\n        }\n        div.table div.td {\n            display: table-cell;\n            width: 50%;\n            padding: 5px 0 5px;\n            font-weight: normal;\n            background-color: white;\n            border: 1px solid black;\n            color: black;\n        }\n        .bold {\n            font-weight: bold!important;\n        }\n        .center {\n            text-align: center!important;\n        }\n        .left {\n            float: left!important;\n        }\n        .noBorder {\n            border: none!important;\n        }\n        .clearFloats {\n            clear:both;\n        }\n        .multiline {\n            white-space: pre-wrap;\n        }\n        .clientData {\n            width: 60%;\n            float: left;\n        }\n        .clientData h2 {\n            margin: 0;\n        }\n        .clientData p {\n            margin: 0px 0px 0px 20px;\n            padding: 0;\n        }\n        .invoiceData {\n            width: 30%;\n            float: right;\n            text-align: right;\n        }\n        .invoiceData p {\n            margin: 0;\n            padding: 0;\n        }\n        #content {\n            margin: 10px 0;\n        }\n        #subheader .left {\n            width: 60%;\n            font-weight: bold;\n        }\n        #subheader .left p {\n            font-size: 35px;\n            margin-top: 0;\n        }\n        #subheader .right {\n            width: 35%;\n            text-align: right;\n            float: right;\n        }\n        #subheader .right p.title {\n            margin: 0px;\n            padding: 0;\n            font-weight: bold;\n            font-size: 20px;\n        }\n        #subheader .right p.date {\n            margin: 0;\n            padding: 0;\n            font-size: 16px;\n        }\n        #content > div.table {\n            text-align: center;\n            width: 50%;\n            float: right;\n            border: none;\n            border-collapse: collapse;\n        }\n        #callsPerTypeSummary > div.table {\n            text-align: center;\n            width: 100%;\n        }\n        #content {\n            width: 100%;\n        }\n        #fixedCosts > div.table {\n            clear: both;\n        }\n        #fixedCosts div.table div.td {\n            width: 25%;\n        }\n        #summary {\n            width: 50%;\n            float: right;\n        }\n        #callsPerTypeSummary div.td {\n            width: 25%;\n        }\n        #callsPerType div.td {\n            width: 20%;\n        }\n    </style>\n    <meta charset=\"UTF-8\">\n</head>\n<body>\n<div id=\"content\">\n    <div id=\"subheader\">\n        <div class=\"left\">\n            <p class=\"left\">Factura</p>\n        </div>\n        <div class=\"right\">\n            <p class=\"title\">Fecha</p>\n            <p class=\"date\">{{invoice.invoiceDate}}</p>\n        </div>\n    </div>\n    <div>\n        <div class=\"clientData\">\n            <h2>Cliente</h2>\n            <p>{{company.name}}</p>\n            <p>{{company.postalAddress}}</p>\n            <p>{{company.postalCode}} {{company.town}}, {{company.province}} </p>\n            <p>NIF / CIF: {{company.nif}}</p>\n        </div>\n        <div class=\"invoiceData\">\n            <p class=\"bold\">Nº de factura</p>\n            <p>{{invoice.number}}</p>\n            <p class=\"bold\">Periodo de facturación</p>\n            <p>{{invoice.inDate}} - {{invoice.outDate}}</p>\n        </div>\n    </div>\n    <br class=\"clearFloats\" />\n    <div id=\"summary\">\n        <div class=\"theader center\">Resumen</div>\n        <div class=\"table\">\n            <div class=\"tbody\">\n                {{#if fixedCostsTotals}}\n                <div class=\"tr bold center\">\n                    <div class=\"th\">Costes fijos</div>\n                    <div class=\"td bold\">\n                        {{fixedCostsTotals}} {{invoice.currency}}\n                    </div>\n                </div>\n                {{/if}}\n                <div class=\"tr bold\">\n                    <div class=\"th\">Total:</div>\n                    <div class=\"td bold\">{{totals.totalPrice}} {{invoice.currency}}</div>\n                </div>\n                <div class=\"tr bold\">\n                    <div class=\"th\">IVA aplicable</div>\n                    <div class=\"td bold\">{{invoice.taxRate}} %</div>\n                </div>\n                <div class=\"tr bold\">\n                    <div class=\"th\">IVA</div>\n                    <div class=\"td bold\">{{totals.totalTaxes}} {{invoice.currency}}</div>\n                </div>\n                <div class=\"tr bold\">\n                    <div class=\"th\">Total con IVA</div>\n                    <div class=\"td bold\">{{totals.totalWithTaxes}} {{invoice.currency}}</div>\n                </div>\n            </div>\n        </div>\n    </div>\n    <br class=\"clearFloats\" />\n\n    {{#if fixedCosts.length}}\n        <div id=\"fixedCosts\">\n            <div class=\"theader\">Costes fijos</div>\n            <div class=\"table\">\n                <div class=\"tbody\">\n                    <div class=\"tr\">\n                        <div class=\"th\">Concepto</div>\n                        <div class=\"th\">Precio</div>\n                        <div class=\"th\">Cantidad</div>\n                        <div class=\"th\">Subtotal</div>\n                    </div>\n                    {{#each fixedCosts}}\n                        <div class=\"tr\">\n                            <div class=\"td\">\n                                {{name}}\n                                {{#if description}}\n                                    <br />\n                                    <div class=\"multiline\">{{description}}</div>\n                                {{/if}}\n                            </div>\n                            <div class=\"td\">{{cost}} {{currency}}</div>\n                            <div class=\"td\">{{quantity}}</div>\n                            <div class=\"td\">{{subTotal}} {{currency}}</div>\n                        </div>\n                    {{/each}}\n                    <div class=\"tr noBorder\">\n                        <div class=\"td noBorder\"></div>\n                        <div class=\"td noBorder\"></div>\n                        <div class=\"th\" style=\"border-right: 1px solid black;\">Total:</div>\n                        <div class=\"td bold\">{{fixedCostsTotals}} {{invoice.currency}}</div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    {{/if}}\n\n    <div id=\"callsPerTypeSummary\">\n        <div class=\"theader\">Resumen de llamadas por tipo</div>\n        <div class=\"table\">\n            <div class=\"tbody\">\n                <div class=\"tr\">\n                    <div class=\"th\">Tipo</div>\n                    <div class=\"th\">Nº llamadas</div>\n                    <div class=\"th\">Duración total</div>\n                    <div class=\"th\">Precio total</div>\n                </div>\n                {{#each callData.callSumary}}\n                <div class=\"tr\">\n                    <div class=\"td white\">{{type}}</div>\n                    <div class=\"td white\">{{numberOfCalls}}</div>\n                    <div class=\"td white\">{{totalCallsDurationFormatted}}</div>\n                    <div class=\"td white\">{{totalPrice}} {{currency}}</div>\n                </div>\n                {{/each}}\n                <div class=\"tr bold\">\n                    <div class=\"th\" style=\"border-right: 1px solid black;\">Totales:</div>\n                    <div class=\"td bold\" style=\"border-left: 1px solid black;\">{{callData.callSumaryTotals.numberOfCalls}}</div>\n                    <div class=\"td bold\">{{callData.callSumaryTotals.totalCallsDurationFormatted}}</div>\n                    <div class=\"td bold\">{{callData.callSumaryTotals.totalPrice}} {{invoice.currency}}</div>\n                </div>\n            </div>\n        </div>\n    </div>\n</body>\n</html>\n','<!DOCTYPE HTML>\n<html>\n<head>\n    <style>\n        body {\n            font-size: 14px;\n            font-family: \'DejaVu Sans\',Helvetica,Arial,sans-serif;\n            padding: 30px 0 15px;\n            border-bottom: 1px solid red;\n            margin: 45px 8px;\n        }\n        .bold {\n            font-weight: bold!important;\n        }\n        .center {\n            text-align: center!important;\n        }\n        .left {\n            float: left!important;\n        }\n        #header {\n            text-align: right;\n            height: 50px;\n        }\n        #header img {\n            float: left;\n            height: 30px;\n        }\n        #header p {\n            margin: 0;\n        }\n        #header .redLine {\n            border-color: red;\n            border-width: 0 0 1px 0;\n        }\n    </style>\n    <meta charset=\"UTF-8\">\n</head>\n<body>\n<div id=\"header\">\n    <div>\n        <img src=\"{{brand.logoPath}}\">\n        <div>\n            <p class=\"bold\">{{brand.name}}</p>\n            <p class=\"bold\">{{brand.invoice.postalAddress}}, {{brand.invoice.postalCode}} {{brand.invoice.town}}, {{brand.invoice.province}} </p>\n            <p>NIF / CIF: {{brand.invoice.nif}}</p>\n        </div>\n        <div class=\"redLine\">\n        </div>\n    </div>\n</div>\n</body>\n</html>\n','<!DOCTYPE HTML>\n<html>\n   <head>\n       <style>\n           #registryData {\n              border-top: 1px solid red;\n         	  border-bottom: 1px solid red;\n              line-height: 18px;\n              font-size: 8px;\n              padding: 3px 0;\n              text-align: center;\n           }\n           #footer {\n         	  padding-bottom: 20px;\n              text-align: right;\n              font-size: 14px;\n              font-weith:bold;\n           }\n       </style>\n       <meta charset=\"UTF-8\">\n   </head>\n   <body>\n     <p id=\"registryData\">\n        {{brand.invoice.registryData}}\n     </p>\n     <div id=\"footer\">\n       <p>\n         <span id=\"page\"></span>\n         / <span id=\"topage\"></span>\n       </p>\n     </div>\n    <script>\n      var vars = {};\n      var query_strings_from_url = document.location.search.substring(1).split(\'&\');\n      for (var query_string in query_strings_from_url) {\n          if (query_strings_from_url.hasOwnProperty(query_string)) {\n              var temp_var = query_strings_from_url[query_string].split(\'=\', 2);\n              vars[temp_var[0]] = decodeURI(temp_var[1]);\n          }\n      }\n      document.getElementById(\'page\').innerHTML = vars.page;\n      document.getElementById(\'topage\').innerHTML = vars.topage;\n    </script>\n    </body>\n</html>\n',NULL),(2,'Detailed','Detailed invoice template','<!DOCTYPE HTML>\n<html>\n<head>\n    <style>\n        body {\n            font-size: 14px;\n            font-family: \'DejaVu Sans\',Helvetica,Arial,sans-serif;\n        }\n        h2 {\n            font-size: 18px;\n        }\n        div{\n            page-break-inside: avoid;\n        }\n        div.theader {\n            width: 100%;\n            text-align: center;\n            margin: 25px 0 0;\n            font-weight: bold;\n            font-size: 23px;\n            border: none;\n            padding-bottom: 5px;\n            border-bottom: 1px solid black;\n        }\n        div.table {\n            display: table;\n            margin-bottom: 5px;\n            text-align: center;\n            border: none;\n            border-collapse: collapse;\n            width: 100%;\n            table-layout: fixed;\n        }\n        div.tbody {\n            display: table-row-group;\n        }\n        div.table div.tr {\n            display: table-row;\n            border: 1px solid black;\n            page-break-inside: avoid;\n        }\n        div.table div.th {\n            display: table-cell;\n            border-right: 1px solid black;\n            background-color: black;\n            border-bottom: 1px solid black;\n            color: white;\n            font-weight: bold;\n            padding: 5px 0 2px;\n        }\n        div.table div.tr:not(:last-child) div.th {\n            border-bottom: 1px solid white;\n        }\n        div.table div.tr div.th:not(:last-child) {\n            border-right: 1px solid white;\n        }\n        div.table div.td {\n            display: table-cell;\n            width: 50%;\n            padding: 5px 0 5px;\n            font-weight: normal;\n            background-color: white;\n            border: 1px solid black;\n            color: black;\n        }\n        .bold {\n            font-weight: bold!important;\n        }\n        .center {\n            text-align: center!important;\n        }\n        .left {\n            float: left!important;\n        }\n        .noBorder {\n            border: none!important;\n        }\n        .clearFloats {\n            clear:both;\n        }\n        .multiline {\n            white-space: pre-wrap;\n        }\n        .clientData {\n            width: 60%;\n            float: left;\n        }\n        .clientData h2 {\n            margin: 0;\n        }\n        .clientData p {\n            margin: 0px 0px 0px 20px;\n            padding: 0;\n        }\n        .invoiceData {\n            width: 30%;\n            float: right;\n            text-align: right;\n        }\n        .invoiceData p {\n            margin: 0;\n            padding: 0;\n        }\n        #content {\n            margin: 10px 0;\n        }\n        #subheader .left {\n            width: 60%;\n            font-weight: bold;\n        }\n        #subheader .left p {\n            font-size: 35px;\n            margin-top: 0;\n        }\n        #subheader .right {\n            width: 35%;\n            text-align: right;\n            float: right;\n        }\n        #subheader .right p.title {\n            margin: 0px;\n            padding: 0;\n            font-weight: bold;\n            font-size: 20px;\n        }\n        #subheader .right p.date {\n            margin: 0;\n            padding: 0;\n            font-size: 16px;\n        }\n        #content > div.table {\n            text-align: center;\n            width: 50%;\n            float: right;\n            border: none;\n            border-collapse: collapse;\n        }\n        #callsPerTypeSummary > div.table {\n            text-align: center;\n            width: 100%;\n        }\n        #content {\n            width: 100%;\n        }\n        #fixedCosts > div.table {\n            clear: both;\n        }\n        #fixedCosts div.table div.td {\n            width: 25%;\n        }\n        #summary {\n            width: 50%;\n            float: right;\n        }\n        #callsPerTypeSummary div.td {\n            width: 25%;\n        }\n        #callsPerType div.td {\n            width: 20%;\n        }\n    </style>\n    <meta charset=\"UTF-8\">\n</head>\n<body>\n<div id=\"content\">\n    <div id=\"subheader\">\n        <div class=\"left\">\n            <p class=\"left\">Factura</p>\n        </div>\n        <div class=\"right\">\n            <p class=\"title\">Fecha</p>\n            <p class=\"date\">{{invoice.invoiceDate}}</p>\n        </div>\n    </div>\n    <div>\n        <div class=\"clientData\">\n            <h2>Cliente</h2>\n            <p>{{company.name}}</p>\n            <p>{{company.postalAddress}}</p>\n            <p>{{company.postalCode}} {{company.town}}, {{company.province}} </p>\n            <p>NIF / CIF: {{company.nif}}</p>\n        </div>\n        <div class=\"invoiceData\">\n            <p class=\"bold\">Nº de factura</p>\n            <p>{{invoice.number}}</p>\n            <p class=\"bold\">Periodo de facturación</p>\n            <p>{{invoice.inDate}} - {{invoice.outDate}}</p>\n        </div>\n    </div>\n    <br class=\"clearFloats\" />\n    <div id=\"summary\">\n        <div class=\"theader center\">Resumen</div>\n        <div class=\"table\">\n            <div class=\"tbody\">\n                {{#if fixedCostsTotals}}\n                <div class=\"tr bold center\">\n                    <div class=\"th\">Costes fijos</div>\n                    <div class=\"td bold\">\n                        {{fixedCostsTotals}} {{invoice.currency}}\n                    </div>\n                </div>\n                {{/if}}\n                <div class=\"tr bold\">\n                    <div class=\"th\">Total:</div>\n                    <div class=\"td bold\">{{totals.totalPrice}} {{invoice.currency}}</div>\n                </div>\n                <div class=\"tr bold\">\n                    <div class=\"th\">IVA aplicable</div>\n                    <div class=\"td bold\">{{invoice.taxRate}} %</div>\n                </div>\n                <div class=\"tr bold\">\n                    <div class=\"th\">IVA</div>\n                    <div class=\"td bold\">{{totals.totalTaxes}} {{invoice.currency}}</div>\n                </div>\n                <div class=\"tr bold\">\n                    <div class=\"th\">Total con IVA</div>\n                    <div class=\"td bold\">{{totals.totalWithTaxes}} {{invoice.currency}}</div>\n                </div>\n            </div>\n        </div>\n    </div>\n    <br class=\"clearFloats\" />\n\n    {{#if fixedCosts.length}}\n        <div id=\"fixedCosts\">\n            <div class=\"theader\">Costes fijos</div>\n            <div class=\"table\">\n                <div class=\"tbody\">\n                    <div class=\"tr\">\n                        <div class=\"th\">Concepto</div>\n                        <div class=\"th\">Precio</div>\n                        <div class=\"th\">Cantidad</div>\n                        <div class=\"th\">Subtotal</div>\n                    </div>\n                    {{#each fixedCosts}}\n                        <div class=\"tr\">\n                            <div class=\"td\">\n                                {{name}}\n                                {{#if description}}\n                                    <br />\n                                    <div class=\"multiline\">{{description}}</div>\n                                {{/if}}\n                            </div>\n                            <div class=\"td\">{{cost}} {{currency}}</div>\n                            <div class=\"td\">{{quantity}}</div>\n                            <div class=\"td\">{{subTotal}} {{currency}}</div>\n                        </div>\n                    {{/each}}\n                    <div class=\"tr noBorder\">\n                        <div class=\"td noBorder\"></div>\n                        <div class=\"td noBorder\"></div>\n                        <div class=\"th\" style=\"border-right: 1px solid black;\">Total:</div>\n                        <div class=\"td bold\">{{fixedCostsTotals}} {{invoice.currency}}</div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    {{/if}}\n\n    <div id=\"callsPerTypeSummary\">\n        <div class=\"theader\">Resumen de llamadas por tipo</div>\n        <div class=\"table\">\n            <div class=\"tbody\">\n                <div class=\"tr\">\n                    <div class=\"th\">Tipo</div>\n                    <div class=\"th\">Nº llamadas</div>\n                    <div class=\"th\">Duración total</div>\n                    <div class=\"th\">Precio total</div>\n                </div>\n                {{#each callData.callSumary}}\n                <div class=\"tr\">\n                    <div class=\"td white\">{{type}}</div>\n                    <div class=\"td white\">{{numberOfCalls}}</div>\n                    <div class=\"td white\">{{totalCallsDurationFormatted}}</div>\n                    <div class=\"td white\">{{totalPrice}} {{currency}}</div>\n                </div>\n                {{/each}}\n                <div class=\"tr bold\">\n                    <div class=\"th\" style=\"border-right: 1px solid black;\">Totales:</div>\n                    <div class=\"td bold\" style=\"border-left: 1px solid black;\">{{callData.callSumaryTotals.numberOfCalls}}</div>\n                    <div class=\"td bold\">{{callData.callSumaryTotals.totalCallsDurationFormatted}}</div>\n                    <div class=\"td bold\">{{callData.callSumaryTotals.totalPrice}} {{invoice.currency}}</div>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    {{#each callData.callsPerType}}\n    <div id=\"callsPerType\">\n        <div class=\"theader\">{{items.0.targetPattern.name}}</div>\n        <div class=\"table\">\n            <div class=\"tbody\">\n                <div class=\"tr\">\n                    <div class=\"th\">Fecha</div>\n                    <div class=\"th\">Destino</div>\n                    <div class=\"th\">Duración</div>\n                    <div class=\"th\">Plan</div>\n                    <div class=\"th\">Precio</div>\n                </div>\n                {{#each items}}\n                <div class=\"tr\">\n                    <div class=\"td white\">{{calldate}}</div>\n                    <div class=\"td white\">{{dst}}</div>\n                    <div class=\"td white\">{{durationFormatted}}</div>\n                    <div class=\"td white\">{{pricingPlan.name}}</div>\n                    <div class=\"td white\">{{price}} {{currency}}</div>\n                </div>\n                {{/each}}\n            </div>\n        </div>\n    </div>\n    {{/each}}\n</body>\n</html>\n','<!DOCTYPE HTML>\n<html>\n<head>\n    <style>\n        body {\n            font-size: 14px;\n            font-family: \'DejaVu Sans\',Helvetica,Arial,sans-serif;\n            padding: 30px 0 15px;\n            border-bottom: 1px solid red;\n            margin: 45px 8px;\n        }\n        .bold {\n            font-weight: bold!important;\n        }\n        .center {\n            text-align: center!important;\n        }\n        .left {\n            float: left!important;\n        }\n        #header {\n            text-align: right;\n            height: 50px;\n        }\n        #header img {\n            float: left;\n            height: 30px;\n        }\n        #header p {\n            margin: 0;\n        }\n        #header .redLine {\n            border-color: red;\n            border-width: 0 0 1px 0;\n        }\n    </style>\n    <meta charset=\"UTF-8\">\n</head>\n<body>\n<div id=\"header\">\n    <div>\n        <img src=\"{{brand.logoPath}}\">\n        <div>\n            <p class=\"bold\">{{brand.name}}</p>\n            <p class=\"bold\">{{brand.invoice.postalAddress}}, {{brand.invoice.postalCode}} {{brand.invoice.town}}, {{brand.invoice.province}} </p>\n            <p>NIF / CIF: {{brand.invoice.nif}}</p>\n        </div>\n        <div class=\"redLine\">\n        </div>\n    </div>\n</div>\n</body>\n</html>\n','<!DOCTYPE HTML>\n<html>\n   <head>\n       <style>\n           #registryData {\n              border-top: 1px solid red;\n         	  border-bottom: 1px solid red;\n              line-height: 18px;\n              font-size: 8px;\n              padding: 3px 0;\n              text-align: center;\n           }\n           #footer {\n         	  padding-bottom: 20px;\n              text-align: right;\n              font-size: 14px;\n              font-weith:bold;\n           }\n       </style>\n       <meta charset=\"UTF-8\">\n   </head>\n   <body>\n     <p id=\"registryData\">\n        {{brand.invoice.registryData}}\n     </p>\n     <div id=\"footer\">\n       <p>\n         <span id=\"page\"></span>\n         / <span id=\"topage\"></span>\n       </p>\n     </div>\n    <script>\n      var vars = {};\n      var query_strings_from_url = document.location.search.substring(1).split(\'&\');\n      for (var query_string in query_strings_from_url) {\n          if (query_strings_from_url.hasOwnProperty(query_string)) {\n              var temp_var = query_strings_from_url[query_string].split(\'=\', 2);\n              vars[temp_var[0]] = decodeURI(temp_var[1]);\n          }\n      }\n      document.getElementById(\'page\').innerHTML = vars.page;\n      document.getElementById(\'topage\').innerHTML = vars.topage;\n    </script>\n    </body>\n</html>\n',NULL);
/*!40000 ALTER TABLE `InvoiceTemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices`
--

DROP TABLE IF EXISTS `Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT NULL,
  `inDate` datetime DEFAULT NULL,
  `outDate` datetime DEFAULT NULL,
  `total` decimal(10,3) DEFAULT NULL,
  `taxRate` decimal(10,3) DEFAULT NULL,
  `totalWithTax` decimal(10,3) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL COMMENT '[enum:waiting|processing|created|error]',
  `companyId` int unsigned NOT NULL,
  `brandId` int unsigned NOT NULL,
  `pdfFileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO]',
  `pdfFileMimeType` varchar(80) DEFAULT NULL,
  `pdfFileBaseName` varchar(255) DEFAULT NULL,
  `invoiceTemplateId` int unsigned DEFAULT NULL,
  `invoiceNumberSequenceId` int unsigned DEFAULT NULL,
  `statusMsg` varchar(140) DEFAULT NULL,
  `invoiceSchedulerId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number_brand` (`number`,`brandId`),
  KEY `IDX_93594DC39CBEC244` (`brandId`),
  KEY `IDX_93594DC32480E723` (`companyId`),
  KEY `IDX_93594DC3D07541BE` (`invoiceTemplateId`),
  KEY `IDX_93594DC34539C703` (`invoiceNumberSequenceId`),
  KEY `IDX_93594DC31D113CF5` (`invoiceSchedulerId`),
  CONSTRAINT `FK_93594DC31D113CF5` FOREIGN KEY (`invoiceSchedulerId`) REFERENCES `InvoiceSchedulers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_93594DC34539C703` FOREIGN KEY (`invoiceNumberSequenceId`) REFERENCES `InvoiceNumberSequences` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Invoices_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Invoices_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Invoices_ibfk_4` FOREIGN KEY (`invoiceTemplateId`) REFERENCES `InvoiceTemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices`
--

LOCK TABLES `Invoices` WRITE;
/*!40000 ALTER TABLE `Invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `iden` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL DEFAULT '',
  `name_es` varchar(100) NOT NULL DEFAULT '',
  `name_ca` varchar(100) NOT NULL DEFAULT '',
  `name_it` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `languageIden` (`iden`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES (1,'es','Spanish','Español','Castellà','Spagnolo'),(2,'en','English','Inglés','Anglès','Inglese'),(3,'ca','Catalan','Catalán','Català','Catalano'),(4,'it','Italian','Italiano','Italià','Italiano');
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `companyId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9517C8192480E723` (`companyId`),
  CONSTRAINT `FK_9517C8192480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locutions`
--

DROP TABLE IF EXISTS `Locutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `originalFileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO:keepExtension]',
  `originalFileMimeType` varchar(80) DEFAULT NULL,
  `originalFileBaseName` varchar(255) DEFAULT NULL,
  `encodedFileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO:keepExtension]',
  `encodedFileMimeType` varchar(80) DEFAULT NULL,
  `encodedFileBaseName` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '[enum:pending|encoding|ready|error]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `locution_name_company` (`name`,`companyId`),
  KEY `IDX_D5088942480E723` (`companyId`),
  CONSTRAINT `Locutions_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locutions`
--

LOCK TABLES `Locutions` WRITE;
/*!40000 ALTER TABLE `Locutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MatchListPatterns`
--

DROP TABLE IF EXISTS `MatchListPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MatchListPatterns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `matchListId` int unsigned NOT NULL,
  `description` varchar(55) DEFAULT NULL,
  `type` varchar(10) NOT NULL COMMENT '[enum:number|regexp]',
  `regExp` varchar(255) DEFAULT NULL,
  `numberCountryId` int unsigned DEFAULT NULL,
  `numberValue` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1A6AA922283E7346` (`matchListId`),
  KEY `IDX_1A6AA922D7819488` (`numberCountryId`),
  CONSTRAINT `MatchListPatterns_ibfk_1` FOREIGN KEY (`matchListId`) REFERENCES `MatchLists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `MatchListPatterns_ibfk_2` FOREIGN KEY (`numberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatchListPatterns`
--

LOCK TABLES `MatchListPatterns` WRITE;
/*!40000 ALTER TABLE `MatchListPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `MatchListPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MatchLists`
--

DROP TABLE IF EXISTS `MatchLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MatchLists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listName` (`brandId`,`companyId`,`name`),
  KEY `IDX_BAF072182480E723` (`companyId`),
  CONSTRAINT `FK_BAF072189CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `MatchList_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatchLists`
--

LOCK TABLES `MatchLists` WRITE;
/*!40000 ALTER TABLE `MatchLists` DISABLE KEYS */;
/*!40000 ALTER TABLE `MatchLists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaxUsageNotifications`
--

DROP TABLE IF EXISTS `MaxUsageNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MaxUsageNotifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `toAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `threshold` decimal(10,4) DEFAULT '0.0000' COMMENT '(DC2Type:decimal)',
  `lastSent` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `companyId` int unsigned DEFAULT NULL,
  `notificationTemplateId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBA0A3A62480E723` (`companyId`),
  KEY `IDX_FBA0A3A61333F77D` (`notificationTemplateId`),
  CONSTRAINT `FK_FBA0A3A61333F77D` FOREIGN KEY (`notificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FBA0A3A62480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaxUsageNotifications`
--

LOCK TABLES `MaxUsageNotifications` WRITE;
/*!40000 ALTER TABLE `MaxUsageNotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `MaxUsageNotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MediaRelaySets`
--

DROP TABLE IF EXISTS `MediaRelaySets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MediaRelaySets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mediaRelaySet_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MediaRelaySets`
--

LOCK TABLES `MediaRelaySets` WRITE;
/*!40000 ALTER TABLE `MediaRelaySets` DISABLE KEYS */;
INSERT INTO `MediaRelaySets` VALUES (0,'Default','Default media relay set');
/*!40000 ALTER TABLE `MediaRelaySets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicOnHold`
--

DROP TABLE IF EXISTS `MusicOnHold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MusicOnHold` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `originalFileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO:keepExtension]',
  `originalFileMimeType` varchar(80) DEFAULT NULL,
  `originalFileBaseName` varchar(255) DEFAULT NULL,
  `encodedFileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO:keepExtension|storeInBaseFolder]',
  `encodedFileMimeType` varchar(80) DEFAULT NULL,
  `encodedFileBaseName` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '[enum:pending|encoding|ready|error]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `musicOnHold_name_company` (`name`,`companyId`),
  UNIQUE KEY `musicOnHold_name_brand` (`name`,`brandId`),
  KEY `IDX_9C5FB5902480E723` (`companyId`),
  KEY `IDX_9C5FB5909CBEC244` (`brandId`),
  CONSTRAINT `FK_9C5FB5909CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `MusicOnHold_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicOnHold`
--

LOCK TABLES `MusicOnHold` WRITE;
/*!40000 ALTER TABLE `MusicOnHold` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicOnHold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NotificationTemplates`
--

DROP TABLE IF EXISTS `NotificationTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NotificationTemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '[enum:voicemail|fax|limit|lowbalance|invoice|callCsv|maxDailyUsage]',
  `brandId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notificationTemplate_name_brand` (`name`,`brandId`),
  KEY `IDX_1C1A7309CBEC244` (`brandId`),
  CONSTRAINT `FK_1C1A7309CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NotificationTemplates`
--

LOCK TABLES `NotificationTemplates` WRITE;
/*!40000 ALTER TABLE `NotificationTemplates` DISABLE KEYS */;
INSERT INTO `NotificationTemplates` VALUES (1,'Generic Voicemail Notification template','voicemail',NULL),(2,'Generic Fax Notification template','fax',NULL),(3,'Generic Low Balance Notification template','lowbalance',NULL),(4,'Generic Invoice Notification Template','invoice',NULL),(5,'Generic Call CSV Notification template','callCsv',NULL),(6,'Generic Max Daily reached Notification template','maxDailyUsage',NULL);
/*!40000 ALTER TABLE `NotificationTemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NotificationTemplatesContents`
--

DROP TABLE IF EXISTS `NotificationTemplatesContents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NotificationTemplatesContents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fromName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notificationTemplateId` int unsigned NOT NULL,
  `languageId` int unsigned DEFAULT NULL,
  `bodyType` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text/plain' COMMENT '[enum:text/plain|text/html]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notificationTemplateContent_language_unique` (`notificationTemplateId`,`languageId`),
  KEY `IDX_AD99291D940D8C7E` (`languageId`),
  CONSTRAINT `FK_AD99291D1333F77D` FOREIGN KEY (`notificationTemplateId`) REFERENCES `NotificationTemplates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AD99291D940D8C7E` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NotificationTemplatesContents`
--

LOCK TABLES `NotificationTemplatesContents` WRITE;
/*!40000 ALTER TABLE `NotificationTemplatesContents` DISABLE KEYS */;
INSERT INTO `NotificationTemplatesContents` VALUES (1,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Nuevo mensaje en el buzón de voz de ${VM_CIDNAME} (${VM_CIDNUM})','Hola ${VM_NAME}!\n\n${VM_CIDNAME} (${VM_CIDNUM}) te ha dejado un mensaje en tú buzón de voz.\n\n    Día: ${VM_DATE}\n    Duración: ${VM_DUR}\n\nUn saludo,\nIvozProvider Mailbox System',1,1,'text/plain'),(2,'IvozProvider Notifications','no-reply@ivozprovider.com','New voicemail from ${VM_CIDNAME} (${VM_CIDNUM})','Greetings ${VM_NAME}!\n\nYou have a new voicemail from ${VM_CIDNAME} (${VM_CIDNUM}) waiting!\n\n    Day: ${VM_DATE}\n    Duration: ${VM_DUR}\n\nBest Regards,\nIvozProvider Mailbox System',1,2,'text/plain'),(3,'IvozProvider Notifications','no-reply@ivozprovider.com','Nuevo Fax desde ${FAX_SRC} recibido en ${FAX_NAME} (${FAX_DST})','Buenas,\n\nUn nuevo Fax ha sido recibido en ${FAX_NAME} (ver adjunto).\n\n    Fecha: ${FAX_DATE}\n    Nombre: ${FAX_PDFNAME}\n    Páginas: ${FAX_PAGES}\n\nUn saludo,\nIvozProvider Virtual Fax System',2,1,'text/plain'),(4,'IvozProvider Notifications','no-reply@ivozprovider.com','New Fax from ${FAX_SRC} received in ${FAX_NAME} (${FAX_DST})','Greetings!\n\nA new fax has been received at ${FAX_NAME} (see attachment).\n\n    Date: ${FAX_DATE}\n    Name: ${FAX_PDFNAME}\n    Pages: ${FAX_PAGES}\n\nBest Regards,\nIvozProvider Virtual Fax System',2,2,'text/plain'),(5,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Alerta de saldo de ${BALANCE_NAME}','Hola ${BALANCE_NAME}!\n\nSu saldo está a punto de agotarse. Cuando esto ocurra no podrá realizar más llamadas\n\n    Saldo: ${BALANCE_AMOUNT}\nPor favor, póngase en contacto con su administador para aumentar su saldo\n\nUn saludo,\nIvozProvider Balance System',3,1,'text/plain'),(6,'IvozProvider Notifications','no-reply@ivozprovider.com','Low balance alerts for ${BALANCE_NAME}','Greetings ${BALANCE_NAME}!\n\nYour balance is about to run out. If that happens you won\'t be able to place more calls.\n\n    Balance: ${BALANCE_AMOUNT}\nPlease, contact your administator to increase your balance\n\nBest Regards,\nIvozProvider Balance System',3,2,'text/plain'),(7,'IvozProvider Notifications','no-reply@ivozprovider.com','Invoice available','Greetings ${INVOICE_COMPANY}!\n\nYou already have your invoice available.\n\nFor the period ${INVOICE_DATE_IN} - ${INVOICE_DATE_OUT} \nthe amount is ${INVOICE_AMOUNT}${INVOICE_CURRENCY}.\nCheck out attached file for further details.\n\nBest Regards,\nIvozProvider',4,2,'text/plain'),(8,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Factura disponible','Hola ${INVOICE_COMPANY}!\n\nYa tienes disponible tu factura.\n\nPara el período ${INVOICE_DATE_IN} - ${INVOICE_DATE_OUT} \nel importe asciende a ${INVOICE_AMOUNT}${INVOICE_CURRENCY}.\nConsulte el fichero adjunto para más detalles. \n\nAtentamente,\nIvozProvider',4,1,'text/plain'),(9,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Nuevo informe de llamadas','Hola ${CALLCSV_COMPANY}!\n\nYa tienes disponible tu factura informe de llamadas para el período ${CALLCSV_DATE_IN} - ${CALLCSV_DATE_OUT}.\n\nConsulte el fichero adjunto para más detalles. \n\nAtentamente,\nIvozProvider',5,1,'text/plain'),(10,'IvozProvider Notifications','no-reply@ivozprovider.com','New call report','Greetings ${CALLCSV_COMPANY}!\n\nYou already have your call report for the period ${CALLCSV_DATE_IN} - ${CALLCSV_DATE_OUT} available.\n\nCheck out attached file for further details.\n\nBest Regards,\nIvozProvider',5,2,'text/plain'),(11,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Nuevo informe de llamadas','Hola ${CALLCSV_COMPANY}!\n\nYa tienes disponible tu factura informe de llamadas para el período ${CALLCSV_DATE_IN} - ${CALLCSV_DATE_OUT}.\n\nConsulte el fichero adjunto para más detalles. \n\nAtentamente,\nIvozProvider',5,3,'text/plain'),(12,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Factura disponible','Hola ${INVOICE_COMPANY}!\n\nYa tienes disponible tu factura.\n\nPara el período ${INVOICE_DATE_IN} - ${INVOICE_DATE_OUT} \nel importe asciende a ${INVOICE_AMOUNT}${INVOICE_CURRENCY}.\nConsulte el fichero adjunto para más detalles. \n\nAtentamente,\nIvozProvider',4,3,'text/plain'),(13,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Nuevo mensaje en el buzón de voz de ${VM_CIDNAME} (${VM_CIDNUM})','Hola ${VM_NAME}!\n\n${VM_CIDNAME} (${VM_CIDNUM}) te ha dejado un mensaje en tú buzón de voz.\n\n    Día: ${VM_DATE}\n    Duración: ${VM_DUR}\n\nUn saludo,\nIvozProvider Mailbox System',1,3,'text/plain'),(14,'IvozProvider Notifications','no-reply@ivozprovider.com','Nuevo Fax desde ${FAX_SRC} recibido en ${FAX_NAME} (${FAX_DST})','Buenas,\n\nUn nuevo Fax ha sido recibido en ${FAX_NAME} (ver adjunto).\n\n    Fecha: ${FAX_DATE}\n    Nombre: ${FAX_PDFNAME}\n    Páginas: ${FAX_PAGES}\n\nUn saludo,\nIvozProvider Virtual Fax System',2,3,'text/plain'),(15,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Alerta de saldo de ${BALANCE_COMPANY}','Hola ${BALANCE_COMPANY}!\n\nSu saldo está a punto de agotarse. Cuando esto ocurra no podrá realizar más llamadas\n\n    Saldo: ${BALANCE_AMOUNT}\nPor favor, póngase en contacto con su administador para aumentar su saldo\n\nUn saludo,\nIvozProvider Balance System',3,3,'text/plain'),(16,'IvozProvider Notifications','no-reply@ivozprovider.com','New call report','Greetings ${CALLCSV_COMPANY}!\n\nYou already have your call report for the period ${CALLCSV_DATE_IN} - ${CALLCSV_DATE_OUT} available.\n\nCheck out attached file for further details.\n\nBest Regards,\nIvozProvider',5,4,'text/plain'),(17,'IvozProvider Notifications','no-reply@ivozprovider.com','Invoice available','Greetings ${INVOICE_COMPANY}!\n\nYou already have your invoice available.\n\nFor the period ${INVOICE_DATE_IN} - ${INVOICE_DATE_OUT} \nthe amount is ${INVOICE_AMOUNT}${INVOICE_CURRENCY}.\nCheck out attached file for further details.\n\nBest Regards,\nIvozProvider',4,4,'text/plain'),(18,'IvozProvider Notifications','no-reply@ivozprovider.com','New voicemail from ${VM_CIDNAME} (${VM_CIDNUM})','Greetings ${VM_NAME}!\n\nYou have a new voicemail from ${VM_CIDNAME} (${VM_CIDNUM}) waiting!\n\n    Day: ${VM_DATE}\n    Duration: ${VM_DUR}\n\nBest Regards,\nIvozProvider Mailbox System',1,4,'text/plain'),(19,'IvozProvider Notifications','no-reply@ivozprovider.com','New Fax from ${FAX_SRC} received in ${FAX_NAME} (${FAX_DST})','Greetings!\n\nA new fax has been received at ${FAX_NAME} (see attachment).\n\n    Date: ${FAX_DATE}\n    Name: ${FAX_PDFNAME}\n    Pages: ${FAX_PAGES}\n\nBest Regards,\nIvozProvider Virtual Fax System',2,4,'text/plain'),(20,'IvozProvider Notifications','no-reply@ivozprovider.com','Low balance alerts for ${BALANCE_COMPANY}','Greetings ${BALANCE_COMPANY}!\n\nYour balance is about to run out. If that happens you won\'t be able to place more calls.\n\n    Balance: ${BALANCE_AMOUNT}\nPlease, contact your administator to increase your balance\n\nBest Regards,\nIvozProvider Balance System',3,4,'text/plain'),(21,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Alerta de consumo máximo de ${MAXDAILYUSAGE_COMPANY}','Hola ${MAXDAILYUSAGE_COMPANY}!\n\nSu saldo diario máximo ha sido alcanzado y no podrá realizar más llamadas hasta mañana.\n\n    Saldo máximo diario: ${MAXDAILYUSAGE_AMOUNT}\n\nPor favor, póngase en contacto con su administador.\n\nUn saludo,\nIvozProvider Balance System',6,1,'text/plain'),(22,'IvozProvider Notifications','no-reply@ivozprovider.com','Max daily reached alert for ${MAXDAILYUSAGE_COMPANY}','Greetings ${MAXDAILYUSAGE_COMPANY}!\n\nYour max daily balance has been reached and you won\'t be able to place more calls until tomorrow.\n\n    Max daily balance: ${MAXDAILYUSAGE_AMOUNT}\n\nPlease, contact your administator for further assistance\n\nBest Regards,\nIvozProvider Balance System',6,2,'text/plain'),(23,'Notificaciones IvozProvider','no-reply@ivozprovider.com','Alerta de consumo máximo de ${MAXDAILYUSAGE_COMPANY}','Hola ${MAXDAILYUSAGE_COMPANY}!\n\nSu saldo diario máximo ha sido alcanzado y no podrá realizar más llamadas hasta mañana.\n\n    Saldo máximo diario: ${MAXDAILYUSAGE_AMOUNT}\n\nPor favor, póngase en contacto con su administador.\n\nUn saludo,\nIvozProvider Balance System',6,3,'text/plain'),(24,'IvozProvider Notifications','no-reply@ivozprovider.com','Max daily reached alert for ${MAXDAILYUSAGE_COMPANY}','Greetings ${MAXDAILYUSAGE_COMPANY}!\n\nYour max daily balance has been reached and you won\'t be able to place more calls until tomorrow.\n\n    Max daily balance: ${MAXDAILYUSAGE_AMOUNT}\n\nPlease, contact your administator for further assistance\n\nBest Regards,\nIvozProvider Balance System',6,4,'text/plain');
/*!40000 ALTER TABLE `NotificationTemplatesContents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutgoingDDIRules`
--

DROP TABLE IF EXISTS `OutgoingDDIRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OutgoingDDIRules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `defaultAction` varchar(10) NOT NULL COMMENT '[enum:keep|force]',
  `forcedDDIId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outgoingDdiRule_company_name` (`companyId`,`name`),
  KEY `IDX_C4795A7CC85EF10` (`forcedDDIId`),
  CONSTRAINT `OutgoingDDIRules_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `OutgoingDDIRules_ibfk_2` FOREIGN KEY (`forcedDDIId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutgoingDDIRules`
--

LOCK TABLES `OutgoingDDIRules` WRITE;
/*!40000 ALTER TABLE `OutgoingDDIRules` DISABLE KEYS */;
/*!40000 ALTER TABLE `OutgoingDDIRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutgoingDDIRulesPatterns`
--

DROP TABLE IF EXISTS `OutgoingDDIRulesPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OutgoingDDIRulesPatterns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `outgoingDDIRuleId` int unsigned NOT NULL,
  `matchListId` int unsigned DEFAULT NULL,
  `action` varchar(10) NOT NULL COMMENT '[enum:keep|force]',
  `forcedDDIId` int unsigned DEFAULT NULL,
  `priority` smallint NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL COMMENT '[enum:prefix|destination]',
  `prefix` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patternPriority` (`outgoingDDIRuleId`,`priority`),
  KEY `IDX_A4399FB2283E7346` (`matchListId`),
  KEY `IDX_A4399FB2C85EF10` (`forcedDDIId`),
  CONSTRAINT `OutgoingDDIRulesPatterns_ibfk_1` FOREIGN KEY (`outgoingDDIRuleId`) REFERENCES `OutgoingDDIRules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `OutgoingDDIRulesPatterns_ibfk_2` FOREIGN KEY (`matchListId`) REFERENCES `MatchLists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `OutgoingDDIRulesPatterns_ibfk_3` FOREIGN KEY (`forcedDDIId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutgoingDDIRulesPatterns`
--

LOCK TABLES `OutgoingDDIRulesPatterns` WRITE;
/*!40000 ALTER TABLE `OutgoingDDIRulesPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `OutgoingDDIRulesPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutgoingRouting`
--

DROP TABLE IF EXISTS `OutgoingRouting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OutgoingRouting` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('pattern','group','fax') DEFAULT 'group',
  `routingPatternId` int unsigned DEFAULT NULL,
  `routingPatternGroupId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  `priority` smallint unsigned NOT NULL,
  `weight` int unsigned NOT NULL DEFAULT '1',
  `companyId` int unsigned DEFAULT NULL,
  `brandId` int unsigned NOT NULL,
  `routingTagId` int unsigned DEFAULT NULL,
  `routingMode` varchar(25) DEFAULT 'static' COMMENT '[enum:static|lcr|block]',
  `prefix` varchar(25) DEFAULT NULL,
  `forceClid` tinyint unsigned DEFAULT '0',
  `clid` varchar(25) DEFAULT NULL,
  `clidCountryId` int unsigned DEFAULT NULL,
  `stopper` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_569314722480E723` (`companyId`),
  KEY `IDX_569314729CBEC244` (`brandId`),
  KEY `IDX_569314726D661974` (`routingPatternId`),
  KEY `IDX_5693147286CE18CB` (`routingPatternGroupId`),
  KEY `IDX_56931472A48EA1F0` (`routingTagId`),
  KEY `IDX_569314726709B1C` (`carrierId`),
  KEY `IDX_56931472FDDAED95` (`clidCountryId`),
  CONSTRAINT `FK_569314726709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_56931472A48EA1F0` FOREIGN KEY (`routingTagId`) REFERENCES `RoutingTags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_56931472FDDAED95` FOREIGN KEY (`clidCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `OutgoingRouting_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `OutgoingRouting_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `OutgoingRouting_ibfk_6` FOREIGN KEY (`routingPatternId`) REFERENCES `RoutingPatterns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `OutgoingRouting_ibfk_7` FOREIGN KEY (`routingPatternGroupId`) REFERENCES `RoutingPatternGroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutgoingRouting`
--

LOCK TABLES `OutgoingRouting` WRITE;
/*!40000 ALTER TABLE `OutgoingRouting` DISABLE KEYS */;
/*!40000 ALTER TABLE `OutgoingRouting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutgoingRoutingRelCarriers`
--

DROP TABLE IF EXISTS `OutgoingRoutingRelCarriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OutgoingRoutingRelCarriers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `outgoingRoutingId` int unsigned NOT NULL,
  `carrierId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outgoingRoutingRelCarrier_carrier` (`outgoingRoutingId`,`carrierId`),
  KEY `IDX_BD8A311D6709B1C` (`carrierId`),
  CONSTRAINT `FK_BD8A311D3CDE892` FOREIGN KEY (`outgoingRoutingId`) REFERENCES `OutgoingRouting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BD8A311D6709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutgoingRoutingRelCarriers`
--

LOCK TABLES `OutgoingRoutingRelCarriers` WRITE;
/*!40000 ALTER TABLE `OutgoingRoutingRelCarriers` DISABLE KEYS */;
/*!40000 ALTER TABLE `OutgoingRoutingRelCarriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PickUpGroups`
--

DROP TABLE IF EXISTS `PickUpGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PickUpGroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `companyId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pickUpGroup_name_company` (`name`,`companyId`),
  KEY `IDX_3F7C24B82480E723` (`companyId`),
  CONSTRAINT `PickUpGroups_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PickUpGroups`
--

LOCK TABLES `PickUpGroups` WRITE;
/*!40000 ALTER TABLE `PickUpGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `PickUpGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PickUpRelUsers`
--

DROP TABLE IF EXISTS `PickUpRelUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PickUpRelUsers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pickUpGroupId` int unsigned NOT NULL,
  `userId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5EAA6699CB8F98DA` (`pickUpGroupId`),
  KEY `IDX_5EAA669964B64DCC` (`userId`),
  CONSTRAINT `PickUpRelUsers_ibfk_1` FOREIGN KEY (`pickUpGroupId`) REFERENCES `PickUpGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PickUpRelUsers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PickUpRelUsers`
--

LOCK TABLES `PickUpRelUsers` WRITE;
/*!40000 ALTER TABLE `PickUpRelUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `PickUpRelUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProxyTrunks`
--

DROP TABLE IF EXISTS `ProxyTrunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProxyTrunks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proxyTrunk_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProxyTrunks`
--

LOCK TABLES `ProxyTrunks` WRITE;
/*!40000 ALTER TABLE `ProxyTrunks` DISABLE KEYS */;
INSERT INTO `ProxyTrunks` VALUES (1,'proxytrunks','127.0.0.1');
/*!40000 ALTER TABLE `ProxyTrunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProxyTrunksRelBrands`
--

DROP TABLE IF EXISTS `ProxyTrunksRelBrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProxyTrunksRelBrands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned NOT NULL,
  `proxyTrunkId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proxyTrunkRelBrand_proxyTrunk_brand` (`proxyTrunkId`,`brandId`),
  KEY `IDX_3ECFAB9CBEC244` (`brandId`),
  CONSTRAINT `FK_3ECFAB7504E30F` FOREIGN KEY (`proxyTrunkId`) REFERENCES `ProxyTrunks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3ECFAB9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProxyTrunksRelBrands`
--

LOCK TABLES `ProxyTrunksRelBrands` WRITE;
/*!40000 ALTER TABLE `ProxyTrunksRelBrands` DISABLE KEYS */;
INSERT INTO `ProxyTrunksRelBrands` VALUES (1,1,1);
/*!40000 ALTER TABLE `ProxyTrunksRelBrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProxyUsers`
--

DROP TABLE IF EXISTS `ProxyUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProxyUsers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proxy_users_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProxyUsers`
--

LOCK TABLES `ProxyUsers` WRITE;
/*!40000 ALTER TABLE `ProxyUsers` DISABLE KEYS */;
INSERT INTO `ProxyUsers` VALUES (1,'proxyusers','127.0.0.1');
/*!40000 ALTER TABLE `ProxyUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PublicEntities`
--

DROP TABLE IF EXISTS `PublicEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PublicEntities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `iden` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fqdn` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `platform` tinyint(1) NOT NULL DEFAULT '0',
  `brand` tinyint(1) NOT NULL DEFAULT '0',
  `client` tinyint(1) NOT NULL DEFAULT '0',
  `name_en` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_es` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_ca` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_it` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iden` (`iden`),
  UNIQUE KEY `fqdn` (`fqdn`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PublicEntities`
--

LOCK TABLES `PublicEntities` WRITE;
/*!40000 ALTER TABLE `PublicEntities` DISABLE KEYS */;
INSERT INTO `PublicEntities` VALUES (1,'_RatingPlanPrices','Model\\RatingPlanPrices',0,0,1,'Prices','Precios','Precios','Prices'),(2,'kam_users_cdrs','Ivoz\\Kam\\Domain\\Model\\UsersCdr\\UsersCdr',0,0,1,'Call registry','Registro de llamadas','Registro de llamadas','Call registry'),(3,'BillableCalls','Ivoz\\Provider\\Domain\\Model\\BillableCall\\BillableCall',1,1,1,'External calls','Llamadas externas','Llamadas externas','External calls'),(4,'Calendars','Ivoz\\Provider\\Domain\\Model\\Calendar\\Calendar',0,0,1,'Calendars','Calendarios','Calendarios','Calendars'),(5,'CalendarPeriods','Ivoz\\Provider\\Domain\\Model\\CalendarPeriod\\CalendarPeriod',0,0,1,'Calendar Periods','Eventos de Horario','Eventos de Horario','Calendar Periods'),(6,'CalendarPeriodsRelSchedules','Ivoz\\Provider\\Domain\\Model\\CalendarPeriodsRelSchedule\\CalendarPeriodsRelSchedule',0,0,1,'Calendar Periods <-> Schedules','Eventos de Horario <-> Horarios','Eventos de Horario <-> Horarios','Calendar Periods <-> Schedules'),(7,'CallACL','Ivoz\\Provider\\Domain\\Model\\CallAcl\\CallAcl',0,0,1,'Call ACLs','Permisos llamada','Permisos llamada','Call ACLs'),(8,'CallAclRelMatchLists','Ivoz\\Provider\\Domain\\Model\\CallAclRelMatchList\\CallAclRelMatchList',0,0,1,'Call ACL Patterns','Patrón permisos llamada','Patrón permisos llamada','Call ACL Patterns'),(9,'CallCsvSchedulers','Ivoz\\Provider\\Domain\\Model\\CallCsvScheduler\\CallCsvScheduler',0,1,1,'Call CSV schedulers','CSVs programados','CSVs programados','Call CSV schedulers'),(10,'CallCsvReports','Ivoz\\Provider\\Domain\\Model\\CallCsvReport\\CallCsvReport',0,1,1,'Call CSV reports','CSVs de llamadas','CSVs de llamadas','Call CSV reports'),(11,'CallForwardSettings','Ivoz\\Provider\\Domain\\Model\\CallForwardSetting\\CallForwardSetting',0,0,1,'Call forward settings','Opciones de desvío','Opciones de desvío','Call forward settings'),(12,'Companies','Ivoz\\Provider\\Domain\\Model\\Company\\Company',1,1,1,'Clients','Clientes','Clientes','Clients'),(13,'CompanyServices','Ivoz\\Provider\\Domain\\Model\\CompanyService\\CompanyService',0,0,1,'Client services','Servicios de cliente','Servicios de cliente','Client services'),(14,'ConditionalRoutes','Ivoz\\Provider\\Domain\\Model\\ConditionalRoute\\ConditionalRoute',0,0,1,'Conditional Routes','Rutas condicionales','Rutas condicionales','Conditional Routes'),(15,'ConditionalRoutesConditions','Ivoz\\Provider\\Domain\\Model\\ConditionalRoutesCondition\\ConditionalRoutesCondition',0,0,1,'Conditional Route Conditions','Condiciones de Rutas Condicionales','Condiciones de Rutas Condicionales','Conditional Route Conditions'),(16,'ConditionalRoutesConditionsRelMatchLists','Ivoz\\Provider\\Domain\\Model\\ConditionalRoutesConditionsRelMatchlist\\ConditionalRoutesConditionsRelMatchlist',0,0,1,'Conditional Routes <-> Match Lists','Rutas condicionales <-> Listas de coincidencia','Rutas condicionales <-> Listas de coincidencia','Conditional Routes <-> Match Lists'),(17,'ConditionalRoutesConditionsRelSchedules','Ivoz\\Provider\\Domain\\Model\\ConditionalRoutesConditionsRelSchedule\\ConditionalRoutesConditionsRelSchedule',0,0,1,'Conditional Routes <-> Schedules','Rutas condicionales <-> Horarios','Rutas condicionales <-> Horarios','Conditional Routes <-> Schedules'),(18,'ConditionalRoutesConditionsRelCalendars','Ivoz\\Provider\\Domain\\Model\\ConditionalRoutesConditionsRelCalendar\\ConditionalRoutesConditionsRelCalendar',0,0,1,'Conditional Routes <-> Calendars','Rutas condicionales <-> Calendarios','Rutas condicionales <-> Calendarios','Conditional Routes <-> Calendars'),(19,'ConditionalRoutesConditionsRelRouteLocks','Ivoz\\Provider\\Domain\\Model\\ConditionalRoutesConditionsRelRouteLock\\ConditionalRoutesConditionsRelRouteLock',0,0,1,'Conditional Routes <-> Route Locks','Rutas condicionales <-> Candados','Rutas condicionales <-> Candados','Conditional Routes <-> Route Locks'),(20,'ConferenceRooms','Ivoz\\Provider\\Domain\\Model\\ConferenceRoom\\ConferenceRoom',0,0,1,'Conference rooms','Salas de conferencias','Salas de conferencias','Conference rooms'),(21,'Countries','Ivoz\\Provider\\Domain\\Model\\Country\\Country',1,1,1,'Countries','Países','Países','Countries'),(22,'DDIs','Ivoz\\Provider\\Domain\\Model\\Ddi\\Ddi',0,1,1,'DDIs','DDIs','DDIs','DDIs'),(23,'Extensions','Ivoz\\Provider\\Domain\\Model\\Extension\\Extension',0,0,1,'Extensions','Extensiones','Extensiones','Extensions'),(24,'ExternalCallFilters','Ivoz\\Provider\\Domain\\Model\\ExternalCallFilter\\ExternalCallFilter',0,0,1,'External call filters','Filtros de entrada externo','Filtros de entrada externo','External call filters'),(25,'ExternalCallFilterBlackLists','Ivoz\\Provider\\Domain\\Model\\ExternalCallFilterBlackList\\ExternalCallFilterBlackList',0,0,1,'External call filters <-> Black Lists','Filtros de entrada externo <-> Listas negras','Filtros de entrada externo <-> Listas negras','External call filters <-> Black Lists'),(26,'ExternalCallFilterRelCalendars','Ivoz\\Provider\\Domain\\Model\\ExternalCallFilterRelCalendar\\ExternalCallFilterRelCalendar',0,0,1,'External call filters <-> Calendars','Filtros de entrada externo <-> Calendarios','Filtros de entrada externo <-> Calendarios','External call filters <-> Calendars'),(27,'ExternalCallFilterRelSchedules','Ivoz\\Provider\\Domain\\Model\\ExternalCallFilterRelSchedule\\ExternalCallFilterRelSchedule',0,0,1,'External call filters <-> Schedules','Filtros de entrada externo <-> Horarios','Filtros de entrada externo <-> Horarios','External call filters <-> Schedules'),(28,'ExternalCallFilterWhiteLists','Ivoz\\Provider\\Domain\\Model\\ExternalCallFilterWhiteList\\ExternalCallFilterWhiteList',0,0,1,'External call filters <-> White Lists','Filtros de entrada externo <-> Listas blancas','Filtros de entrada externo <-> Listas blancas','External call filters <-> White Lists'),(29,'FaxesInOut','Ivoz\\Provider\\Domain\\Model\\FaxesInOut\\FaxesInOut',0,0,1,'Faxfiles','Ficheros de fax','Ficheros de fax','Faxfiles'),(30,'Faxes','Ivoz\\Provider\\Domain\\Model\\Fax\\Fax',0,1,1,'Faxes','Faxes','Faxes','Faxes'),(31,'Features','Ivoz\\Provider\\Domain\\Model\\Feature\\Feature',1,1,1,'Features','Funcionalidades','Funcionalidades','Features'),(32,'FeaturesRelCompanies','Ivoz\\Provider\\Domain\\Model\\FeaturesRelCompany\\FeaturesRelCompany',0,1,1,'Features <-> Clients','Funcionalidades <-> Clientes','Funcionalidades <-> Clientes','Features <-> Clients'),(33,'Friends','Ivoz\\Provider\\Domain\\Model\\Friend\\Friend',0,1,1,'Friends','Friends','Friends','Friends'),(34,'FriendsPatterns','Ivoz\\Provider\\Domain\\Model\\FriendsPattern\\FriendsPattern',0,0,1,'Friend Patterns','Patrones de Friend','Patrones de Friend','Friend Patterns'),(35,'HolidayDates','Ivoz\\Provider\\Domain\\Model\\HolidayDate\\HolidayDate',0,0,1,'Holiday dates','Festivos','Festivos','Holiday dates'),(36,'HuntGroups','Ivoz\\Provider\\Domain\\Model\\HuntGroup\\HuntGroup',0,0,1,'Hunt Groups','Grupos de salto','Grupos de salto','Hunt Groups'),(37,'HuntGroupsRelUsers','Ivoz\\Provider\\Domain\\Model\\HuntGroupsRelUser\\HuntGroupsRelUser',0,0,1,'Hunt Groups <-> Users','Grupos de salto <-> Usuarios','Grupos de salto <-> Usuarios','Hunt Groups <-> Users'),(38,'Invoices','Ivoz\\Provider\\Domain\\Model\\Invoice\\Invoice',1,1,1,'Invoices','Facturas','Facturas','Invoices'),(39,'IVREntries','Ivoz\\Provider\\Domain\\Model\\IvrEntry\\IvrEntry',0,0,1,'IVR entries','Entradas IVR','Entradas IVR','IVR entries'),(40,'IVRs','Ivoz\\Provider\\Domain\\Model\\Ivr\\Ivr',0,0,1,'IVRs','IVRs','IVRs','IVRs'),(41,'IVRExcludedExtensions','Ivoz\\Provider\\Domain\\Model\\IvrExcludedExtension\\IvrExcludedExtension',0,0,1,'IVR Excluded Extensions','IVR Extensiones excluidas','IVR Extensiones excluidas','IVR Excluded Extensions'),(42,'Languages','Ivoz\\Provider\\Domain\\Model\\Language\\Language',1,1,1,'Languages','Idiomas','Idiomas','Languages'),(43,'Locutions','Ivoz\\Provider\\Domain\\Model\\Locution\\Locution',0,0,1,'Locutions','Locuciones','Locuciones','Locutions'),(44,'NotificationTemplates','Ivoz\\Provider\\Domain\\Model\\NotificationTemplate\\NotificationTemplate',0,1,1,'Notification templates','Plantillas de notificación','Plantillas de notificación','Notification templates'),(45,'MatchLists','Ivoz\\Provider\\Domain\\Model\\MatchList\\MatchList',0,0,1,'Match Lists','Listas de ','Listas de ','Match Lists'),(46,'MatchListPatterns','Ivoz\\Provider\\Domain\\Model\\MatchListPattern\\MatchListPattern',0,0,1,'Match List Patterns','Patrones lista de coincidencia','Patrones lista de coincidencia','Match List Patterns'),(47,'MusicOnHold','Ivoz\\Provider\\Domain\\Model\\MusicOnHold\\MusicOnHold',0,0,1,'Musics on Hold','Músicas en espera','Músicas en espera','Musics on Hold'),(48,'OutgoingDDIRules','Ivoz\\Provider\\Domain\\Model\\OutgoingDdiRule\\OutgoingDdiRule',0,0,1,'Outgoing DDI Rules','Reglas DDI de salida','Reglas DDI de salida','Outgoing DDI Rules'),(49,'OutgoingDDIRulesPatterns','Ivoz\\Provider\\Domain\\Model\\OutgoingDdiRulesPattern\\OutgoingDdiRulesPattern',0,0,1,'Outgoing DDI Rule Patterns','Patrones de regla DDI de salida','Patrones de regla DDI de salida','Outgoing DDI Rule Patterns'),(50,'PickUpGroups','Ivoz\\Provider\\Domain\\Model\\PickUpGroup\\PickUpGroup',0,0,1,'Pick up groups','Grupos de captura','Grupos de captura','Pick up groups'),(51,'PickUpRelUsers','Ivoz\\Provider\\Domain\\Model\\PickUpRelUser\\PickUpRelUser',0,0,1,'Pick up <->> users','Grupos de captura <-> Usuarios','Grupos de captura <-> Usuarios','Pick up <->> users'),(52,'QueueMembers','Ivoz\\Provider\\Domain\\Model\\QueueMember\\QueueMember',0,0,1,'Queue Members','Miembros de cola','Miembros de cola','Queue Members'),(53,'Queues','Ivoz\\Provider\\Domain\\Model\\Queue\\Queue',0,0,1,'Queues','Colas','Colas','Queues'),(54,'RatingPlanGroups','Ivoz\\Provider\\Domain\\Model\\RatingPlanGroup\\RatingPlanGroup',1,1,1,'Rating plans groups','Grupos de planes de precios','Grupos de planes de precios','Rating plans groups'),(55,'RatingProfiles','Ivoz\\Provider\\Domain\\Model\\RatingProfile\\RatingProfile',0,1,1,'Rating Plans','Planes de precios','Planes de precios','Rating Plans'),(56,'Recordings','Ivoz\\Provider\\Domain\\Model\\Recording\\Recording',0,0,1,'Recordings','Grabaciones','Grabaciones','Recordings'),(57,'ResidentialDevices','Ivoz\\Provider\\Domain\\Model\\ResidentialDevice\\ResidentialDevice',0,1,1,'Residential Devices','Dispositivo residencial','Dispositivo residencial','Residential Devices'),(58,'RetailAccounts','Ivoz\\Provider\\Domain\\Model\\RetailAccount\\RetailAccount',0,1,1,'Retail Accounts','Cuentas Retail','Cuentas Retail','Retail Accounts'),(59,'RouteLocks','Ivoz\\Provider\\Domain\\Model\\RouteLock\\RouteLock',0,0,1,'Route Locks','Candados','Candados','Route Locks'),(60,'Schedules','Ivoz\\Provider\\Domain\\Model\\Schedule\\Schedule',0,0,1,'Schedules','Horarios','Horarios','Schedules'),(61,'Services','Ivoz\\Provider\\Domain\\Model\\Service\\Service',1,1,1,'Services','Servicios','Servicios','Services'),(62,'Terminals','Ivoz\\Provider\\Domain\\Model\\Terminal\\Terminal',0,1,1,'Terminals','Terminales','Terminales','Terminals'),(63,'TerminalModels','Ivoz\\Provider\\Domain\\Model\\TerminalModel\\TerminalModel',1,0,1,'Terminal models','Modelos de Terminales','Modelos de Terminales','Terminal models'),(64,'Timezones','Ivoz\\Provider\\Domain\\Model\\Timezone\\Timezone',1,1,1,'Time zones','Zonas Horarias','Zonas Horarias','Time zones'),(65,'TransformationRuleSets','Ivoz\\Provider\\Domain\\Model\\TransformationRuleSet\\TransformationRuleSet',0,1,1,'Numeric transformations','Transformaciones numéricas','Transformaciones numéricas','Numeric transformations'),(66,'Users','Ivoz\\Provider\\Domain\\Model\\User\\User',0,1,1,'Users','Usuarios','Usuarios','Users'),(67,'_ActiveCalls','Model\\ActiveCalls',1,1,1,'Active calls','Llamadas activas','Llamadas activas','Active calls'),(68,'_DdiProviderRegistrationStatus','Ivoz\\Kam\\Domain\\Model\\TrunksUacreg\\DdiProviderRegistrationStatus',0,1,0,'Ddi provider registration status','Estado de registro de proveedores DDIs','Estado de registro de proveedores DDIs','Ddi provider registration status'),(69,'_RegistrationStatus','Ivoz\\Kam\\Domain\\Model\\UsersLocation\\RegistrationStatus',0,1,0,'Registration status','Estado de registro','Estado de registro','Registration status'),(70,'kam_users_address','Ivoz\\Kam\\Domain\\Model\\UsersAddress\\UsersAddress',0,1,0,'Authorized sources','Redes autorizadas','Redes autorizadas','Authorized sources'),(71,'Administrators','Ivoz\\Provider\\Domain\\Model\\Administrator\\Administrator',1,1,0,'Administrators','Administradores','Administradores','Administrators'),(72,'BalanceNotifications','Ivoz\\Provider\\Domain\\Model\\BalanceNotification\\BalanceNotification',0,1,0,'Balance Notifications','Notificaciones Saldo','Notificaciones Saldo','Balance Notifications'),(74,'Brands','Ivoz\\Provider\\Domain\\Model\\Brand\\Brand',1,1,0,'Brands','Marcas','Marcas','Brands'),(76,'BrandServices','Ivoz\\Provider\\Domain\\Model\\BrandService\\BrandService',1,1,0,'Brand services','Servicios de marca','Servicios de marca','Brand services'),(79,'Carriers','Ivoz\\Provider\\Domain\\Model\\Carrier\\Carrier',0,1,0,'Carriers','Carriers','Carriers','Carriers'),(80,'CarrierServers','Ivoz\\Provider\\Domain\\Model\\CarrierServer\\CarrierServer',0,1,0,'Carrier servers','Servidores de Carrier','Servidores de Carrier','Carrier servers'),(83,'Currencies','Ivoz\\Provider\\Domain\\Model\\Currency\\Currency',0,1,0,'Currencies','Divisas','Divisas','Currencies'),(85,'DDIProviderAddresses','Ivoz\\Provider\\Domain\\Model\\DdiProviderAddress\\DdiProviderAddress',0,1,0,'DDI Provider Addresses','Direcciones IP Proveedor','Direcciones IP Proveedor','DDI Provider Addresses'),(86,'DDIProviders','Ivoz\\Provider\\Domain\\Model\\DdiProvider\\DdiProvider',0,1,0,'DDI Providers','Proveedores DDIs','Proveedores DDIs','DDI Providers'),(87,'DDIProviderRegistrations','Ivoz\\Provider\\Domain\\Model\\DdiProviderRegistration\\DdiProviderRegistration',0,1,0,'DDI Provider Registrations','Registros Proveedor','Registros Proveedor','DDI Provider Registrations'),(88,'Destinations','Ivoz\\Provider\\Domain\\Model\\Destination\\Destination',1,1,0,'Destinations','Destinos','Destinos','Destinations'),(89,'DestinationRates','Ivoz\\Provider\\Domain\\Model\\DestinationRate\\DestinationRate',0,1,0,'Rates','Tarifas','Tarifas','Rates'),(90,'DestinationRateGroups','Ivoz\\Provider\\Domain\\Model\\DestinationRateGroup\\DestinationRateGroup',0,1,0,'Destination rates','Precios destinos','Precios destinos','Destination rates'),(91,'Domains','Ivoz\\Provider\\Domain\\Model\\Domain\\Domain',1,1,0,'Domains','Dominios','Dominios','Domains'),(93,'FeaturesRelBrands','Ivoz\\Provider\\Domain\\Model\\FeaturesRelBrand\\FeaturesRelBrand',1,1,0,'Features <-> Brands','Funcionalidades <-> Marcas','Funcionalidades <-> Marcas','Features <-> Brands'),(95,'FixedCosts','Ivoz\\Provider\\Domain\\Model\\FixedCost\\FixedCost',0,1,0,'Fixed costs','Costes fijos','Costes fijos','Fixed costs'),(96,'FixedCostsRelInvoices','Ivoz\\Provider\\Domain\\Model\\FixedCostsRelInvoice\\FixedCostsRelInvoice',0,1,0,'Fixed costs <-> Invoices','Costes fijos <-> Facturas','Costes fijos <-> Facturas','Fixed costs <-> Invoices'),(97,'FixedCostsRelInvoiceSchedulers','Ivoz\\Provider\\Domain\\Model\\FixedCostsRelInvoiceScheduler\\FixedCostsRelInvoiceScheduler',0,1,0,'Fixed costs <-> Invoice schedulers','Costes fijos <-> Planificadores de facturas','Costes fijos <-> Planificadores de facturas','Fixed costs <-> Invoice schedulers'),(100,'InvoiceNumberSequences','Ivoz\\Provider\\Domain\\Model\\InvoiceNumberSequence\\InvoiceNumberSequence',0,1,0,'Invoice number sequences','Numeraciones de facturas','Numeraciones de facturas','Invoice number sequences'),(101,'InvoiceSchedulers','Ivoz\\Provider\\Domain\\Model\\InvoiceScheduler\\InvoiceScheduler',0,1,0,'Invoice schedulers','Planificadores de facturas','Planificadores de facturas','Invoice schedulers'),(102,'InvoiceTemplates','Ivoz\\Provider\\Domain\\Model\\InvoiceTemplate\\InvoiceTemplate',1,1,0,'Invoice templates','Plantillas de facturas','Plantillas de facturas','Invoice templates'),(104,'NotificationTemplatesContents','Ivoz\\Provider\\Domain\\Model\\NotificationTemplateContent\\NotificationTemplateContent',0,1,0,'Notification contents','Contenidos de notificaciones','Contenidos de notificaciones','Notification contents'),(106,'OutgoingRouting','Ivoz\\Provider\\Domain\\Model\\OutgoingRouting\\OutgoingRouting',0,1,0,'Outgoing routings','Rutas salientes','Rutas salientes','Outgoing routings'),(108,'RatingPlans','Ivoz\\Provider\\Domain\\Model\\RatingPlan\\RatingPlan',0,1,0,'Rates','Precios','Precios','Rates'),(112,'RoutingPatternGroups','Ivoz\\Provider\\Domain\\Model\\RoutingPatternGroup\\RoutingPatternGroup',0,1,0,'Routing pattern groups','Grupos de patrones de ruta','Grupos de patrones de ruta','Routing pattern groups'),(113,'RoutingPatternGroupsRelPatterns','Ivoz\\Provider\\Domain\\Model\\RoutingPatternGroupsRelPattern\\RoutingPatternGroupsRelPattern',0,1,0,'Routing pattern groups rel patterns','Patrones de destino','Patrones de destino','Routing pattern groups rel patterns'),(114,'RoutingPatterns','Ivoz\\Provider\\Domain\\Model\\RoutingPattern\\RoutingPattern',0,1,0,'Routing patterns','Patrones de ruta','Patrones de ruta','Routing patterns'),(115,'RoutingTags','Ivoz\\Provider\\Domain\\Model\\RoutingTag\\RoutingTag',0,1,0,'Routing Tags','Etiquetas de ruta','Etiquetas de ruta','Routing Tags'),(117,'SpecialNumbers','Ivoz\\Provider\\Domain\\Model\\SpecialNumber\\SpecialNumber',1,1,0,'Special Numbers','Números especiales','Números especiales','Special Numbers'),(121,'TransformationRules','Ivoz\\Provider\\Domain\\Model\\TransformationRule\\TransformationRule',0,1,0,'Transformation Rules','Transformaciones numéricas','Transformaciones numéricas','Transformation Rules'),(122,'WebPortals','Ivoz\\Provider\\Domain\\Model\\WebPortal\\WebPortal',1,1,0,'Web Portals','Portales Web','Portales Web','Web Portals'),(125,'kam_rtpengine','Ivoz\\Kam\\Domain\\Model\\Rtpengine\\Rtpengine',1,0,0,'Media relays','Servidores de media','Servidores de media','Media relays'),(126,'ApplicationServers','Ivoz\\Provider\\Domain\\Model\\ApplicationServer\\ApplicationServer',1,0,0,'Application Servers','Servidores de Aplicación','Servidores de Aplicación','Application Servers'),(139,'MediaRelaySets','Ivoz\\Provider\\Domain\\Model\\MediaRelaySet\\MediaRelaySet',1,0,0,'Media relay sets','Servidores de Media','Servidores de Media','Media relay sets'),(140,'ProxyTrunks','Ivoz\\Provider\\Domain\\Model\\ProxyTrunk\\ProxyTrunk',1,1,0,'Proxies Trunks','Proxies de Salida','Proxies de Salida','Proxies Trunks'),(141,'ProxyUsers','Ivoz\\Provider\\Domain\\Model\\ProxyUser\\ProxyUser',1,0,0,'Proxies Users','Proxies de Usuarios','Proxies de Usuarios','Proxies Users'),(145,'TerminalManufacturers','Ivoz\\Provider\\Domain\\Model\\TerminalManufacturer\\TerminalManufacturer',1,0,0,'Terminal manufacturers','Fabricantes de Terminales','Fabricantes de Terminales','Terminal manufacturers'),(149,'BannedAddresses','IvozProviderDomainModelBannedAddressBannedAddress',1,1,0,'Banned Addresses','Direcciones bloqueadas','Direcciones bloqueadas','Banned Addresses'),(150,'ProxyTrunksRelBrands','Ivoz\\Provider\\Domain\\Model\\ProxyTrunksRelBrand\\ProxyTrunksRelBrand',1,0,0,'Proxy Trunks <-> Brand','Proxy de Salida <-> Marca','Proxy de Salida <-> Marca','Proxy Trunks <-> Brand'),(151,'_RegistrationSummary','Model\\RegistrationSummary',0,1,1,'Registration summary','Resumen de registros','Resumen de registros','Registration summary'),(152,'_UsersMassImport','Model\\UsersMassImport',0,1,0,'Users mass import','Importación masiva de usuarios','Importació massiva d\'usuaris','Importazione di massa degli utenti'),(153,'Locations','IvozProviderDomainModelLocationLocation',0,0,1,'Locations','Ubicaciones','Ubicacions','Ubicazioni');
/*!40000 ALTER TABLE `PublicEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QueueMembers`
--

DROP TABLE IF EXISTS `QueueMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QueueMembers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `queueId` int unsigned NOT NULL,
  `userId` int unsigned NOT NULL,
  `penalty` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_51FEFDD1A4D768C6` (`queueId`),
  KEY `IDX_51FEFDD164B64DCC` (`userId`),
  CONSTRAINT `QueueMembers_ibfk_1` FOREIGN KEY (`queueId`) REFERENCES `Queues` (`id`) ON DELETE CASCADE,
  CONSTRAINT `QueueMembers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QueueMembers`
--

LOCK TABLES `QueueMembers` WRITE;
/*!40000 ALTER TABLE `QueueMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `QueueMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Queues`
--

DROP TABLE IF EXISTS `Queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Queues` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `maxWaitTime` int DEFAULT NULL,
  `timeoutLocutionId` int unsigned DEFAULT NULL,
  `timeoutTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `timeoutNumberCountryId` int unsigned DEFAULT NULL,
  `timeoutNumberValue` varchar(25) DEFAULT NULL,
  `timeoutExtensionId` int unsigned DEFAULT NULL,
  `timeoutVoiceMailUserId` int unsigned DEFAULT NULL,
  `maxlen` int DEFAULT NULL,
  `fullLocutionId` int unsigned DEFAULT NULL,
  `fullTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `fullNumberCountryId` int unsigned DEFAULT NULL,
  `fullNumberValue` varchar(25) DEFAULT NULL,
  `fullExtensionId` int unsigned DEFAULT NULL,
  `fullVoiceMailUserId` int unsigned DEFAULT NULL,
  `periodicAnnounceLocutionId` int unsigned DEFAULT NULL,
  `periodicAnnounceFrequency` int DEFAULT NULL,
  `memberCallRest` int DEFAULT NULL,
  `memberCallTimeout` int DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `preventMissedCalls` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_queuename` (`companyId`,`name`),
  KEY `IDX_C86607A02CAE121C` (`periodicAnnounceLocutionId`),
  KEY `IDX_C86607A0FE276E1B` (`timeoutLocutionId`),
  KEY `IDX_C86607A0535464FB` (`timeoutExtensionId`),
  KEY `IDX_C86607A07030598F` (`timeoutVoiceMailUserId`),
  KEY `IDX_C86607A0DC78ACAF` (`fullLocutionId`),
  KEY `IDX_C86607A09F7A4CAC` (`fullExtensionId`),
  KEY `IDX_C86607A08961FE7B` (`fullVoiceMailUserId`),
  KEY `IDX_C86607A0892C2FA` (`timeoutNumberCountryId`),
  KEY `IDX_C86607A0F1C3650E` (`fullNumberCountryId`),
  CONSTRAINT `FK_C86607A0892C2FA` FOREIGN KEY (`timeoutNumberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C86607A0F1C3650E` FOREIGN KEY (`fullNumberCountryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Queues_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Queues_ibfk_2` FOREIGN KEY (`periodicAnnounceLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Queues_ibfk_3` FOREIGN KEY (`timeoutLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Queues_ibfk_4` FOREIGN KEY (`timeoutExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Queues_ibfk_5` FOREIGN KEY (`timeoutVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Queues_ibfk_6` FOREIGN KEY (`fullLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Queues_ibfk_7` FOREIGN KEY (`fullExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Queues_ibfk_8` FOREIGN KEY (`fullVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Queues`
--

LOCK TABLES `Queues` WRITE;
/*!40000 ALTER TABLE `Queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `Queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatingPlanGroups`
--

DROP TABLE IF EXISTS `RatingPlanGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RatingPlanGroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(55) NOT NULL,
  `name_es` varchar(55) NOT NULL,
  `name_ca` varchar(55) NOT NULL,
  `name_it` varchar(55) NOT NULL,
  `description_en` varchar(255) NOT NULL,
  `description_es` varchar(255) NOT NULL,
  `description_ca` varchar(255) NOT NULL,
  `description_it` varchar(255) NOT NULL,
  `brandId` int unsigned NOT NULL,
  `currencyId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1826169C9CBEC244` (`brandId`),
  KEY `IDX_1826169C91000B8A` (`currencyId`),
  CONSTRAINT `FK_1826169C91000B8A` FOREIGN KEY (`currencyId`) REFERENCES `Currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EB67DB9C9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatingPlanGroups`
--

LOCK TABLES `RatingPlanGroups` WRITE;
/*!40000 ALTER TABLE `RatingPlanGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatingPlanGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatingPlans`
--

DROP TABLE IF EXISTS `RatingPlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RatingPlans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `weight` decimal(8,2) NOT NULL DEFAULT '10.00',
  `ratingPlanGroupId` int unsigned NOT NULL,
  `destinationRateGroupId` int unsigned NOT NULL,
  `timing_type` varchar(10) DEFAULT 'always' COMMENT '[enum:always|custom]',
  `time_in` time NOT NULL,
  `monday` tinyint(1) DEFAULT '1',
  `tuesday` tinyint(1) DEFAULT '1',
  `wednesday` tinyint(1) DEFAULT '1',
  `thursday` tinyint(1) DEFAULT '1',
  `friday` tinyint(1) DEFAULT '1',
  `saturday` tinyint(1) DEFAULT '1',
  `sunday` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ratingPlan_ratingPlanGroup_weight` (`ratingPlanGroupId`,`weight`),
  KEY `IDX_EB67DB9CC11683D9` (`destinationRateGroupId`),
  CONSTRAINT `FK_4CC2BCABC11683D9` FOREIGN KEY (`destinationRateGroupId`) REFERENCES `DestinationRateGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EB67DB9C6A765F36` FOREIGN KEY (`ratingPlanGroupId`) REFERENCES `RatingPlanGroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatingPlans`
--

LOCK TABLES `RatingPlans` WRITE;
/*!40000 ALTER TABLE `RatingPlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatingPlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatingProfiles`
--

DROP TABLE IF EXISTS `RatingProfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RatingProfiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `activationTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `companyId` int unsigned DEFAULT NULL,
  `ratingPlanGroupId` int unsigned NOT NULL,
  `routingTagId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ratingProfile_company_plan_tag` (`companyId`,`ratingPlanGroupId`,`routingTagId`,`activationTime`),
  KEY `IDX_282687BBA48EA1F0` (`routingTagId`),
  KEY `IDX_282687BB6709B1C` (`carrierId`),
  KEY `IDX_282687BB6A765F36` (`ratingPlanGroupId`),
  CONSTRAINT `FK_282687BB2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_282687BB6709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_282687BB6A765F36` FOREIGN KEY (`ratingPlanGroupId`) REFERENCES `RatingPlanGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_282687BBA48EA1F0` FOREIGN KEY (`routingTagId`) REFERENCES `RoutingTags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatingProfiles`
--

LOCK TABLES `RatingProfiles` WRITE;
/*!40000 ALTER TABLE `RatingProfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatingProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recordings`
--

DROP TABLE IF EXISTS `Recordings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recordings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `callid` varchar(255) DEFAULT NULL,
  `calldate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('ondemand','ddi') NOT NULL DEFAULT 'ddi' COMMENT '[enum:ondemand|ddi]',
  `duration` float(10,3) NOT NULL DEFAULT '0.000',
  `caller` varchar(128) DEFAULT NULL,
  `callee` varchar(128) DEFAULT NULL,
  `recorder` varchar(128) DEFAULT NULL,
  `recordedFileFileSize` int unsigned DEFAULT NULL COMMENT '[FSO:keepExtension]',
  `recordedFileMimeType` varchar(80) DEFAULT NULL,
  `recordedFileBaseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A68A9FBE2480E723` (`companyId`),
  CONSTRAINT `Recordings_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recordings`
--

LOCK TABLES `Recordings` WRITE;
/*!40000 ALTER TABLE `Recordings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recordings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResidentialDevices`
--

DROP TABLE IF EXISTS `ResidentialDevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResidentialDevices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned NOT NULL,
  `companyId` int unsigned NOT NULL,
  `name` varchar(65) NOT NULL,
  `domainId` int unsigned DEFAULT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `transport` varchar(25) DEFAULT NULL COMMENT '[enum:udp|tcp|tls]',
  `ip` varchar(50) DEFAULT NULL,
  `port` smallint unsigned DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `outgoingDdiId` int unsigned DEFAULT NULL,
  `disallow` varchar(200) NOT NULL DEFAULT 'all',
  `allow` varchar(200) NOT NULL DEFAULT 'alaw',
  `direct_media_method` varchar(255) NOT NULL DEFAULT 'update' COMMENT '[enum:invite|update]',
  `callerid_update_header` varchar(255) NOT NULL DEFAULT 'pai' COMMENT '[enum:pai|rpid]',
  `update_callerid` varchar(255) NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no]',
  `from_domain` varchar(190) DEFAULT NULL,
  `directConnectivity` varchar(255) NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no]',
  `languageId` int unsigned DEFAULT NULL,
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  `ddiIn` varchar(255) NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no]',
  `maxCalls` int unsigned NOT NULL DEFAULT '1',
  `t38Passthrough` varchar(255) NOT NULL DEFAULT 'no' COMMENT '[enum:yes|no]',
  `rtpEncryption` tinyint(1) NOT NULL DEFAULT '0',
  `multiContact` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `residentialDevice_name_brand` (`name`,`brandId`),
  KEY `IDX_1805369A9CBEC244` (`brandId`),
  KEY `IDX_1805369A334600F3` (`domainId`),
  KEY `IDX_1805369A2480E723` (`companyId`),
  KEY `IDX_1805369A2FECF701` (`transformationRuleSetId`),
  KEY `IDX_1805369A508D43B5` (`outgoingDdiId`),
  KEY `IDX_1805369A940D8C7E` (`languageId`),
  CONSTRAINT `FK_1805369A2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1805369A2FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1805369A334600F3` FOREIGN KEY (`domainId`) REFERENCES `Domains` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1805369A508D43B5` FOREIGN KEY (`outgoingDdiId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1805369A940D8C7E` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1805369A9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResidentialDevices`
--

LOCK TABLES `ResidentialDevices` WRITE;
/*!40000 ALTER TABLE `ResidentialDevices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResidentialDevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RetailAccounts`
--

DROP TABLE IF EXISTS `RetailAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RetailAccounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `transport` varchar(25) DEFAULT NULL COMMENT '[enum:udp|tcp|tls]',
  `ip` varchar(50) DEFAULT NULL,
  `port` smallint unsigned DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `fromDomain` varchar(190) DEFAULT NULL,
  `directConnectivity` varchar(255) NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no]',
  `brandId` int unsigned NOT NULL,
  `domainId` int unsigned DEFAULT NULL,
  `companyId` int unsigned NOT NULL,
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  `outgoingDdiId` int unsigned DEFAULT NULL,
  `ddiIn` varchar(255) NOT NULL DEFAULT 'yes' COMMENT '[enum:yes|no]',
  `t38Passthrough` varchar(255) NOT NULL DEFAULT 'no' COMMENT '[enum:yes|no]',
  `rtpEncryption` tinyint(1) NOT NULL DEFAULT '0',
  `multiContact` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `retailAccount_name_brand` (`name`,`brandId`),
  KEY `IDX_732D92509CBEC244` (`brandId`),
  KEY `IDX_732D9250334600F3` (`domainId`),
  KEY `IDX_732D92502480E723` (`companyId`),
  KEY `IDX_732D92502FECF701` (`transformationRuleSetId`),
  KEY `IDX_732D9250508D43B5` (`outgoingDdiId`),
  CONSTRAINT `FK_732D92502480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_732D92502FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_732D9250334600F3` FOREIGN KEY (`domainId`) REFERENCES `Domains` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_732D9250508D43B5` FOREIGN KEY (`outgoingDdiId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_732D92509CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RetailAccounts`
--

LOCK TABLES `RetailAccounts` WRITE;
/*!40000 ALTER TABLE `RetailAccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `RetailAccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RouteLocks`
--

DROP TABLE IF EXISTS `RouteLocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RouteLocks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `open` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_82CD30DD2480E723` (`companyId`),
  CONSTRAINT `FK_82CD30DD2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RouteLocks`
--

LOCK TABLES `RouteLocks` WRITE;
/*!40000 ALTER TABLE `RouteLocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `RouteLocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoutingPatternGroups`
--

DROP TABLE IF EXISTS `RoutingPatternGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoutingPatternGroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `description` varchar(55) DEFAULT NULL,
  `brandId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `routingPatternGroup_name_brand` (`name`,`brandId`),
  KEY `IDX_CE50E62B9CBEC244` (`brandId`),
  CONSTRAINT `RoutingPatternGroups_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoutingPatternGroups`
--

LOCK TABLES `RoutingPatternGroups` WRITE;
/*!40000 ALTER TABLE `RoutingPatternGroups` DISABLE KEYS */;
INSERT INTO `RoutingPatternGroups` VALUES (7,'Europe',NULL,1),(8,'Asia',NULL,1),(9,'North america',NULL,1),(10,'Africa',NULL,1),(11,'Antarctica',NULL,1),(12,'South america',NULL,1),(13,'Oceania',NULL,1);
/*!40000 ALTER TABLE `RoutingPatternGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoutingPatternGroupsRelPatterns`
--

DROP TABLE IF EXISTS `RoutingPatternGroupsRelPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoutingPatternGroupsRelPatterns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `routingPatternId` int unsigned NOT NULL,
  `routingPatternGroupId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rel` (`routingPatternId`,`routingPatternGroupId`),
  KEY `IDX_C90A69B486CE18CB` (`routingPatternGroupId`),
  CONSTRAINT `RoutingPatternGroupsRelPatterns_ibfk_1` FOREIGN KEY (`routingPatternId`) REFERENCES `RoutingPatterns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `RoutingPatternGroupsRelPatterns_ibfk_2` FOREIGN KEY (`routingPatternGroupId`) REFERENCES `RoutingPatternGroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6559 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoutingPatternGroupsRelPatterns`
--

LOCK TABLES `RoutingPatternGroupsRelPatterns` WRITE;
/*!40000 ALTER TABLE `RoutingPatternGroupsRelPatterns` DISABLE KEYS */;
INSERT INTO `RoutingPatternGroupsRelPatterns` VALUES (6310,1,7),(6311,2,8),(6312,3,8),(6313,4,9),(6314,5,9),(6315,6,7),(6316,7,8),(6317,8,10),(6318,9,11),(6319,10,12),(6320,11,13),(6321,12,7),(6322,13,13),(6323,14,9),(6324,15,7),(6325,16,8),(6326,17,7),(6327,18,9),(6328,19,8),(6329,20,7),(6330,21,10),(6331,22,7),(6332,23,8),(6333,24,10),(6334,25,10),(6335,26,9),(6336,27,9),(6337,28,8),(6338,29,12),(6339,30,12),(6340,31,12),(6341,32,9),(6342,33,8),(6343,34,11),(6344,35,10),(6345,36,7),(6346,37,9),(6347,38,9),(6348,39,8),(6349,40,10),(6350,41,10),(6351,42,10),(6352,43,7),(6353,44,10),(6354,45,13),(6355,46,12),(6356,47,10),(6357,48,8),(6358,49,12),(6359,50,9),(6360,51,9),(6361,52,10),(6362,53,12),(6363,54,8),(6364,55,8),(6365,56,7),(6366,57,7),(6367,58,10),(6368,59,7),(6369,60,9),(6370,61,9),(6371,62,10),(6372,63,12),(6373,64,7),(6374,65,10),(6375,66,10),(6376,67,10),(6377,68,7),(6378,69,10),(6379,70,7),(6380,71,13),(6381,72,12),(6382,73,13),(6383,74,7),(6384,75,7),(6385,76,10),(6386,77,7),(6387,78,9),(6388,79,8),(6389,80,12),(6390,81,7),(6391,82,10),(6392,83,7),(6393,84,9),(6394,85,10),(6395,86,10),(6396,87,9),(6397,88,10),(6398,89,7),(6399,90,11),(6400,91,9),(6401,92,13),(6402,93,10),(6403,94,12),(6404,95,8),(6405,96,11),(6406,97,9),(6407,98,7),(6408,99,9),(6409,100,7),(6410,101,8),(6411,102,7),(6412,103,8),(6413,104,7),(6414,105,8),(6415,106,8),(6416,107,8),(6417,108,8),(6418,109,7),(6419,110,7),(6420,111,7),(6421,112,9),(6422,113,8),(6423,114,8),(6424,115,10),(6425,116,8),(6426,117,8),(6427,118,13),(6428,119,10),(6429,120,9),(6430,121,8),(6431,122,8),(6432,123,8),(6433,124,9),(6434,125,8),(6435,126,8),(6436,127,8),(6437,128,9),(6438,129,7),(6439,130,8),(6440,131,10),(6441,132,10),(6442,133,7),(6443,134,7),(6444,135,7),(6445,136,10),(6446,137,10),(6447,138,7),(6448,139,7),(6449,140,7),(6450,141,9),(6451,142,10),(6452,143,13),(6453,144,7),(6454,145,10),(6455,146,8),(6456,147,8),(6457,148,8),(6458,149,13),(6459,150,9),(6460,151,10),(6461,152,9),(6462,153,7),(6463,154,10),(6464,155,8),(6465,156,10),(6466,157,9),(6467,158,8),(6468,159,10),(6469,160,10),(6470,161,13),(6471,162,10),(6472,163,13),(6473,164,10),(6474,165,9),(6475,166,7),(6476,167,7),(6477,168,8),(6478,169,13),(6479,170,13),(6480,171,13),(6481,172,8),(6482,173,9),(6483,174,12),(6484,175,13),(6485,176,13),(6486,177,8),(6487,178,8),(6488,179,7),(6489,180,9),(6490,181,13),(6491,182,9),(6492,183,8),(6493,184,7),(6494,185,13),(6495,186,12),(6496,187,8),(6497,188,10),(6498,189,7),(6499,190,7),(6500,191,7),(6501,192,10),(6502,193,8),(6503,194,13),(6504,195,10),(6505,196,10),(6506,197,7),(6507,198,8),(6508,199,10),(6509,200,7),(6510,201,7),(6511,202,7),(6512,203,10),(6513,204,7),(6514,205,10),(6515,206,10),(6516,207,12),(6517,208,10),(6518,209,10),(6519,210,9),(6520,211,9),(6521,212,8),(6522,213,10),(6523,214,9),(6524,215,10),(6525,216,11),(6526,217,10),(6527,218,8),(6528,219,8),(6529,220,13),(6530,221,8),(6531,222,8),(6532,223,10),(6533,224,13),(6534,225,7),(6535,226,9),(6536,227,13),(6537,228,8),(6538,229,10),(6539,230,7),(6540,231,10),(6541,232,13),(6542,233,9),(6543,234,12),(6544,235,8),(6545,236,7),(6546,237,9),(6547,238,12),(6548,239,9),(6549,240,9),(6550,241,8),(6551,242,13),(6552,243,13),(6553,244,13),(6554,245,8),(6555,246,10),(6556,247,10),(6557,248,10),(6558,249,10);
/*!40000 ALTER TABLE `RoutingPatternGroupsRelPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoutingPatterns`
--

DROP TABLE IF EXISTS `RoutingPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoutingPatterns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(55) NOT NULL,
  `name_es` varchar(55) NOT NULL,
  `name_ca` varchar(55) NOT NULL,
  `name_it` varchar(55) NOT NULL,
  `description_en` varchar(55) DEFAULT NULL,
  `description_es` varchar(55) DEFAULT NULL,
  `description_ca` varchar(55) DEFAULT NULL,
  `description_it` varchar(55) DEFAULT NULL,
  `prefix` varchar(80) NOT NULL,
  `brandId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FA5E087B9CBEC244` (`brandId`),
  CONSTRAINT `RoutingPatterns_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoutingPatterns`
--

LOCK TABLES `RoutingPatterns` WRITE;
/*!40000 ALTER TABLE `RoutingPatterns` DISABLE KEYS */;
INSERT INTO `RoutingPatterns` VALUES (1,'Andorra','Andorra','Andorra','Andorra','','','','','+376',1),(2,'United Arab Emirates','Emiratos Árabes Unidos','Emiratos Árabes Unidos','United Arab Emirates','','','','','+971',1),(3,'Afghanistan','Afganistán','Afganistán','Afghanistan','','','','','+93',1),(4,'Antigua and Barbuda','Antigua y Barbuda','Antigua y Barbuda','Antigua and Barbuda','','','','','+1268',1),(5,'Anguilla','Anguila','Anguila','Anguilla','','','','','+1264',1),(6,'Albania','Albania','Albania','Albania','','','','','+355',1),(7,'Armenia','Armenia','Armenia','Armenia','','','','','+374',1),(8,'Angola','Angola','Angola','Angola','','','','','+244',1),(9,'Antarctica','Antártida','Antártida','Antarctica','','','','','+672',1),(10,'Argentina','Argentina','Argentina','Argentina','','','','','+54',1),(11,'American Samoa','Samoa Americana','Samoa Americana','American Samoa','','','','','+1684',1),(12,'Austria','Austria','Austria','Austria','','','','','+43',1),(13,'Australia','Australia','Australia','Australia','','','','','+61',1),(14,'Aruba','Aruba','Aruba','Aruba','','','','','+297',1),(15,'Åland Islands','Islas de Åland','Islas de Åland','Åland Islands','','','','','+358',1),(16,'Azerbaijan','Azerbayán','Azerbayán','Azerbaijan','','','','','+994',1),(17,'Bosnia and Herzegovina','Bosnia y Herzegovina','Bosnia y Herzegovina','Bosnia and Herzegovina','','','','','+387',1),(18,'Barbados','Barbados','Barbados','Barbados','','','','','+1246',1),(19,'Bangladesh','Bangladesh','Bangladesh','Bangladesh','','','','','+880',1),(20,'Belgium','Bélgica','Bélgica','Belgium','','','','','+32',1),(21,'Burkina Faso','Burkina Faso','Burkina Faso','Burkina Faso','','','','','+226',1),(22,'Bulgaria','Bulgaria','Bulgaria','Bulgaria','','','','','+359',1),(23,'Bahrain','Bahrein','Bahrein','Bahrain','','','','','+973',1),(24,'Burundi','Burundi','Burundi','Burundi','','','','','+257',1),(25,'Benin','Benín','Benín','Benin','','','','','+229',1),(26,'Saint Barthélemy','San Bartolomé','San Bartolomé','Saint Barthélemy','','','','','+590',1),(27,'Bermuda Islands','Islas Bermudas','Islas Bermudas','Bermuda Islands','','','','','+1441',1),(28,'Brunei','Brunéi','Brunéi','Brunei','','','','','+673',1),(29,'Bolivia','Bolivia','Bolivia','Bolivia','','','','','+591',1),(30,'Bonaire','Bonaire','Bonaire','Bonaire','','','','','+599',1),(31,'Brazil','Brasil','Brasil','Brazil','','','','','+55',1),(32,'Bahamas','Bahamas','Bahamas','Bahamas','','','','','+1242',1),(33,'Bhutan','Bhután','Bhután','Bhutan','','','','','+975',1),(34,'Bouvet Island','Isla Bouvet','Isla Bouvet','Bouvet Island','','','','','+47',1),(35,'Botswana','Botsuana','Botsuana','Botswana','','','','','+267',1),(36,'Belarus','Bielorrusia','Bielorrusia','Belarus','','','','','+375',1),(37,'Belize','Belice','Belice','Belize','','','','','+501',1),(38,'Canada','Canadá','Canadá','Canada','','','','','+1',1),(39,'Cocos (Keeling) Islands','Islas Cocos (Keeling)','Islas Cocos (Keeling)','Cocos (Keeling) Islands','','','','','+61',1),(40,'Congo','Congo','Congo','Congo','','','','','+243',1),(41,'Central African Republic','República Centroafricana','República Centroafricana','Central African Republic','','','','','+236',1),(42,'Congo','Congo','Congo','Congo','','','','','+242',1),(43,'Switzerland','Suiza','Suiza','Switzerland','','','','','+41',1),(44,'Ivory Coast','Costa de Marfil','Costa de Marfil','Ivory Coast','','','','','+225',1),(45,'Cook Islands','Islas Cook','Islas Cook','Cook Islands','','','','','+682',1),(46,'Chile','Chile','Chile','Chile','','','','','+56',1),(47,'Cameroon','Camerún','Camerún','Cameroon','','','','','+237',1),(48,'China','China','China','China','','','','','+86',1),(49,'Colombia','Colombia','Colombia','Colombia','','','','','+57',1),(50,'Costa Rica','Costa Rica','Costa Rica','Costa Rica','','','','','+506',1),(51,'Cuba','Cuba','Cuba','Cuba','','','','','+53',1),(52,'Cape Verde','Cabo Verde','Cabo Verde','Cape Verde','','','','','+238',1),(53,'Curaçao','Curaçao','Curaçao','Curaçao','','','','','+599',1),(54,'Christmas Island','Isla de Navidad','Isla de Navidad','Christmas Island','','','','','+61',1),(55,'Cyprus','Chipre','Chipre','Cyprus','','','','','+357',1),(56,'Czech Republic','República Checa','República Checa','Czech Republic','','','','','+420',1),(57,'Germany','Alemania','Alemania','Germany','','','','','+49',1),(58,'Djibouti','Yibuti','Yibuti','Djibouti','','','','','+253',1),(59,'Denmark','Dinamarca','Dinamarca','Denmark','','','','','+45',1),(60,'Dominica','Dominica','Dominica','Dominica','','','','','+1767',1),(61,'Dominican Republic','República Dominicana','República Dominicana','Dominican Republic','','','','','+1809',1),(62,'Algeria','Algeria','Algeria','Algeria','','','','','+213',1),(63,'Ecuador','Ecuador','Ecuador','Ecuador','','','','','+593',1),(64,'Estonia','Estonia','Estonia','Estonia','','','','','+372',1),(65,'Egypt','Egipto','Egipto','Egypt','','','','','+20',1),(66,'Western Sahara','Sahara Occidental','Sahara Occidental','Western Sahara','','','','','+212',1),(67,'Eritrea','Eritrea','Eritrea','Eritrea','','','','','+291',1),(68,'Spain','España','España','Spain','','','','','+34',1),(69,'Ethiopia','Etiopía','Etiopía','Ethiopia','','','','','+251',1),(70,'Finland','Finlandia','Finlandia','Finland','','','','','+358',1),(71,'Fiji','Fiyi','Fiyi','Fiji','','','','','+679',1),(72,'Falkland Islands (Malvinas)','Islas Malvinas','Islas Malvinas','Falkland Islands (Malvinas)','','','','','+500',1),(73,'Estados Federados de','Micronesia','Micronesia','Estados Federados de','','','','','+691',1),(74,'Faroe Islands','Islas Feroe','Islas Feroe','Faroe Islands','','','','','+298',1),(75,'France','Francia','Francia','France','','','','','+33',1),(76,'Gabon','Gabón','Gabón','Gabon','','','','','+241',1),(77,'United Kingdom','Reino Unido','Reino Unido','United Kingdom','','','','','+44',1),(78,'Grenada','Granada','Granada','Grenada','','','','','+1473',1),(79,'Georgia','Georgia','Georgia','Georgia','','','','','+995',1),(80,'French Guiana','Guayana Francesa','Guayana Francesa','French Guiana','','','','','+594',1),(81,'Guernsey','Guernsey','Guernsey','Guernsey','','','','','+44',1),(82,'Ghana','Ghana','Ghana','Ghana','','','','','+233',1),(83,'Gibraltar','Gibraltar','Gibraltar','Gibraltar','','','','','+350',1),(84,'Greenland','Groenlandia','Groenlandia','Greenland','','','','','+299',1),(85,'Gambia','Gambia','Gambia','Gambia','','','','','+220',1),(86,'Guinea','Guinea','Guinea','Guinea','','','','','+224',1),(87,'Guadeloupe','Guadalupe','Guadalupe','Guadeloupe','','','','','+590',1),(88,'Equatorial Guinea','Guinea Ecuatorial','Guinea Ecuatorial','Equatorial Guinea','','','','','+240',1),(89,'Greece','Grecia','Grecia','Greece','','','','','+30',1),(90,'South Georgia and the South Sandwich Islands','Islas Georgias del Sur y Sandwich del Sur','Islas Georgias del Sur y Sandwich del Sur','South Georgia and the South Sandwich Islands','','','','','+500',1),(91,'Guatemala','Guatemala','Guatemala','Guatemala','','','','','+502',1),(92,'Guam','Guam','Guam','Guam','','','','','+1671',1),(93,'Guinea-Bissau','Guinea-Bissau','Guinea-Bissau','Guinea-Bissau','','','','','+245',1),(94,'Guyana','Guyana','Guyana','Guyana','','','','','+592',1),(95,'Hong Kong','Hong kong','Hong kong','Hong Kong','','','','','+852',1),(96,'Heard Island and McDonald Islands','Islas Heard y McDonald','Islas Heard y McDonald','Heard Island and McDonald Islands','','','','','+672',1),(97,'Honduras','Honduras','Honduras','Honduras','','','','','+504',1),(98,'Croatia','Croacia','Croacia','Croatia','','','','','+385',1),(99,'Haiti','Haití','Haití','Haiti','','','','','+509',1),(100,'Hungary','Hungría','Hungría','Hungary','','','','','+36',1),(101,'Indonesia','Indonesia','Indonesia','Indonesia','','','','','+62',1),(102,'Ireland','Irlanda','Irlanda','Ireland','','','','','+353',1),(103,'Israel','Israel','Israel','Israel','','','','','+972',1),(104,'Isle of Man','Isla de Man','Isla de Man','Isle of Man','','','','','+44',1),(105,'India','India','India','India','','','','','+91',1),(106,'British Indian Ocean Territory','Territorio Británico del Océano Índico','Territorio Británico del Océano Índico','British Indian Ocean Territory','','','','','+246',1),(107,'Iraq','Irak','Irak','Iraq','','','','','+964',1),(108,'Iran','Irán','Irán','Iran','','','','','+98',1),(109,'Iceland','Islandia','Islandia','Iceland','','','','','+354',1),(110,'Italy','Italia','Italia','Italy','','','','','+39',1),(111,'Jersey','Jersey','Jersey','Jersey','','','','','+44',1),(112,'Jamaica','Jamaica','Jamaica','Jamaica','','','','','+1876',1),(113,'Jordan','Jordania','Jordania','Jordan','','','','','+962',1),(114,'Japan','Japón','Japón','Japan','','','','','+81',1),(115,'Kenya','Kenia','Kenia','Kenya','','','','','+254',1),(116,'Kyrgyzstan','Kirgizstán','Kirgizstán','Kyrgyzstan','','','','','+996',1),(117,'Cambodia','Camboya','Camboya','Cambodia','','','','','+855',1),(118,'Kiribati','Kiribati','Kiribati','Kiribati','','','','','+686',1),(119,'Comoros','Comoras','Comoras','Comoros','','','','','+269',1),(120,'Saint Kitts and Nevis','San Cristóbal y Nieves','San Cristóbal y Nieves','Saint Kitts and Nevis','','','','','+1869',1),(121,'North Korea','Corea del Norte','Corea del Norte','North Korea','','','','','+850',1),(122,'South Korea','Corea del Sur','Corea del Sur','South Korea','','','','','+82',1),(123,'Kuwait','Kuwait','Kuwait','Kuwait','','','','','+965',1),(124,'Cayman Islands','Islas Caimán','Islas Caimán','Cayman Islands','','','','','+1345',1),(125,'Kazakhstan','Kazajistán','Kazajistán','Kazakhstan','','','','','+7',1),(126,'Laos','Laos','Laos','Laos','','','','','+856',1),(127,'Lebanon','Líbano','Líbano','Lebanon','','','','','+961',1),(128,'Saint Lucia','Santa Lucía','Santa Lucía','Saint Lucia','','','','','+1758',1),(129,'Liechtenstein','Liechtenstein','Liechtenstein','Liechtenstein','','','','','+423',1),(130,'Sri Lanka','Sri lanka','Sri lanka','Sri Lanka','','','','','+94',1),(131,'Liberia','Liberia','Liberia','Liberia','','','','','+231',1),(132,'Lesotho','Lesoto','Lesoto','Lesotho','','','','','+266',1),(133,'Lithuania','Lituania','Lituania','Lithuania','','','','','+370',1),(134,'Luxembourg','Luxemburgo','Luxemburgo','Luxembourg','','','','','+352',1),(135,'Latvia','Letonia','Letonia','Latvia','','','','','+371',1),(136,'Libya','Libia','Libia','Libya','','','','','+218',1),(137,'Morocco','Marruecos','Marruecos','Morocco','','','','','+212',1),(138,'Monaco','Mónaco','Mónaco','Monaco','','','','','+377',1),(139,'Moldova','Moldavia','Moldavia','Moldova','','','','','+373',1),(140,'Montenegro','Montenegro','Montenegro','Montenegro','','','','','+382',1),(141,'Saint Martin (French part)','San Martín (Francia)','San Martín (Francia)','Saint Martin (French part)','','','','','+1599',1),(142,'Madagascar','Madagascar','Madagascar','Madagascar','','','','','+261',1),(143,'Marshall Islands','Islas Marshall','Islas Marshall','Marshall Islands','','','','','+692',1),(144,'Macedonia','Macedônia','Macedônia','Macedonia','','','','','+389',1),(145,'Mali','Mali','Mali','Mali','','','','','+223',1),(146,'Myanmar','Birmania','Birmania','Myanmar','','','','','+95',1),(147,'Mongolia','Mongolia','Mongolia','Mongolia','','','','','+976',1),(148,'Macao','Macao','Macao','Macao','','','','','+853',1),(149,'Northern Mariana Islands','Islas Marianas del Norte','Islas Marianas del Norte','Northern Mariana Islands','','','','','+1670',1),(150,'Martinique','Martinica','Martinica','Martinique','','','','','+596',1),(151,'Mauritania','Mauritania','Mauritania','Mauritania','','','','','+222',1),(152,'Montserrat','Montserrat','Montserrat','Montserrat','','','','','+1664',1),(153,'Malta','Malta','Malta','Malta','','','','','+356',1),(154,'Mauritius','Mauricio','Mauricio','Mauritius','','','','','+230',1),(155,'Maldives','Islas Maldivas','Islas Maldivas','Maldives','','','','','+960',1),(156,'Malawi','Malawi','Malawi','Malawi','','','','','+265',1),(157,'Mexico','México','México','Mexico','','','','','+52',1),(158,'Malaysia','Malasia','Malasia','Malaysia','','','','','+60',1),(159,'Mozambique','Mozambique','Mozambique','Mozambique','','','','','+258',1),(160,'Namibia','Namibia','Namibia','Namibia','','','','','+264',1),(161,'New Caledonia','Nueva Caledonia','Nueva Caledonia','New Caledonia','','','','','+687',1),(162,'Niger','Niger','Niger','Niger','','','','','+227',1),(163,'Norfolk Island','Isla Norfolk','Isla Norfolk','Norfolk Island','','','','','+672',1),(164,'Nigeria','Nigeria','Nigeria','Nigeria','','','','','+234',1),(165,'Nicaragua','Nicaragua','Nicaragua','Nicaragua','','','','','+505',1),(166,'Netherlands','Países Bajos','Países Bajos','Netherlands','','','','','+31',1),(167,'Norway','Noruega','Noruega','Norway','','','','','+47',1),(168,'Nepal','Nepal','Nepal','Nepal','','','','','+977',1),(169,'Nauru','Nauru','Nauru','Nauru','','','','','+674',1),(170,'Niue','Niue','Niue','Niue','','','','','+683',1),(171,'New Zealand','Nueva Zelanda','Nueva Zelanda','New Zealand','','','','','+64',1),(172,'Oman','Omán','Omán','Oman','','','','','+968',1),(173,'Panama','Panamá','Panamá','Panama','','','','','+507',1),(174,'Peru','Perú','Perú','Peru','','','','','+51',1),(175,'French Polynesia','Polinesia Francesa','Polinesia Francesa','French Polynesia','','','','','+689',1),(176,'Papua New Guinea','Papúa Nueva Guinea','Papúa Nueva Guinea','Papua New Guinea','','','','','+675',1),(177,'Philippines','Filipinas','Filipinas','Philippines','','','','','+63',1),(178,'Pakistan','Pakistán','Pakistán','Pakistan','','','','','+92',1),(179,'Poland','Polonia','Polonia','Poland','','','','','+48',1),(180,'Saint Pierre and Miquelon','San Pedro y Miquelón','San Pedro y Miquelón','Saint Pierre and Miquelon','','','','','+508',1),(181,'Pitcairn Islands','Islas Pitcairn','Islas Pitcairn','Pitcairn Islands','','','','','+870',1),(182,'Puerto Rico','Puerto Rico','Puerto Rico','Puerto Rico','','','','','+1',1),(183,'Palestine','Palestina','Palestina','Palestine','','','','','+970',1),(184,'Portugal','Portugal','Portugal','Portugal','','','','','+351',1),(185,'Palau','Palau','Palau','Palau','','','','','+680',1),(186,'Paraguay','Paraguay','Paraguay','Paraguay','','','','','+595',1),(187,'Qatar','Qatar','Qatar','Qatar','','','','','+974',1),(188,'Réunion','Reunión','Reunión','Réunion','','','','','+262',1),(189,'Romania','Rumanía','Rumanía','Romania','','','','','+40',1),(190,'Serbia','Serbia','Serbia','Serbia','','','','','+381',1),(191,'Russia','Rusia','Rusia','Russia','','','','','+7',1),(192,'Rwanda','Ruanda','Ruanda','Rwanda','','','','','+250',1),(193,'Saudi Arabia','Arabia Saudita','Arabia Saudita','Saudi Arabia','','','','','+966',1),(194,'Solomon Islands','Islas Salomón','Islas Salomón','Solomon Islands','','','','','+677',1),(195,'Seychelles','Seychelles','Seychelles','Seychelles','','','','','+248',1),(196,'Sudan','Sudán','Sudán','Sudan','','','','','+249',1),(197,'Sweden','Suecia','Suecia','Sweden','','','','','+46',1),(198,'Singapore','Singapur','Singapur','Singapore','','','','','+65',1),(199,'Ascensión y Tristán de Acuña','Santa Elena','Santa Elena','Ascensión y Tristán de Acuña','','','','','+290',1),(200,'Slovenia','Eslovenia','Eslovenia','Slovenia','','','','','+386',1),(201,'Svalbard and Jan Mayen','Svalbard y Jan Mayen','Svalbard y Jan Mayen','Svalbard and Jan Mayen','','','','','+47',1),(202,'Slovakia','Eslovaquia','Eslovaquia','Slovakia','','','','','+421',1),(203,'Sierra Leone','Sierra Leona','Sierra Leona','Sierra Leone','','','','','+232',1),(204,'San Marino','San Marino','San Marino','San Marino','','','','','+378',1),(205,'Senegal','Senegal','Senegal','Senegal','','','','','+221',1),(206,'Somalia','Somalia','Somalia','Somalia','','','','','+252',1),(207,'Suriname','Surinám','Surinám','Suriname','','','','','+597',1),(208,'South Sudan','Sudán del Sur','Sudán del Sur','South Sudan','','','','','+211',1),(209,'Sao Tome and Principe','Santo Tomé y Príncipe','Santo Tomé y Príncipe','Sao Tome and Principe','','','','','+239',1),(210,'El Salvador','El Salvador','El Salvador','El Salvador','','','','','+503',1),(211,'Sint Maarten (Dutch part)','Sint Maarten (parte neerlandesa)','Sint Maarten (parte neerlandesa)','Sint Maarten (Dutch part)','','','','','+1721',1),(212,'Syria','Siria','Siria','Syria','','','','','+963',1),(213,'Swaziland','Swazilandia','Swazilandia','Swaziland','','','','','+268',1),(214,'Turks and Caicos Islands','Islas Turcas y Caicos','Islas Turcas y Caicos','Turks and Caicos Islands','','','','','+1649',1),(215,'Chad','Chad','Chad','Chad','','','','','+235',1),(216,'French Southern Territories','Territorios Australes y Antárticas Franceses','Territorios Australes y Antárticas Franceses','French Southern Territories','','','','','+262',1),(217,'Togo','Togo','Togo','Togo','','','','','+228',1),(218,'Thailand','Tailandia','Tailandia','Thailand','','','','','+66',1),(219,'Tajikistan','Tadjikistán','Tadjikistán','Tajikistan','','','','','+992',1),(220,'Tokelau','Tokelau','Tokelau','Tokelau','','','','','+690',1),(221,'East Timor','Timor Oriental','Timor Oriental','East Timor','','','','','+670',1),(222,'Turkmenistan','Turkmenistán','Turkmenistán','Turkmenistan','','','','','+993',1),(223,'Tunisia','Tunez','Tunez','Tunisia','','','','','+216',1),(224,'Tonga','Tonga','Tonga','Tonga','','','','','+676',1),(225,'Turkey','Turquía','Turquía','Turkey','','','','','+90',1),(226,'Trinidad and Tobago','Trinidad y Tobago','Trinidad y Tobago','Trinidad and Tobago','','','','','+1868',1),(227,'Tuvalu','Tuvalu','Tuvalu','Tuvalu','','','','','+688',1),(228,'Taiwan','Taiwán','Taiwán','Taiwan','','','','','+886',1),(229,'Tanzania','Tanzania','Tanzania','Tanzania','','','','','+255',1),(230,'Ukraine','Ucrania','Ucrania','Ukraine','','','','','+380',1),(231,'Uganda','Uganda','Uganda','Uganda','','','','','+256',1),(232,'United States Minor Outlying Islands','Islas Ultramarinas Menores de Estados Unidos','Islas Ultramarinas Menores de Estados Unidos','United States Minor Outlying Islands','','','','','+1',1),(233,'United States of America','Estados Unidos de América','Estados Unidos de América','United States of America','','','','','+1',1),(234,'Uruguay','Uruguay','Uruguay','Uruguay','','','','','+598',1),(235,'Uzbekistan','Uzbekistán','Uzbekistán','Uzbekistan','','','','','+998',1),(236,'Vatican City State','Ciudad del Vaticano','Ciudad del Vaticano','Vatican City State','','','','','+39',1),(237,'Saint Vincent and the Grenadines','San Vicente y las Granadinas','San Vicente y las Granadinas','Saint Vincent and the Grenadines','','','','','+1784',1),(238,'Venezuela','Venezuela','Venezuela','Venezuela','','','','','+58',1),(239,'Virgin Islands','Islas Vírgenes Británicas','Islas Vírgenes Británicas','Virgin Islands','','','','','+1284',1),(240,'United States Virgin Islands','Islas Vírgenes de los Estados Unidos','Islas Vírgenes de los Estados Unidos','United States Virgin Islands','','','','','+1340',1),(241,'Vietnam','Vietnam','Vietnam','Vietnam','','','','','+84',1),(242,'Vanuatu','Vanuatu','Vanuatu','Vanuatu','','','','','+678',1),(243,'Wallis and Futuna','Wallis y Futuna','Wallis y Futuna','Wallis and Futuna','','','','','+681',1),(244,'Samoa','Samoa','Samoa','Samoa','','','','','+685',1),(245,'Yemen','Yemen','Yemen','Yemen','','','','','+967',1),(246,'Mayotte','Mayotte','Mayotte','Mayotte','','','','','+262',1),(247,'South Africa','Sudáfrica','Sudáfrica','South Africa','','','','','+27',1),(248,'Zambia','Zambia','Zambia','Zambia','','','','','+260',1),(249,'Zimbabwe','Zimbabue','Zimbabue','Zimbabwe','','','','','+263',1);
/*!40000 ALTER TABLE `RoutingPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoutingTags`
--

DROP TABLE IF EXISTS `RoutingTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoutingTags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `brandId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_109FBB419CBEC244` (`brandId`),
  CONSTRAINT `FK_109FBB419CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoutingTags`
--

LOCK TABLES `RoutingTags` WRITE;
/*!40000 ALTER TABLE `RoutingTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoutingTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedules`
--

DROP TABLE IF EXISTS `Schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schedules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `timeIn` time NOT NULL,
  `timeout` time NOT NULL,
  `monday` tinyint unsigned DEFAULT '0',
  `tuesday` tinyint unsigned DEFAULT '0',
  `wednesday` tinyint unsigned DEFAULT '0',
  `thursday` tinyint unsigned DEFAULT '0',
  `friday` tinyint unsigned DEFAULT '0',
  `saturday` tinyint unsigned DEFAULT '0',
  `sunday` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `schedule_name_company` (`name`,`companyId`),
  KEY `IDX_B3CA5E2D2480E723` (`companyId`),
  CONSTRAINT `Schedules_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedules`
--

LOCK TABLES `Schedules` WRITE;
/*!40000 ALTER TABLE `Schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `iden` varchar(50) NOT NULL DEFAULT '',
  `name_en` varchar(50) NOT NULL DEFAULT '',
  `name_es` varchar(50) NOT NULL DEFAULT '',
  `name_ca` varchar(50) NOT NULL DEFAULT '',
  `name_it` varchar(50) NOT NULL DEFAULT '',
  `description_en` varchar(255) NOT NULL DEFAULT '',
  `description_es` varchar(255) NOT NULL DEFAULT '',
  `description_ca` varchar(255) NOT NULL DEFAULT '',
  `description_it` varchar(255) NOT NULL DEFAULT '',
  `defaultCode` varchar(3) NOT NULL,
  `extraArgs` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
INSERT INTO `Services` VALUES (1,'DirectPickUp','Direct Pickup','Captura Directa','Captura Directa','Direct Pickup','Add the capture extension after the service code','Añada la extensión a capturar tras el código de servicio','Añada la extensión a capturar tras el código de servicio','Add the capture extension after the service code','94',1),(2,'GroupPickUp','Group Pickup','Captura de Grupo','Captura de Grupo','Group Pickup','Captura la llamada de un miembro de los grupos de captura del usuario','Captura la llamada de un miembro de los grupos de captura del usuario','Captura la llamada de un miembro de los grupos de captura del usuario','Captura la llamada de un miembro de los grupos de captura del usuario','95',0),(3,'Voicemail','Check Voicemail','Consultar buzón de voz','Consultar buzón de voz','Check Voicemail','Check and configure the voicemail of the user','Consulta y configura el buzón de voz del usuario','Consulta y configura el buzón de voz del usuario','Check and configure the voicemail of the user','93',1),(4,'RecordLocution','Record Locution','Grabar Locucion','Grabar Locucion','Record Locution','Add the locution code after the service code','Añada el código de locución tras el código de servicio','Añada el código de locución tras el código de servicio','Add the locution code after the service code','00',1),(5,'CloseLock','Close Lock','Cerrar candado','Cerrar candado','Close Lock','Disables a routes with the lock','Deshabilita rutas configuradas con el candado','Deshabilita rutas configuradas con el candado','Disables a routes with the lock','70',1),(6,'OpenLock','Open Lock','Abrir candado','Abrir candado','Open Lock','Enables a routes with the lock','Habilita rutas configuradas con el candado','Habilita rutas configuradas con el candado','Enables a routes with the lock','71',1),(7,'ToggleLock','Toggle Lock','Alternar candado','Alternar candado','Toggle Lock','Switch current lock status','Alterna el estado de un candado','Alterna el estado de un candado','Switch current lock status','72',1),(8,'CallForwardInconditional','Inconditional call forward','Desvío incondicional','Desvío incondicional','Inconditional call forward','Enable or disable inconditional call forward','Habilita o deshabilita el desvío incondicional','Habilita o deshabilita el desvío incondicional','Enable or disable inconditional call forward','80',1),(9,'CallForwardBusy','Busy call forward','Desvío si ocupado','Desvío si ocupado','Busy call forward','Enable or disable busy call forward','Habilita o deshabilita el desvío si ocupado','Habilita o deshabilita el desvío si ocupado','Enable or disable busy call forward','81',1),(10,'CallForwardNoAnswer','No answer call forward','Desvío si no contesta','Desvío si no contesta','No answer call forward','Enable or disable no answer call forward','Habilita o deshabilita el desvío si no contesta','Habilita o deshabilita el desvío si no contesta','Enable or disable no answer call forward','82',1),(11,'CallForwardUnreachable','Unreachable call forward','Desvío si inalcanzable','Desvío si inalcanzable','Unreachable call forward','Enable or disable unreachable call forward','Habilita o deshabilita el desvío si inalcanzable','Habilita o deshabilita el desvío si inalcanzable','Enable or disable unreachable call forward','83',1);
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialNumbers`
--

DROP TABLE IF EXISTS `SpecialNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SpecialNumbers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `numberE164` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `disableCDR` int unsigned NOT NULL DEFAULT '1',
  `brandId` int unsigned DEFAULT NULL,
  `countryId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D0323969CBEC244` (`brandId`),
  KEY `IDX_8D032396FBA2A6B4` (`countryId`),
  CONSTRAINT `FK_8D0323969CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8D032396FBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialNumbers`
--

LOCK TABLES `SpecialNumbers` WRITE;
/*!40000 ALTER TABLE `SpecialNumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecialNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TerminalManufacturers`
--

DROP TABLE IF EXISTS `TerminalManufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TerminalManufacturers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `iden` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `terminalManufacturer_iden` (`iden`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TerminalManufacturers`
--

LOCK TABLES `TerminalManufacturers` WRITE;
/*!40000 ALTER TABLE `TerminalManufacturers` DISABLE KEYS */;
INSERT INTO `TerminalManufacturers` VALUES (1,'Generic','Generic SIP Manufacturer','Generic SIP Manufacturer'),(2,'Yealink','Yealink',''),(3,'Cisco','Cisco',''),(4,'Snom','Snom','');
/*!40000 ALTER TABLE `TerminalManufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TerminalModels`
--

DROP TABLE IF EXISTS `TerminalModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TerminalModels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `iden` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `TerminalManufacturerId` int unsigned NOT NULL,
  `genericTemplate` text,
  `specificTemplate` text,
  `genericUrlPattern` varchar(225) DEFAULT NULL,
  `specificUrlPattern` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `terminalModel_iden` (`iden`),
  UNIQUE KEY `terminalModel_genericUrlPattern` (`genericUrlPattern`),
  KEY `IDX_144DF7FCCFFDBE50` (`TerminalManufacturerId`),
  CONSTRAINT `TerminalModels_ibfk_1` FOREIGN KEY (`TerminalManufacturerId`) REFERENCES `TerminalManufacturers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TerminalModels`
--

LOCK TABLES `TerminalModels` WRITE;
/*!40000 ALTER TABLE `TerminalModels` DISABLE KEYS */;
INSERT INTO `TerminalModels` VALUES (1,'Generic','Generic SIP Model','Generic SIP Model',1,NULL,NULL,NULL,NULL),(2,'YealinkT21P_E2','YealinkT21P_E2','',2,NULL,NULL,'y000000000052.cfg','{mac}'),(3,'SPA502G','SPA502G','',3,NULL,NULL,'spa502G.cfg','{mac}'),(4,'YealinkT21P','YealinkT21P','',2,NULL,NULL,'y000000000034.cfg','{mac}'),(5,'YealinkT27P','YealinkT27P','',2,NULL,NULL,'y000000000045.cfg','{mac}'),(6,'SPA504G','SPA504G','',3,NULL,NULL,'spa504G.cfg','{mac}'),(7,'SPA509G','SPA509G','',3,NULL,NULL,'spa509G.cfg','{mac}'),(8,'SPA525G2','SPA525G2','',3,NULL,NULL,'spa525G2.cfg','{mac}'),(9,'SPA514G','SPA514G','',3,NULL,NULL,'spa514G.cfg','{mac}'),(10,'YealinkT46G','YealinkT46G','',2,NULL,NULL,'y000000000028.cfg','{mac}'),(11,'YealinkT48G','YealinkT48G','',2,NULL,NULL,'y000000000035.cfg','{mac}'),(12,'YealinkT23P','YealinkT23P','',2,NULL,NULL,'y000000000044.cfg','{mac}'),(13,'YealinkW5XP','Yealink W5XP','',2,NULL,NULL,'y000000000025.cfg','{mac}'),(14,'SnomD375','SnomD375','',4,NULL,NULL,'snomD375.htm','{mac}'),(15,'SnomD717','SnomD717','',4,NULL,NULL,'snomD717.htm','{mac}'),(16,'SnomD735','SnomD735','',4,NULL,NULL,'snomD735.htm','{mac}'),(17,'SnomD785','SnomD785','',4,NULL,NULL,'snomD785.htm','{mac}');
/*!40000 ALTER TABLE `TerminalModels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Terminals`
--

DROP TABLE IF EXISTS `Terminals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Terminals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `TerminalModelId` int unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `domainId` int unsigned DEFAULT NULL,
  `disallow` varchar(200) NOT NULL DEFAULT 'all',
  `allow_audio` varchar(200) NOT NULL DEFAULT 'alaw',
  `allow_video` varchar(200) DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') NOT NULL DEFAULT 'update' COMMENT '[enum:update|invite|reinvite]',
  `password` varchar(25) NOT NULL DEFAULT '' COMMENT '[password]',
  `companyId` int unsigned NOT NULL,
  `mac` varchar(12) DEFAULT NULL,
  `lastProvisionDate` timestamp NULL DEFAULT NULL,
  `t38Passthrough` varchar(255) NOT NULL DEFAULT 'no' COMMENT '[enum:yes|no]',
  `rtpEncryption` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `terminal_name_domain` (`name`,`domainId`),
  UNIQUE KEY `terminal_mac` (`mac`),
  KEY `IDX_98AB47BB96B6775` (`TerminalModelId`),
  KEY `IDX_98AB47BB2480E723` (`companyId`),
  KEY `IDX_98AB47BB334600F3` (`domainId`),
  CONSTRAINT `FK_98AB47BB334600F3` FOREIGN KEY (`domainId`) REFERENCES `Domains` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Terminals_CompanyId_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Terminals_ibfk_1` FOREIGN KEY (`TerminalModelId`) REFERENCES `TerminalModels` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Terminals`
--

LOCK TABLES `Terminals` WRITE;
/*!40000 ALTER TABLE `Terminals` DISABLE KEYS */;
INSERT INTO `Terminals` VALUES (1,1,'alice',3,'all','alaw',NULL,'invite','alice**PA55W0RD',1,NULL,NULL,'no',0),(2,1,'bob',3,'all','alaw',NULL,'invite','bob**PA55W0RD',1,NULL,NULL,'no',0);
/*!40000 ALTER TABLE `Terminals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Timezones`
--

DROP TABLE IF EXISTS `Timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Timezones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `countryId` int unsigned DEFAULT NULL,
  `tz` varchar(255) NOT NULL,
  `comment` varchar(150) DEFAULT '',
  `timeZoneLabel_en` varchar(20) NOT NULL DEFAULT '',
  `timeZoneLabel_es` varchar(20) NOT NULL DEFAULT '',
  `timeZoneLabel_ca` varchar(20) NOT NULL DEFAULT '',
  `timeZoneLabel_it` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `IDX_F7A34AFDFBA2A6B4` (`countryId`),
  CONSTRAINT `FK_F7A34AFDFBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Timezones`
--

LOCK TABLES `Timezones` WRITE;
/*!40000 ALTER TABLE `Timezones` DISABLE KEYS */;
INSERT INTO `Timezones` VALUES (1,1,'Europe/Andorra',NULL,'','','',''),(2,2,'Asia/Dubai',NULL,'','','',''),(3,3,'Asia/Kabul',NULL,'','','',''),(4,4,'America/Antigua',NULL,'','','',''),(5,5,'America/Anguilla',NULL,'','','',''),(6,6,'Europe/Tirane',NULL,'','','',''),(7,7,'Asia/Yerevan',NULL,'','','',''),(8,8,'Africa/Luanda',NULL,'','','',''),(9,9,'Antarctica/McMurdo','McMurdo, South Pole, Scott (New Zealand time)','','','',''),(10,9,'Antarctica/Rothera','Rothera Station, Adelaide Island','','','',''),(11,9,'Antarctica/Palmer','Palmer Station, Anvers Island','','','',''),(12,9,'Antarctica/Mawson','Mawson Station, Holme Bay','','','',''),(13,9,'Antarctica/Davis','Davis Station, Vestfold Hills','','','',''),(14,9,'Antarctica/Casey','Casey Station, Bailey Peninsula','','','',''),(15,9,'Antarctica/Vostok','Vostok Station, Lake Vostok','','','',''),(16,9,'Antarctica/DumontDUrville','Dumont-d\'Urville Station, Adelie Land','','','',''),(17,9,'Antarctica/Syowa','Syowa Station, E Ongul I','','','',''),(18,9,'Antarctica/Troll','Troll Station, Queen Maud Land','','','',''),(19,10,'America/Argentina/Buenos_Aires','Buenos Aires (BA, CF)','','','',''),(20,10,'America/Argentina/Cordoba','most locations (CB, CC, CN, ER, FM, MN, SE, SF)','','','',''),(21,10,'America/Argentina/Salta','(SA, LP, NQ, RN)','','','',''),(22,10,'America/Argentina/Jujuy','Jujuy (JY)','','','',''),(23,10,'America/Argentina/Tucuman','Tucuman (TM)','','','',''),(24,10,'America/Argentina/Catamarca','Catamarca (CT), Chubut (CH)','','','',''),(25,10,'America/Argentina/La_Rioja','La Rioja (LR)','','','',''),(26,10,'America/Argentina/San_Juan','San Juan (SJ)','','','',''),(27,10,'America/Argentina/Mendoza','Mendoza (MZ)','','','',''),(28,10,'America/Argentina/San_Luis','San Luis (SL)','','','',''),(29,10,'America/Argentina/Rio_Gallegos','Santa Cruz (SC)','','','',''),(30,10,'America/Argentina/Ushuaia','Tierra del Fuego (TF)','','','',''),(31,11,'Pacific/Pago_Pago',NULL,'','','',''),(32,12,'Europe/Vienna',NULL,'','','',''),(33,13,'Australia/Lord_Howe','Lord Howe Island','','','',''),(34,13,'Antarctica/Macquarie','Macquarie Island','','','',''),(35,13,'Australia/Hobart','Tasmania - most locations','','','',''),(36,13,'Australia/Currie','Tasmania - King Island','','','',''),(37,13,'Australia/Melbourne','Victoria','','','',''),(38,13,'Australia/Sydney','New South Wales - most locations','','','',''),(39,13,'Australia/Broken_Hill','New South Wales - Yancowinna','','','',''),(40,13,'Australia/Brisbane','Queensland - most locations','','','',''),(41,13,'Australia/Lindeman','Queensland - Holiday Islands','','','',''),(42,13,'Australia/Adelaide','South Australia','','','',''),(43,13,'Australia/Darwin','Northern Territory','','','',''),(44,13,'Australia/Perth','Western Australia - most locations','','','',''),(45,13,'Australia/Eucla','Western Australia - Eucla area','','','',''),(46,14,'America/Aruba',NULL,'','','',''),(47,15,'Europe/Mariehamn',NULL,'','','',''),(48,16,'Asia/Baku',NULL,'','','',''),(49,17,'Europe/Sarajevo',NULL,'','','',''),(50,18,'America/Barbados',NULL,'','','',''),(51,19,'Asia/Dhaka',NULL,'','','',''),(52,20,'Europe/Brussels',NULL,'','','',''),(53,21,'Africa/Ouagadougou',NULL,'','','',''),(54,22,'Europe/Sofia',NULL,'','','',''),(55,23,'Asia/Bahrain',NULL,'','','',''),(56,24,'Africa/Bujumbura',NULL,'','','',''),(57,25,'Africa/Porto-Novo',NULL,'','','',''),(58,26,'America/St_Barthelemy',NULL,'','','',''),(59,27,'Atlantic/Bermuda',NULL,'','','',''),(60,28,'Asia/Brunei',NULL,'','','',''),(61,29,'America/La_Paz',NULL,'','','',''),(62,30,'America/Kralendijk',NULL,'','','',''),(63,31,'America/Noronha','Atlantic islands','','','',''),(64,31,'America/Belem','Amapa, E Para','','','',''),(65,31,'America/Fortaleza','NE Brazil (MA, PI, CE, RN, PB)','','','',''),(66,31,'America/Recife','Pernambuco','','','',''),(67,31,'America/Araguaina','Tocantins','','','',''),(68,31,'America/Maceio','Alagoas, Sergipe','','','',''),(69,31,'America/Bahia','Bahia','','','',''),(70,31,'America/Sao_Paulo','S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)','','','',''),(71,31,'America/Campo_Grande','Mato Grosso do Sul','','','',''),(72,31,'America/Cuiaba','Mato Grosso','','','',''),(73,31,'America/Santarem','W Para','','','',''),(74,31,'America/Porto_Velho','Rondonia','','','',''),(75,31,'America/Boa_Vista','Roraima','','','',''),(76,31,'America/Manaus','E Amazonas','','','',''),(77,31,'America/Eirunepe','W Amazonas','','','',''),(78,31,'America/Rio_Branco','Acre','','','',''),(79,32,'America/Nassau',NULL,'','','',''),(80,33,'Asia/Thimphu',NULL,'','','',''),(81,35,'Africa/Gaborone',NULL,'','','',''),(82,36,'Europe/Minsk',NULL,'','','',''),(83,37,'America/Belize',NULL,'','','',''),(84,38,'America/St_Johns','Newfoundland Time, including SE Labrador','','','',''),(85,38,'America/Halifax','Atlantic Time - Nova Scotia (most places), PEI','','','',''),(86,38,'America/Glace_Bay','Atlantic Time - Nova Scotia - places that did not observe DST 1966-1971','','','',''),(87,38,'America/Moncton','Atlantic Time - New Brunswick','','','',''),(88,38,'America/Goose_Bay','Atlantic Time - Labrador - most locations','','','',''),(89,38,'America/Blanc-Sablon','Atlantic Standard Time - Quebec - Lower North Shore','','','',''),(90,38,'America/Toronto','Eastern Time - Ontario & Quebec - most locations','','','',''),(91,38,'America/Nipigon','Eastern Time - Ontario & Quebec - places that did not observe DST 1967-1973','','','',''),(92,38,'America/Thunder_Bay','Eastern Time - Thunder Bay, Ontario','','','',''),(93,38,'America/Iqaluit','Eastern Time - east Nunavut - most locations','','','',''),(94,38,'America/Pangnirtung','Eastern Time - Pangnirtung, Nunavut','','','',''),(95,38,'America/Resolute','Central Time - Resolute, Nunavut','','','',''),(96,38,'America/Atikokan','Eastern Standard Time - Atikokan, Ontario and Southampton I, Nunavut','','','',''),(97,38,'America/Rankin_Inlet','Central Time - central Nunavut','','','',''),(98,38,'America/Winnipeg','Central Time - Manitoba & west Ontario','','','',''),(99,38,'America/Rainy_River','Central Time - Rainy River & Fort Frances, Ontario','','','',''),(100,38,'America/Regina','Central Standard Time - Saskatchewan - most locations','','','',''),(101,38,'America/Swift_Current','Central Standard Time - Saskatchewan - midwest','','','',''),(102,38,'America/Edmonton','Mountain Time - Alberta, east British Columbia & west Saskatchewan','','','',''),(103,38,'America/Cambridge_Bay','Mountain Time - west Nunavut','','','',''),(104,38,'America/Yellowknife','Mountain Time - central Northwest Territories','','','',''),(105,38,'America/Inuvik','Mountain Time - west Northwest Territories','','','',''),(106,38,'America/Creston','Mountain Standard Time - Creston, British Columbia','','','',''),(107,38,'America/Dawson_Creek','Mountain Standard Time - Dawson Creek & Fort Saint John, British Columbia','','','',''),(108,38,'America/Vancouver','Pacific Time - west British Columbia','','','',''),(109,38,'America/Whitehorse','Pacific Time - south Yukon','','','',''),(110,38,'America/Dawson','Pacific Time - north Yukon','','','',''),(111,39,'Indian/Cocos',NULL,'','','',''),(112,40,'Africa/Kinshasa','west Dem. Rep. of Congo','','','',''),(113,40,'Africa/Lubumbashi','east Dem. Rep. of Congo','','','',''),(114,41,'Africa/Bangui',NULL,'','','',''),(115,42,'Africa/Brazzaville',NULL,'','','',''),(116,43,'Europe/Zurich',NULL,'','','',''),(117,44,'Africa/Abidjan',NULL,'','','',''),(118,45,'Pacific/Rarotonga',NULL,'','','',''),(119,46,'America/Santiago','most locations','','','',''),(120,46,'Pacific/Easter','Easter Island','','','',''),(121,47,'Africa/Douala',NULL,'','','',''),(122,48,'Asia/Shanghai','Beijing Time','','','',''),(123,48,'Asia/Urumqi','Xinjiang Time','','','',''),(124,49,'America/Bogota',NULL,'','','',''),(125,50,'America/Costa_Rica',NULL,'','','',''),(126,51,'America/Havana',NULL,'','','',''),(127,52,'Atlantic/Cape_Verde',NULL,'','','',''),(128,53,'America/Curacao',NULL,'','','',''),(129,54,'Indian/Christmas',NULL,'','','',''),(130,55,'Asia/Nicosia',NULL,'','','',''),(131,56,'Europe/Prague',NULL,'','','',''),(132,57,'Europe/Berlin','most locations','','','',''),(133,57,'Europe/Busingen','Busingen','','','',''),(134,58,'Africa/Djibouti',NULL,'','','',''),(135,59,'Europe/Copenhagen',NULL,'','','',''),(136,60,'America/Dominica',NULL,'','','',''),(137,61,'America/Santo_Domingo',NULL,'','','',''),(138,64,'Africa/Algiers',NULL,'','','',''),(139,65,'America/Guayaquil','mainland','','','',''),(140,65,'Pacific/Galapagos','Galapagos Islands','','','',''),(141,66,'Europe/Tallinn',NULL,'','','',''),(142,67,'Africa/Cairo',NULL,'','','',''),(143,68,'Africa/El_Aaiun',NULL,'','','',''),(144,69,'Africa/Asmara',NULL,'','','',''),(145,70,'Europe/Madrid','mainland','','','',''),(146,70,'Africa/Ceuta','Ceuta & Melilla','','','',''),(147,70,'Atlantic/Canary','Canary Islands','','','',''),(148,71,'Africa/Addis_Ababa',NULL,'','','',''),(149,72,'Europe/Helsinki',NULL,'','','',''),(150,73,'Pacific/Fiji',NULL,'','','',''),(151,74,'Atlantic/Stanley',NULL,'','','',''),(152,75,'Pacific/Chuuk','Chuuk (Truk) and Yap','','','',''),(153,75,'Pacific/Pohnpei','Pohnpei (Ponape)','','','',''),(154,75,'Pacific/Kosrae','Kosrae','','','',''),(155,76,'Atlantic/Faroe',NULL,'','','',''),(156,77,'Europe/Paris',NULL,'','','',''),(157,78,'Africa/Libreville',NULL,'','','',''),(158,79,'Europe/London',NULL,'','','',''),(159,80,'America/Grenada',NULL,'','','',''),(160,81,'Asia/Tbilisi',NULL,'','','',''),(161,82,'America/Cayenne',NULL,'','','',''),(162,83,'Europe/Guernsey',NULL,'','','',''),(163,84,'Africa/Accra',NULL,'','','',''),(164,85,'Europe/Gibraltar',NULL,'','','',''),(165,86,'America/Godthab','most locations','','','',''),(166,86,'America/Danmarkshavn','east coast, north of Scoresbysund','','','',''),(167,86,'America/Scoresbysund','Scoresbysund / Ittoqqortoormiit','','','',''),(168,86,'America/Thule','Thule / Pituffik','','','',''),(169,87,'Africa/Banjul',NULL,'','','',''),(170,88,'Africa/Conakry',NULL,'','','',''),(171,89,'America/Guadeloupe',NULL,'','','',''),(172,90,'Africa/Malabo',NULL,'','','',''),(173,91,'Europe/Athens',NULL,'','','',''),(174,92,'Atlantic/South_Georgia',NULL,'','','',''),(175,93,'America/Guatemala',NULL,'','','',''),(176,94,'Pacific/Guam',NULL,'','','',''),(177,95,'Africa/Bissau',NULL,'','','',''),(178,96,'America/Guyana',NULL,'','','',''),(179,97,'Asia/Hong_Kong',NULL,'','','',''),(180,99,'America/Tegucigalpa',NULL,'','','',''),(181,100,'Europe/Zagreb',NULL,'','','',''),(182,101,'America/Port-au-Prince',NULL,'','','',''),(183,102,'Europe/Budapest',NULL,'','','',''),(184,103,'Asia/Jakarta','Java & Sumatra','','','',''),(185,103,'Asia/Pontianak','west & central Borneo','','','',''),(186,103,'Asia/Makassar','east & south Borneo, Sulawesi (Celebes), Bali, Nusa Tengarra, west Timor','','','',''),(187,103,'Asia/Jayapura','west New Guinea (Irian Jaya) & Malukus (Moluccas)','','','',''),(188,104,'Europe/Dublin',NULL,'','','',''),(189,105,'Asia/Jerusalem',NULL,'','','',''),(190,106,'Europe/Isle_of_Man',NULL,'','','',''),(191,107,'Asia/Kolkata',NULL,'','','',''),(192,108,'Indian/Chagos',NULL,'','','',''),(193,109,'Asia/Baghdad',NULL,'','','',''),(194,110,'Asia/Tehran',NULL,'','','',''),(195,111,'Atlantic/Reykjavik',NULL,'','','',''),(196,112,'Europe/Rome',NULL,'','','',''),(197,113,'Europe/Jersey',NULL,'','','',''),(198,114,'America/Jamaica',NULL,'','','',''),(199,115,'Asia/Amman',NULL,'','','',''),(200,116,'Asia/Tokyo',NULL,'','','',''),(201,117,'Africa/Nairobi',NULL,'','','',''),(202,118,'Asia/Bishkek',NULL,'','','',''),(203,119,'Asia/Phnom_Penh',NULL,'','','',''),(204,120,'Pacific/Tarawa','Gilbert Islands','','','',''),(205,120,'Pacific/Enderbury','Phoenix Islands','','','',''),(206,120,'Pacific/Kiritimati','Line Islands','','','',''),(207,121,'Indian/Comoro',NULL,'','','',''),(208,122,'America/St_Kitts',NULL,'','','',''),(209,123,'Asia/Pyongyang',NULL,'','','',''),(210,124,'Asia/Seoul',NULL,'','','',''),(211,125,'Asia/Kuwait',NULL,'','','',''),(212,126,'America/Cayman',NULL,'','','',''),(213,127,'Asia/Almaty','most locations','','','',''),(214,127,'Asia/Qyzylorda','Qyzylorda (Kyzylorda, Kzyl-Orda)','','','',''),(215,127,'Asia/Aqtobe','Aqtobe (Aktobe)','','','',''),(216,127,'Asia/Aqtau','Atyrau (Atirau, Gur\'yev), Mangghystau (Mankistau)','','','',''),(217,127,'Asia/Oral','West Kazakhstan','','','',''),(218,128,'Asia/Vientiane',NULL,'','','',''),(219,129,'Asia/Beirut',NULL,'','','',''),(220,130,'America/St_Lucia',NULL,'','','',''),(221,131,'Europe/Vaduz',NULL,'','','',''),(222,132,'Asia/Colombo',NULL,'','','',''),(223,133,'Africa/Monrovia',NULL,'','','',''),(224,134,'Africa/Maseru',NULL,'','','',''),(225,135,'Europe/Vilnius',NULL,'','','',''),(226,136,'Europe/Luxembourg',NULL,'','','',''),(227,137,'Europe/Riga',NULL,'','','',''),(228,138,'Africa/Tripoli',NULL,'','','',''),(229,139,'Africa/Casablanca',NULL,'','','',''),(230,140,'Europe/Monaco',NULL,'','','',''),(231,141,'Europe/Chisinau',NULL,'','','',''),(232,142,'Europe/Podgorica',NULL,'','','',''),(233,143,'America/Marigot',NULL,'','','',''),(234,144,'Indian/Antananarivo',NULL,'','','',''),(235,145,'Pacific/Majuro','most locations','','','',''),(236,145,'Pacific/Kwajalein','Kwajalein','','','',''),(237,146,'Europe/Skopje',NULL,'','','',''),(238,147,'Africa/Bamako',NULL,'','','',''),(239,148,'Asia/Rangoon',NULL,'','','',''),(240,149,'Asia/Ulaanbaatar','most locations','','','',''),(241,149,'Asia/Hovd','Bayan-Olgiy, Govi-Altai, Hovd, Uvs, Zavkhan','','','',''),(242,149,'Asia/Choibalsan','Dornod, Sukhbaatar','','','',''),(243,150,'Asia/Macau',NULL,'','','',''),(244,151,'Pacific/Saipan',NULL,'','','',''),(245,152,'America/Martinique',NULL,'','','',''),(246,153,'Africa/Nouakchott',NULL,'','','',''),(247,154,'America/Montserrat',NULL,'','','',''),(248,155,'Europe/Malta',NULL,'','','',''),(249,156,'Indian/Mauritius',NULL,'','','',''),(250,157,'Indian/Maldives',NULL,'','','',''),(251,158,'Africa/Blantyre',NULL,'','','',''),(252,159,'America/Mexico_City','Central Time - most locations','','','',''),(253,159,'America/Cancun','Central Time - Quintana Roo','','','',''),(254,159,'America/Merida','Central Time - Campeche, Yucatan','','','',''),(255,159,'America/Monterrey','Mexican Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas away from US border','','','',''),(256,159,'America/Matamoros','US Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas near US border','','','',''),(257,159,'America/Mazatlan','Mountain Time - S Baja, Nayarit, Sinaloa','','','',''),(258,159,'America/Chihuahua','Mexican Mountain Time - Chihuahua away from US border','','','',''),(259,159,'America/Ojinaga','US Mountain Time - Chihuahua near US border','','','',''),(260,159,'America/Hermosillo','Mountain Standard Time - Sonora','','','',''),(261,159,'America/Tijuana','US Pacific Time - Baja California near US border','','','',''),(262,184,'America/Santa_Isabel','Mexican Pacific Time - Baja California away from US border','','','',''),(263,159,'America/Bahia_Banderas','Mexican Central Time - Bahia de Banderas','','','',''),(264,160,'Asia/Kuala_Lumpur','peninsular Malaysia','','','',''),(265,160,'Asia/Kuching','Sabah & Sarawak','','','',''),(266,161,'Africa/Maputo',NULL,'','','',''),(267,162,'Africa/Windhoek',NULL,'','','',''),(268,163,'Pacific/Noumea',NULL,'','','',''),(269,164,'Africa/Niamey',NULL,'','','',''),(270,165,'Pacific/Norfolk',NULL,'','','',''),(271,166,'Africa/Lagos',NULL,'','','',''),(272,167,'America/Managua',NULL,'','','',''),(273,168,'Europe/Amsterdam',NULL,'','','',''),(274,169,'Europe/Oslo',NULL,'','','',''),(275,170,'Asia/Kathmandu',NULL,'','','',''),(276,171,'Pacific/Nauru',NULL,'','','',''),(277,172,'Pacific/Niue',NULL,'','','',''),(278,173,'Pacific/Auckland','most locations','','','',''),(279,173,'Pacific/Chatham','Chatham Islands','','','',''),(280,174,'Asia/Muscat',NULL,'','','',''),(281,175,'America/Panama',NULL,'','','',''),(282,176,'America/Lima',NULL,'','','',''),(283,177,'Pacific/Tahiti','Society Islands','','','',''),(284,177,'Pacific/Marquesas','Marquesas Islands','','','',''),(285,177,'Pacific/Gambier','Gambier Islands','','','',''),(286,178,'Pacific/Port_Moresby','most locations','','','',''),(287,178,'Pacific/Bougainville','Bougainville','','','',''),(288,179,'Asia/Manila',NULL,'','','',''),(289,180,'Asia/Karachi',NULL,'','','',''),(290,181,'Europe/Warsaw',NULL,'','','',''),(291,182,'America/Miquelon',NULL,'','','',''),(292,183,'Pacific/Pitcairn',NULL,'','','',''),(293,184,'America/Puerto_Rico',NULL,'','','',''),(294,185,'Asia/Gaza','Gaza Strip','','','',''),(295,185,'Asia/Hebron','West Bank','','','',''),(296,186,'Europe/Lisbon','mainland','','','',''),(297,186,'Atlantic/Madeira','Madeira Islands','','','',''),(298,186,'Atlantic/Azores','Azores','','','',''),(299,187,'Pacific/Palau',NULL,'','','',''),(300,188,'America/Asuncion',NULL,'','','',''),(301,189,'Asia/Qatar',NULL,'','','',''),(302,190,'Indian/Reunion',NULL,'','','',''),(303,191,'Europe/Bucharest',NULL,'','','',''),(304,192,'Europe/Belgrade',NULL,'','','',''),(305,193,'Europe/Kaliningrad','Moscow-01 - Kaliningrad','','','',''),(306,193,'Europe/Moscow','Moscow+00 - west Russia','','','',''),(307,193,'Europe/Simferopol','Moscow+00 - Crimea','','','',''),(308,193,'Europe/Volgograd','Moscow+00 - Caspian Sea','','','',''),(309,193,'Europe/Samara','Moscow+00 (Moscow+01 after 2014-10-26) - Samara, Udmurtia','','','',''),(310,193,'Asia/Yekaterinburg','Moscow+02 - Urals','','','',''),(311,193,'Asia/Omsk','Moscow+03 - west Siberia','','','',''),(312,193,'Asia/Novosibirsk','Moscow+03 - Novosibirsk','','','',''),(313,193,'Asia/Novokuznetsk','Moscow+03 (Moscow+04 after 2014-10-26) - Kemerovo','','','',''),(314,193,'Asia/Krasnoyarsk','Moscow+04 - Yenisei River','','','',''),(315,193,'Asia/Irkutsk','Moscow+05 - Lake Baikal','','','',''),(316,193,'Asia/Chita','Moscow+06 (Moscow+05 after 2014-10-26) - Zabaykalsky','','','',''),(317,193,'Asia/Yakutsk','Moscow+06 - Lena River','','','',''),(318,193,'Asia/Khandyga','Moscow+06 - Tomponsky, Ust-Maysky','','','',''),(319,193,'Asia/Vladivostok','Moscow+07 - Amur River','','','',''),(320,193,'Asia/Sakhalin','Moscow+07 - Sakhalin Island','','','',''),(321,193,'Asia/Ust-Nera','Moscow+07 - Oymyakonsky','','','',''),(322,193,'Asia/Magadan','Moscow+08 (Moscow+07 after 2014-10-26) - Magadan','','','',''),(323,193,'Asia/Srednekolymsk','Moscow+08 - E Sakha, N Kuril Is','','','',''),(324,193,'Asia/Kamchatka','Moscow+08 (Moscow+09 after 2014-10-26) - Kamchatka','','','',''),(325,193,'Asia/Anadyr','Moscow+08 (Moscow+09 after 2014-10-26) - Bering Sea','','','',''),(326,194,'Africa/Kigali',NULL,'','','',''),(327,195,'Asia/Riyadh',NULL,'','','',''),(328,196,'Pacific/Guadalcanal',NULL,'','','',''),(329,197,'Indian/Mahe',NULL,'','','',''),(330,198,'Africa/Khartoum',NULL,'','','',''),(331,199,'Europe/Stockholm',NULL,'','','',''),(332,200,'Asia/Singapore',NULL,'','','',''),(333,201,'Atlantic/St_Helena',NULL,'','','',''),(334,202,'Europe/Ljubljana',NULL,'','','',''),(335,203,'Arctic/Longyearbyen',NULL,'','','',''),(336,204,'Europe/Bratislava',NULL,'','','',''),(337,205,'Africa/Freetown',NULL,'','','',''),(338,206,'Europe/San_Marino',NULL,'','','',''),(339,207,'Africa/Dakar',NULL,'','','',''),(340,208,'Africa/Mogadishu',NULL,'','','',''),(341,209,'America/Paramaribo',NULL,'','','',''),(342,210,'Africa/Juba',NULL,'','','',''),(343,211,'Africa/Sao_Tome',NULL,'','','',''),(344,212,'America/El_Salvador',NULL,'','','',''),(345,213,'America/Lower_Princes',NULL,'','','',''),(346,214,'Asia/Damascus',NULL,'','','',''),(347,215,'Africa/Mbabane',NULL,'','','',''),(348,216,'America/Grand_Turk',NULL,'','','',''),(349,217,'Africa/Ndjamena',NULL,'','','',''),(350,218,'Indian/Kerguelen',NULL,'','','',''),(351,219,'Africa/Lome',NULL,'','','',''),(352,220,'Asia/Bangkok',NULL,'','','',''),(353,221,'Asia/Dushanbe',NULL,'','','',''),(354,222,'Pacific/Fakaofo',NULL,'','','',''),(355,223,'Asia/Dili',NULL,'','','',''),(356,224,'Asia/Ashgabat',NULL,'','','',''),(357,225,'Africa/Tunis',NULL,'','','',''),(358,226,'Pacific/Tongatapu',NULL,'','','',''),(359,227,'Europe/Istanbul',NULL,'','','',''),(360,228,'America/Port_of_Spain',NULL,'','','',''),(361,229,'Pacific/Funafuti',NULL,'','','',''),(362,230,'Asia/Taipei',NULL,'','','',''),(363,231,'Africa/Dar_es_Salaam',NULL,'','','',''),(364,232,'Europe/Kiev','most locations','','','',''),(365,232,'Europe/Uzhgorod','Ruthenia','','','',''),(366,232,'Europe/Zaporozhye','Zaporozh\'ye, E Lugansk / Zaporizhia, E Luhansk','','','',''),(367,233,'Africa/Kampala',NULL,'','','',''),(368,235,'Pacific/Johnston','Johnston Atoll','','','',''),(369,234,'Pacific/Midway','Midway Islands','','','',''),(370,234,'Pacific/Wake','Wake Island','','','',''),(371,235,'America/New_York','Eastern Time','','','',''),(372,235,'America/Detroit','Eastern Time - Michigan - most locations','','','',''),(373,235,'America/Kentucky/Louisville','Eastern Time - Kentucky - Louisville area','','','',''),(374,235,'America/Kentucky/Monticello','Eastern Time - Kentucky - Wayne County','','','',''),(375,235,'America/Indiana/Indianapolis','Eastern Time - Indiana - most locations','','','',''),(376,235,'America/Indiana/Vincennes','Eastern Time - Indiana - Daviess, Dubois, Knox & Martin Counties','','','',''),(377,235,'America/Indiana/Winamac','Eastern Time - Indiana - Pulaski County','','','',''),(378,235,'America/Indiana/Marengo','Eastern Time - Indiana - Crawford County','','','',''),(379,235,'America/Indiana/Petersburg','Eastern Time - Indiana - Pike County','','','',''),(380,235,'America/Indiana/Vevay','Eastern Time - Indiana - Switzerland County','','','',''),(381,235,'America/Chicago','Central Time','','','',''),(382,235,'America/Indiana/Tell_City','Central Time - Indiana - Perry County','','','',''),(383,235,'America/Indiana/Knox','Central Time - Indiana - Starke County','','','',''),(384,235,'America/Menominee','Central Time - Michigan - Dickinson, Gogebic, Iron & Menominee Counties','','','',''),(385,235,'America/North_Dakota/Center','Central Time - North Dakota - Oliver County','','','',''),(386,235,'America/North_Dakota/New_Salem','Central Time - North Dakota - Morton County (except Mandan area)','','','',''),(387,235,'America/North_Dakota/Beulah','Central Time - North Dakota - Mercer County','','','',''),(388,235,'America/Denver','Mountain Time','','','',''),(389,235,'America/Boise','Mountain Time - south Idaho & east Oregon','','','',''),(390,235,'America/Phoenix','Mountain Standard Time - Arizona (except Navajo)','','','',''),(391,235,'America/Los_Angeles','Pacific Time','','','',''),(392,235,'America/Metlakatla','Pacific Standard Time - Annette Island, Alaska','','','',''),(393,235,'America/Anchorage','Alaska Time','','','',''),(394,235,'America/Juneau','Alaska Time - Alaska panhandle','','','',''),(395,235,'America/Sitka','Alaska Time - southeast Alaska panhandle','','','',''),(396,235,'America/Yakutat','Alaska Time - Alaska panhandle neck','','','',''),(397,235,'America/Nome','Alaska Time - west Alaska','','','',''),(398,235,'America/Adak','Aleutian Islands','','','',''),(399,235,'Pacific/Honolulu','Hawaii','','','',''),(400,236,'America/Montevideo',NULL,'','','',''),(401,237,'Asia/Samarkand','west Uzbekistan','','','',''),(402,237,'Asia/Tashkent','east Uzbekistan','','','',''),(403,238,'Europe/Vatican',NULL,'','','',''),(404,239,'America/St_Vincent',NULL,'','','',''),(405,240,'America/Caracas',NULL,'','','',''),(406,241,'America/Tortola',NULL,'','','',''),(407,242,'America/St_Thomas',NULL,'','','',''),(408,243,'Asia/Ho_Chi_Minh',NULL,'','','',''),(409,244,'Pacific/Efate',NULL,'','','',''),(410,245,'Pacific/Wallis',NULL,'','','',''),(411,246,'Pacific/Apia',NULL,'','','',''),(412,247,'Asia/Aden',NULL,'','','',''),(413,248,'Indian/Mayotte',NULL,'','','',''),(414,249,'Africa/Johannesburg',NULL,'','','',''),(415,250,'Africa/Lusaka',NULL,'','','',''),(416,251,'Africa/Harare',NULL,'','','','');
/*!40000 ALTER TABLE `Timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransformationRuleSets`
--

DROP TABLE IF EXISTS `TransformationRuleSets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransformationRuleSets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL,
  `name_es` varchar(100) NOT NULL,
  `name_ca` varchar(100) NOT NULL,
  `name_it` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `internationalCode` varchar(10) DEFAULT '00',
  `trunkPrefix` varchar(5) DEFAULT '',
  `areaCode` varchar(5) DEFAULT '',
  `nationalLen` int unsigned DEFAULT '9',
  `brandId` int unsigned DEFAULT NULL,
  `countryId` int unsigned DEFAULT NULL,
  `generateRules` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_C272BD0FFBA2A6B4` (`countryId`),
  KEY `IDX_C272BD0F9CBEC244` (`brandId`),
  CONSTRAINT `FK_C272BD0F9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C272BD0FFBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransformationRuleSets`
--

LOCK TABLES `TransformationRuleSets` WRITE;
/*!40000 ALTER TABLE `TransformationRuleSets` DISABLE KEYS */;
INSERT INTO `TransformationRuleSets` VALUES (1,'Andorra','Andorra','Andorra','Andorra','Generic transformation for Andorra','00','','',7,NULL,1,0),(2,'United Arab Emirates','Emiratos Árabes Unidos','Emiratos Árabes Unidos','United Arab Emirates','Generic transformation for United Arab Emirates','00','0','',9,NULL,2,0),(3,'Afghanistan','Afganistán','Afganistán','Afghanistan','Generic transformation for Afghanistan','00','0','',9,NULL,3,0),(4,'Antigua and Barbuda','Antigua y Barbuda','Antigua y Barbuda','Antigua and Barbuda','Generic transformation for Antigua and Barbuda','00','1','',9,NULL,4,0),(5,'Anguilla','Anguila','Anguila','Anguilla','Generic transformation for Anguilla','00','1','',9,NULL,5,0),(6,'Albania','Albania','Albania','Albania','Generic transformation for Albania','00','0','',9,NULL,6,0),(7,'Armenia','Armenia','Armenia','Armenia','Generic transformation for Armenia','00','','',9,NULL,7,0),(8,'Angola','Angola','Angola','Angola','Generic transformation for Angola','00','','',9,NULL,8,0),(9,'Antarctica','Antártida','Antártida','Antarctica','Generic transformation for Antarctica','00','','',9,NULL,9,0),(10,'Argentina','Argentina','Argentina','Argentina','Generic transformation for Argentina','00','0','',9,NULL,10,0),(11,'American Samoa','Samoa Americana','Samoa Americana','American Samoa','Generic transformation for American Samoa','00','1','',9,NULL,11,0),(12,'Austria','Austria','Austria','Austria','Generic transformation for Austria','00','0','',9,NULL,12,0),(13,'Australia','Australia','Australia','Australia','Generic transformation for Australia','0011','0','',9,NULL,13,0),(14,'Aruba','Aruba','Aruba','Aruba','Generic transformation for Aruba','00','','',9,NULL,14,0),(15,'Åland Islands','Islas de Åland','Islas de Åland','Åland Islands','Generic transformation for Åland Islands','00','','',9,NULL,15,0),(16,'Azerbaijan','Azerbayán','Azerbayán','Azerbaijan','Generic transformation for Azerbaijan','00','8','',9,NULL,16,0),(17,'Bosnia and Herzegovina','Bosnia y Herzegovina','Bosnia y Herzegovina','Bosnia and Herzegovina','Generic transformation for Bosnia and Herzegovina','00','0','',9,NULL,17,0),(18,'Barbados','Barbados','Barbados','Barbados','Generic transformation for Barbados','00','1','',9,NULL,18,0),(19,'Bangladesh','Bangladesh','Bangladesh','Bangladesh','Generic transformation for Bangladesh','00','0','',9,NULL,19,0),(20,'Belgium','Bélgica','Bélgica','Belgium','Generic transformation for Belgium','00','0','',9,NULL,20,0),(21,'Burkina Faso','Burkina Faso','Burkina Faso','Burkina Faso','Generic transformation for Burkina Faso','00','','',9,NULL,21,0),(22,'Bulgaria','Bulgaria','Bulgaria','Bulgaria','Generic transformation for Bulgaria','00','0','',9,NULL,22,0),(23,'Bahrain','Bahrein','Bahrein','Bahrain','Generic transformation for Bahrain','00','','',9,NULL,23,0),(24,'Burundi','Burundi','Burundi','Burundi','Generic transformation for Burundi','00','','',9,NULL,24,0),(25,'Benin','Benín','Benín','Benin','Generic transformation for Benin','00','','',9,NULL,25,0),(26,'Saint Barthélemy','San Bartolomé','San Bartolomé','Saint Barthélemy','Generic transformation for Saint Barthélemy','00','','',9,NULL,26,0),(27,'Bermuda Islands','Islas Bermudas','Islas Bermudas','Bermuda Islands','Generic transformation for Bermuda Islands','00','1','',9,NULL,27,0),(28,'Brunei','Brunéi','Brunéi','Brunei','Generic transformation for Brunei','00','','',9,NULL,28,0),(29,'Bolivia','Bolivia','Bolivia','Bolivia','Generic transformation for Bolivia','00','0','',9,NULL,29,0),(30,'Bonaire','Bonaire','Bonaire','Bonaire','Generic transformation for Bonaire','00','','',9,NULL,30,0),(31,'Brazil','Brasil','Brasil','Brazil','Generic transformation for Brazil','00','0','',9,NULL,31,0),(32,'Bahamas','Bahamas','Bahamas','Bahamas','Generic transformation for Bahamas','00','1','',9,NULL,32,0),(33,'Bhutan','Bhután','Bhután','Bhutan','Generic transformation for Bhutan','00','','',9,NULL,33,0),(34,'Bouvet Island','Isla Bouvet','Isla Bouvet','Bouvet Island','Generic transformation for Bouvet Island','00','','',9,NULL,34,0),(35,'Botswana','Botsuana','Botsuana','Botswana','Generic transformation for Botswana','00','','',9,NULL,35,0),(36,'Belarus','Bielorrusia','Bielorrusia','Belarus','Generic transformation for Belarus','00','8','',9,NULL,36,0),(37,'Belize','Belice','Belice','Belize','Generic transformation for Belize','00','','',9,NULL,37,0),(38,'Canada','Canadá','Canadá','Canada','Generic transformation for Canada','011','1','',9,NULL,38,0),(39,'Cocos (Keeling) Islands','Islas Cocos (Keeling)','Islas Cocos (Keeling)','Cocos (Keeling) Islands','Generic transformation for Cocos (Keeling) Islands','00','','',9,NULL,39,0),(40,'Congo','Congo','Congo','Congo','Generic transformation for Congo','00','','',9,NULL,40,0),(41,'Central African Republic','República Centroafricana','República Centroafricana','Central African Republic','Generic transformation for Central African Republic','00','','',9,NULL,41,0),(42,'Congo','Congo','Congo','Congo','Generic transformation for Congo','00','','',9,NULL,42,0),(43,'Switzerland','Suiza','Suiza','Switzerland','Generic transformation for Switzerland','00','0','',9,NULL,43,0),(44,'Ivory Coast','Costa de Marfil','Costa de Marfil','Ivory Coast','Generic transformation for Ivory Coast','00','','',9,NULL,44,0),(45,'Cook Islands','Islas Cook','Islas Cook','Cook Islands','Generic transformation for Cook Islands','00','','',9,NULL,45,0),(46,'Chile','Chile','Chile','Chile','Generic transformation for Chile','00','','',9,NULL,46,0),(47,'Cameroon','Camerún','Camerún','Cameroon','Generic transformation for Cameroon','00','','',9,NULL,47,0),(48,'China','China','China','China','Generic transformation for China','00','0','',9,NULL,48,0),(49,'Colombia','Colombia','Colombia','Colombia','Generic transformation for Colombia','00','','',9,NULL,49,0),(50,'Costa Rica','Costa Rica','Costa Rica','Costa Rica','Generic transformation for Costa Rica','00','','',9,NULL,50,0),(51,'Cuba','Cuba','Cuba','Cuba','Generic transformation for Cuba','119','0','',7,NULL,51,0),(52,'Cape Verde','Cabo Verde','Cabo Verde','Cape Verde','Generic transformation for Cape Verde','00','','',9,NULL,52,0),(53,'Curaçao','Curaçao','Curaçao','Curaçao','Generic transformation for Curaçao','00','','',9,NULL,53,0),(54,'Christmas Island','Isla de Navidad','Isla de Navidad','Christmas Island','Generic transformation for Christmas Island','00','','',9,NULL,54,0),(55,'Cyprus','Chipre','Chipre','Cyprus','Generic transformation for Cyprus','00','0','',9,NULL,55,0),(56,'Czech Republic','República Checa','República Checa','Czech Republic','Generic transformation for Czech Republic','00','','',9,NULL,56,0),(57,'Germany','Alemania','Alemania','Germany','Generic transformation for Germany','00','','',9,NULL,57,0),(58,'Djibouti','Yibuti','Yibuti','Djibouti','Generic transformation for Djibouti','00','','',9,NULL,58,0),(59,'Denmark','Dinamarca','Dinamarca','Denmark','Generic transformation for Denmark','00','','',9,NULL,59,0),(60,'Dominica','Dominica','Dominica','Dominica','Generic transformation for Dominica','00','1','',9,NULL,60,0),(61,'Dominican Republic','República Dominicana','República Dominicana','Dominican Republic','Generic transformation for Dominican Republic','00','1','',9,NULL,61,0),(64,'Algeria','Algeria','Algeria','Algeria','Generic transformation for Algeria','00','','',9,NULL,64,0),(65,'Ecuador','Ecuador','Ecuador','Ecuador','Generic transformation for Ecuador','00','','',9,NULL,65,0),(66,'Estonia','Estonia','Estonia','Estonia','Generic transformation for Estonia','00','','',9,NULL,66,0),(67,'Egypt','Egipto','Egipto','Egypt','Generic transformation for Egypt','00','0','',9,NULL,67,0),(68,'Western Sahara','Sahara Occidental','Sahara Occidental','Western Sahara','Generic transformation for Western Sahara','00','','',9,NULL,68,0),(69,'Eritrea','Eritrea','Eritrea','Eritrea','Generic transformation for Eritrea','00','','',9,NULL,69,0),(70,'Spain','España','España','Spain','Generic transformation for Spain','00','','',9,NULL,70,0),(71,'Ethiopia','Etiopía','Etiopía','Ethiopia','Generic transformation for Ethiopia','00','','',9,NULL,71,0),(72,'Finland','Finlandia','Finlandia','Finland','Generic transformation for Finland','00','0','',9,NULL,72,0),(73,'Fiji','Fiyi','Fiyi','Fiji','Generic transformation for Fiji','00','','',9,NULL,73,0),(74,'Falkland Islands (Malvinas)','Islas Malvinas','Islas Malvinas','Falkland Islands (Malvinas)','Generic transformation for Falkland Islands (Malvinas)','00','','',9,NULL,74,0),(75,'Estados Federados de','Micronesia','Micronesia','Estados Federados de','Generic transformation for Estados Federados de','00','','',9,NULL,75,0),(76,'Faroe Islands','Islas Feroe','Islas Feroe','Faroe Islands','Generic transformation for Faroe Islands','00','','',9,NULL,76,0),(77,'France','Francia','Francia','France','Generic transformation for France','00','0','',9,NULL,77,0),(78,'Gabon','Gabón','Gabón','Gabon','Generic transformation for Gabon','00','','',9,NULL,78,0),(79,'United Kingdom','Reino Unido','Reino Unido','United Kingdom','Generic transformation for United Kingdom','00','0','',9,NULL,79,0),(80,'Grenada','Granada','Granada','Grenada','Generic transformation for Grenada','00','1','',9,NULL,80,0),(81,'Georgia','Georgia','Georgia','Georgia','Generic transformation for Georgia','00','','',9,NULL,81,0),(82,'French Guiana','Guayana Francesa','Guayana Francesa','French Guiana','Generic transformation for French Guiana','00','','',9,NULL,82,0),(83,'Guernsey','Guernsey','Guernsey','Guernsey','Generic transformation for Guernsey','00','','',9,NULL,83,0),(84,'Ghana','Ghana','Ghana','Ghana','Generic transformation for Ghana','00','','',9,NULL,84,0),(85,'Gibraltar','Gibraltar','Gibraltar','Gibraltar','Generic transformation for Gibraltar','00','','',9,NULL,85,0),(86,'Greenland','Groenlandia','Groenlandia','Greenland','Generic transformation for Greenland','00','','',9,NULL,86,0),(87,'Gambia','Gambia','Gambia','Gambia','Generic transformation for Gambia','00','','',9,NULL,87,0),(88,'Guinea','Guinea','Guinea','Guinea','Generic transformation for Guinea','00','','',9,NULL,88,0),(89,'Guadeloupe','Guadalupe','Guadalupe','Guadeloupe','Generic transformation for Guadeloupe','00','','',9,NULL,89,0),(90,'Equatorial Guinea','Guinea Ecuatorial','Guinea Ecuatorial','Equatorial Guinea','Generic transformation for Equatorial Guinea','00','','',9,NULL,90,0),(91,'Greece','Grecia','Grecia','Greece','Generic transformation for Greece','00','0','',9,NULL,91,0),(92,'South Georgia and the South Sandwich Islands','Islas Georgias del Sur y Sandwich del Sur','Islas Georgias del Sur y Sandwich del Sur','South Georgia and the South Sandwich Islands','Generic transformation for South Georgia and the South Sandwich Islands','00','','',9,NULL,92,0),(93,'Guatemala','Guatemala','Guatemala','Guatemala','Generic transformation for Guatemala','00','','',9,NULL,93,0),(94,'Guam','Guam','Guam','Guam','Generic transformation for Guam','00','1','',9,NULL,94,0),(95,'Guinea-Bissau','Guinea-Bissau','Guinea-Bissau','Guinea-Bissau','Generic transformation for Guinea-Bissau','00','','',9,NULL,95,0),(96,'Guyana','Guyana','Guyana','Guyana','Generic transformation for Guyana','00','','',9,NULL,96,0),(97,'Hong Kong','Hong kong','Hong kong','Hong Kong','Generic transformation for Hong Kong','00','','',9,NULL,97,0),(98,'Heard Island and McDonald Islands','Islas Heard y McDonald','Islas Heard y McDonald','Heard Island and McDonald Islands','Generic transformation for Heard Island and McDonald Islands','00','','',9,NULL,98,0),(99,'Honduras','Honduras','Honduras','Honduras','Generic transformation for Honduras','00','','',9,NULL,99,0),(100,'Croatia','Croacia','Croacia','Croatia','Generic transformation for Croatia','00','0','',9,NULL,100,0),(101,'Haiti','Haití','Haití','Haiti','Generic transformation for Haiti','00','','',9,NULL,101,0),(102,'Hungary','Hungría','Hungría','Hungary','Generic transformation for Hungary','00','06','',9,NULL,102,0),(103,'Indonesia','Indonesia','Indonesia','Indonesia','Generic transformation for Indonesia','00','0','',9,NULL,103,0),(104,'Ireland','Irlanda','Irlanda','Ireland','Generic transformation for Ireland','00','0','',9,NULL,104,0),(105,'Israel','Israel','Israel','Israel','Generic transformation for Israel','00','0','',9,NULL,105,0),(106,'Isle of Man','Isla de Man','Isla de Man','Isle of Man','Generic transformation for Isle of Man','00','','',9,NULL,106,0),(107,'India','India','India','India','Generic transformation for India','00','0','',9,NULL,107,0),(108,'British Indian Ocean Territory','Territorio Británico del Océano Índico','Territorio Británico del Océano Índico','British Indian Ocean Territory','Generic transformation for British Indian Ocean Territory','00','','',9,NULL,108,0),(109,'Iraq','Irak','Irak','Iraq','Generic transformation for Iraq','00','','',9,NULL,109,0),(110,'Iran','Irán','Irán','Iran','Generic transformation for Iran','00','0','',9,NULL,110,0),(111,'Iceland','Islandia','Islandia','Iceland','Generic transformation for Iceland','00','','',9,NULL,111,0),(112,'Italy','Italia','Italia','Italy','Generic transformation for Italy','00','','',9,NULL,112,0),(113,'Jersey','Jersey','Jersey','Jersey','Generic transformation for Jersey','00','','',9,NULL,113,0),(114,'Jamaica','Jamaica','Jamaica','Jamaica','Generic transformation for Jamaica','00','1','',9,NULL,114,0),(115,'Jordan','Jordania','Jordania','Jordan','Generic transformation for Jordan','00','0','',9,NULL,115,0),(116,'Japan','Japón','Japón','Japan','Generic transformation for Japan','010','0','',9,NULL,116,0),(117,'Kenya','Kenia','Kenia','Kenya','Generic transformation for Kenya','00','0','',9,NULL,117,0),(118,'Kyrgyzstan','Kirgizstán','Kirgizstán','Kyrgyzstan','Generic transformation for Kyrgyzstan','00','','',9,NULL,118,0),(119,'Cambodia','Camboya','Camboya','Cambodia','Generic transformation for Cambodia','00','0','',9,NULL,119,0),(120,'Kiribati','Kiribati','Kiribati','Kiribati','Generic transformation for Kiribati','00','','',9,NULL,120,0),(121,'Comoros','Comoras','Comoras','Comoros','Generic transformation for Comoros','00','','',9,NULL,121,0),(122,'Saint Kitts and Nevis','San Cristóbal y Nieves','San Cristóbal y Nieves','Saint Kitts and Nevis','Generic transformation for Saint Kitts and Nevis','00','1','',9,NULL,122,0),(123,'North Korea','Corea del Norte','Corea del Norte','North Korea','Generic transformation for North Korea','00','0','',9,NULL,123,0),(124,'South Korea','Corea del Sur','Corea del Sur','South Korea','Generic transformation for South Korea','00','0','',9,NULL,124,0),(125,'Kuwait','Kuwait','Kuwait','Kuwait','Generic transformation for Kuwait','00','','',9,NULL,125,0),(126,'Cayman Islands','Islas Caimán','Islas Caimán','Cayman Islands','Generic transformation for Cayman Islands','00','1','',9,NULL,126,0),(127,'Kazakhstan','Kazajistán','Kazajistán','Kazakhstan','Generic transformation for Kazakhstan','00','8','',9,NULL,127,0),(128,'Laos','Laos','Laos','Laos','Generic transformation for Laos','00','0','',9,NULL,128,0),(129,'Lebanon','Líbano','Líbano','Lebanon','Generic transformation for Lebanon','00','','',9,NULL,129,0),(130,'Saint Lucia','Santa Lucía','Santa Lucía','Saint Lucia','Generic transformation for Saint Lucia','00','1','',9,NULL,130,0),(131,'Liechtenstein','Liechtenstein','Liechtenstein','Liechtenstein','Generic transformation for Liechtenstein','00','','',9,NULL,131,0),(132,'Sri Lanka','Sri lanka','Sri lanka','Sri Lanka','Generic transformation for Sri Lanka','00','','',9,NULL,132,0),(133,'Liberia','Liberia','Liberia','Liberia','Generic transformation for Liberia','00','','',9,NULL,133,0),(134,'Lesotho','Lesoto','Lesoto','Lesotho','Generic transformation for Lesotho','00','','',9,NULL,134,0),(135,'Lithuania','Lituania','Lituania','Lithuania','Generic transformation for Lithuania','00','8','',9,NULL,135,0),(136,'Luxembourg','Luxemburgo','Luxemburgo','Luxembourg','Generic transformation for Luxembourg','00','','',9,NULL,136,0),(137,'Latvia','Letonia','Letonia','Latvia','Generic transformation for Latvia','00','','',9,NULL,137,0),(138,'Libya','Libia','Libia','Libya','Generic transformation for Libya','00','','',9,NULL,138,0),(139,'Morocco','Marruecos','Marruecos','Morocco','Generic transformation for Morocco','00','0','',9,NULL,139,0),(140,'Monaco','Mónaco','Mónaco','Monaco','Generic transformation for Monaco','00','','',9,NULL,140,0),(141,'Moldova','Moldavia','Moldavia','Moldova','Generic transformation for Moldova','00','0','',9,NULL,141,0),(142,'Montenegro','Montenegro','Montenegro','Montenegro','Generic transformation for Montenegro','00','0','',9,NULL,142,0),(143,'Saint Martin (French part)','San Martín (Francia)','San Martín (Francia)','Saint Martin (French part)','Generic transformation for Saint Martin (French part)','00','','',9,NULL,143,0),(144,'Madagascar','Madagascar','Madagascar','Madagascar','Generic transformation for Madagascar','00','','',9,NULL,144,0),(145,'Marshall Islands','Islas Marshall','Islas Marshall','Marshall Islands','Generic transformation for Marshall Islands','00','','',9,NULL,145,0),(146,'Macedonia','Macedônia','Macedônia','Macedonia','Generic transformation for Macedonia','00','0','',9,NULL,146,0),(147,'Mali','Mali','Mali','Mali','Generic transformation for Mali','00','','',9,NULL,147,0),(148,'Myanmar','Birmania','Birmania','Myanmar','Generic transformation for Myanmar','00','0','',9,NULL,148,0),(149,'Mongolia','Mongolia','Mongolia','Mongolia','Generic transformation for Mongolia','00','0','',9,NULL,149,0),(150,'Macao','Macao','Macao','Macao','Generic transformation for Macao','00','','',9,NULL,150,0),(151,'Northern Mariana Islands','Islas Marianas del Norte','Islas Marianas del Norte','Northern Mariana Islands','Generic transformation for Northern Mariana Islands','00','1','',9,NULL,151,0),(152,'Martinique','Martinica','Martinica','Martinique','Generic transformation for Martinique','00','','',9,NULL,152,0),(153,'Mauritania','Mauritania','Mauritania','Mauritania','Generic transformation for Mauritania','00','','',9,NULL,153,0),(154,'Montserrat','Montserrat','Montserrat','Montserrat','Generic transformation for Montserrat','00','1','',9,NULL,154,0),(155,'Malta','Malta','Malta','Malta','Generic transformation for Malta','00','','',9,NULL,155,0),(156,'Mauritius','Mauricio','Mauricio','Mauritius','Generic transformation for Mauritius','00','','',9,NULL,156,0),(157,'Maldives','Islas Maldivas','Islas Maldivas','Maldives','Generic transformation for Maldives','00','','',9,NULL,157,0),(158,'Malawi','Malawi','Malawi','Malawi','Generic transformation for Malawi','00','','',9,NULL,158,0),(159,'Mexico','México','México','Mexico','Generic transformation for Mexico','00','01','',9,NULL,159,0),(160,'Malaysia','Malasia','Malasia','Malaysia','Generic transformation for Malaysia','00','0','',9,NULL,160,0),(161,'Mozambique','Mozambique','Mozambique','Mozambique','Generic transformation for Mozambique','00','','',9,NULL,161,0),(162,'Namibia','Namibia','Namibia','Namibia','Generic transformation for Namibia','00','','',9,NULL,162,0),(163,'New Caledonia','Nueva Caledonia','Nueva Caledonia','New Caledonia','Generic transformation for New Caledonia','00','','',9,NULL,163,0),(164,'Niger','Niger','Niger','Niger','Generic transformation for Niger','00','','',9,NULL,164,0),(165,'Norfolk Island','Isla Norfolk','Isla Norfolk','Norfolk Island','Generic transformation for Norfolk Island','00','','',9,NULL,165,0),(166,'Nigeria','Nigeria','Nigeria','Nigeria','Generic transformation for Nigeria','00','0','',9,NULL,166,0),(167,'Nicaragua','Nicaragua','Nicaragua','Nicaragua','Generic transformation for Nicaragua','00','','',9,NULL,167,0),(168,'Netherlands','Países Bajos','Países Bajos','Netherlands','Generic transformation for Netherlands','00','0','',9,NULL,168,0),(169,'Norway','Noruega','Noruega','Norway','Generic transformation for Norway','00','','',9,NULL,169,0),(170,'Nepal','Nepal','Nepal','Nepal','Generic transformation for Nepal','00','','',9,NULL,170,0),(171,'Nauru','Nauru','Nauru','Nauru','Generic transformation for Nauru','00','','',9,NULL,171,0),(172,'Niue','Niue','Niue','Niue','Generic transformation for Niue','00','','',9,NULL,172,0),(173,'New Zealand','Nueva Zelanda','Nueva Zelanda','New Zealand','Generic transformation for New Zealand','00','0','',9,NULL,173,0),(174,'Oman','Omán','Omán','Oman','Generic transformation for Oman','00','','',9,NULL,174,0),(175,'Panama','Panamá','Panamá','Panama','Generic transformation for Panama','00','','',9,NULL,175,0),(176,'Peru','Perú','Perú','Peru','Generic transformation for Peru','00','0','',9,NULL,176,0),(177,'French Polynesia','Polinesia Francesa','Polinesia Francesa','French Polynesia','Generic transformation for French Polynesia','00','','',9,NULL,177,0),(178,'Papua New Guinea','Papúa Nueva Guinea','Papúa Nueva Guinea','Papua New Guinea','Generic transformation for Papua New Guinea','00','','',9,NULL,178,0),(179,'Philippines','Filipinas','Filipinas','Philippines','Generic transformation for Philippines','00','0','',9,NULL,179,0),(180,'Pakistan','Pakistán','Pakistán','Pakistan','Generic transformation for Pakistan','00','0','',9,NULL,180,0),(181,'Poland','Polonia','Polonia','Poland','Generic transformation for Poland','00','','',9,NULL,181,0),(182,'Saint Pierre and Miquelon','San Pedro y Miquelón','San Pedro y Miquelón','Saint Pierre and Miquelon','Generic transformation for Saint Pierre and Miquelon','00','','',9,NULL,182,0),(183,'Pitcairn Islands','Islas Pitcairn','Islas Pitcairn','Pitcairn Islands','Generic transformation for Pitcairn Islands','00','','',9,NULL,183,0),(184,'Puerto Rico','Puerto Rico','Puerto Rico','Puerto Rico','Generic transformation for Puerto Rico','00','1','',9,NULL,184,0),(185,'Palestine','Palestina','Palestina','Palestine','Generic transformation for Palestine','00','','',9,NULL,185,0),(186,'Portugal','Portugal','Portugal','Portugal','Generic transformation for Portugal','00','','',9,NULL,186,0),(187,'Palau','Palau','Palau','Palau','Generic transformation for Palau','00','','',9,NULL,187,0),(188,'Paraguay','Paraguay','Paraguay','Paraguay','Generic transformation for Paraguay','00','','',9,NULL,188,0),(189,'Qatar','Qatar','Qatar','Qatar','Generic transformation for Qatar','00','','',9,NULL,189,0),(190,'Réunion','Reunión','Reunión','Réunion','Generic transformation for Réunion','00','','',9,NULL,190,0),(191,'Romania','Rumanía','Rumanía','Romania','Generic transformation for Romania','00','0','',9,NULL,191,0),(192,'Serbia','Serbia','Serbia','Serbia','Generic transformation for Serbia','00','0','',9,NULL,192,0),(193,'Russia','Rusia','Rusia','Russia','Generic transformation for Russia','810','8','',10,NULL,193,0),(194,'Rwanda','Ruanda','Ruanda','Rwanda','Generic transformation for Rwanda','00','0','',9,NULL,194,0),(195,'Saudi Arabia','Arabia Saudita','Arabia Saudita','Saudi Arabia','Generic transformation for Saudi Arabia','00','0','',9,NULL,195,0),(196,'Solomon Islands','Islas Salomón','Islas Salomón','Solomon Islands','Generic transformation for Solomon Islands','00','','',9,NULL,196,0),(197,'Seychelles','Seychelles','Seychelles','Seychelles','Generic transformation for Seychelles','00','','',9,NULL,197,0),(198,'Sudan','Sudán','Sudán','Sudan','Generic transformation for Sudan','00','','',9,NULL,198,0),(199,'Sweden','Suecia','Suecia','Sweden','Generic transformation for Sweden','00','0','',9,NULL,199,0),(200,'Singapore','Singapur','Singapur','Singapore','Generic transformation for Singapore','00','','',9,NULL,200,0),(201,'Ascensión y Tristán de Acuña','Santa Elena','Santa Elena','Ascensión y Tristán de Acuña','Generic transformation for Ascensión y Tristán de Acuña','00','','',9,NULL,201,0),(202,'Slovenia','Eslovenia','Eslovenia','Slovenia','Generic transformation for Slovenia','00','0','',9,NULL,202,0),(203,'Svalbard and Jan Mayen','Svalbard y Jan Mayen','Svalbard y Jan Mayen','Svalbard and Jan Mayen','Generic transformation for Svalbard and Jan Mayen','00','','',9,NULL,203,0),(204,'Slovakia','Eslovaquia','Eslovaquia','Slovakia','Generic transformation for Slovakia','00','0','',9,NULL,204,0),(205,'Sierra Leone','Sierra Leona','Sierra Leona','Sierra Leone','Generic transformation for Sierra Leone','00','','',9,NULL,205,0),(206,'San Marino','San Marino','San Marino','San Marino','Generic transformation for San Marino','00','','',9,NULL,206,0),(207,'Senegal','Senegal','Senegal','Senegal','Generic transformation for Senegal','00','','',9,NULL,207,0),(208,'Somalia','Somalia','Somalia','Somalia','Generic transformation for Somalia','00','','',9,NULL,208,0),(209,'Suriname','Surinám','Surinám','Suriname','Generic transformation for Suriname','00','','',9,NULL,209,0),(210,'South Sudan','Sudán del Sur','Sudán del Sur','South Sudan','Generic transformation for South Sudan','00','','',9,NULL,210,0),(211,'Sao Tome and Principe','Santo Tomé y Príncipe','Santo Tomé y Príncipe','Sao Tome and Principe','Generic transformation for Sao Tome and Principe','00','','',9,NULL,211,0),(212,'El Salvador','El Salvador','El Salvador','El Salvador','Generic transformation for El Salvador','00','','',9,NULL,212,0),(213,'Sint Maarten (Dutch part)','Sint Maarten (parte neerlandesa)','Sint Maarten (parte neerlandesa)','Sint Maarten (Dutch part)','Generic transformation for Sint Maarten (Dutch part)','00','1','',9,NULL,213,0),(214,'Syria','Siria','Siria','Syria','Generic transformation for Syria','00','','',9,NULL,214,0),(215,'Swaziland','Swazilandia','Swazilandia','Swaziland','Generic transformation for Swaziland','00','','',9,NULL,215,0),(216,'Turks and Caicos Islands','Islas Turcas y Caicos','Islas Turcas y Caicos','Turks and Caicos Islands','Generic transformation for Turks and Caicos Islands','00','1','',9,NULL,216,0),(217,'Chad','Chad','Chad','Chad','Generic transformation for Chad','00','','',9,NULL,217,0),(218,'French Southern Territories','Territorios Australes y Antárticas Franceses','Territorios Australes y Antárticas Franceses','French Southern Territories','Generic transformation for French Southern Territories','00','','',9,NULL,218,0),(219,'Togo','Togo','Togo','Togo','Generic transformation for Togo','00','','',9,NULL,219,0),(220,'Thailand','Tailandia','Tailandia','Thailand','Generic transformation for Thailand','00','0','',9,NULL,220,0),(221,'Tajikistan','Tadjikistán','Tadjikistán','Tajikistan','Generic transformation for Tajikistan','00','','',9,NULL,221,0),(222,'Tokelau','Tokelau','Tokelau','Tokelau','Generic transformation for Tokelau','00','','',9,NULL,222,0),(223,'East Timor','Timor Oriental','Timor Oriental','East Timor','Generic transformation for East Timor','00','','',9,NULL,223,0),(224,'Turkmenistan','Turkmenistán','Turkmenistán','Turkmenistan','Generic transformation for Turkmenistan','00','8','',9,NULL,224,0),(225,'Tunisia','Tunez','Tunez','Tunisia','Generic transformation for Tunisia','00','','',9,NULL,225,0),(226,'Tonga','Tonga','Tonga','Tonga','Generic transformation for Tonga','00','','',9,NULL,226,0),(227,'Turkey','Turquía','Turquía','Turkey','Generic transformation for Turkey','00','0','',9,NULL,227,0),(228,'Trinidad and Tobago','Trinidad y Tobago','Trinidad y Tobago','Trinidad and Tobago','Generic transformation for Trinidad and Tobago','00','1','',9,NULL,228,0),(229,'Tuvalu','Tuvalu','Tuvalu','Tuvalu','Generic transformation for Tuvalu','00','','',9,NULL,229,0),(230,'Taiwan','Taiwán','Taiwán','Taiwan','Generic transformation for Taiwan','00','0','',9,NULL,230,0),(231,'Tanzania','Tanzania','Tanzania','Tanzania','Generic transformation for Tanzania','00','0','',9,NULL,231,0),(232,'Ukraine','Ucrania','Ucrania','Ukraine','Generic transformation for Ukraine','00','0','',9,NULL,232,0),(233,'Uganda','Uganda','Uganda','Uganda','Generic transformation for Uganda','00','','',9,NULL,233,0),(234,'United States Minor Outlying Islands','Islas Ultramarinas Menores de Estados Unidos','Islas Ultramarinas Menores de Estados Unidos','United States Minor Outlying Islands','Generic transformation for United States Minor Outlying Islands','00','','',9,NULL,234,0),(235,'United States of America','Estados Unidos de América','Estados Unidos de América','United States of America','Generic transformation for United States of America','011','1','',9,NULL,235,0),(236,'Uruguay','Uruguay','Uruguay','Uruguay','Generic transformation for Uruguay','00','','',9,NULL,236,0),(237,'Uzbekistan','Uzbekistán','Uzbekistán','Uzbekistan','Generic transformation for Uzbekistan','00','8','',9,NULL,237,0),(238,'Vatican City State','Ciudad del Vaticano','Ciudad del Vaticano','Vatican City State','Generic transformation for Vatican City State','00','','',9,NULL,238,0),(239,'Saint Vincent and the Grenadines','San Vicente y las Granadinas','San Vicente y las Granadinas','Saint Vincent and the Grenadines','Generic transformation for Saint Vincent and the Grenadines','00','1','',9,NULL,239,0),(240,'Venezuela','Venezuela','Venezuela','Venezuela','Generic transformation for Venezuela','00','0','',9,NULL,240,0),(241,'Virgin Islands','Islas Vírgenes Británicas','Islas Vírgenes Británicas','Virgin Islands','Generic transformation for Virgin Islands','00','1','',9,NULL,241,0),(242,'United States Virgin Islands','Islas Vírgenes de los Estados Unidos','Islas Vírgenes de los Estados Unidos','United States Virgin Islands','Generic transformation for United States Virgin Islands','00','1','',9,NULL,242,0),(243,'Vietnam','Vietnam','Vietnam','Vietnam','Generic transformation for Vietnam','00','0','',9,NULL,243,0),(244,'Vanuatu','Vanuatu','Vanuatu','Vanuatu','Generic transformation for Vanuatu','00','','',9,NULL,244,0),(245,'Wallis and Futuna','Wallis y Futuna','Wallis y Futuna','Wallis and Futuna','Generic transformation for Wallis and Futuna','00','','',9,NULL,245,0),(246,'Samoa','Samoa','Samoa','Samoa','Generic transformation for Samoa','00','','',9,NULL,246,0),(247,'Yemen','Yemen','Yemen','Yemen','Generic transformation for Yemen','00','','',9,NULL,247,0),(248,'Mayotte','Mayotte','Mayotte','Mayotte','Generic transformation for Mayotte','00','','',9,NULL,248,0),(249,'South Africa','Sudáfrica','Sudáfrica','South Africa','Generic transformation for South Africa','00','0','',9,NULL,249,0),(250,'Zambia','Zambia','Zambia','Zambia','Generic transformation for Zambia','00','','',9,NULL,250,0),(251,'Zimbabwe','Zimbabue','Zimbabue','Zimbabwe','Generic transformation for Zimbabwe','00','','',9,NULL,251,0),(252,'E.164','E.164','E.164','E.164','No numeric transformation','00','','',9,NULL,NULL,0),(253,'E.164 (w/o plus)','E.164 (sin +)','E.164 (sin +)','E.164 (w/o plus)','E.164 without plus notation','00','','',9,NULL,NULL,0);
/*!40000 ALTER TABLE `TransformationRuleSets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransformationRules`
--

DROP TABLE IF EXISTS `TransformationRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransformationRules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL COMMENT '[enum:callerin|calleein|callerout|calleeout]',
  `description` varchar(64) NOT NULL DEFAULT '',
  `priority` int unsigned DEFAULT NULL,
  `matchExpr` varchar(128) DEFAULT NULL,
  `replaceExpr` varchar(128) DEFAULT NULL,
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C82DE1742FECF701` (`transformationRuleSetId`),
  CONSTRAINT `FK_C82DE1742FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3063 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransformationRules`
--

LOCK TABLES `TransformationRules` WRITE;
/*!40000 ALTER TABLE `TransformationRules` DISABLE KEYS */;
INSERT INTO `TransformationRules` VALUES (1,'callerout','From e164 to out of area national',2,'^\\+971([0-9]{9})$','0\\1',2),(2,'callerout','From e164 to out of area national',2,'^\\+93([0-9]{9})$','0\\1',3),(3,'callerout','From e164 to out of area national',2,'^\\+1268([0-9]{9})$','1\\1',4),(4,'callerout','From e164 to out of area national',2,'^\\+1264([0-9]{9})$','1\\1',5),(5,'callerout','From e164 to out of area national',2,'^\\+355([0-9]{9})$','0\\1',6),(6,'callerout','From e164 to out of area national',2,'^\\+54([0-9]{9})$','0\\1',10),(7,'callerout','From e164 to out of area national',2,'^\\+1684([0-9]{9})$','1\\1',11),(8,'callerout','From e164 to out of area national',2,'^\\+43([0-9]{9})$','0\\1',12),(9,'callerout','From e164 to out of area national',2,'^\\+61([0-9]{9})$','0\\1',13),(10,'callerout','From e164 to out of area national',2,'^\\+994([0-9]{9})$','8\\1',16),(11,'callerout','From e164 to out of area national',2,'^\\+387([0-9]{9})$','0\\1',17),(12,'callerout','From e164 to out of area national',2,'^\\+1246([0-9]{9})$','1\\1',18),(13,'callerout','From e164 to out of area national',2,'^\\+880([0-9]{9})$','0\\1',19),(14,'callerout','From e164 to out of area national',2,'^\\+32([0-9]{9})$','0\\1',20),(15,'callerout','From e164 to out of area national',2,'^\\+359([0-9]{9})$','0\\1',22),(16,'callerout','From e164 to out of area national',2,'^\\+1441([0-9]{9})$','1\\1',27),(17,'callerout','From e164 to out of area national',2,'^\\+591([0-9]{9})$','0\\1',29),(18,'callerout','From e164 to out of area national',2,'^\\+55([0-9]{9})$','0\\1',31),(19,'callerout','From e164 to out of area national',2,'^\\+1242([0-9]{9})$','1\\1',32),(20,'callerout','From e164 to out of area national',2,'^\\+375([0-9]{9})$','8\\1',36),(21,'callerout','From e164 to out of area national',2,'^\\+1([0-9]{9})$','1\\1',38),(22,'callerout','From e164 to out of area national',2,'^\\+41([0-9]{9})$','0\\1',43),(23,'callerout','From e164 to out of area national',2,'^\\+86([0-9]{9})$','0\\1',48),(24,'callerout','From e164 to out of area national',2,'^\\+53([0-9]{7})$','0\\1',51),(25,'callerout','From e164 to out of area national',2,'^\\+357([0-9]{9})$','0\\1',55),(26,'callerout','From e164 to out of area national',2,'^\\+1767([0-9]{9})$','1\\1',60),(27,'callerout','From e164 to out of area national',2,'^\\+1809([0-9]{9})$','1\\1',61),(28,'callerout','From e164 to out of area national',2,'^\\+20([0-9]{9})$','0\\1',67),(29,'callerout','From e164 to out of area national',2,'^\\+358([0-9]{9})$','0\\1',72),(30,'callerout','From e164 to out of area national',2,'^\\+33([0-9]{9})$','0\\1',77),(31,'callerout','From e164 to out of area national',2,'^\\+44([0-9]{9})$','0\\1',79),(32,'callerout','From e164 to out of area national',2,'^\\+1473([0-9]{9})$','1\\1',80),(33,'callerout','From e164 to out of area national',2,'^\\+30([0-9]{9})$','0\\1',91),(34,'callerout','From e164 to out of area national',2,'^\\+1671([0-9]{9})$','1\\1',94),(35,'callerout','From e164 to out of area national',2,'^\\+385([0-9]{9})$','0\\1',100),(36,'callerout','From e164 to out of area national',2,'^\\+36([0-9]{9})$','06\\1',102),(37,'callerout','From e164 to out of area national',2,'^\\+62([0-9]{9})$','0\\1',103),(38,'callerout','From e164 to out of area national',2,'^\\+353([0-9]{9})$','0\\1',104),(39,'callerout','From e164 to out of area national',2,'^\\+972([0-9]{9})$','0\\1',105),(40,'callerout','From e164 to out of area national',2,'^\\+91([0-9]{9})$','0\\1',107),(41,'callerout','From e164 to out of area national',2,'^\\+98([0-9]{9})$','0\\1',110),(42,'callerout','From e164 to out of area national',2,'^\\+1876([0-9]{9})$','1\\1',114),(43,'callerout','From e164 to out of area national',2,'^\\+962([0-9]{9})$','0\\1',115),(44,'callerout','From e164 to out of area national',2,'^\\+81([0-9]{9})$','0\\1',116),(45,'callerout','From e164 to out of area national',2,'^\\+254([0-9]{9})$','0\\1',117),(46,'callerout','From e164 to out of area national',2,'^\\+855([0-9]{9})$','0\\1',119),(47,'callerout','From e164 to out of area national',2,'^\\+1869([0-9]{9})$','1\\1',122),(48,'callerout','From e164 to out of area national',2,'^\\+850([0-9]{9})$','0\\1',123),(49,'callerout','From e164 to out of area national',2,'^\\+82([0-9]{9})$','0\\1',124),(50,'callerout','From e164 to out of area national',2,'^\\+1345([0-9]{9})$','1\\1',126),(51,'callerout','From e164 to out of area national',2,'^\\+7([0-9]{9})$','8\\1',127),(52,'callerout','From e164 to out of area national',2,'^\\+856([0-9]{9})$','0\\1',128),(53,'callerout','From e164 to out of area national',2,'^\\+1758([0-9]{9})$','1\\1',130),(54,'callerout','From e164 to out of area national',2,'^\\+370([0-9]{9})$','8\\1',135),(55,'callerout','From e164 to out of area national',2,'^\\+212([0-9]{9})$','0\\1',139),(56,'callerout','From e164 to out of area national',2,'^\\+373([0-9]{9})$','0\\1',141),(57,'callerout','From e164 to out of area national',2,'^\\+382([0-9]{9})$','0\\1',142),(58,'callerout','From e164 to out of area national',2,'^\\+389([0-9]{9})$','0\\1',146),(59,'callerout','From e164 to out of area national',2,'^\\+95([0-9]{9})$','0\\1',148),(60,'callerout','From e164 to out of area national',2,'^\\+976([0-9]{9})$','0\\1',149),(61,'callerout','From e164 to out of area national',2,'^\\+1670([0-9]{9})$','1\\1',151),(62,'callerout','From e164 to out of area national',2,'^\\+1664([0-9]{9})$','1\\1',154),(63,'callerout','From e164 to out of area national',2,'^\\+52([0-9]{9})$','01\\1',159),(64,'callerout','From e164 to out of area national',2,'^\\+60([0-9]{9})$','0\\1',160),(65,'callerout','From e164 to out of area national',2,'^\\+234([0-9]{9})$','0\\1',166),(66,'callerout','From e164 to out of area national',2,'^\\+31([0-9]{9})$','0\\1',168),(67,'callerout','From e164 to out of area national',2,'^\\+64([0-9]{9})$','0\\1',173),(68,'callerout','From e164 to out of area national',2,'^\\+51([0-9]{9})$','0\\1',176),(69,'callerout','From e164 to out of area national',2,'^\\+63([0-9]{9})$','0\\1',179),(70,'callerout','From e164 to out of area national',2,'^\\+92([0-9]{9})$','0\\1',180),(71,'callerout','From e164 to out of area national',2,'^\\+1([0-9]{9})$','1\\1',184),(72,'callerout','From e164 to out of area national',2,'^\\+40([0-9]{9})$','0\\1',191),(73,'callerout','From e164 to out of area national',2,'^\\+381([0-9]{9})$','0\\1',192),(74,'callerout','From e164 to out of area national',2,'^\\+7([0-9]{10})$','8\\1',193),(75,'callerout','From e164 to out of area national',2,'^\\+250([0-9]{9})$','0\\1',194),(76,'callerout','From e164 to out of area national',2,'^\\+966([0-9]{9})$','0\\1',195),(77,'callerout','From e164 to out of area national',2,'^\\+46([0-9]{9})$','0\\1',199),(78,'callerout','From e164 to out of area national',2,'^\\+386([0-9]{9})$','0\\1',202),(79,'callerout','From e164 to out of area national',2,'^\\+421([0-9]{9})$','0\\1',204),(80,'callerout','From e164 to out of area national',2,'^\\+1721([0-9]{9})$','1\\1',213),(81,'callerout','From e164 to out of area national',2,'^\\+1649([0-9]{9})$','1\\1',216),(82,'callerout','From e164 to out of area national',2,'^\\+66([0-9]{9})$','0\\1',220),(83,'callerout','From e164 to out of area national',2,'^\\+993([0-9]{9})$','8\\1',224),(84,'callerout','From e164 to out of area national',2,'^\\+90([0-9]{9})$','0\\1',227),(85,'callerout','From e164 to out of area national',2,'^\\+1868([0-9]{9})$','1\\1',228),(86,'callerout','From e164 to out of area national',2,'^\\+886([0-9]{9})$','0\\1',230),(87,'callerout','From e164 to out of area national',2,'^\\+255([0-9]{9})$','0\\1',231),(88,'callerout','From e164 to out of area national',2,'^\\+380([0-9]{9})$','0\\1',232),(89,'callerout','From e164 to out of area national',2,'^\\+1([0-9]{9})$','1\\1',235),(90,'callerout','From e164 to out of area national',2,'^\\+998([0-9]{9})$','8\\1',237),(91,'callerout','From e164 to out of area national',2,'^\\+1784([0-9]{9})$','1\\1',239),(92,'callerout','From e164 to out of area national',2,'^\\+58([0-9]{9})$','0\\1',240),(93,'callerout','From e164 to out of area national',2,'^\\+1284([0-9]{9})$','1\\1',241),(94,'callerout','From e164 to out of area national',2,'^\\+1340([0-9]{9})$','1\\1',242),(95,'callerout','From e164 to out of area national',2,'^\\+84([0-9]{9})$','0\\1',243),(96,'callerout','From e164 to out of area national',2,'^\\+27([0-9]{9})$','0\\1',249),(128,'callerout','From e164 to national',3,'^\\+376([0-9]+)$','\\1',1),(129,'callerout','From e164 to national',3,'^\\+971([0-9]+)$','\\1',2),(130,'callerout','From e164 to national',3,'^\\+93([0-9]+)$','\\1',3),(131,'callerout','From e164 to national',3,'^\\+1268([0-9]+)$','\\1',4),(132,'callerout','From e164 to national',3,'^\\+1264([0-9]+)$','\\1',5),(133,'callerout','From e164 to national',3,'^\\+355([0-9]+)$','\\1',6),(134,'callerout','From e164 to national',3,'^\\+374([0-9]+)$','\\1',7),(135,'callerout','From e164 to national',3,'^\\+244([0-9]+)$','\\1',8),(136,'callerout','From e164 to national',3,'^\\+672([0-9]+)$','\\1',9),(137,'callerout','From e164 to national',3,'^\\+54([0-9]+)$','\\1',10),(138,'callerout','From e164 to national',3,'^\\+1684([0-9]+)$','\\1',11),(139,'callerout','From e164 to national',3,'^\\+43([0-9]+)$','\\1',12),(140,'callerout','From e164 to national',3,'^\\+61([0-9]+)$','\\1',13),(141,'callerout','From e164 to national',3,'^\\+297([0-9]+)$','\\1',14),(142,'callerout','From e164 to national',3,'^\\+358([0-9]+)$','\\1',15),(143,'callerout','From e164 to national',3,'^\\+994([0-9]+)$','\\1',16),(144,'callerout','From e164 to national',3,'^\\+387([0-9]+)$','\\1',17),(145,'callerout','From e164 to national',3,'^\\+1246([0-9]+)$','\\1',18),(146,'callerout','From e164 to national',3,'^\\+880([0-9]+)$','\\1',19),(147,'callerout','From e164 to national',3,'^\\+32([0-9]+)$','\\1',20),(148,'callerout','From e164 to national',3,'^\\+226([0-9]+)$','\\1',21),(149,'callerout','From e164 to national',3,'^\\+359([0-9]+)$','\\1',22),(150,'callerout','From e164 to national',3,'^\\+973([0-9]+)$','\\1',23),(151,'callerout','From e164 to national',3,'^\\+257([0-9]+)$','\\1',24),(152,'callerout','From e164 to national',3,'^\\+229([0-9]+)$','\\1',25),(153,'callerout','From e164 to national',3,'^\\+590([0-9]+)$','\\1',26),(154,'callerout','From e164 to national',3,'^\\+1441([0-9]+)$','\\1',27),(155,'callerout','From e164 to national',3,'^\\+673([0-9]+)$','\\1',28),(156,'callerout','From e164 to national',3,'^\\+591([0-9]+)$','\\1',29),(157,'callerout','From e164 to national',3,'^\\+599([0-9]+)$','\\1',30),(158,'callerout','From e164 to national',3,'^\\+55([0-9]+)$','\\1',31),(159,'callerout','From e164 to national',3,'^\\+1242([0-9]+)$','\\1',32),(160,'callerout','From e164 to national',3,'^\\+975([0-9]+)$','\\1',33),(161,'callerout','From e164 to national',3,'^\\+47([0-9]+)$','\\1',34),(162,'callerout','From e164 to national',3,'^\\+267([0-9]+)$','\\1',35),(163,'callerout','From e164 to national',3,'^\\+375([0-9]+)$','\\1',36),(164,'callerout','From e164 to national',3,'^\\+501([0-9]+)$','\\1',37),(165,'callerout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',38),(166,'callerout','From e164 to national',3,'^\\+61([0-9]+)$','\\1',39),(167,'callerout','From e164 to national',3,'^\\+243([0-9]+)$','\\1',40),(168,'callerout','From e164 to national',3,'^\\+236([0-9]+)$','\\1',41),(169,'callerout','From e164 to national',3,'^\\+242([0-9]+)$','\\1',42),(170,'callerout','From e164 to national',3,'^\\+41([0-9]+)$','\\1',43),(171,'callerout','From e164 to national',3,'^\\+225([0-9]+)$','\\1',44),(172,'callerout','From e164 to national',3,'^\\+682([0-9]+)$','\\1',45),(173,'callerout','From e164 to national',3,'^\\+56([0-9]+)$','\\1',46),(174,'callerout','From e164 to national',3,'^\\+237([0-9]+)$','\\1',47),(175,'callerout','From e164 to national',3,'^\\+86([0-9]+)$','\\1',48),(176,'callerout','From e164 to national',3,'^\\+57([0-9]+)$','\\1',49),(177,'callerout','From e164 to national',3,'^\\+506([0-9]+)$','\\1',50),(178,'callerout','From e164 to national',3,'^\\+53([0-9]+)$','\\1',51),(179,'callerout','From e164 to national',3,'^\\+238([0-9]+)$','\\1',52),(180,'callerout','From e164 to national',3,'^\\+599([0-9]+)$','\\1',53),(181,'callerout','From e164 to national',3,'^\\+61([0-9]+)$','\\1',54),(182,'callerout','From e164 to national',3,'^\\+357([0-9]+)$','\\1',55),(183,'callerout','From e164 to national',3,'^\\+420([0-9]+)$','\\1',56),(184,'callerout','From e164 to national',3,'^\\+49([0-9]+)$','\\1',57),(185,'callerout','From e164 to national',3,'^\\+253([0-9]+)$','\\1',58),(186,'callerout','From e164 to national',3,'^\\+45([0-9]+)$','\\1',59),(187,'callerout','From e164 to national',3,'^\\+1767([0-9]+)$','\\1',60),(188,'callerout','From e164 to national',3,'^\\+1809([0-9]+)$','\\1',61),(189,'callerout','From e164 to national',3,'^\\+213([0-9]+)$','\\1',64),(190,'callerout','From e164 to national',3,'^\\+593([0-9]+)$','\\1',65),(191,'callerout','From e164 to national',3,'^\\+372([0-9]+)$','\\1',66),(192,'callerout','From e164 to national',3,'^\\+20([0-9]+)$','\\1',67),(193,'callerout','From e164 to national',3,'^\\+212([0-9]+)$','\\1',68),(194,'callerout','From e164 to national',3,'^\\+291([0-9]+)$','\\1',69),(195,'callerout','From e164 to national',3,'^\\+34([0-9]+)$','\\1',70),(196,'callerout','From e164 to national',3,'^\\+251([0-9]+)$','\\1',71),(197,'callerout','From e164 to national',3,'^\\+358([0-9]+)$','\\1',72),(198,'callerout','From e164 to national',3,'^\\+679([0-9]+)$','\\1',73),(199,'callerout','From e164 to national',3,'^\\+500([0-9]+)$','\\1',74),(200,'callerout','From e164 to national',3,'^\\+691([0-9]+)$','\\1',75),(201,'callerout','From e164 to national',3,'^\\+298([0-9]+)$','\\1',76),(202,'callerout','From e164 to national',3,'^\\+33([0-9]+)$','\\1',77),(203,'callerout','From e164 to national',3,'^\\+241([0-9]+)$','\\1',78),(204,'callerout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',79),(205,'callerout','From e164 to national',3,'^\\+1473([0-9]+)$','\\1',80),(206,'callerout','From e164 to national',3,'^\\+995([0-9]+)$','\\1',81),(207,'callerout','From e164 to national',3,'^\\+594([0-9]+)$','\\1',82),(208,'callerout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',83),(209,'callerout','From e164 to national',3,'^\\+233([0-9]+)$','\\1',84),(210,'callerout','From e164 to national',3,'^\\+350([0-9]+)$','\\1',85),(211,'callerout','From e164 to national',3,'^\\+299([0-9]+)$','\\1',86),(212,'callerout','From e164 to national',3,'^\\+220([0-9]+)$','\\1',87),(213,'callerout','From e164 to national',3,'^\\+224([0-9]+)$','\\1',88),(214,'callerout','From e164 to national',3,'^\\+590([0-9]+)$','\\1',89),(215,'callerout','From e164 to national',3,'^\\+240([0-9]+)$','\\1',90),(216,'callerout','From e164 to national',3,'^\\+30([0-9]+)$','\\1',91),(217,'callerout','From e164 to national',3,'^\\+500([0-9]+)$','\\1',92),(218,'callerout','From e164 to national',3,'^\\+502([0-9]+)$','\\1',93),(219,'callerout','From e164 to national',3,'^\\+1671([0-9]+)$','\\1',94),(220,'callerout','From e164 to national',3,'^\\+245([0-9]+)$','\\1',95),(221,'callerout','From e164 to national',3,'^\\+592([0-9]+)$','\\1',96),(222,'callerout','From e164 to national',3,'^\\+852([0-9]+)$','\\1',97),(223,'callerout','From e164 to national',3,'^\\+672([0-9]+)$','\\1',98),(224,'callerout','From e164 to national',3,'^\\+504([0-9]+)$','\\1',99),(225,'callerout','From e164 to national',3,'^\\+385([0-9]+)$','\\1',100),(226,'callerout','From e164 to national',3,'^\\+509([0-9]+)$','\\1',101),(227,'callerout','From e164 to national',3,'^\\+36([0-9]+)$','\\1',102),(228,'callerout','From e164 to national',3,'^\\+62([0-9]+)$','\\1',103),(229,'callerout','From e164 to national',3,'^\\+353([0-9]+)$','\\1',104),(230,'callerout','From e164 to national',3,'^\\+972([0-9]+)$','\\1',105),(231,'callerout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',106),(232,'callerout','From e164 to national',3,'^\\+91([0-9]+)$','\\1',107),(233,'callerout','From e164 to national',3,'^\\+246([0-9]+)$','\\1',108),(234,'callerout','From e164 to national',3,'^\\+964([0-9]+)$','\\1',109),(235,'callerout','From e164 to national',3,'^\\+98([0-9]+)$','\\1',110),(236,'callerout','From e164 to national',3,'^\\+354([0-9]+)$','\\1',111),(237,'callerout','From e164 to national',3,'^\\+39([0-9]+)$','\\1',112),(238,'callerout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',113),(239,'callerout','From e164 to national',3,'^\\+1876([0-9]+)$','\\1',114),(240,'callerout','From e164 to national',3,'^\\+962([0-9]+)$','\\1',115),(241,'callerout','From e164 to national',3,'^\\+81([0-9]+)$','\\1',116),(242,'callerout','From e164 to national',3,'^\\+254([0-9]+)$','\\1',117),(243,'callerout','From e164 to national',3,'^\\+996([0-9]+)$','\\1',118),(244,'callerout','From e164 to national',3,'^\\+855([0-9]+)$','\\1',119),(245,'callerout','From e164 to national',3,'^\\+686([0-9]+)$','\\1',120),(246,'callerout','From e164 to national',3,'^\\+269([0-9]+)$','\\1',121),(247,'callerout','From e164 to national',3,'^\\+1869([0-9]+)$','\\1',122),(248,'callerout','From e164 to national',3,'^\\+850([0-9]+)$','\\1',123),(249,'callerout','From e164 to national',3,'^\\+82([0-9]+)$','\\1',124),(250,'callerout','From e164 to national',3,'^\\+965([0-9]+)$','\\1',125),(251,'callerout','From e164 to national',3,'^\\+1345([0-9]+)$','\\1',126),(252,'callerout','From e164 to national',3,'^\\+7([0-9]+)$','\\1',127),(253,'callerout','From e164 to national',3,'^\\+856([0-9]+)$','\\1',128),(254,'callerout','From e164 to national',3,'^\\+961([0-9]+)$','\\1',129),(255,'callerout','From e164 to national',3,'^\\+1758([0-9]+)$','\\1',130),(256,'callerout','From e164 to national',3,'^\\+423([0-9]+)$','\\1',131),(257,'callerout','From e164 to national',3,'^\\+94([0-9]+)$','\\1',132),(258,'callerout','From e164 to national',3,'^\\+231([0-9]+)$','\\1',133),(259,'callerout','From e164 to national',3,'^\\+266([0-9]+)$','\\1',134),(260,'callerout','From e164 to national',3,'^\\+370([0-9]+)$','\\1',135),(261,'callerout','From e164 to national',3,'^\\+352([0-9]+)$','\\1',136),(262,'callerout','From e164 to national',3,'^\\+371([0-9]+)$','\\1',137),(263,'callerout','From e164 to national',3,'^\\+218([0-9]+)$','\\1',138),(264,'callerout','From e164 to national',3,'^\\+212([0-9]+)$','\\1',139),(265,'callerout','From e164 to national',3,'^\\+377([0-9]+)$','\\1',140),(266,'callerout','From e164 to national',3,'^\\+373([0-9]+)$','\\1',141),(267,'callerout','From e164 to national',3,'^\\+382([0-9]+)$','\\1',142),(268,'callerout','From e164 to national',3,'^\\+1599([0-9]+)$','\\1',143),(269,'callerout','From e164 to national',3,'^\\+261([0-9]+)$','\\1',144),(270,'callerout','From e164 to national',3,'^\\+692([0-9]+)$','\\1',145),(271,'callerout','From e164 to national',3,'^\\+389([0-9]+)$','\\1',146),(272,'callerout','From e164 to national',3,'^\\+223([0-9]+)$','\\1',147),(273,'callerout','From e164 to national',3,'^\\+95([0-9]+)$','\\1',148),(274,'callerout','From e164 to national',3,'^\\+976([0-9]+)$','\\1',149),(275,'callerout','From e164 to national',3,'^\\+853([0-9]+)$','\\1',150),(276,'callerout','From e164 to national',3,'^\\+1670([0-9]+)$','\\1',151),(277,'callerout','From e164 to national',3,'^\\+596([0-9]+)$','\\1',152),(278,'callerout','From e164 to national',3,'^\\+222([0-9]+)$','\\1',153),(279,'callerout','From e164 to national',3,'^\\+1664([0-9]+)$','\\1',154),(280,'callerout','From e164 to national',3,'^\\+356([0-9]+)$','\\1',155),(281,'callerout','From e164 to national',3,'^\\+230([0-9]+)$','\\1',156),(282,'callerout','From e164 to national',3,'^\\+960([0-9]+)$','\\1',157),(283,'callerout','From e164 to national',3,'^\\+265([0-9]+)$','\\1',158),(284,'callerout','From e164 to national',3,'^\\+52([0-9]+)$','\\1',159),(285,'callerout','From e164 to national',3,'^\\+60([0-9]+)$','\\1',160),(286,'callerout','From e164 to national',3,'^\\+258([0-9]+)$','\\1',161),(287,'callerout','From e164 to national',3,'^\\+264([0-9]+)$','\\1',162),(288,'callerout','From e164 to national',3,'^\\+687([0-9]+)$','\\1',163),(289,'callerout','From e164 to national',3,'^\\+227([0-9]+)$','\\1',164),(290,'callerout','From e164 to national',3,'^\\+672([0-9]+)$','\\1',165),(291,'callerout','From e164 to national',3,'^\\+234([0-9]+)$','\\1',166),(292,'callerout','From e164 to national',3,'^\\+505([0-9]+)$','\\1',167),(293,'callerout','From e164 to national',3,'^\\+31([0-9]+)$','\\1',168),(294,'callerout','From e164 to national',3,'^\\+47([0-9]+)$','\\1',169),(295,'callerout','From e164 to national',3,'^\\+977([0-9]+)$','\\1',170),(296,'callerout','From e164 to national',3,'^\\+674([0-9]+)$','\\1',171),(297,'callerout','From e164 to national',3,'^\\+683([0-9]+)$','\\1',172),(298,'callerout','From e164 to national',3,'^\\+64([0-9]+)$','\\1',173),(299,'callerout','From e164 to national',3,'^\\+968([0-9]+)$','\\1',174),(300,'callerout','From e164 to national',3,'^\\+507([0-9]+)$','\\1',175),(301,'callerout','From e164 to national',3,'^\\+51([0-9]+)$','\\1',176),(302,'callerout','From e164 to national',3,'^\\+689([0-9]+)$','\\1',177),(303,'callerout','From e164 to national',3,'^\\+675([0-9]+)$','\\1',178),(304,'callerout','From e164 to national',3,'^\\+63([0-9]+)$','\\1',179),(305,'callerout','From e164 to national',3,'^\\+92([0-9]+)$','\\1',180),(306,'callerout','From e164 to national',3,'^\\+48([0-9]+)$','\\1',181),(307,'callerout','From e164 to national',3,'^\\+508([0-9]+)$','\\1',182),(308,'callerout','From e164 to national',3,'^\\+870([0-9]+)$','\\1',183),(309,'callerout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',184),(310,'callerout','From e164 to national',3,'^\\+970([0-9]+)$','\\1',185),(311,'callerout','From e164 to national',3,'^\\+351([0-9]+)$','\\1',186),(312,'callerout','From e164 to national',3,'^\\+680([0-9]+)$','\\1',187),(313,'callerout','From e164 to national',3,'^\\+595([0-9]+)$','\\1',188),(314,'callerout','From e164 to national',3,'^\\+974([0-9]+)$','\\1',189),(315,'callerout','From e164 to national',3,'^\\+262([0-9]+)$','\\1',190),(316,'callerout','From e164 to national',3,'^\\+40([0-9]+)$','\\1',191),(317,'callerout','From e164 to national',3,'^\\+381([0-9]+)$','\\1',192),(318,'callerout','From e164 to national',3,'^\\+7([0-9]+)$','\\1',193),(319,'callerout','From e164 to national',3,'^\\+250([0-9]+)$','\\1',194),(320,'callerout','From e164 to national',3,'^\\+966([0-9]+)$','\\1',195),(321,'callerout','From e164 to national',3,'^\\+677([0-9]+)$','\\1',196),(322,'callerout','From e164 to national',3,'^\\+248([0-9]+)$','\\1',197),(323,'callerout','From e164 to national',3,'^\\+249([0-9]+)$','\\1',198),(324,'callerout','From e164 to national',3,'^\\+46([0-9]+)$','\\1',199),(325,'callerout','From e164 to national',3,'^\\+65([0-9]+)$','\\1',200),(326,'callerout','From e164 to national',3,'^\\+290([0-9]+)$','\\1',201),(327,'callerout','From e164 to national',3,'^\\+386([0-9]+)$','\\1',202),(328,'callerout','From e164 to national',3,'^\\+47([0-9]+)$','\\1',203),(329,'callerout','From e164 to national',3,'^\\+421([0-9]+)$','\\1',204),(330,'callerout','From e164 to national',3,'^\\+232([0-9]+)$','\\1',205),(331,'callerout','From e164 to national',3,'^\\+378([0-9]+)$','\\1',206),(332,'callerout','From e164 to national',3,'^\\+221([0-9]+)$','\\1',207),(333,'callerout','From e164 to national',3,'^\\+252([0-9]+)$','\\1',208),(334,'callerout','From e164 to national',3,'^\\+597([0-9]+)$','\\1',209),(335,'callerout','From e164 to national',3,'^\\+211([0-9]+)$','\\1',210),(336,'callerout','From e164 to national',3,'^\\+239([0-9]+)$','\\1',211),(337,'callerout','From e164 to national',3,'^\\+503([0-9]+)$','\\1',212),(338,'callerout','From e164 to national',3,'^\\+1721([0-9]+)$','\\1',213),(339,'callerout','From e164 to national',3,'^\\+963([0-9]+)$','\\1',214),(340,'callerout','From e164 to national',3,'^\\+268([0-9]+)$','\\1',215),(341,'callerout','From e164 to national',3,'^\\+1649([0-9]+)$','\\1',216),(342,'callerout','From e164 to national',3,'^\\+235([0-9]+)$','\\1',217),(343,'callerout','From e164 to national',3,'^\\+262([0-9]+)$','\\1',218),(344,'callerout','From e164 to national',3,'^\\+228([0-9]+)$','\\1',219),(345,'callerout','From e164 to national',3,'^\\+66([0-9]+)$','\\1',220),(346,'callerout','From e164 to national',3,'^\\+992([0-9]+)$','\\1',221),(347,'callerout','From e164 to national',3,'^\\+690([0-9]+)$','\\1',222),(348,'callerout','From e164 to national',3,'^\\+670([0-9]+)$','\\1',223),(349,'callerout','From e164 to national',3,'^\\+993([0-9]+)$','\\1',224),(350,'callerout','From e164 to national',3,'^\\+216([0-9]+)$','\\1',225),(351,'callerout','From e164 to national',3,'^\\+676([0-9]+)$','\\1',226),(352,'callerout','From e164 to national',3,'^\\+90([0-9]+)$','\\1',227),(353,'callerout','From e164 to national',3,'^\\+1868([0-9]+)$','\\1',228),(354,'callerout','From e164 to national',3,'^\\+688([0-9]+)$','\\1',229),(355,'callerout','From e164 to national',3,'^\\+886([0-9]+)$','\\1',230),(356,'callerout','From e164 to national',3,'^\\+255([0-9]+)$','\\1',231),(357,'callerout','From e164 to national',3,'^\\+380([0-9]+)$','\\1',232),(358,'callerout','From e164 to national',3,'^\\+256([0-9]+)$','\\1',233),(359,'callerout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',234),(360,'callerout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',235),(361,'callerout','From e164 to national',3,'^\\+598([0-9]+)$','\\1',236),(362,'callerout','From e164 to national',3,'^\\+998([0-9]+)$','\\1',237),(363,'callerout','From e164 to national',3,'^\\+39([0-9]+)$','\\1',238),(364,'callerout','From e164 to national',3,'^\\+1784([0-9]+)$','\\1',239),(365,'callerout','From e164 to national',3,'^\\+58([0-9]+)$','\\1',240),(366,'callerout','From e164 to national',3,'^\\+1284([0-9]+)$','\\1',241),(367,'callerout','From e164 to national',3,'^\\+1340([0-9]+)$','\\1',242),(368,'callerout','From e164 to national',3,'^\\+84([0-9]+)$','\\1',243),(369,'callerout','From e164 to national',3,'^\\+678([0-9]+)$','\\1',244),(370,'callerout','From e164 to national',3,'^\\+681([0-9]+)$','\\1',245),(371,'callerout','From e164 to national',3,'^\\+685([0-9]+)$','\\1',246),(372,'callerout','From e164 to national',3,'^\\+967([0-9]+)$','\\1',247),(373,'callerout','From e164 to national',3,'^\\+262([0-9]+)$','\\1',248),(374,'callerout','From e164 to national',3,'^\\+27([0-9]+)$','\\1',249),(375,'callerout','From e164 to national',3,'^\\+260([0-9]+)$','\\1',250),(376,'callerout','From e164 to national',3,'^\\+263([0-9]+)$','\\1',251),(383,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',1),(384,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',2),(385,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',3),(386,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',4),(387,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',5),(388,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',6),(389,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',7),(390,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',8),(391,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',9),(392,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',10),(393,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',11),(394,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',12),(395,'callerout','From e164 to international',4,'^\\+([0-9]+)$','0011\\1',13),(396,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',14),(397,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',15),(398,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',16),(399,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',17),(400,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',18),(401,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',19),(402,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',20),(403,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',21),(404,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',22),(405,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',23),(406,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',24),(407,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',25),(408,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',26),(409,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',27),(410,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',28),(411,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',29),(412,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',30),(413,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',31),(414,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',32),(415,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',33),(416,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',34),(417,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',35),(418,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',36),(419,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',37),(420,'callerout','From e164 to international',4,'^\\+([0-9]+)$','011\\1',38),(421,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',39),(422,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',40),(423,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',41),(424,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',42),(425,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',43),(426,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',44),(427,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',45),(428,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',46),(429,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',47),(430,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',48),(431,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',49),(432,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',50),(433,'callerout','From e164 to international',4,'^\\+([0-9]+)$','119\\1',51),(434,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',52),(435,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',53),(436,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',54),(437,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',55),(438,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',56),(439,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',57),(440,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',58),(441,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',59),(442,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',60),(443,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',61),(444,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',64),(445,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',65),(446,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',66),(447,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',67),(448,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',68),(449,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',69),(450,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',70),(451,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',71),(452,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',72),(453,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',73),(454,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',74),(455,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',75),(456,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',76),(457,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',77),(458,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',78),(459,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',79),(460,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',80),(461,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',81),(462,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',82),(463,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',83),(464,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',84),(465,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',85),(466,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',86),(467,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',87),(468,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',88),(469,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',89),(470,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',90),(471,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',91),(472,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',92),(473,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',93),(474,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',94),(475,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',95),(476,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',96),(477,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',97),(478,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',98),(479,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',99),(480,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',100),(481,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',101),(482,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',102),(483,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',103),(484,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',104),(485,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',105),(486,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',106),(487,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',107),(488,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',108),(489,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',109),(490,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',110),(491,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',111),(492,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',112),(493,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',113),(494,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',114),(495,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',115),(496,'callerout','From e164 to international',4,'^\\+([0-9]+)$','010\\1',116),(497,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',117),(498,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',118),(499,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',119),(500,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',120),(501,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',121),(502,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',122),(503,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',123),(504,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',124),(505,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',125),(506,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',126),(507,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',127),(508,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',128),(509,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',129),(510,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',130),(511,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',131),(512,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',132),(513,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',133),(514,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',134),(515,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',135),(516,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',136),(517,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',137),(518,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',138),(519,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',139),(520,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',140),(521,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',141),(522,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',142),(523,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',143),(524,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',144),(525,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',145),(526,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',146),(527,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',147),(528,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',148),(529,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',149),(530,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',150),(531,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',151),(532,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',152),(533,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',153),(534,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',154),(535,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',155),(536,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',156),(537,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',157),(538,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',158),(539,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',159),(540,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',160),(541,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',161),(542,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',162),(543,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',163),(544,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',164),(545,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',165),(546,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',166),(547,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',167),(548,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',168),(549,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',169),(550,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',170),(551,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',171),(552,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',172),(553,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',173),(554,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',174),(555,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',175),(556,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',176),(557,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',177),(558,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',178),(559,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',179),(560,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',180),(561,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',181),(562,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',182),(563,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',183),(564,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',184),(565,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',185),(566,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',186),(567,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',187),(568,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',188),(569,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',189),(570,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',190),(571,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',191),(572,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',192),(573,'callerout','From e164 to international',4,'^\\+([0-9]+)$','810\\1',193),(574,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',194),(575,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',195),(576,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',196),(577,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',197),(578,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',198),(579,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',199),(580,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',200),(581,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',201),(582,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',202),(583,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',203),(584,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',204),(585,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',205),(586,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',206),(587,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',207),(588,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',208),(589,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',209),(590,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',210),(591,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',211),(592,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',212),(593,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',213),(594,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',214),(595,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',215),(596,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',216),(597,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',217),(598,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',218),(599,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',219),(600,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',220),(601,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',221),(602,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',222),(603,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',223),(604,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',224),(605,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',225),(606,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',226),(607,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',227),(608,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',228),(609,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',229),(610,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',230),(611,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',231),(612,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',232),(613,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',233),(614,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',234),(615,'callerout','From e164 to international',4,'^\\+([0-9]+)$','011\\1',235),(616,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',236),(617,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',237),(618,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',238),(619,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',239),(620,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',240),(621,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',241),(622,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',242),(623,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',243),(624,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',244),(625,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',245),(626,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',246),(627,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',247),(628,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',248),(629,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',249),(630,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',250),(631,'callerout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',251),(638,'calleeout','From e164 to out of area national',2,'^\\+971([0-9]{9})$','0\\1',2),(639,'calleeout','From e164 to out of area national',2,'^\\+93([0-9]{9})$','0\\1',3),(640,'calleeout','From e164 to out of area national',2,'^\\+1268([0-9]{9})$','1\\1',4),(641,'calleeout','From e164 to out of area national',2,'^\\+1264([0-9]{9})$','1\\1',5),(642,'calleeout','From e164 to out of area national',2,'^\\+355([0-9]{9})$','0\\1',6),(643,'calleeout','From e164 to out of area national',2,'^\\+54([0-9]{9})$','0\\1',10),(644,'calleeout','From e164 to out of area national',2,'^\\+1684([0-9]{9})$','1\\1',11),(645,'calleeout','From e164 to out of area national',2,'^\\+43([0-9]{9})$','0\\1',12),(646,'calleeout','From e164 to out of area national',2,'^\\+61([0-9]{9})$','0\\1',13),(647,'calleeout','From e164 to out of area national',2,'^\\+994([0-9]{9})$','8\\1',16),(648,'calleeout','From e164 to out of area national',2,'^\\+387([0-9]{9})$','0\\1',17),(649,'calleeout','From e164 to out of area national',2,'^\\+1246([0-9]{9})$','1\\1',18),(650,'calleeout','From e164 to out of area national',2,'^\\+880([0-9]{9})$','0\\1',19),(651,'calleeout','From e164 to out of area national',2,'^\\+32([0-9]{9})$','0\\1',20),(652,'calleeout','From e164 to out of area national',2,'^\\+359([0-9]{9})$','0\\1',22),(653,'calleeout','From e164 to out of area national',2,'^\\+1441([0-9]{9})$','1\\1',27),(654,'calleeout','From e164 to out of area national',2,'^\\+591([0-9]{9})$','0\\1',29),(655,'calleeout','From e164 to out of area national',2,'^\\+55([0-9]{9})$','0\\1',31),(656,'calleeout','From e164 to out of area national',2,'^\\+1242([0-9]{9})$','1\\1',32),(657,'calleeout','From e164 to out of area national',2,'^\\+375([0-9]{9})$','8\\1',36),(658,'calleeout','From e164 to out of area national',2,'^\\+1([0-9]{9})$','1\\1',38),(659,'calleeout','From e164 to out of area national',2,'^\\+41([0-9]{9})$','0\\1',43),(660,'calleeout','From e164 to out of area national',2,'^\\+86([0-9]{9})$','0\\1',48),(661,'calleeout','From e164 to out of area national',2,'^\\+53([0-9]{7})$','0\\1',51),(662,'calleeout','From e164 to out of area national',2,'^\\+357([0-9]{9})$','0\\1',55),(663,'calleeout','From e164 to out of area national',2,'^\\+1767([0-9]{9})$','1\\1',60),(664,'calleeout','From e164 to out of area national',2,'^\\+1809([0-9]{9})$','1\\1',61),(665,'calleeout','From e164 to out of area national',2,'^\\+20([0-9]{9})$','0\\1',67),(666,'calleeout','From e164 to out of area national',2,'^\\+358([0-9]{9})$','0\\1',72),(667,'calleeout','From e164 to out of area national',2,'^\\+33([0-9]{9})$','0\\1',77),(668,'calleeout','From e164 to out of area national',2,'^\\+44([0-9]{9})$','0\\1',79),(669,'calleeout','From e164 to out of area national',2,'^\\+1473([0-9]{9})$','1\\1',80),(670,'calleeout','From e164 to out of area national',2,'^\\+30([0-9]{9})$','0\\1',91),(671,'calleeout','From e164 to out of area national',2,'^\\+1671([0-9]{9})$','1\\1',94),(672,'calleeout','From e164 to out of area national',2,'^\\+385([0-9]{9})$','0\\1',100),(673,'calleeout','From e164 to out of area national',2,'^\\+36([0-9]{9})$','06\\1',102),(674,'calleeout','From e164 to out of area national',2,'^\\+62([0-9]{9})$','0\\1',103),(675,'calleeout','From e164 to out of area national',2,'^\\+353([0-9]{9})$','0\\1',104),(676,'calleeout','From e164 to out of area national',2,'^\\+972([0-9]{9})$','0\\1',105),(677,'calleeout','From e164 to out of area national',2,'^\\+91([0-9]{9})$','0\\1',107),(678,'calleeout','From e164 to out of area national',2,'^\\+98([0-9]{9})$','0\\1',110),(679,'calleeout','From e164 to out of area national',2,'^\\+1876([0-9]{9})$','1\\1',114),(680,'calleeout','From e164 to out of area national',2,'^\\+962([0-9]{9})$','0\\1',115),(681,'calleeout','From e164 to out of area national',2,'^\\+81([0-9]{9})$','0\\1',116),(682,'calleeout','From e164 to out of area national',2,'^\\+254([0-9]{9})$','0\\1',117),(683,'calleeout','From e164 to out of area national',2,'^\\+855([0-9]{9})$','0\\1',119),(684,'calleeout','From e164 to out of area national',2,'^\\+1869([0-9]{9})$','1\\1',122),(685,'calleeout','From e164 to out of area national',2,'^\\+850([0-9]{9})$','0\\1',123),(686,'calleeout','From e164 to out of area national',2,'^\\+82([0-9]{9})$','0\\1',124),(687,'calleeout','From e164 to out of area national',2,'^\\+1345([0-9]{9})$','1\\1',126),(688,'calleeout','From e164 to out of area national',2,'^\\+7([0-9]{9})$','8\\1',127),(689,'calleeout','From e164 to out of area national',2,'^\\+856([0-9]{9})$','0\\1',128),(690,'calleeout','From e164 to out of area national',2,'^\\+1758([0-9]{9})$','1\\1',130),(691,'calleeout','From e164 to out of area national',2,'^\\+370([0-9]{9})$','8\\1',135),(692,'calleeout','From e164 to out of area national',2,'^\\+212([0-9]{9})$','0\\1',139),(693,'calleeout','From e164 to out of area national',2,'^\\+373([0-9]{9})$','0\\1',141),(694,'calleeout','From e164 to out of area national',2,'^\\+382([0-9]{9})$','0\\1',142),(695,'calleeout','From e164 to out of area national',2,'^\\+389([0-9]{9})$','0\\1',146),(696,'calleeout','From e164 to out of area national',2,'^\\+95([0-9]{9})$','0\\1',148),(697,'calleeout','From e164 to out of area national',2,'^\\+976([0-9]{9})$','0\\1',149),(698,'calleeout','From e164 to out of area national',2,'^\\+1670([0-9]{9})$','1\\1',151),(699,'calleeout','From e164 to out of area national',2,'^\\+1664([0-9]{9})$','1\\1',154),(700,'calleeout','From e164 to out of area national',2,'^\\+52([0-9]{9})$','01\\1',159),(701,'calleeout','From e164 to out of area national',2,'^\\+60([0-9]{9})$','0\\1',160),(702,'calleeout','From e164 to out of area national',2,'^\\+234([0-9]{9})$','0\\1',166),(703,'calleeout','From e164 to out of area national',2,'^\\+31([0-9]{9})$','0\\1',168),(704,'calleeout','From e164 to out of area national',2,'^\\+64([0-9]{9})$','0\\1',173),(705,'calleeout','From e164 to out of area national',2,'^\\+51([0-9]{9})$','0\\1',176),(706,'calleeout','From e164 to out of area national',2,'^\\+63([0-9]{9})$','0\\1',179),(707,'calleeout','From e164 to out of area national',2,'^\\+92([0-9]{9})$','0\\1',180),(708,'calleeout','From e164 to out of area national',2,'^\\+1([0-9]{9})$','1\\1',184),(709,'calleeout','From e164 to out of area national',2,'^\\+40([0-9]{9})$','0\\1',191),(710,'calleeout','From e164 to out of area national',2,'^\\+381([0-9]{9})$','0\\1',192),(711,'calleeout','From e164 to out of area national',2,'^\\+7([0-9]{10})$','8\\1',193),(712,'calleeout','From e164 to out of area national',2,'^\\+250([0-9]{9})$','0\\1',194),(713,'calleeout','From e164 to out of area national',2,'^\\+966([0-9]{9})$','0\\1',195),(714,'calleeout','From e164 to out of area national',2,'^\\+46([0-9]{9})$','0\\1',199),(715,'calleeout','From e164 to out of area national',2,'^\\+386([0-9]{9})$','0\\1',202),(716,'calleeout','From e164 to out of area national',2,'^\\+421([0-9]{9})$','0\\1',204),(717,'calleeout','From e164 to out of area national',2,'^\\+1721([0-9]{9})$','1\\1',213),(718,'calleeout','From e164 to out of area national',2,'^\\+1649([0-9]{9})$','1\\1',216),(719,'calleeout','From e164 to out of area national',2,'^\\+66([0-9]{9})$','0\\1',220),(720,'calleeout','From e164 to out of area national',2,'^\\+993([0-9]{9})$','8\\1',224),(721,'calleeout','From e164 to out of area national',2,'^\\+90([0-9]{9})$','0\\1',227),(722,'calleeout','From e164 to out of area national',2,'^\\+1868([0-9]{9})$','1\\1',228),(723,'calleeout','From e164 to out of area national',2,'^\\+886([0-9]{9})$','0\\1',230),(724,'calleeout','From e164 to out of area national',2,'^\\+255([0-9]{9})$','0\\1',231),(725,'calleeout','From e164 to out of area national',2,'^\\+380([0-9]{9})$','0\\1',232),(726,'calleeout','From e164 to out of area national',2,'^\\+1([0-9]{9})$','1\\1',235),(727,'calleeout','From e164 to out of area national',2,'^\\+998([0-9]{9})$','8\\1',237),(728,'calleeout','From e164 to out of area national',2,'^\\+1784([0-9]{9})$','1\\1',239),(729,'calleeout','From e164 to out of area national',2,'^\\+58([0-9]{9})$','0\\1',240),(730,'calleeout','From e164 to out of area national',2,'^\\+1284([0-9]{9})$','1\\1',241),(731,'calleeout','From e164 to out of area national',2,'^\\+1340([0-9]{9})$','1\\1',242),(732,'calleeout','From e164 to out of area national',2,'^\\+84([0-9]{9})$','0\\1',243),(733,'calleeout','From e164 to out of area national',2,'^\\+27([0-9]{9})$','0\\1',249),(765,'calleeout','From e164 to national',3,'^\\+376([0-9]+)$','\\1',1),(766,'calleeout','From e164 to national',3,'^\\+971([0-9]+)$','\\1',2),(767,'calleeout','From e164 to national',3,'^\\+93([0-9]+)$','\\1',3),(768,'calleeout','From e164 to national',3,'^\\+1268([0-9]+)$','\\1',4),(769,'calleeout','From e164 to national',3,'^\\+1264([0-9]+)$','\\1',5),(770,'calleeout','From e164 to national',3,'^\\+355([0-9]+)$','\\1',6),(771,'calleeout','From e164 to national',3,'^\\+374([0-9]+)$','\\1',7),(772,'calleeout','From e164 to national',3,'^\\+244([0-9]+)$','\\1',8),(773,'calleeout','From e164 to national',3,'^\\+672([0-9]+)$','\\1',9),(774,'calleeout','From e164 to national',3,'^\\+54([0-9]+)$','\\1',10),(775,'calleeout','From e164 to national',3,'^\\+1684([0-9]+)$','\\1',11),(776,'calleeout','From e164 to national',3,'^\\+43([0-9]+)$','\\1',12),(777,'calleeout','From e164 to national',3,'^\\+61([0-9]+)$','\\1',13),(778,'calleeout','From e164 to national',3,'^\\+297([0-9]+)$','\\1',14),(779,'calleeout','From e164 to national',3,'^\\+358([0-9]+)$','\\1',15),(780,'calleeout','From e164 to national',3,'^\\+994([0-9]+)$','\\1',16),(781,'calleeout','From e164 to national',3,'^\\+387([0-9]+)$','\\1',17),(782,'calleeout','From e164 to national',3,'^\\+1246([0-9]+)$','\\1',18),(783,'calleeout','From e164 to national',3,'^\\+880([0-9]+)$','\\1',19),(784,'calleeout','From e164 to national',3,'^\\+32([0-9]+)$','\\1',20),(785,'calleeout','From e164 to national',3,'^\\+226([0-9]+)$','\\1',21),(786,'calleeout','From e164 to national',3,'^\\+359([0-9]+)$','\\1',22),(787,'calleeout','From e164 to national',3,'^\\+973([0-9]+)$','\\1',23),(788,'calleeout','From e164 to national',3,'^\\+257([0-9]+)$','\\1',24),(789,'calleeout','From e164 to national',3,'^\\+229([0-9]+)$','\\1',25),(790,'calleeout','From e164 to national',3,'^\\+590([0-9]+)$','\\1',26),(791,'calleeout','From e164 to national',3,'^\\+1441([0-9]+)$','\\1',27),(792,'calleeout','From e164 to national',3,'^\\+673([0-9]+)$','\\1',28),(793,'calleeout','From e164 to national',3,'^\\+591([0-9]+)$','\\1',29),(794,'calleeout','From e164 to national',3,'^\\+599([0-9]+)$','\\1',30),(795,'calleeout','From e164 to national',3,'^\\+55([0-9]+)$','\\1',31),(796,'calleeout','From e164 to national',3,'^\\+1242([0-9]+)$','\\1',32),(797,'calleeout','From e164 to national',3,'^\\+975([0-9]+)$','\\1',33),(798,'calleeout','From e164 to national',3,'^\\+47([0-9]+)$','\\1',34),(799,'calleeout','From e164 to national',3,'^\\+267([0-9]+)$','\\1',35),(800,'calleeout','From e164 to national',3,'^\\+375([0-9]+)$','\\1',36),(801,'calleeout','From e164 to national',3,'^\\+501([0-9]+)$','\\1',37),(802,'calleeout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',38),(803,'calleeout','From e164 to national',3,'^\\+61([0-9]+)$','\\1',39),(804,'calleeout','From e164 to national',3,'^\\+243([0-9]+)$','\\1',40),(805,'calleeout','From e164 to national',3,'^\\+236([0-9]+)$','\\1',41),(806,'calleeout','From e164 to national',3,'^\\+242([0-9]+)$','\\1',42),(807,'calleeout','From e164 to national',3,'^\\+41([0-9]+)$','\\1',43),(808,'calleeout','From e164 to national',3,'^\\+225([0-9]+)$','\\1',44),(809,'calleeout','From e164 to national',3,'^\\+682([0-9]+)$','\\1',45),(810,'calleeout','From e164 to national',3,'^\\+56([0-9]+)$','\\1',46),(811,'calleeout','From e164 to national',3,'^\\+237([0-9]+)$','\\1',47),(812,'calleeout','From e164 to national',3,'^\\+86([0-9]+)$','\\1',48),(813,'calleeout','From e164 to national',3,'^\\+57([0-9]+)$','\\1',49),(814,'calleeout','From e164 to national',3,'^\\+506([0-9]+)$','\\1',50),(815,'calleeout','From e164 to national',3,'^\\+53([0-9]+)$','\\1',51),(816,'calleeout','From e164 to national',3,'^\\+238([0-9]+)$','\\1',52),(817,'calleeout','From e164 to national',3,'^\\+599([0-9]+)$','\\1',53),(818,'calleeout','From e164 to national',3,'^\\+61([0-9]+)$','\\1',54),(819,'calleeout','From e164 to national',3,'^\\+357([0-9]+)$','\\1',55),(820,'calleeout','From e164 to national',3,'^\\+420([0-9]+)$','\\1',56),(821,'calleeout','From e164 to national',3,'^\\+49([0-9]+)$','\\1',57),(822,'calleeout','From e164 to national',3,'^\\+253([0-9]+)$','\\1',58),(823,'calleeout','From e164 to national',3,'^\\+45([0-9]+)$','\\1',59),(824,'calleeout','From e164 to national',3,'^\\+1767([0-9]+)$','\\1',60),(825,'calleeout','From e164 to national',3,'^\\+1809([0-9]+)$','\\1',61),(826,'calleeout','From e164 to national',3,'^\\+213([0-9]+)$','\\1',64),(827,'calleeout','From e164 to national',3,'^\\+593([0-9]+)$','\\1',65),(828,'calleeout','From e164 to national',3,'^\\+372([0-9]+)$','\\1',66),(829,'calleeout','From e164 to national',3,'^\\+20([0-9]+)$','\\1',67),(830,'calleeout','From e164 to national',3,'^\\+212([0-9]+)$','\\1',68),(831,'calleeout','From e164 to national',3,'^\\+291([0-9]+)$','\\1',69),(832,'calleeout','From e164 to national',3,'^\\+34([0-9]+)$','\\1',70),(833,'calleeout','From e164 to national',3,'^\\+251([0-9]+)$','\\1',71),(834,'calleeout','From e164 to national',3,'^\\+358([0-9]+)$','\\1',72),(835,'calleeout','From e164 to national',3,'^\\+679([0-9]+)$','\\1',73),(836,'calleeout','From e164 to national',3,'^\\+500([0-9]+)$','\\1',74),(837,'calleeout','From e164 to national',3,'^\\+691([0-9]+)$','\\1',75),(838,'calleeout','From e164 to national',3,'^\\+298([0-9]+)$','\\1',76),(839,'calleeout','From e164 to national',3,'^\\+33([0-9]+)$','\\1',77),(840,'calleeout','From e164 to national',3,'^\\+241([0-9]+)$','\\1',78),(841,'calleeout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',79),(842,'calleeout','From e164 to national',3,'^\\+1473([0-9]+)$','\\1',80),(843,'calleeout','From e164 to national',3,'^\\+995([0-9]+)$','\\1',81),(844,'calleeout','From e164 to national',3,'^\\+594([0-9]+)$','\\1',82),(845,'calleeout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',83),(846,'calleeout','From e164 to national',3,'^\\+233([0-9]+)$','\\1',84),(847,'calleeout','From e164 to national',3,'^\\+350([0-9]+)$','\\1',85),(848,'calleeout','From e164 to national',3,'^\\+299([0-9]+)$','\\1',86),(849,'calleeout','From e164 to national',3,'^\\+220([0-9]+)$','\\1',87),(850,'calleeout','From e164 to national',3,'^\\+224([0-9]+)$','\\1',88),(851,'calleeout','From e164 to national',3,'^\\+590([0-9]+)$','\\1',89),(852,'calleeout','From e164 to national',3,'^\\+240([0-9]+)$','\\1',90),(853,'calleeout','From e164 to national',3,'^\\+30([0-9]+)$','\\1',91),(854,'calleeout','From e164 to national',3,'^\\+500([0-9]+)$','\\1',92),(855,'calleeout','From e164 to national',3,'^\\+502([0-9]+)$','\\1',93),(856,'calleeout','From e164 to national',3,'^\\+1671([0-9]+)$','\\1',94),(857,'calleeout','From e164 to national',3,'^\\+245([0-9]+)$','\\1',95),(858,'calleeout','From e164 to national',3,'^\\+592([0-9]+)$','\\1',96),(859,'calleeout','From e164 to national',3,'^\\+852([0-9]+)$','\\1',97),(860,'calleeout','From e164 to national',3,'^\\+672([0-9]+)$','\\1',98),(861,'calleeout','From e164 to national',3,'^\\+504([0-9]+)$','\\1',99),(862,'calleeout','From e164 to national',3,'^\\+385([0-9]+)$','\\1',100),(863,'calleeout','From e164 to national',3,'^\\+509([0-9]+)$','\\1',101),(864,'calleeout','From e164 to national',3,'^\\+36([0-9]+)$','\\1',102),(865,'calleeout','From e164 to national',3,'^\\+62([0-9]+)$','\\1',103),(866,'calleeout','From e164 to national',3,'^\\+353([0-9]+)$','\\1',104),(867,'calleeout','From e164 to national',3,'^\\+972([0-9]+)$','\\1',105),(868,'calleeout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',106),(869,'calleeout','From e164 to national',3,'^\\+91([0-9]+)$','\\1',107),(870,'calleeout','From e164 to national',3,'^\\+246([0-9]+)$','\\1',108),(871,'calleeout','From e164 to national',3,'^\\+964([0-9]+)$','\\1',109),(872,'calleeout','From e164 to national',3,'^\\+98([0-9]+)$','\\1',110),(873,'calleeout','From e164 to national',3,'^\\+354([0-9]+)$','\\1',111),(874,'calleeout','From e164 to national',3,'^\\+39([0-9]+)$','\\1',112),(875,'calleeout','From e164 to national',3,'^\\+44([0-9]+)$','\\1',113),(876,'calleeout','From e164 to national',3,'^\\+1876([0-9]+)$','\\1',114),(877,'calleeout','From e164 to national',3,'^\\+962([0-9]+)$','\\1',115),(878,'calleeout','From e164 to national',3,'^\\+81([0-9]+)$','\\1',116),(879,'calleeout','From e164 to national',3,'^\\+254([0-9]+)$','\\1',117),(880,'calleeout','From e164 to national',3,'^\\+996([0-9]+)$','\\1',118),(881,'calleeout','From e164 to national',3,'^\\+855([0-9]+)$','\\1',119),(882,'calleeout','From e164 to national',3,'^\\+686([0-9]+)$','\\1',120),(883,'calleeout','From e164 to national',3,'^\\+269([0-9]+)$','\\1',121),(884,'calleeout','From e164 to national',3,'^\\+1869([0-9]+)$','\\1',122),(885,'calleeout','From e164 to national',3,'^\\+850([0-9]+)$','\\1',123),(886,'calleeout','From e164 to national',3,'^\\+82([0-9]+)$','\\1',124),(887,'calleeout','From e164 to national',3,'^\\+965([0-9]+)$','\\1',125),(888,'calleeout','From e164 to national',3,'^\\+1345([0-9]+)$','\\1',126),(889,'calleeout','From e164 to national',3,'^\\+7([0-9]+)$','\\1',127),(890,'calleeout','From e164 to national',3,'^\\+856([0-9]+)$','\\1',128),(891,'calleeout','From e164 to national',3,'^\\+961([0-9]+)$','\\1',129),(892,'calleeout','From e164 to national',3,'^\\+1758([0-9]+)$','\\1',130),(893,'calleeout','From e164 to national',3,'^\\+423([0-9]+)$','\\1',131),(894,'calleeout','From e164 to national',3,'^\\+94([0-9]+)$','\\1',132),(895,'calleeout','From e164 to national',3,'^\\+231([0-9]+)$','\\1',133),(896,'calleeout','From e164 to national',3,'^\\+266([0-9]+)$','\\1',134),(897,'calleeout','From e164 to national',3,'^\\+370([0-9]+)$','\\1',135),(898,'calleeout','From e164 to national',3,'^\\+352([0-9]+)$','\\1',136),(899,'calleeout','From e164 to national',3,'^\\+371([0-9]+)$','\\1',137),(900,'calleeout','From e164 to national',3,'^\\+218([0-9]+)$','\\1',138),(901,'calleeout','From e164 to national',3,'^\\+212([0-9]+)$','\\1',139),(902,'calleeout','From e164 to national',3,'^\\+377([0-9]+)$','\\1',140),(903,'calleeout','From e164 to national',3,'^\\+373([0-9]+)$','\\1',141),(904,'calleeout','From e164 to national',3,'^\\+382([0-9]+)$','\\1',142),(905,'calleeout','From e164 to national',3,'^\\+1599([0-9]+)$','\\1',143),(906,'calleeout','From e164 to national',3,'^\\+261([0-9]+)$','\\1',144),(907,'calleeout','From e164 to national',3,'^\\+692([0-9]+)$','\\1',145),(908,'calleeout','From e164 to national',3,'^\\+389([0-9]+)$','\\1',146),(909,'calleeout','From e164 to national',3,'^\\+223([0-9]+)$','\\1',147),(910,'calleeout','From e164 to national',3,'^\\+95([0-9]+)$','\\1',148),(911,'calleeout','From e164 to national',3,'^\\+976([0-9]+)$','\\1',149),(912,'calleeout','From e164 to national',3,'^\\+853([0-9]+)$','\\1',150),(913,'calleeout','From e164 to national',3,'^\\+1670([0-9]+)$','\\1',151),(914,'calleeout','From e164 to national',3,'^\\+596([0-9]+)$','\\1',152),(915,'calleeout','From e164 to national',3,'^\\+222([0-9]+)$','\\1',153),(916,'calleeout','From e164 to national',3,'^\\+1664([0-9]+)$','\\1',154),(917,'calleeout','From e164 to national',3,'^\\+356([0-9]+)$','\\1',155),(918,'calleeout','From e164 to national',3,'^\\+230([0-9]+)$','\\1',156),(919,'calleeout','From e164 to national',3,'^\\+960([0-9]+)$','\\1',157),(920,'calleeout','From e164 to national',3,'^\\+265([0-9]+)$','\\1',158),(921,'calleeout','From e164 to national',3,'^\\+52([0-9]+)$','\\1',159),(922,'calleeout','From e164 to national',3,'^\\+60([0-9]+)$','\\1',160),(923,'calleeout','From e164 to national',3,'^\\+258([0-9]+)$','\\1',161),(924,'calleeout','From e164 to national',3,'^\\+264([0-9]+)$','\\1',162),(925,'calleeout','From e164 to national',3,'^\\+687([0-9]+)$','\\1',163),(926,'calleeout','From e164 to national',3,'^\\+227([0-9]+)$','\\1',164),(927,'calleeout','From e164 to national',3,'^\\+672([0-9]+)$','\\1',165),(928,'calleeout','From e164 to national',3,'^\\+234([0-9]+)$','\\1',166),(929,'calleeout','From e164 to national',3,'^\\+505([0-9]+)$','\\1',167),(930,'calleeout','From e164 to national',3,'^\\+31([0-9]+)$','\\1',168),(931,'calleeout','From e164 to national',3,'^\\+47([0-9]+)$','\\1',169),(932,'calleeout','From e164 to national',3,'^\\+977([0-9]+)$','\\1',170),(933,'calleeout','From e164 to national',3,'^\\+674([0-9]+)$','\\1',171),(934,'calleeout','From e164 to national',3,'^\\+683([0-9]+)$','\\1',172),(935,'calleeout','From e164 to national',3,'^\\+64([0-9]+)$','\\1',173),(936,'calleeout','From e164 to national',3,'^\\+968([0-9]+)$','\\1',174),(937,'calleeout','From e164 to national',3,'^\\+507([0-9]+)$','\\1',175),(938,'calleeout','From e164 to national',3,'^\\+51([0-9]+)$','\\1',176),(939,'calleeout','From e164 to national',3,'^\\+689([0-9]+)$','\\1',177),(940,'calleeout','From e164 to national',3,'^\\+675([0-9]+)$','\\1',178),(941,'calleeout','From e164 to national',3,'^\\+63([0-9]+)$','\\1',179),(942,'calleeout','From e164 to national',3,'^\\+92([0-9]+)$','\\1',180),(943,'calleeout','From e164 to national',3,'^\\+48([0-9]+)$','\\1',181),(944,'calleeout','From e164 to national',3,'^\\+508([0-9]+)$','\\1',182),(945,'calleeout','From e164 to national',3,'^\\+870([0-9]+)$','\\1',183),(946,'calleeout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',184),(947,'calleeout','From e164 to national',3,'^\\+970([0-9]+)$','\\1',185),(948,'calleeout','From e164 to national',3,'^\\+351([0-9]+)$','\\1',186),(949,'calleeout','From e164 to national',3,'^\\+680([0-9]+)$','\\1',187),(950,'calleeout','From e164 to national',3,'^\\+595([0-9]+)$','\\1',188),(951,'calleeout','From e164 to national',3,'^\\+974([0-9]+)$','\\1',189),(952,'calleeout','From e164 to national',3,'^\\+262([0-9]+)$','\\1',190),(953,'calleeout','From e164 to national',3,'^\\+40([0-9]+)$','\\1',191),(954,'calleeout','From e164 to national',3,'^\\+381([0-9]+)$','\\1',192),(955,'calleeout','From e164 to national',3,'^\\+7([0-9]+)$','\\1',193),(956,'calleeout','From e164 to national',3,'^\\+250([0-9]+)$','\\1',194),(957,'calleeout','From e164 to national',3,'^\\+966([0-9]+)$','\\1',195),(958,'calleeout','From e164 to national',3,'^\\+677([0-9]+)$','\\1',196),(959,'calleeout','From e164 to national',3,'^\\+248([0-9]+)$','\\1',197),(960,'calleeout','From e164 to national',3,'^\\+249([0-9]+)$','\\1',198),(961,'calleeout','From e164 to national',3,'^\\+46([0-9]+)$','\\1',199),(962,'calleeout','From e164 to national',3,'^\\+65([0-9]+)$','\\1',200),(963,'calleeout','From e164 to national',3,'^\\+290([0-9]+)$','\\1',201),(964,'calleeout','From e164 to national',3,'^\\+386([0-9]+)$','\\1',202),(965,'calleeout','From e164 to national',3,'^\\+47([0-9]+)$','\\1',203),(966,'calleeout','From e164 to national',3,'^\\+421([0-9]+)$','\\1',204),(967,'calleeout','From e164 to national',3,'^\\+232([0-9]+)$','\\1',205),(968,'calleeout','From e164 to national',3,'^\\+378([0-9]+)$','\\1',206),(969,'calleeout','From e164 to national',3,'^\\+221([0-9]+)$','\\1',207),(970,'calleeout','From e164 to national',3,'^\\+252([0-9]+)$','\\1',208),(971,'calleeout','From e164 to national',3,'^\\+597([0-9]+)$','\\1',209),(972,'calleeout','From e164 to national',3,'^\\+211([0-9]+)$','\\1',210),(973,'calleeout','From e164 to national',3,'^\\+239([0-9]+)$','\\1',211),(974,'calleeout','From e164 to national',3,'^\\+503([0-9]+)$','\\1',212),(975,'calleeout','From e164 to national',3,'^\\+1721([0-9]+)$','\\1',213),(976,'calleeout','From e164 to national',3,'^\\+963([0-9]+)$','\\1',214),(977,'calleeout','From e164 to national',3,'^\\+268([0-9]+)$','\\1',215),(978,'calleeout','From e164 to national',3,'^\\+1649([0-9]+)$','\\1',216),(979,'calleeout','From e164 to national',3,'^\\+235([0-9]+)$','\\1',217),(980,'calleeout','From e164 to national',3,'^\\+262([0-9]+)$','\\1',218),(981,'calleeout','From e164 to national',3,'^\\+228([0-9]+)$','\\1',219),(982,'calleeout','From e164 to national',3,'^\\+66([0-9]+)$','\\1',220),(983,'calleeout','From e164 to national',3,'^\\+992([0-9]+)$','\\1',221),(984,'calleeout','From e164 to national',3,'^\\+690([0-9]+)$','\\1',222),(985,'calleeout','From e164 to national',3,'^\\+670([0-9]+)$','\\1',223),(986,'calleeout','From e164 to national',3,'^\\+993([0-9]+)$','\\1',224),(987,'calleeout','From e164 to national',3,'^\\+216([0-9]+)$','\\1',225),(988,'calleeout','From e164 to national',3,'^\\+676([0-9]+)$','\\1',226),(989,'calleeout','From e164 to national',3,'^\\+90([0-9]+)$','\\1',227),(990,'calleeout','From e164 to national',3,'^\\+1868([0-9]+)$','\\1',228),(991,'calleeout','From e164 to national',3,'^\\+688([0-9]+)$','\\1',229),(992,'calleeout','From e164 to national',3,'^\\+886([0-9]+)$','\\1',230),(993,'calleeout','From e164 to national',3,'^\\+255([0-9]+)$','\\1',231),(994,'calleeout','From e164 to national',3,'^\\+380([0-9]+)$','\\1',232),(995,'calleeout','From e164 to national',3,'^\\+256([0-9]+)$','\\1',233),(996,'calleeout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',234),(997,'calleeout','From e164 to national',3,'^\\+1([0-9]+)$','\\1',235),(998,'calleeout','From e164 to national',3,'^\\+598([0-9]+)$','\\1',236),(999,'calleeout','From e164 to national',3,'^\\+998([0-9]+)$','\\1',237),(1000,'calleeout','From e164 to national',3,'^\\+39([0-9]+)$','\\1',238),(1001,'calleeout','From e164 to national',3,'^\\+1784([0-9]+)$','\\1',239),(1002,'calleeout','From e164 to national',3,'^\\+58([0-9]+)$','\\1',240),(1003,'calleeout','From e164 to national',3,'^\\+1284([0-9]+)$','\\1',241),(1004,'calleeout','From e164 to national',3,'^\\+1340([0-9]+)$','\\1',242),(1005,'calleeout','From e164 to national',3,'^\\+84([0-9]+)$','\\1',243),(1006,'calleeout','From e164 to national',3,'^\\+678([0-9]+)$','\\1',244),(1007,'calleeout','From e164 to national',3,'^\\+681([0-9]+)$','\\1',245),(1008,'calleeout','From e164 to national',3,'^\\+685([0-9]+)$','\\1',246),(1009,'calleeout','From e164 to national',3,'^\\+967([0-9]+)$','\\1',247),(1010,'calleeout','From e164 to national',3,'^\\+262([0-9]+)$','\\1',248),(1011,'calleeout','From e164 to national',3,'^\\+27([0-9]+)$','\\1',249),(1012,'calleeout','From e164 to national',3,'^\\+260([0-9]+)$','\\1',250),(1013,'calleeout','From e164 to national',3,'^\\+263([0-9]+)$','\\1',251),(1020,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',1),(1021,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',2),(1022,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',3),(1023,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',4),(1024,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',5),(1025,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',6),(1026,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',7),(1027,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',8),(1028,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',9),(1029,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',10),(1030,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',11),(1031,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',12),(1032,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','0011\\1',13),(1033,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',14),(1034,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',15),(1035,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',16),(1036,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',17),(1037,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',18),(1038,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',19),(1039,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',20),(1040,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',21),(1041,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',22),(1042,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',23),(1043,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',24),(1044,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',25),(1045,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',26),(1046,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',27),(1047,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',28),(1048,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',29),(1049,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',30),(1050,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',31),(1051,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',32),(1052,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',33),(1053,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',34),(1054,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',35),(1055,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',36),(1056,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',37),(1057,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','011\\1',38),(1058,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',39),(1059,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',40),(1060,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',41),(1061,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',42),(1062,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',43),(1063,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',44),(1064,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',45),(1065,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',46),(1066,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',47),(1067,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',48),(1068,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',49),(1069,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',50),(1070,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','119\\1',51),(1071,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',52),(1072,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',53),(1073,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',54),(1074,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',55),(1075,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',56),(1076,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',57),(1077,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',58),(1078,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',59),(1079,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',60),(1080,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',61),(1081,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',64),(1082,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',65),(1083,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',66),(1084,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',67),(1085,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',68),(1086,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',69),(1087,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',70),(1088,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',71),(1089,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',72),(1090,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',73),(1091,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',74),(1092,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',75),(1093,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',76),(1094,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',77),(1095,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',78),(1096,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',79),(1097,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',80),(1098,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',81),(1099,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',82),(1100,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',83),(1101,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',84),(1102,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',85),(1103,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',86),(1104,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',87),(1105,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',88),(1106,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',89),(1107,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',90),(1108,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',91),(1109,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',92),(1110,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',93),(1111,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',94),(1112,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',95),(1113,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',96),(1114,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',97),(1115,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',98),(1116,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',99),(1117,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',100),(1118,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',101),(1119,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',102),(1120,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',103),(1121,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',104),(1122,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',105),(1123,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',106),(1124,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',107),(1125,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',108),(1126,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',109),(1127,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',110),(1128,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',111),(1129,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',112),(1130,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',113),(1131,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',114),(1132,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',115),(1133,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','010\\1',116),(1134,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',117),(1135,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',118),(1136,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',119),(1137,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',120),(1138,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',121),(1139,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',122),(1140,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',123),(1141,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',124),(1142,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',125),(1143,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',126),(1144,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',127),(1145,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',128),(1146,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',129),(1147,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',130),(1148,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',131),(1149,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',132),(1150,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',133),(1151,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',134),(1152,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',135),(1153,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',136),(1154,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',137),(1155,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',138),(1156,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',139),(1157,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',140),(1158,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',141),(1159,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',142),(1160,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',143),(1161,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',144),(1162,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',145),(1163,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',146),(1164,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',147),(1165,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',148),(1166,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',149),(1167,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',150),(1168,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',151),(1169,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',152),(1170,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',153),(1171,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',154),(1172,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',155),(1173,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',156),(1174,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',157),(1175,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',158),(1176,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',159),(1177,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',160),(1178,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',161),(1179,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',162),(1180,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',163),(1181,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',164),(1182,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',165),(1183,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',166),(1184,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',167),(1185,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',168),(1186,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',169),(1187,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',170),(1188,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',171),(1189,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',172),(1190,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',173),(1191,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',174),(1192,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',175),(1193,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',176),(1194,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',177),(1195,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',178),(1196,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',179),(1197,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',180),(1198,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',181),(1199,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',182),(1200,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',183),(1201,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',184),(1202,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',185),(1203,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',186),(1204,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',187),(1205,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',188),(1206,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',189),(1207,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',190),(1208,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',191),(1209,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',192),(1210,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','810\\1',193),(1211,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',194),(1212,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',195),(1213,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',196),(1214,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',197),(1215,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',198),(1216,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',199),(1217,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',200),(1218,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',201),(1219,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',202),(1220,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',203),(1221,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',204),(1222,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',205),(1223,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',206),(1224,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',207),(1225,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',208),(1226,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',209),(1227,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',210),(1228,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',211),(1229,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',212),(1230,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',213),(1231,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',214),(1232,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',215),(1233,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',216),(1234,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',217),(1235,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',218),(1236,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',219),(1237,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',220),(1238,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',221),(1239,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',222),(1240,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',223),(1241,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',224),(1242,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',225),(1243,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',226),(1244,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',227),(1245,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',228),(1246,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',229),(1247,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',230),(1248,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',231),(1249,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',232),(1250,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',233),(1251,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',234),(1252,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','011\\1',235),(1253,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',236),(1254,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',237),(1255,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',238),(1256,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',239),(1257,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',240),(1258,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',241),(1259,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',242),(1260,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',243),(1261,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',244),(1262,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',245),(1263,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',246),(1264,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',247),(1265,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',248),(1266,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',249),(1267,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',250),(1268,'calleeout','From e164 to international',4,'^\\+([0-9]+)$','00\\1',251),(1275,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',1),(1276,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',2),(1277,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',3),(1278,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',4),(1279,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',5),(1280,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',6),(1281,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',7),(1282,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',8),(1283,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',9),(1284,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',10),(1285,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',11),(1286,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',12),(1287,'callerin','From international to e164',1,'^(\\+|0011)([0-9]+)$','+\\2',13),(1288,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',14),(1289,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',15),(1290,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',16),(1291,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',17),(1292,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',18),(1293,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',19),(1294,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',20),(1295,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',21),(1296,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',22),(1297,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',23),(1298,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',24),(1299,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',25),(1300,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',26),(1301,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',27),(1302,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',28),(1303,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',29),(1304,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',30),(1305,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',31),(1306,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',32),(1307,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',33),(1308,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',34),(1309,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',35),(1310,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',36),(1311,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',37),(1312,'callerin','From international to e164',1,'^(\\+|011)([0-9]+)$','+\\2',38),(1313,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',39),(1314,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',40),(1315,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',41),(1316,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',42),(1317,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',43),(1318,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',44),(1319,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',45),(1320,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',46),(1321,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',47),(1322,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',48),(1323,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',49),(1324,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',50),(1325,'callerin','From international to e164',1,'^(\\+|119)([0-9]+)$','+\\2',51),(1326,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',52),(1327,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',53),(1328,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',54),(1329,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',55),(1330,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',56),(1331,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',57),(1332,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',58),(1333,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',59),(1334,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',60),(1335,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',61),(1336,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',64),(1337,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',65),(1338,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',66),(1339,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',67),(1340,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',68),(1341,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',69),(1342,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',70),(1343,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',71),(1344,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',72),(1345,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',73),(1346,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',74),(1347,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',75),(1348,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',76),(1349,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',77),(1350,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',78),(1351,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',79),(1352,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',80),(1353,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',81),(1354,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',82),(1355,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',83),(1356,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',84),(1357,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',85),(1358,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',86),(1359,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',87),(1360,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',88),(1361,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',89),(1362,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',90),(1363,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',91),(1364,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',92),(1365,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',93),(1366,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',94),(1367,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',95),(1368,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',96),(1369,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',97),(1370,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',98),(1371,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',99),(1372,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',100),(1373,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',101),(1374,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',102),(1375,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',103),(1376,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',104),(1377,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',105),(1378,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',106),(1379,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',107),(1380,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',108),(1381,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',109),(1382,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',110),(1383,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',111),(1384,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',112),(1385,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',113),(1386,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',114),(1387,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',115),(1388,'callerin','From international to e164',1,'^(\\+|010)([0-9]+)$','+\\2',116),(1389,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',117),(1390,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',118),(1391,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',119),(1392,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',120),(1393,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',121),(1394,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',122),(1395,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',123),(1396,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',124),(1397,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',125),(1398,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',126),(1399,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',127),(1400,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',128),(1401,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',129),(1402,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',130),(1403,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',131),(1404,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',132),(1405,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',133),(1406,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',134),(1407,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',135),(1408,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',136),(1409,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',137),(1410,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',138),(1411,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',139),(1412,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',140),(1413,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',141),(1414,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',142),(1415,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',143),(1416,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',144),(1417,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',145),(1418,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',146),(1419,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',147),(1420,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',148),(1421,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',149),(1422,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',150),(1423,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',151),(1424,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',152),(1425,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',153),(1426,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',154),(1427,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',155),(1428,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',156),(1429,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',157),(1430,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',158),(1431,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',159),(1432,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',160),(1433,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',161),(1434,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',162),(1435,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',163),(1436,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',164),(1437,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',165),(1438,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',166),(1439,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',167),(1440,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',168),(1441,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',169),(1442,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',170),(1443,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',171),(1444,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',172),(1445,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',173),(1446,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',174),(1447,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',175),(1448,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',176),(1449,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',177),(1450,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',178),(1451,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',179),(1452,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',180),(1453,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',181),(1454,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',182),(1455,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',183),(1456,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',184),(1457,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',185),(1458,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',186),(1459,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',187),(1460,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',188),(1461,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',189),(1462,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',190),(1463,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',191),(1464,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',192),(1465,'callerin','From international to e164',1,'^(\\+|810)([0-9]+)$','+\\2',193),(1466,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',194),(1467,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',195),(1468,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',196),(1469,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',197),(1470,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',198),(1471,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',199),(1472,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',200),(1473,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',201),(1474,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',202),(1475,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',203),(1476,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',204),(1477,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',205),(1478,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',206),(1479,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',207),(1480,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',208),(1481,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',209),(1482,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',210),(1483,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',211),(1484,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',212),(1485,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',213),(1486,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',214),(1487,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',215),(1488,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',216),(1489,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',217),(1490,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',218),(1491,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',219),(1492,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',220),(1493,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',221),(1494,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',222),(1495,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',223),(1496,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',224),(1497,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',225),(1498,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',226),(1499,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',227),(1500,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',228),(1501,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',229),(1502,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',230),(1503,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',231),(1504,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',232),(1505,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',233),(1506,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',234),(1507,'callerin','From international to e164',1,'^(\\+|011)([0-9]+)$','+\\2',235),(1508,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',236),(1509,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',237),(1510,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',238),(1511,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',239),(1512,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',240),(1513,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',241),(1514,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',242),(1515,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',243),(1516,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',244),(1517,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',245),(1518,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',246),(1519,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',247),(1520,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',248),(1521,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',249),(1522,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',250),(1523,'callerin','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',251),(1530,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+971\\1',2),(1531,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+93\\1',3),(1532,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1268\\1',4),(1533,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1264\\1',5),(1534,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+355\\1',6),(1535,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+54\\1',10),(1536,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1684\\1',11),(1537,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+43\\1',12),(1538,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+61\\1',13),(1539,'callerin','From out of area national to e164',2,'^8([0-9]{9})$','+994\\1',16),(1540,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+387\\1',17),(1541,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1246\\1',18),(1542,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+880\\1',19),(1543,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+32\\1',20),(1544,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+359\\1',22),(1545,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1441\\1',27),(1546,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+591\\1',29),(1547,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+55\\1',31),(1548,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1242\\1',32),(1549,'callerin','From out of area national to e164',2,'^8([0-9]{9})$','+375\\1',36),(1550,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1\\1',38),(1551,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+41\\1',43),(1552,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+86\\1',48),(1553,'callerin','From out of area national to e164',2,'^0([0-9]{7})$','+53\\1',51),(1554,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+357\\1',55),(1555,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1767\\1',60),(1556,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1809\\1',61),(1557,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+20\\1',67),(1558,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+358\\1',72),(1559,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+33\\1',77),(1560,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+44\\1',79),(1561,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1473\\1',80),(1562,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+30\\1',91),(1563,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1671\\1',94),(1564,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+385\\1',100),(1565,'callerin','From out of area national to e164',2,'^06([0-9]{9})$','+36\\1',102),(1566,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+62\\1',103),(1567,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+353\\1',104),(1568,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+972\\1',105),(1569,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+91\\1',107),(1570,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+98\\1',110),(1571,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1876\\1',114),(1572,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+962\\1',115),(1573,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+81\\1',116),(1574,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+254\\1',117),(1575,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+855\\1',119),(1576,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1869\\1',122),(1577,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+850\\1',123),(1578,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+82\\1',124),(1579,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1345\\1',126),(1580,'callerin','From out of area national to e164',2,'^8([0-9]{9})$','+7\\1',127),(1581,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+856\\1',128),(1582,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1758\\1',130),(1583,'callerin','From out of area national to e164',2,'^8([0-9]{9})$','+370\\1',135),(1584,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+212\\1',139),(1585,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+373\\1',141),(1586,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+382\\1',142),(1587,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+389\\1',146),(1588,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+95\\1',148),(1589,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+976\\1',149),(1590,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1670\\1',151),(1591,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1664\\1',154),(1592,'callerin','From out of area national to e164',2,'^01([0-9]{9})$','+52\\1',159),(1593,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+60\\1',160),(1594,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+234\\1',166),(1595,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+31\\1',168),(1596,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+64\\1',173),(1597,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+51\\1',176),(1598,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+63\\1',179),(1599,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+92\\1',180),(1600,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1\\1',184),(1601,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+40\\1',191),(1602,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+381\\1',192),(1603,'callerin','From out of area national to e164',2,'^8([0-9]{10})$','+7\\1',193),(1604,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+250\\1',194),(1605,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+966\\1',195),(1606,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+46\\1',199),(1607,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+386\\1',202),(1608,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+421\\1',204),(1609,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1721\\1',213),(1610,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1649\\1',216),(1611,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+66\\1',220),(1612,'callerin','From out of area national to e164',2,'^8([0-9]{9})$','+993\\1',224),(1613,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+90\\1',227),(1614,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1868\\1',228),(1615,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+886\\1',230),(1616,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+255\\1',231),(1617,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+380\\1',232),(1618,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1\\1',235),(1619,'callerin','From out of area national to e164',2,'^8([0-9]{9})$','+998\\1',237),(1620,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1784\\1',239),(1621,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+58\\1',240),(1622,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1284\\1',241),(1623,'callerin','From out of area national to e164',2,'^1([0-9]{9})$','+1340\\1',242),(1624,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+84\\1',243),(1625,'callerin','From out of area national to e164',2,'^0([0-9]{9})$','+27\\1',249),(1657,'callerin','From national to e164',5,'^([0-9]+)$','+376\\1',1),(1658,'callerin','From national to e164',5,'^([0-9]+)$','+971\\1',2),(1659,'callerin','From national to e164',5,'^([0-9]+)$','+93\\1',3),(1660,'callerin','From national to e164',5,'^([0-9]+)$','+1268\\1',4),(1661,'callerin','From national to e164',5,'^([0-9]+)$','+1264\\1',5),(1662,'callerin','From national to e164',5,'^([0-9]+)$','+355\\1',6),(1663,'callerin','From national to e164',5,'^([0-9]+)$','+374\\1',7),(1664,'callerin','From national to e164',5,'^([0-9]+)$','+244\\1',8),(1665,'callerin','From national to e164',5,'^([0-9]+)$','+672\\1',9),(1666,'callerin','From national to e164',5,'^([0-9]+)$','+54\\1',10),(1667,'callerin','From national to e164',5,'^([0-9]+)$','+1684\\1',11),(1668,'callerin','From national to e164',5,'^([0-9]+)$','+43\\1',12),(1669,'callerin','From national to e164',5,'^([0-9]+)$','+61\\1',13),(1670,'callerin','From national to e164',5,'^([0-9]+)$','+297\\1',14),(1671,'callerin','From national to e164',5,'^([0-9]+)$','+358\\1',15),(1672,'callerin','From national to e164',5,'^([0-9]+)$','+994\\1',16),(1673,'callerin','From national to e164',5,'^([0-9]+)$','+387\\1',17),(1674,'callerin','From national to e164',5,'^([0-9]+)$','+1246\\1',18),(1675,'callerin','From national to e164',5,'^([0-9]+)$','+880\\1',19),(1676,'callerin','From national to e164',5,'^([0-9]+)$','+32\\1',20),(1677,'callerin','From national to e164',5,'^([0-9]+)$','+226\\1',21),(1678,'callerin','From national to e164',5,'^([0-9]+)$','+359\\1',22),(1679,'callerin','From national to e164',5,'^([0-9]+)$','+973\\1',23),(1680,'callerin','From national to e164',5,'^([0-9]+)$','+257\\1',24),(1681,'callerin','From national to e164',5,'^([0-9]+)$','+229\\1',25),(1682,'callerin','From national to e164',5,'^([0-9]+)$','+590\\1',26),(1683,'callerin','From national to e164',5,'^([0-9]+)$','+1441\\1',27),(1684,'callerin','From national to e164',5,'^([0-9]+)$','+673\\1',28),(1685,'callerin','From national to e164',5,'^([0-9]+)$','+591\\1',29),(1686,'callerin','From national to e164',5,'^([0-9]+)$','+599\\1',30),(1687,'callerin','From national to e164',5,'^([0-9]+)$','+55\\1',31),(1688,'callerin','From national to e164',5,'^([0-9]+)$','+1242\\1',32),(1689,'callerin','From national to e164',5,'^([0-9]+)$','+975\\1',33),(1690,'callerin','From national to e164',5,'^([0-9]+)$','+47\\1',34),(1691,'callerin','From national to e164',5,'^([0-9]+)$','+267\\1',35),(1692,'callerin','From national to e164',5,'^([0-9]+)$','+375\\1',36),(1693,'callerin','From national to e164',5,'^([0-9]+)$','+501\\1',37),(1694,'callerin','From national to e164',5,'^([0-9]+)$','+1\\1',38),(1695,'callerin','From national to e164',5,'^([0-9]+)$','+61\\1',39),(1696,'callerin','From national to e164',5,'^([0-9]+)$','+243\\1',40),(1697,'callerin','From national to e164',5,'^([0-9]+)$','+236\\1',41),(1698,'callerin','From national to e164',5,'^([0-9]+)$','+242\\1',42),(1699,'callerin','From national to e164',5,'^([0-9]+)$','+41\\1',43),(1700,'callerin','From national to e164',5,'^([0-9]+)$','+225\\1',44),(1701,'callerin','From national to e164',5,'^([0-9]+)$','+682\\1',45),(1702,'callerin','From national to e164',5,'^([0-9]+)$','+56\\1',46),(1703,'callerin','From national to e164',5,'^([0-9]+)$','+237\\1',47),(1704,'callerin','From national to e164',5,'^([0-9]+)$','+86\\1',48),(1705,'callerin','From national to e164',5,'^([0-9]+)$','+57\\1',49),(1706,'callerin','From national to e164',5,'^([0-9]+)$','+506\\1',50),(1707,'callerin','From national to e164',5,'^([0-9]+)$','+53\\1',51),(1708,'callerin','From national to e164',5,'^([0-9]+)$','+238\\1',52),(1709,'callerin','From national to e164',5,'^([0-9]+)$','+599\\1',53),(1710,'callerin','From national to e164',5,'^([0-9]+)$','+61\\1',54),(1711,'callerin','From national to e164',5,'^([0-9]+)$','+357\\1',55),(1712,'callerin','From national to e164',5,'^([0-9]+)$','+420\\1',56),(1713,'callerin','From national to e164',5,'^([0-9]+)$','+49\\1',57),(1714,'callerin','From national to e164',5,'^([0-9]+)$','+253\\1',58),(1715,'callerin','From national to e164',5,'^([0-9]+)$','+45\\1',59),(1716,'callerin','From national to e164',5,'^([0-9]+)$','+1767\\1',60),(1717,'callerin','From national to e164',5,'^([0-9]+)$','+1809\\1',61),(1718,'callerin','From national to e164',5,'^([0-9]+)$','+213\\1',64),(1719,'callerin','From national to e164',5,'^([0-9]+)$','+593\\1',65),(1720,'callerin','From national to e164',5,'^([0-9]+)$','+372\\1',66),(1721,'callerin','From national to e164',5,'^([0-9]+)$','+20\\1',67),(1722,'callerin','From national to e164',5,'^([0-9]+)$','+212\\1',68),(1723,'callerin','From national to e164',5,'^([0-9]+)$','+291\\1',69),(1724,'callerin','From national to e164',5,'^([0-9]+)$','+34\\1',70),(1725,'callerin','From national to e164',5,'^([0-9]+)$','+251\\1',71),(1726,'callerin','From national to e164',5,'^([0-9]+)$','+358\\1',72),(1727,'callerin','From national to e164',5,'^([0-9]+)$','+679\\1',73),(1728,'callerin','From national to e164',5,'^([0-9]+)$','+500\\1',74),(1729,'callerin','From national to e164',5,'^([0-9]+)$','+691\\1',75),(1730,'callerin','From national to e164',5,'^([0-9]+)$','+298\\1',76),(1731,'callerin','From national to e164',5,'^([0-9]+)$','+33\\1',77),(1732,'callerin','From national to e164',5,'^([0-9]+)$','+241\\1',78),(1733,'callerin','From national to e164',5,'^([0-9]+)$','+44\\1',79),(1734,'callerin','From national to e164',5,'^([0-9]+)$','+1473\\1',80),(1735,'callerin','From national to e164',5,'^([0-9]+)$','+995\\1',81),(1736,'callerin','From national to e164',5,'^([0-9]+)$','+594\\1',82),(1737,'callerin','From national to e164',5,'^([0-9]+)$','+44\\1',83),(1738,'callerin','From national to e164',5,'^([0-9]+)$','+233\\1',84),(1739,'callerin','From national to e164',5,'^([0-9]+)$','+350\\1',85),(1740,'callerin','From national to e164',5,'^([0-9]+)$','+299\\1',86),(1741,'callerin','From national to e164',5,'^([0-9]+)$','+220\\1',87),(1742,'callerin','From national to e164',5,'^([0-9]+)$','+224\\1',88),(1743,'callerin','From national to e164',5,'^([0-9]+)$','+590\\1',89),(1744,'callerin','From national to e164',5,'^([0-9]+)$','+240\\1',90),(1745,'callerin','From national to e164',5,'^([0-9]+)$','+30\\1',91),(1746,'callerin','From national to e164',5,'^([0-9]+)$','+500\\1',92),(1747,'callerin','From national to e164',5,'^([0-9]+)$','+502\\1',93),(1748,'callerin','From national to e164',5,'^([0-9]+)$','+1671\\1',94),(1749,'callerin','From national to e164',5,'^([0-9]+)$','+245\\1',95),(1750,'callerin','From national to e164',5,'^([0-9]+)$','+592\\1',96),(1751,'callerin','From national to e164',5,'^([0-9]+)$','+852\\1',97),(1752,'callerin','From national to e164',5,'^([0-9]+)$','+672\\1',98),(1753,'callerin','From national to e164',5,'^([0-9]+)$','+504\\1',99),(1754,'callerin','From national to e164',5,'^([0-9]+)$','+385\\1',100),(1755,'callerin','From national to e164',5,'^([0-9]+)$','+509\\1',101),(1756,'callerin','From national to e164',5,'^([0-9]+)$','+36\\1',102),(1757,'callerin','From national to e164',5,'^([0-9]+)$','+62\\1',103),(1758,'callerin','From national to e164',5,'^([0-9]+)$','+353\\1',104),(1759,'callerin','From national to e164',5,'^([0-9]+)$','+972\\1',105),(1760,'callerin','From national to e164',5,'^([0-9]+)$','+44\\1',106),(1761,'callerin','From national to e164',5,'^([0-9]+)$','+91\\1',107),(1762,'callerin','From national to e164',5,'^([0-9]+)$','+246\\1',108),(1763,'callerin','From national to e164',5,'^([0-9]+)$','+964\\1',109),(1764,'callerin','From national to e164',5,'^([0-9]+)$','+98\\1',110),(1765,'callerin','From national to e164',5,'^([0-9]+)$','+354\\1',111),(1766,'callerin','From national to e164',5,'^([0-9]+)$','+39\\1',112),(1767,'callerin','From national to e164',5,'^([0-9]+)$','+44\\1',113),(1768,'callerin','From national to e164',5,'^([0-9]+)$','+1876\\1',114),(1769,'callerin','From national to e164',5,'^([0-9]+)$','+962\\1',115),(1770,'callerin','From national to e164',5,'^([0-9]+)$','+81\\1',116),(1771,'callerin','From national to e164',5,'^([0-9]+)$','+254\\1',117),(1772,'callerin','From national to e164',5,'^([0-9]+)$','+996\\1',118),(1773,'callerin','From national to e164',5,'^([0-9]+)$','+855\\1',119),(1774,'callerin','From national to e164',5,'^([0-9]+)$','+686\\1',120),(1775,'callerin','From national to e164',5,'^([0-9]+)$','+269\\1',121),(1776,'callerin','From national to e164',5,'^([0-9]+)$','+1869\\1',122),(1777,'callerin','From national to e164',5,'^([0-9]+)$','+850\\1',123),(1778,'callerin','From national to e164',5,'^([0-9]+)$','+82\\1',124),(1779,'callerin','From national to e164',5,'^([0-9]+)$','+965\\1',125),(1780,'callerin','From national to e164',5,'^([0-9]+)$','+1345\\1',126),(1781,'callerin','From national to e164',5,'^([0-9]+)$','+7\\1',127),(1782,'callerin','From national to e164',5,'^([0-9]+)$','+856\\1',128),(1783,'callerin','From national to e164',5,'^([0-9]+)$','+961\\1',129),(1784,'callerin','From national to e164',5,'^([0-9]+)$','+1758\\1',130),(1785,'callerin','From national to e164',5,'^([0-9]+)$','+423\\1',131),(1786,'callerin','From national to e164',5,'^([0-9]+)$','+94\\1',132),(1787,'callerin','From national to e164',5,'^([0-9]+)$','+231\\1',133),(1788,'callerin','From national to e164',5,'^([0-9]+)$','+266\\1',134),(1789,'callerin','From national to e164',5,'^([0-9]+)$','+370\\1',135),(1790,'callerin','From national to e164',5,'^([0-9]+)$','+352\\1',136),(1791,'callerin','From national to e164',5,'^([0-9]+)$','+371\\1',137),(1792,'callerin','From national to e164',5,'^([0-9]+)$','+218\\1',138),(1793,'callerin','From national to e164',5,'^([0-9]+)$','+212\\1',139),(1794,'callerin','From national to e164',5,'^([0-9]+)$','+377\\1',140),(1795,'callerin','From national to e164',5,'^([0-9]+)$','+373\\1',141),(1796,'callerin','From national to e164',5,'^([0-9]+)$','+382\\1',142),(1797,'callerin','From national to e164',5,'^([0-9]+)$','+1599\\1',143),(1798,'callerin','From national to e164',5,'^([0-9]+)$','+261\\1',144),(1799,'callerin','From national to e164',5,'^([0-9]+)$','+692\\1',145),(1800,'callerin','From national to e164',5,'^([0-9]+)$','+389\\1',146),(1801,'callerin','From national to e164',5,'^([0-9]+)$','+223\\1',147),(1802,'callerin','From national to e164',5,'^([0-9]+)$','+95\\1',148),(1803,'callerin','From national to e164',5,'^([0-9]+)$','+976\\1',149),(1804,'callerin','From national to e164',5,'^([0-9]+)$','+853\\1',150),(1805,'callerin','From national to e164',5,'^([0-9]+)$','+1670\\1',151),(1806,'callerin','From national to e164',5,'^([0-9]+)$','+596\\1',152),(1807,'callerin','From national to e164',5,'^([0-9]+)$','+222\\1',153),(1808,'callerin','From national to e164',5,'^([0-9]+)$','+1664\\1',154),(1809,'callerin','From national to e164',5,'^([0-9]+)$','+356\\1',155),(1810,'callerin','From national to e164',5,'^([0-9]+)$','+230\\1',156),(1811,'callerin','From national to e164',5,'^([0-9]+)$','+960\\1',157),(1812,'callerin','From national to e164',5,'^([0-9]+)$','+265\\1',158),(1813,'callerin','From national to e164',5,'^([0-9]+)$','+52\\1',159),(1814,'callerin','From national to e164',5,'^([0-9]+)$','+60\\1',160),(1815,'callerin','From national to e164',5,'^([0-9]+)$','+258\\1',161),(1816,'callerin','From national to e164',5,'^([0-9]+)$','+264\\1',162),(1817,'callerin','From national to e164',5,'^([0-9]+)$','+687\\1',163),(1818,'callerin','From national to e164',5,'^([0-9]+)$','+227\\1',164),(1819,'callerin','From national to e164',5,'^([0-9]+)$','+672\\1',165),(1820,'callerin','From national to e164',5,'^([0-9]+)$','+234\\1',166),(1821,'callerin','From national to e164',5,'^([0-9]+)$','+505\\1',167),(1822,'callerin','From national to e164',5,'^([0-9]+)$','+31\\1',168),(1823,'callerin','From national to e164',5,'^([0-9]+)$','+47\\1',169),(1824,'callerin','From national to e164',5,'^([0-9]+)$','+977\\1',170),(1825,'callerin','From national to e164',5,'^([0-9]+)$','+674\\1',171),(1826,'callerin','From national to e164',5,'^([0-9]+)$','+683\\1',172),(1827,'callerin','From national to e164',5,'^([0-9]+)$','+64\\1',173),(1828,'callerin','From national to e164',5,'^([0-9]+)$','+968\\1',174),(1829,'callerin','From national to e164',5,'^([0-9]+)$','+507\\1',175),(1830,'callerin','From national to e164',5,'^([0-9]+)$','+51\\1',176),(1831,'callerin','From national to e164',5,'^([0-9]+)$','+689\\1',177),(1832,'callerin','From national to e164',5,'^([0-9]+)$','+675\\1',178),(1833,'callerin','From national to e164',5,'^([0-9]+)$','+63\\1',179),(1834,'callerin','From national to e164',5,'^([0-9]+)$','+92\\1',180),(1835,'callerin','From national to e164',5,'^([0-9]+)$','+48\\1',181),(1836,'callerin','From national to e164',5,'^([0-9]+)$','+508\\1',182),(1837,'callerin','From national to e164',5,'^([0-9]+)$','+870\\1',183),(1838,'callerin','From national to e164',5,'^([0-9]+)$','+1\\1',184),(1839,'callerin','From national to e164',5,'^([0-9]+)$','+970\\1',185),(1840,'callerin','From national to e164',5,'^([0-9]+)$','+351\\1',186),(1841,'callerin','From national to e164',5,'^([0-9]+)$','+680\\1',187),(1842,'callerin','From national to e164',5,'^([0-9]+)$','+595\\1',188),(1843,'callerin','From national to e164',5,'^([0-9]+)$','+974\\1',189),(1844,'callerin','From national to e164',5,'^([0-9]+)$','+262\\1',190),(1845,'callerin','From national to e164',5,'^([0-9]+)$','+40\\1',191),(1846,'callerin','From national to e164',5,'^([0-9]+)$','+381\\1',192),(1847,'callerin','From national to e164',5,'^([0-9]+)$','+7\\1',193),(1848,'callerin','From national to e164',5,'^([0-9]+)$','+250\\1',194),(1849,'callerin','From national to e164',5,'^([0-9]+)$','+966\\1',195),(1850,'callerin','From national to e164',5,'^([0-9]+)$','+677\\1',196),(1851,'callerin','From national to e164',5,'^([0-9]+)$','+248\\1',197),(1852,'callerin','From national to e164',5,'^([0-9]+)$','+249\\1',198),(1853,'callerin','From national to e164',5,'^([0-9]+)$','+46\\1',199),(1854,'callerin','From national to e164',5,'^([0-9]+)$','+65\\1',200),(1855,'callerin','From national to e164',5,'^([0-9]+)$','+290\\1',201),(1856,'callerin','From national to e164',5,'^([0-9]+)$','+386\\1',202),(1857,'callerin','From national to e164',5,'^([0-9]+)$','+47\\1',203),(1858,'callerin','From national to e164',5,'^([0-9]+)$','+421\\1',204),(1859,'callerin','From national to e164',5,'^([0-9]+)$','+232\\1',205),(1860,'callerin','From national to e164',5,'^([0-9]+)$','+378\\1',206),(1861,'callerin','From national to e164',5,'^([0-9]+)$','+221\\1',207),(1862,'callerin','From national to e164',5,'^([0-9]+)$','+252\\1',208),(1863,'callerin','From national to e164',5,'^([0-9]+)$','+597\\1',209),(1864,'callerin','From national to e164',5,'^([0-9]+)$','+211\\1',210),(1865,'callerin','From national to e164',5,'^([0-9]+)$','+239\\1',211),(1866,'callerin','From national to e164',5,'^([0-9]+)$','+503\\1',212),(1867,'callerin','From national to e164',5,'^([0-9]+)$','+1721\\1',213),(1868,'callerin','From national to e164',5,'^([0-9]+)$','+963\\1',214),(1869,'callerin','From national to e164',5,'^([0-9]+)$','+268\\1',215),(1870,'callerin','From national to e164',5,'^([0-9]+)$','+1649\\1',216),(1871,'callerin','From national to e164',5,'^([0-9]+)$','+235\\1',217),(1872,'callerin','From national to e164',5,'^([0-9]+)$','+262\\1',218),(1873,'callerin','From national to e164',5,'^([0-9]+)$','+228\\1',219),(1874,'callerin','From national to e164',5,'^([0-9]+)$','+66\\1',220),(1875,'callerin','From national to e164',5,'^([0-9]+)$','+992\\1',221),(1876,'callerin','From national to e164',5,'^([0-9]+)$','+690\\1',222),(1877,'callerin','From national to e164',5,'^([0-9]+)$','+670\\1',223),(1878,'callerin','From national to e164',5,'^([0-9]+)$','+993\\1',224),(1879,'callerin','From national to e164',5,'^([0-9]+)$','+216\\1',225),(1880,'callerin','From national to e164',5,'^([0-9]+)$','+676\\1',226),(1881,'callerin','From national to e164',5,'^([0-9]+)$','+90\\1',227),(1882,'callerin','From national to e164',5,'^([0-9]+)$','+1868\\1',228),(1883,'callerin','From national to e164',5,'^([0-9]+)$','+688\\1',229),(1884,'callerin','From national to e164',5,'^([0-9]+)$','+886\\1',230),(1885,'callerin','From national to e164',5,'^([0-9]+)$','+255\\1',231),(1886,'callerin','From national to e164',5,'^([0-9]+)$','+380\\1',232),(1887,'callerin','From national to e164',5,'^([0-9]+)$','+256\\1',233),(1888,'callerin','From national to e164',5,'^([0-9]+)$','+1\\1',234),(1889,'callerin','From national to e164',5,'^([0-9]+)$','+1\\1',235),(1890,'callerin','From national to e164',5,'^([0-9]+)$','+598\\1',236),(1891,'callerin','From national to e164',5,'^([0-9]+)$','+998\\1',237),(1892,'callerin','From national to e164',5,'^([0-9]+)$','+39\\1',238),(1893,'callerin','From national to e164',5,'^([0-9]+)$','+1784\\1',239),(1894,'callerin','From national to e164',5,'^([0-9]+)$','+58\\1',240),(1895,'callerin','From national to e164',5,'^([0-9]+)$','+1284\\1',241),(1896,'callerin','From national to e164',5,'^([0-9]+)$','+1340\\1',242),(1897,'callerin','From national to e164',5,'^([0-9]+)$','+84\\1',243),(1898,'callerin','From national to e164',5,'^([0-9]+)$','+678\\1',244),(1899,'callerin','From national to e164',5,'^([0-9]+)$','+681\\1',245),(1900,'callerin','From national to e164',5,'^([0-9]+)$','+685\\1',246),(1901,'callerin','From national to e164',5,'^([0-9]+)$','+967\\1',247),(1902,'callerin','From national to e164',5,'^([0-9]+)$','+262\\1',248),(1903,'callerin','From national to e164',5,'^([0-9]+)$','+27\\1',249),(1904,'callerin','From national to e164',5,'^([0-9]+)$','+260\\1',250),(1905,'callerin','From national to e164',5,'^([0-9]+)$','+263\\1',251),(1912,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',1),(1913,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',2),(1914,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',3),(1915,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',4),(1916,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',5),(1917,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',6),(1918,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',7),(1919,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',8),(1920,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',9),(1921,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',10),(1922,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',11),(1923,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',12),(1924,'calleein','From international to e164',1,'^(\\+|0011)([0-9]+)$','+\\2',13),(1925,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',14),(1926,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',15),(1927,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',16),(1928,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',17),(1929,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',18),(1930,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',19),(1931,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',20),(1932,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',21),(1933,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',22),(1934,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',23),(1935,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',24),(1936,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',25),(1937,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',26),(1938,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',27),(1939,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',28),(1940,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',29),(1941,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',30),(1942,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',31),(1943,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',32),(1944,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',33),(1945,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',34),(1946,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',35),(1947,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',36),(1948,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',37),(1949,'calleein','From international to e164',1,'^(\\+|011)([0-9]+)$','+\\2',38),(1950,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',39),(1951,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',40),(1952,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',41),(1953,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',42),(1954,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',43),(1955,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',44),(1956,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',45),(1957,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',46),(1958,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',47),(1959,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',48),(1960,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',49),(1961,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',50),(1962,'calleein','From international to e164',1,'^(\\+|119)([0-9]+)$','+\\2',51),(1963,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',52),(1964,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',53),(1965,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',54),(1966,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',55),(1967,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',56),(1968,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',57),(1969,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',58),(1970,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',59),(1971,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',60),(1972,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',61),(1973,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',64),(1974,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',65),(1975,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',66),(1976,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',67),(1977,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',68),(1978,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',69),(1979,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',70),(1980,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',71),(1981,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',72),(1982,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',73),(1983,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',74),(1984,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',75),(1985,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',76),(1986,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',77),(1987,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',78),(1988,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',79),(1989,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',80),(1990,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',81),(1991,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',82),(1992,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',83),(1993,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',84),(1994,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',85),(1995,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',86),(1996,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',87),(1997,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',88),(1998,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',89),(1999,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',90),(2000,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',91),(2001,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',92),(2002,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',93),(2003,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',94),(2004,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',95),(2005,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',96),(2006,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',97),(2007,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',98),(2008,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',99),(2009,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',100),(2010,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',101),(2011,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',102),(2012,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',103),(2013,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',104),(2014,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',105),(2015,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',106),(2016,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',107),(2017,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',108),(2018,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',109),(2019,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',110),(2020,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',111),(2021,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',112),(2022,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',113),(2023,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',114),(2024,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',115),(2025,'calleein','From international to e164',1,'^(\\+|010)([0-9]+)$','+\\2',116),(2026,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',117),(2027,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',118),(2028,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',119),(2029,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',120),(2030,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',121),(2031,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',122),(2032,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',123),(2033,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',124),(2034,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',125),(2035,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',126),(2036,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',127),(2037,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',128),(2038,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',129),(2039,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',130),(2040,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',131),(2041,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',132),(2042,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',133),(2043,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',134),(2044,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',135),(2045,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',136),(2046,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',137),(2047,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',138),(2048,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',139),(2049,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',140),(2050,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',141),(2051,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',142),(2052,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',143),(2053,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',144),(2054,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',145),(2055,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',146),(2056,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',147),(2057,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',148),(2058,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',149),(2059,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',150),(2060,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',151),(2061,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',152),(2062,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',153),(2063,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',154),(2064,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',155),(2065,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',156),(2066,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',157),(2067,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',158),(2068,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',159),(2069,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',160),(2070,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',161),(2071,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',162),(2072,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',163),(2073,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',164),(2074,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',165),(2075,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',166),(2076,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',167),(2077,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',168),(2078,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',169),(2079,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',170),(2080,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',171),(2081,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',172),(2082,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',173),(2083,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',174),(2084,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',175),(2085,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',176),(2086,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',177),(2087,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',178),(2088,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',179),(2089,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',180),(2090,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',181),(2091,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',182),(2092,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',183),(2093,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',184),(2094,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',185),(2095,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',186),(2096,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',187),(2097,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',188),(2098,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',189),(2099,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',190),(2100,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',191),(2101,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',192),(2102,'calleein','From international to e164',1,'^(\\+|810)([0-9]+)$','+\\2',193),(2103,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',194),(2104,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',195),(2105,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',196),(2106,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',197),(2107,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',198),(2108,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',199),(2109,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',200),(2110,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',201),(2111,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',202),(2112,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',203),(2113,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',204),(2114,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',205),(2115,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',206),(2116,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',207),(2117,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',208),(2118,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',209),(2119,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',210),(2120,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',211),(2121,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',212),(2122,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',213),(2123,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',214),(2124,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',215),(2125,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',216),(2126,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',217),(2127,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',218),(2128,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',219),(2129,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',220),(2130,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',221),(2131,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',222),(2132,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',223),(2133,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',224),(2134,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',225),(2135,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',226),(2136,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',227),(2137,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',228),(2138,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',229),(2139,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',230),(2140,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',231),(2141,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',232),(2142,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',233),(2143,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',234),(2144,'calleein','From international to e164',1,'^(\\+|011)([0-9]+)$','+\\2',235),(2145,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',236),(2146,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',237),(2147,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',238),(2148,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',239),(2149,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',240),(2150,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',241),(2151,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',242),(2152,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',243),(2153,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',244),(2154,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',245),(2155,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',246),(2156,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',247),(2157,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',248),(2158,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',249),(2159,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',250),(2160,'calleein','From international to e164',1,'^(\\+|00)([0-9]+)$','+\\2',251),(2167,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+971\\1',2),(2168,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+93\\1',3),(2169,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1268\\1',4),(2170,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1264\\1',5),(2171,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+355\\1',6),(2172,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+54\\1',10),(2173,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1684\\1',11),(2174,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+43\\1',12),(2175,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+61\\1',13),(2176,'calleein','From out of area national to e164',2,'^8([0-9]{9})$','+994\\1',16),(2177,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+387\\1',17),(2178,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1246\\1',18),(2179,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+880\\1',19),(2180,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+32\\1',20),(2181,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+359\\1',22),(2182,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1441\\1',27),(2183,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+591\\1',29),(2184,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+55\\1',31),(2185,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1242\\1',32),(2186,'calleein','From out of area national to e164',2,'^8([0-9]{9})$','+375\\1',36),(2187,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1\\1',38),(2188,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+41\\1',43),(2189,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+86\\1',48),(2190,'calleein','From out of area national to e164',2,'^0([0-9]{7})$','+53\\1',51),(2191,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+357\\1',55),(2192,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1767\\1',60),(2193,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1809\\1',61),(2194,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+20\\1',67),(2195,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+358\\1',72),(2196,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+33\\1',77),(2197,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+44\\1',79),(2198,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1473\\1',80),(2199,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+30\\1',91),(2200,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1671\\1',94),(2201,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+385\\1',100),(2202,'calleein','From out of area national to e164',2,'^06([0-9]{9})$','+36\\1',102),(2203,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+62\\1',103),(2204,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+353\\1',104),(2205,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+972\\1',105),(2206,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+91\\1',107),(2207,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+98\\1',110),(2208,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1876\\1',114),(2209,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+962\\1',115),(2210,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+81\\1',116),(2211,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+254\\1',117),(2212,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+855\\1',119),(2213,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1869\\1',122),(2214,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+850\\1',123),(2215,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+82\\1',124),(2216,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1345\\1',126),(2217,'calleein','From out of area national to e164',2,'^8([0-9]{9})$','+7\\1',127),(2218,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+856\\1',128),(2219,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1758\\1',130),(2220,'calleein','From out of area national to e164',2,'^8([0-9]{9})$','+370\\1',135),(2221,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+212\\1',139),(2222,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+373\\1',141),(2223,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+382\\1',142),(2224,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+389\\1',146),(2225,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+95\\1',148),(2226,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+976\\1',149),(2227,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1670\\1',151),(2228,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1664\\1',154),(2229,'calleein','From out of area national to e164',2,'^01([0-9]{9})$','+52\\1',159),(2230,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+60\\1',160),(2231,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+234\\1',166),(2232,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+31\\1',168),(2233,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+64\\1',173),(2234,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+51\\1',176),(2235,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+63\\1',179),(2236,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+92\\1',180),(2237,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1\\1',184),(2238,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+40\\1',191),(2239,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+381\\1',192),(2240,'calleein','From out of area national to e164',2,'^8([0-9]{10})$','+7\\1',193),(2241,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+250\\1',194),(2242,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+966\\1',195),(2243,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+46\\1',199),(2244,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+386\\1',202),(2245,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+421\\1',204),(2246,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1721\\1',213),(2247,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1649\\1',216),(2248,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+66\\1',220),(2249,'calleein','From out of area national to e164',2,'^8([0-9]{9})$','+993\\1',224),(2250,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+90\\1',227),(2251,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1868\\1',228),(2252,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+886\\1',230),(2253,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+255\\1',231),(2254,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+380\\1',232),(2255,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1\\1',235),(2256,'calleein','From out of area national to e164',2,'^8([0-9]{9})$','+998\\1',237),(2257,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1784\\1',239),(2258,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+58\\1',240),(2259,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1284\\1',241),(2260,'calleein','From out of area national to e164',2,'^1([0-9]{9})$','+1340\\1',242),(2261,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+84\\1',243),(2262,'calleein','From out of area national to e164',2,'^0([0-9]{9})$','+27\\1',249),(2294,'calleein','From national to e164',5,'^([0-9]+)$','+376\\1',1),(2295,'calleein','From national to e164',5,'^([0-9]+)$','+971\\1',2),(2296,'calleein','From national to e164',5,'^([0-9]+)$','+93\\1',3),(2297,'calleein','From national to e164',5,'^([0-9]+)$','+1268\\1',4),(2298,'calleein','From national to e164',5,'^([0-9]+)$','+1264\\1',5),(2299,'calleein','From national to e164',5,'^([0-9]+)$','+355\\1',6),(2300,'calleein','From national to e164',5,'^([0-9]+)$','+374\\1',7),(2301,'calleein','From national to e164',5,'^([0-9]+)$','+244\\1',8),(2302,'calleein','From national to e164',5,'^([0-9]+)$','+672\\1',9),(2303,'calleein','From national to e164',5,'^([0-9]+)$','+54\\1',10),(2304,'calleein','From national to e164',5,'^([0-9]+)$','+1684\\1',11),(2305,'calleein','From national to e164',5,'^([0-9]+)$','+43\\1',12),(2306,'calleein','From national to e164',5,'^([0-9]+)$','+61\\1',13),(2307,'calleein','From national to e164',5,'^([0-9]+)$','+297\\1',14),(2308,'calleein','From national to e164',5,'^([0-9]+)$','+358\\1',15),(2309,'calleein','From national to e164',5,'^([0-9]+)$','+994\\1',16),(2310,'calleein','From national to e164',5,'^([0-9]+)$','+387\\1',17),(2311,'calleein','From national to e164',5,'^([0-9]+)$','+1246\\1',18),(2312,'calleein','From national to e164',5,'^([0-9]+)$','+880\\1',19),(2313,'calleein','From national to e164',5,'^([0-9]+)$','+32\\1',20),(2314,'calleein','From national to e164',5,'^([0-9]+)$','+226\\1',21),(2315,'calleein','From national to e164',5,'^([0-9]+)$','+359\\1',22),(2316,'calleein','From national to e164',5,'^([0-9]+)$','+973\\1',23),(2317,'calleein','From national to e164',5,'^([0-9]+)$','+257\\1',24),(2318,'calleein','From national to e164',5,'^([0-9]+)$','+229\\1',25),(2319,'calleein','From national to e164',5,'^([0-9]+)$','+590\\1',26),(2320,'calleein','From national to e164',5,'^([0-9]+)$','+1441\\1',27),(2321,'calleein','From national to e164',5,'^([0-9]+)$','+673\\1',28),(2322,'calleein','From national to e164',5,'^([0-9]+)$','+591\\1',29),(2323,'calleein','From national to e164',5,'^([0-9]+)$','+599\\1',30),(2324,'calleein','From national to e164',5,'^([0-9]+)$','+55\\1',31),(2325,'calleein','From national to e164',5,'^([0-9]+)$','+1242\\1',32),(2326,'calleein','From national to e164',5,'^([0-9]+)$','+975\\1',33),(2327,'calleein','From national to e164',5,'^([0-9]+)$','+47\\1',34),(2328,'calleein','From national to e164',5,'^([0-9]+)$','+267\\1',35),(2329,'calleein','From national to e164',5,'^([0-9]+)$','+375\\1',36),(2330,'calleein','From national to e164',5,'^([0-9]+)$','+501\\1',37),(2331,'calleein','From national to e164',5,'^([0-9]+)$','+1\\1',38),(2332,'calleein','From national to e164',5,'^([0-9]+)$','+61\\1',39),(2333,'calleein','From national to e164',5,'^([0-9]+)$','+243\\1',40),(2334,'calleein','From national to e164',5,'^([0-9]+)$','+236\\1',41),(2335,'calleein','From national to e164',5,'^([0-9]+)$','+242\\1',42),(2336,'calleein','From national to e164',5,'^([0-9]+)$','+41\\1',43),(2337,'calleein','From national to e164',5,'^([0-9]+)$','+225\\1',44),(2338,'calleein','From national to e164',5,'^([0-9]+)$','+682\\1',45),(2339,'calleein','From national to e164',5,'^([0-9]+)$','+56\\1',46),(2340,'calleein','From national to e164',5,'^([0-9]+)$','+237\\1',47),(2341,'calleein','From national to e164',5,'^([0-9]+)$','+86\\1',48),(2342,'calleein','From national to e164',5,'^([0-9]+)$','+57\\1',49),(2343,'calleein','From national to e164',5,'^([0-9]+)$','+506\\1',50),(2344,'calleein','From national to e164',5,'^([0-9]+)$','+53\\1',51),(2345,'calleein','From national to e164',5,'^([0-9]+)$','+238\\1',52),(2346,'calleein','From national to e164',5,'^([0-9]+)$','+599\\1',53),(2347,'calleein','From national to e164',5,'^([0-9]+)$','+61\\1',54),(2348,'calleein','From national to e164',5,'^([0-9]+)$','+357\\1',55),(2349,'calleein','From national to e164',5,'^([0-9]+)$','+420\\1',56),(2350,'calleein','From national to e164',5,'^([0-9]+)$','+49\\1',57),(2351,'calleein','From national to e164',5,'^([0-9]+)$','+253\\1',58),(2352,'calleein','From national to e164',5,'^([0-9]+)$','+45\\1',59),(2353,'calleein','From national to e164',5,'^([0-9]+)$','+1767\\1',60),(2354,'calleein','From national to e164',5,'^([0-9]+)$','+1809\\1',61),(2355,'calleein','From national to e164',5,'^([0-9]+)$','+213\\1',64),(2356,'calleein','From national to e164',5,'^([0-9]+)$','+593\\1',65),(2357,'calleein','From national to e164',5,'^([0-9]+)$','+372\\1',66),(2358,'calleein','From national to e164',5,'^([0-9]+)$','+20\\1',67),(2359,'calleein','From national to e164',5,'^([0-9]+)$','+212\\1',68),(2360,'calleein','From national to e164',5,'^([0-9]+)$','+291\\1',69),(2361,'calleein','From national to e164',5,'^([0-9]+)$','+34\\1',70),(2362,'calleein','From national to e164',5,'^([0-9]+)$','+251\\1',71),(2363,'calleein','From national to e164',5,'^([0-9]+)$','+358\\1',72),(2364,'calleein','From national to e164',5,'^([0-9]+)$','+679\\1',73),(2365,'calleein','From national to e164',5,'^([0-9]+)$','+500\\1',74),(2366,'calleein','From national to e164',5,'^([0-9]+)$','+691\\1',75),(2367,'calleein','From national to e164',5,'^([0-9]+)$','+298\\1',76),(2368,'calleein','From national to e164',5,'^([0-9]+)$','+33\\1',77),(2369,'calleein','From national to e164',5,'^([0-9]+)$','+241\\1',78),(2370,'calleein','From national to e164',5,'^([0-9]+)$','+44\\1',79),(2371,'calleein','From national to e164',5,'^([0-9]+)$','+1473\\1',80),(2372,'calleein','From national to e164',5,'^([0-9]+)$','+995\\1',81),(2373,'calleein','From national to e164',5,'^([0-9]+)$','+594\\1',82),(2374,'calleein','From national to e164',5,'^([0-9]+)$','+44\\1',83),(2375,'calleein','From national to e164',5,'^([0-9]+)$','+233\\1',84),(2376,'calleein','From national to e164',5,'^([0-9]+)$','+350\\1',85),(2377,'calleein','From national to e164',5,'^([0-9]+)$','+299\\1',86),(2378,'calleein','From national to e164',5,'^([0-9]+)$','+220\\1',87),(2379,'calleein','From national to e164',5,'^([0-9]+)$','+224\\1',88),(2380,'calleein','From national to e164',5,'^([0-9]+)$','+590\\1',89),(2381,'calleein','From national to e164',5,'^([0-9]+)$','+240\\1',90),(2382,'calleein','From national to e164',5,'^([0-9]+)$','+30\\1',91),(2383,'calleein','From national to e164',5,'^([0-9]+)$','+500\\1',92),(2384,'calleein','From national to e164',5,'^([0-9]+)$','+502\\1',93),(2385,'calleein','From national to e164',5,'^([0-9]+)$','+1671\\1',94),(2386,'calleein','From national to e164',5,'^([0-9]+)$','+245\\1',95),(2387,'calleein','From national to e164',5,'^([0-9]+)$','+592\\1',96),(2388,'calleein','From national to e164',5,'^([0-9]+)$','+852\\1',97),(2389,'calleein','From national to e164',5,'^([0-9]+)$','+672\\1',98),(2390,'calleein','From national to e164',5,'^([0-9]+)$','+504\\1',99),(2391,'calleein','From national to e164',5,'^([0-9]+)$','+385\\1',100),(2392,'calleein','From national to e164',5,'^([0-9]+)$','+509\\1',101),(2393,'calleein','From national to e164',5,'^([0-9]+)$','+36\\1',102),(2394,'calleein','From national to e164',5,'^([0-9]+)$','+62\\1',103),(2395,'calleein','From national to e164',5,'^([0-9]+)$','+353\\1',104),(2396,'calleein','From national to e164',5,'^([0-9]+)$','+972\\1',105),(2397,'calleein','From national to e164',5,'^([0-9]+)$','+44\\1',106),(2398,'calleein','From national to e164',5,'^([0-9]+)$','+91\\1',107),(2399,'calleein','From national to e164',5,'^([0-9]+)$','+246\\1',108),(2400,'calleein','From national to e164',5,'^([0-9]+)$','+964\\1',109),(2401,'calleein','From national to e164',5,'^([0-9]+)$','+98\\1',110),(2402,'calleein','From national to e164',5,'^([0-9]+)$','+354\\1',111),(2403,'calleein','From national to e164',5,'^([0-9]+)$','+39\\1',112),(2404,'calleein','From national to e164',5,'^([0-9]+)$','+44\\1',113),(2405,'calleein','From national to e164',5,'^([0-9]+)$','+1876\\1',114),(2406,'calleein','From national to e164',5,'^([0-9]+)$','+962\\1',115),(2407,'calleein','From national to e164',5,'^([0-9]+)$','+81\\1',116),(2408,'calleein','From national to e164',5,'^([0-9]+)$','+254\\1',117),(2409,'calleein','From national to e164',5,'^([0-9]+)$','+996\\1',118),(2410,'calleein','From national to e164',5,'^([0-9]+)$','+855\\1',119),(2411,'calleein','From national to e164',5,'^([0-9]+)$','+686\\1',120),(2412,'calleein','From national to e164',5,'^([0-9]+)$','+269\\1',121),(2413,'calleein','From national to e164',5,'^([0-9]+)$','+1869\\1',122),(2414,'calleein','From national to e164',5,'^([0-9]+)$','+850\\1',123),(2415,'calleein','From national to e164',5,'^([0-9]+)$','+82\\1',124),(2416,'calleein','From national to e164',5,'^([0-9]+)$','+965\\1',125),(2417,'calleein','From national to e164',5,'^([0-9]+)$','+1345\\1',126),(2418,'calleein','From national to e164',5,'^([0-9]+)$','+7\\1',127),(2419,'calleein','From national to e164',5,'^([0-9]+)$','+856\\1',128),(2420,'calleein','From national to e164',5,'^([0-9]+)$','+961\\1',129),(2421,'calleein','From national to e164',5,'^([0-9]+)$','+1758\\1',130),(2422,'calleein','From national to e164',5,'^([0-9]+)$','+423\\1',131),(2423,'calleein','From national to e164',5,'^([0-9]+)$','+94\\1',132),(2424,'calleein','From national to e164',5,'^([0-9]+)$','+231\\1',133),(2425,'calleein','From national to e164',5,'^([0-9]+)$','+266\\1',134),(2426,'calleein','From national to e164',5,'^([0-9]+)$','+370\\1',135),(2427,'calleein','From national to e164',5,'^([0-9]+)$','+352\\1',136),(2428,'calleein','From national to e164',5,'^([0-9]+)$','+371\\1',137),(2429,'calleein','From national to e164',5,'^([0-9]+)$','+218\\1',138),(2430,'calleein','From national to e164',5,'^([0-9]+)$','+212\\1',139),(2431,'calleein','From national to e164',5,'^([0-9]+)$','+377\\1',140),(2432,'calleein','From national to e164',5,'^([0-9]+)$','+373\\1',141),(2433,'calleein','From national to e164',5,'^([0-9]+)$','+382\\1',142),(2434,'calleein','From national to e164',5,'^([0-9]+)$','+1599\\1',143),(2435,'calleein','From national to e164',5,'^([0-9]+)$','+261\\1',144),(2436,'calleein','From national to e164',5,'^([0-9]+)$','+692\\1',145),(2437,'calleein','From national to e164',5,'^([0-9]+)$','+389\\1',146),(2438,'calleein','From national to e164',5,'^([0-9]+)$','+223\\1',147),(2439,'calleein','From national to e164',5,'^([0-9]+)$','+95\\1',148),(2440,'calleein','From national to e164',5,'^([0-9]+)$','+976\\1',149),(2441,'calleein','From national to e164',5,'^([0-9]+)$','+853\\1',150),(2442,'calleein','From national to e164',5,'^([0-9]+)$','+1670\\1',151),(2443,'calleein','From national to e164',5,'^([0-9]+)$','+596\\1',152),(2444,'calleein','From national to e164',5,'^([0-9]+)$','+222\\1',153),(2445,'calleein','From national to e164',5,'^([0-9]+)$','+1664\\1',154),(2446,'calleein','From national to e164',5,'^([0-9]+)$','+356\\1',155),(2447,'calleein','From national to e164',5,'^([0-9]+)$','+230\\1',156),(2448,'calleein','From national to e164',5,'^([0-9]+)$','+960\\1',157),(2449,'calleein','From national to e164',5,'^([0-9]+)$','+265\\1',158),(2450,'calleein','From national to e164',5,'^([0-9]+)$','+52\\1',159),(2451,'calleein','From national to e164',5,'^([0-9]+)$','+60\\1',160),(2452,'calleein','From national to e164',5,'^([0-9]+)$','+258\\1',161),(2453,'calleein','From national to e164',5,'^([0-9]+)$','+264\\1',162),(2454,'calleein','From national to e164',5,'^([0-9]+)$','+687\\1',163),(2455,'calleein','From national to e164',5,'^([0-9]+)$','+227\\1',164),(2456,'calleein','From national to e164',5,'^([0-9]+)$','+672\\1',165),(2457,'calleein','From national to e164',5,'^([0-9]+)$','+234\\1',166),(2458,'calleein','From national to e164',5,'^([0-9]+)$','+505\\1',167),(2459,'calleein','From national to e164',5,'^([0-9]+)$','+31\\1',168),(2460,'calleein','From national to e164',5,'^([0-9]+)$','+47\\1',169),(2461,'calleein','From national to e164',5,'^([0-9]+)$','+977\\1',170),(2462,'calleein','From national to e164',5,'^([0-9]+)$','+674\\1',171),(2463,'calleein','From national to e164',5,'^([0-9]+)$','+683\\1',172),(2464,'calleein','From national to e164',5,'^([0-9]+)$','+64\\1',173),(2465,'calleein','From national to e164',5,'^([0-9]+)$','+968\\1',174),(2466,'calleein','From national to e164',5,'^([0-9]+)$','+507\\1',175),(2467,'calleein','From national to e164',5,'^([0-9]+)$','+51\\1',176),(2468,'calleein','From national to e164',5,'^([0-9]+)$','+689\\1',177),(2469,'calleein','From national to e164',5,'^([0-9]+)$','+675\\1',178),(2470,'calleein','From national to e164',5,'^([0-9]+)$','+63\\1',179),(2471,'calleein','From national to e164',5,'^([0-9]+)$','+92\\1',180),(2472,'calleein','From national to e164',5,'^([0-9]+)$','+48\\1',181),(2473,'calleein','From national to e164',5,'^([0-9]+)$','+508\\1',182),(2474,'calleein','From national to e164',5,'^([0-9]+)$','+870\\1',183),(2475,'calleein','From national to e164',5,'^([0-9]+)$','+1\\1',184),(2476,'calleein','From national to e164',5,'^([0-9]+)$','+970\\1',185),(2477,'calleein','From national to e164',5,'^([0-9]+)$','+351\\1',186),(2478,'calleein','From national to e164',5,'^([0-9]+)$','+680\\1',187),(2479,'calleein','From national to e164',5,'^([0-9]+)$','+595\\1',188),(2480,'calleein','From national to e164',5,'^([0-9]+)$','+974\\1',189),(2481,'calleein','From national to e164',5,'^([0-9]+)$','+262\\1',190),(2482,'calleein','From national to e164',5,'^([0-9]+)$','+40\\1',191),(2483,'calleein','From national to e164',5,'^([0-9]+)$','+381\\1',192),(2484,'calleein','From national to e164',5,'^([0-9]+)$','+7\\1',193),(2485,'calleein','From national to e164',5,'^([0-9]+)$','+250\\1',194),(2486,'calleein','From national to e164',5,'^([0-9]+)$','+966\\1',195),(2487,'calleein','From national to e164',5,'^([0-9]+)$','+677\\1',196),(2488,'calleein','From national to e164',5,'^([0-9]+)$','+248\\1',197),(2489,'calleein','From national to e164',5,'^([0-9]+)$','+249\\1',198),(2490,'calleein','From national to e164',5,'^([0-9]+)$','+46\\1',199),(2491,'calleein','From national to e164',5,'^([0-9]+)$','+65\\1',200),(2492,'calleein','From national to e164',5,'^([0-9]+)$','+290\\1',201),(2493,'calleein','From national to e164',5,'^([0-9]+)$','+386\\1',202),(2494,'calleein','From national to e164',5,'^([0-9]+)$','+47\\1',203),(2495,'calleein','From national to e164',5,'^([0-9]+)$','+421\\1',204),(2496,'calleein','From national to e164',5,'^([0-9]+)$','+232\\1',205),(2497,'calleein','From national to e164',5,'^([0-9]+)$','+378\\1',206),(2498,'calleein','From national to e164',5,'^([0-9]+)$','+221\\1',207),(2499,'calleein','From national to e164',5,'^([0-9]+)$','+252\\1',208),(2500,'calleein','From national to e164',5,'^([0-9]+)$','+597\\1',209),(2501,'calleein','From national to e164',5,'^([0-9]+)$','+211\\1',210),(2502,'calleein','From national to e164',5,'^([0-9]+)$','+239\\1',211),(2503,'calleein','From national to e164',5,'^([0-9]+)$','+503\\1',212),(2504,'calleein','From national to e164',5,'^([0-9]+)$','+1721\\1',213),(2505,'calleein','From national to e164',5,'^([0-9]+)$','+963\\1',214),(2506,'calleein','From national to e164',5,'^([0-9]+)$','+268\\1',215),(2507,'calleein','From national to e164',5,'^([0-9]+)$','+1649\\1',216),(2508,'calleein','From national to e164',5,'^([0-9]+)$','+235\\1',217),(2509,'calleein','From national to e164',5,'^([0-9]+)$','+262\\1',218),(2510,'calleein','From national to e164',5,'^([0-9]+)$','+228\\1',219),(2511,'calleein','From national to e164',5,'^([0-9]+)$','+66\\1',220),(2512,'calleein','From national to e164',5,'^([0-9]+)$','+992\\1',221),(2513,'calleein','From national to e164',5,'^([0-9]+)$','+690\\1',222),(2514,'calleein','From national to e164',5,'^([0-9]+)$','+670\\1',223),(2515,'calleein','From national to e164',5,'^([0-9]+)$','+993\\1',224),(2516,'calleein','From national to e164',5,'^([0-9]+)$','+216\\1',225),(2517,'calleein','From national to e164',5,'^([0-9]+)$','+676\\1',226),(2518,'calleein','From national to e164',5,'^([0-9]+)$','+90\\1',227),(2519,'calleein','From national to e164',5,'^([0-9]+)$','+1868\\1',228),(2520,'calleein','From national to e164',5,'^([0-9]+)$','+688\\1',229),(2521,'calleein','From national to e164',5,'^([0-9]+)$','+886\\1',230),(2522,'calleein','From national to e164',5,'^([0-9]+)$','+255\\1',231),(2523,'calleein','From national to e164',5,'^([0-9]+)$','+380\\1',232),(2524,'calleein','From national to e164',5,'^([0-9]+)$','+256\\1',233),(2525,'calleein','From national to e164',5,'^([0-9]+)$','+1\\1',234),(2526,'calleein','From national to e164',5,'^([0-9]+)$','+1\\1',235),(2527,'calleein','From national to e164',5,'^([0-9]+)$','+598\\1',236),(2528,'calleein','From national to e164',5,'^([0-9]+)$','+998\\1',237),(2529,'calleein','From national to e164',5,'^([0-9]+)$','+39\\1',238),(2530,'calleein','From national to e164',5,'^([0-9]+)$','+1784\\1',239),(2531,'calleein','From national to e164',5,'^([0-9]+)$','+58\\1',240),(2532,'calleein','From national to e164',5,'^([0-9]+)$','+1284\\1',241),(2533,'calleein','From national to e164',5,'^([0-9]+)$','+1340\\1',242),(2534,'calleein','From national to e164',5,'^([0-9]+)$','+84\\1',243),(2535,'calleein','From national to e164',5,'^([0-9]+)$','+678\\1',244),(2536,'calleein','From national to e164',5,'^([0-9]+)$','+681\\1',245),(2537,'calleein','From national to e164',5,'^([0-9]+)$','+685\\1',246),(2538,'calleein','From national to e164',5,'^([0-9]+)$','+967\\1',247),(2539,'calleein','From national to e164',5,'^([0-9]+)$','+262\\1',248),(2540,'calleein','From national to e164',5,'^([0-9]+)$','+27\\1',249),(2541,'calleein','From national to e164',5,'^([0-9]+)$','+260\\1',250),(2542,'calleein','From national to e164',5,'^([0-9]+)$','+263\\1',251),(2549,'callerin','From e164 without plus to e164 with plus',1,'^([0-9]+)$','+\\1',253),(2550,'calleein','From e164 without plus to e164 with plus',1,'^([0-9]+)$','+\\1',253),(2551,'callerout','From e164 with plus to e164 without plus',1,'^(\\+)([0-9]+)$','\\2',253),(2552,'calleeout','From e164 with plus to e164 without plus',1,'^(\\+)([0-9]+)$','\\2',253),(2620,'callerin','From national in e164 without plus to e164',4,'^34([0-9]+)$','+34\\1',70),(2875,'calleein','From national in e164 without plus to e164',4,'^34([0-9]+)$','+34\\1',70);
/*!40000 ALTER TABLE `TransformationRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(80) DEFAULT NULL COMMENT '[password]',
  `timezoneId` int unsigned DEFAULT NULL,
  `terminalId` int unsigned DEFAULT NULL,
  `extensionId` int unsigned DEFAULT NULL,
  `outgoingDDIId` int unsigned DEFAULT NULL,
  `outgoingDDIRuleId` int unsigned DEFAULT NULL,
  `callACLId` int unsigned DEFAULT NULL,
  `doNotDisturb` tinyint unsigned NOT NULL DEFAULT '0',
  `isBoss` tinyint unsigned NOT NULL DEFAULT '0',
  `bossAssistantId` int unsigned DEFAULT NULL,
  `bossAssistantWhiteListId` int unsigned DEFAULT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  `maxCalls` int unsigned NOT NULL DEFAULT '0',
  `externalIpCalls` varchar(1) NOT NULL DEFAULT '0' COMMENT '[enum:0|1|2|3]',
  `voicemailEnabled` tinyint unsigned NOT NULL DEFAULT '1',
  `voicemailLocutionId` int unsigned DEFAULT NULL,
  `voicemailSendMail` tinyint unsigned NOT NULL DEFAULT '0',
  `voicemailAttachSound` tinyint unsigned NOT NULL DEFAULT '1',
  `languageId` int unsigned DEFAULT NULL,
  `gsQRCode` tinyint unsigned NOT NULL DEFAULT '0',
  `transformationRuleSetId` int unsigned DEFAULT NULL,
  `rejectCallMethod` varchar(3) NOT NULL DEFAULT 'rfc' COMMENT '[enum:rfc|486|600]',
  `multiContact` tinyint unsigned NOT NULL DEFAULT '1',
  `locationId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueTerminalId` (`terminalId`),
  UNIQUE KEY `uniqueExtensionId` (`extensionId`),
  UNIQUE KEY `duplicateEmail` (`email`),
  KEY `IDX_D5428AED2480E723` (`companyId`),
  KEY `IDX_D5428AED31D2BA8E` (`timezoneId`),
  KEY `IDX_D5428AED508D43B5` (`outgoingDDIId`),
  KEY `IDX_D5428AEDCA2FAA07` (`callACLId`),
  KEY `IDX_D5428AEDB5FEF91D` (`bossAssistantId`),
  KEY `IDX_D5428AED940D8C7E` (`languageId`),
  KEY `IDX_D5428AEDFC6BB9C8` (`outgoingDDIRuleId`),
  KEY `IDX_D5428AEDF32B4B65` (`voicemailLocutionId`),
  KEY `IDX_D5428AED6FA2F8E7` (`bossAssistantWhiteListId`),
  KEY `IDX_D5428AED2FECF701` (`transformationRuleSetId`),
  KEY `IDX_D5428AED96D7286D` (`locationId`),
  CONSTRAINT `FK_D5428AED2FECF701` FOREIGN KEY (`transformationRuleSetId`) REFERENCES `TransformationRuleSets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D5428AED96D7286D` FOREIGN KEY (`locationId`) REFERENCES `Locations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Users_ibfk_10` FOREIGN KEY (`callACLId`) REFERENCES `CallACL` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_11` FOREIGN KEY (`bossAssistantId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_13` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_14` FOREIGN KEY (`outgoingDDIRuleId`) REFERENCES `OutgoingDDIRules` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_15` FOREIGN KEY (`voicemailLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_16` FOREIGN KEY (`bossAssistantWhiteListId`) REFERENCES `MatchLists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_3` FOREIGN KEY (`terminalId`) REFERENCES `Terminals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_7` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_8` FOREIGN KEY (`timezoneId`) REFERENCES `Timezones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_9` FOREIGN KEY (`outgoingDDIId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,1,'Alice','Allison','alice@democompany.com','$5$rounds=5000$a73b96fd$XGSEyikkLGgFNo8/TV4.IrnkfN6UecTusCVQX6Qjbl8',145,1,1,NULL,NULL,NULL,0,0,NULL,NULL,1,1,'0',1,NULL,1,1,NULL,0,70,'rfc',1,NULL),(2,1,'Bob','Bobson','bob@democompany.com','$5$rounds=5000$b1e18dba$71SpUyDy6TCqe3vg/zeZJPiV.MmF6Ip2Lc0sLeZW8u2',145,2,2,NULL,NULL,NULL,0,0,NULL,NULL,1,1,'0',1,NULL,1,1,NULL,0,70,'rfc',1,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WebPortals`
--

DROP TABLE IF EXISTS `WebPortals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WebPortals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int unsigned DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `klearTheme` varchar(200) DEFAULT '',
  `urlType` varchar(25) NOT NULL COMMENT '[enum:god|brand|admin|user]',
  `name` varchar(200) DEFAULT '',
  `logoFileSize` int unsigned DEFAULT NULL COMMENT '[FSO]',
  `logoMimeType` varchar(80) DEFAULT NULL,
  `logoBaseName` varchar(255) DEFAULT NULL,
  `userTheme` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `webportal_url` (`url`),
  KEY `IDX_C811E30C9CBEC244` (`brandId`),
  CONSTRAINT `FK_C811E30C9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WebPortals`
--

LOCK TABLES `WebPortals` WRITE;
/*!40000 ALTER TABLE `WebPortals` DISABLE KEYS */;
INSERT INTO `WebPortals` VALUES (1,NULL,'https://example.com','redmond','god','Platform Administration Portal',NULL,NULL,NULL,'default');
/*!40000 ALTER TABLE `WebPortals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ast_hints`
--

DROP TABLE IF EXISTS `ast_hints`;
/*!50001 DROP VIEW IF EXISTS `ast_hints`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ast_hints` AS SELECT 
 1 AS `exten`,
 1 AS `context`,
 1 AS `device`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ast_musiconhold`
--

DROP TABLE IF EXISTS `ast_musiconhold`;
/*!50001 DROP VIEW IF EXISTS `ast_musiconhold`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ast_musiconhold` AS SELECT 
 1 AS `name`,
 1 AS `mode`,
 1 AS `directory`,
 1 AS `sort`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ast_ps_aors`
--

DROP TABLE IF EXISTS `ast_ps_aors`;
/*!50001 DROP VIEW IF EXISTS `ast_ps_aors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ast_ps_aors` AS SELECT 
 1 AS `sorcery_id`,
 1 AS `contact`,
 1 AS `qualify_frequency`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ast_ps_endpoints`
--

DROP TABLE IF EXISTS `ast_ps_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_ps_endpoints` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sorcery_id` varchar(40) NOT NULL,
  `from_domain` varchar(190) DEFAULT NULL,
  `terminalId` int unsigned DEFAULT NULL,
  `friendId` int unsigned DEFAULT NULL,
  `residentialDeviceId` int unsigned DEFAULT NULL,
  `retailAccountId` int unsigned DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `context` varchar(40) NOT NULL DEFAULT 'users',
  `disallow` varchar(200) NOT NULL DEFAULT 'all',
  `allow` varchar(200) NOT NULL DEFAULT 'all',
  `direct_media` enum('yes','no') DEFAULT 'yes',
  `direct_media_method` enum('invite','reinvite','update') DEFAULT 'update' COMMENT '[enum:update|invite|reinvite]',
  `mailboxes` varchar(100) DEFAULT NULL,
  `named_pickup_group` varchar(255) DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT 'yes',
  `send_pai` enum('yes','no') DEFAULT 'yes',
  `100rel` enum('no','required','yes') NOT NULL DEFAULT 'no',
  `outbound_proxy` varchar(256) DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `t38_udptl` varchar(255) NOT NULL DEFAULT 'no' COMMENT '[enum:yes|no]',
  `t38_udptl_ec` varchar(255) NOT NULL DEFAULT 'redundancy' COMMENT '[enum:none|fec|redundancy]',
  `t38_udptl_maxdatagram` int unsigned NOT NULL DEFAULT '1440',
  `t38_udptl_nat` varchar(255) NOT NULL DEFAULT 'no' COMMENT '[enum:yes|no]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `psEndpoint_terminal` (`terminalId`),
  UNIQUE KEY `psEndpoint_friend` (`friendId`),
  UNIQUE KEY `psEndpoint_residential_device` (`residentialDeviceId`),
  UNIQUE KEY `psEndpoint_retail_account` (`retailAccountId`),
  KEY `psEndpoint_sorcery_idx` (`sorcery_id`),
  CONSTRAINT `ast_ps_endpoints_ibfk_1` FOREIGN KEY (`terminalId`) REFERENCES `Terminals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ast_ps_endpoints_ibfk_2` FOREIGN KEY (`friendId`) REFERENCES `Friends` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_800B60515EA9D64D` FOREIGN KEY (`retailAccountId`) REFERENCES `RetailAccounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_800B60518B329DCD` FOREIGN KEY (`residentialDeviceId`) REFERENCES `ResidentialDevices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_ps_endpoints`
--

LOCK TABLES `ast_ps_endpoints` WRITE;
/*!40000 ALTER TABLE `ast_ps_endpoints` DISABLE KEYS */;
INSERT INTO `ast_ps_endpoints` VALUES (1,'b1c1t1_alice',NULL,1,NULL,NULL,NULL,'b1c1t1_alice','Alice  <101>','users','all','alaw',NULL,'invite','101@company1','','yes','yes','no',NULL,NULL,'no','redundancy',1440,'no'),(2,'b1c1t2_bob',NULL,2,NULL,NULL,NULL,'b1c1t2_bob','Bob  <102>','users','all','alaw',NULL,'invite','102@company1','','yes','yes','no',NULL,NULL,'no','redundancy',1440,'no');
/*!40000 ALTER TABLE `ast_ps_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ast_queue_members`
--

DROP TABLE IF EXISTS `ast_queue_members`;
/*!50001 DROP VIEW IF EXISTS `ast_queue_members`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ast_queue_members` AS SELECT 
 1 AS `uniqueid`,
 1 AS `queue_name`,
 1 AS `interface`,
 1 AS `membername`,
 1 AS `state_interface`,
 1 AS `penalty`,
 1 AS `paused`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ast_queues`
--

DROP TABLE IF EXISTS `ast_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_queues` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `periodic_announce` varchar(128) DEFAULT NULL,
  `periodic_announce_frequency` int DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `autopause` enum('yes','no','all') NOT NULL DEFAULT 'no',
  `ringinuse` enum('yes','no') NOT NULL DEFAULT 'no',
  `wrapuptime` int DEFAULT NULL,
  `maxlen` int DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `queueId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `queue_queueId` (`queueId`),
  CONSTRAINT `ast_queues_ibfk_1` FOREIGN KEY (`queueId`) REFERENCES `Queues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_queues`
--

LOCK TABLES `ast_queues` WRITE;
/*!40000 ALTER TABLE `ast_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `ast_queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_voicemail`
--

DROP TABLE IF EXISTS `ast_voicemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_voicemail` (
  `uniqueid` int NOT NULL AUTO_INCREMENT,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deleteast_voicemail` enum('yes','no') DEFAULT NULL,
  `saycid` varchar(255) DEFAULT 'yes',
  `sendast_voicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `residentialDeviceId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  UNIQUE KEY `voicemail_user` (`userId`),
  UNIQUE KEY `voicemail_residential_device` (`residentialDeviceId`),
  KEY `voicemail__context` (`context`),
  KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  KEY `voicemail_imapuser` (`imapuser`),
  CONSTRAINT `ast_voicemail_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B2AD1D0A8B329DCD` FOREIGN KEY (`residentialDeviceId`) REFERENCES `ResidentialDevices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_voicemail`
--

LOCK TABLES `ast_voicemail` WRITE;
/*!40000 ALTER TABLE `ast_voicemail` DISABLE KEYS */;
INSERT INTO `ast_voicemail` VALUES (1,'company1','user1',NULL,'Alice Allison',NULL,'alice@democompany.com',NULL,'yes',NULL,NULL,NULL,'Europe/Madrid',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'users',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'company1','user2',NULL,'Bob Bobson',NULL,'bob@democompany.com',NULL,'yes',NULL,NULL,NULL,'Europe/Madrid',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'users',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `ast_voicemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kam_dialplan`
--

DROP TABLE IF EXISTS `kam_dialplan`;
/*!50001 DROP VIEW IF EXISTS `kam_dialplan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kam_dialplan` AS SELECT 
 1 AS `id`,
 1 AS `dpid`,
 1 AS `pr`,
 1 AS `match_op`,
 1 AS `match_exp`,
 1 AS `match_len`,
 1 AS `subst_exp`,
 1 AS `repl_exp`,
 1 AS `attrs`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kam_dispatcher`
--

DROP TABLE IF EXISTS `kam_dispatcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_dispatcher` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `setid` int NOT NULL DEFAULT '0',
  `destination` varchar(192) NOT NULL DEFAULT '',
  `flags` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  `attrs` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(64) NOT NULL DEFAULT '',
  `applicationServerId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dispatcher_applicationServerId` (`applicationServerId`),
  CONSTRAINT `kam_dispatcher_ibfk_1` FOREIGN KEY (`applicationServerId`) REFERENCES `ApplicationServers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_dispatcher`
--

LOCK TABLES `kam_dispatcher` WRITE;
/*!40000 ALTER TABLE `kam_dispatcher` DISABLE KEYS */;
INSERT INTO `kam_dispatcher` VALUES (1,1,'sip:127.0.0.1:6060',0,0,'','as001',1);
/*!40000 ALTER TABLE `kam_dispatcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_rtpengine`
--

DROP TABLE IF EXISTS `kam_rtpengine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_rtpengine` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `setid` int NOT NULL DEFAULT '0',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `weight` int unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `stamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '(DC2Type:datetime)',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mediaRelaySetsId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rtpengine_nodes` (`setid`,`url`),
  KEY `rtpengine_mediaRelaySetsId` (`mediaRelaySetsId`),
  CONSTRAINT `FK_C5AB1ADEC8555117` FOREIGN KEY (`mediaRelaySetsId`) REFERENCES `MediaRelaySets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_rtpengine`
--

LOCK TABLES `kam_rtpengine` WRITE;
/*!40000 ALTER TABLE `kam_rtpengine` DISABLE KEYS */;
INSERT INTO `kam_rtpengine` VALUES (2,0,'udp:127.0.0.1:22223',1,0,'2000-01-01 00:00:00','Default rtpengine set',0);
/*!40000 ALTER TABLE `kam_rtpengine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_address`
--

DROP TABLE IF EXISTS `kam_trunks_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `grp` int unsigned NOT NULL DEFAULT '1',
  `ip_addr` varchar(50) DEFAULT NULL,
  `mask` int NOT NULL DEFAULT '32',
  `port` int NOT NULL DEFAULT '0',
  `tag` varchar(64) DEFAULT NULL,
  `ddiProviderAddressId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_873EF06250736B8` (`ddiProviderAddressId`),
  CONSTRAINT `FK_873EF06250736B8` FOREIGN KEY (`ddiProviderAddressId`) REFERENCES `DDIProviderAddresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_address`
--

LOCK TABLES `kam_trunks_address` WRITE;
/*!40000 ALTER TABLE `kam_trunks_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_cdrs`
--

DROP TABLE IF EXISTS `kam_trunks_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_cdrs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '(DC2Type:datetime)',
  `end_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '(DC2Type:datetime)',
  `duration` double NOT NULL DEFAULT '0',
  `caller` varchar(128) DEFAULT NULL,
  `callee` varchar(128) DEFAULT NULL,
  `callid` varchar(255) DEFAULT NULL,
  `callidHash` varchar(128) DEFAULT NULL,
  `xcallid` varchar(255) DEFAULT NULL,
  `diversion` varchar(64) DEFAULT NULL,
  `bounced` tinyint(1) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL COMMENT '[enum:inbound|outbound]',
  `cgrid` varchar(40) DEFAULT NULL,
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  `parsed` tinyint(1) DEFAULT '0',
  `parserScheduledAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `retailAccountId` int unsigned DEFAULT NULL,
  `residentialDeviceId` int unsigned DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `friendId` int unsigned DEFAULT NULL,
  `faxId` int unsigned DEFAULT NULL,
  `ddiId` int unsigned DEFAULT NULL,
  `ddiProviderId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trunksCdr_callid_direction` (`callid`,`direction`),
  KEY `IDX_92E58EB69CBEC244` (`brandId`),
  KEY `IDX_92E58EB62480E723` (`companyId`),
  KEY `trunksCdr_start_time_idx` (`start_time`),
  KEY `IDX_92E58EB66709B1C` (`carrierId`),
  KEY `IDX_92E58EB65EA9D64D` (`retailAccountId`),
  KEY `trunksCdr_parsed_idx` (`parsed`),
  KEY `IDX_92E58EB68B329DCD` (`residentialDeviceId`),
  KEY `IDX_92E58EB664B64DCC` (`userId`),
  KEY `IDX_92E58EB6893BA339` (`friendId`),
  KEY `IDX_92E58EB6624C8D73` (`faxId`),
  KEY `IDX_92E58EB632B6E766` (`ddiId`),
  KEY `IDX_92E58EB653615680` (`ddiProviderId`),
  CONSTRAINT `FK_92E58EB62480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB632B6E766` FOREIGN KEY (`ddiId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB653615680` FOREIGN KEY (`ddiProviderId`) REFERENCES `DDIProviders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB65EA9D64D` FOREIGN KEY (`retailAccountId`) REFERENCES `RetailAccounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB6624C8D73` FOREIGN KEY (`faxId`) REFERENCES `Faxes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB664B64DCC` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB66709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB6893BA339` FOREIGN KEY (`friendId`) REFERENCES `Friends` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB68B329DCD` FOREIGN KEY (`residentialDeviceId`) REFERENCES `ResidentialDevices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92E58EB69CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_cdrs`
--

LOCK TABLES `kam_trunks_cdrs` WRITE;
/*!40000 ALTER TABLE `kam_trunks_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kam_trunks_domain`
--

DROP TABLE IF EXISTS `kam_trunks_domain`;
/*!50001 DROP VIEW IF EXISTS `kam_trunks_domain`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kam_trunks_domain` AS SELECT 
 1 AS `domain`,
 1 AS `did`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kam_trunks_domain_attrs`
--

DROP TABLE IF EXISTS `kam_trunks_domain_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_domain_attrs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(190) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_attrs_idx` (`did`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_domain_attrs`
--

LOCK TABLES `kam_trunks_domain_attrs` WRITE;
/*!40000 ALTER TABLE `kam_trunks_domain_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_domain_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_htable`
--

DROP TABLE IF EXISTS `kam_trunks_htable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_htable` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key_name` varchar(64) NOT NULL DEFAULT '',
  `key_type` int NOT NULL DEFAULT '0',
  `value_type` int NOT NULL DEFAULT '0',
  `key_value` varchar(128) NOT NULL DEFAULT '',
  `expires` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_htable`
--

LOCK TABLES `kam_trunks_htable` WRITE;
/*!40000 ALTER TABLE `kam_trunks_htable` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_htable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_lcr_gateways`
--

DROP TABLE IF EXISTS `kam_trunks_lcr_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_lcr_gateways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lcr_id` int unsigned NOT NULL DEFAULT '1',
  `gw_name` varchar(200) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `hostname` varchar(64) DEFAULT NULL,
  `port` smallint unsigned DEFAULT NULL,
  `params` varchar(64) DEFAULT NULL,
  `uri_scheme` smallint unsigned DEFAULT NULL,
  `transport` smallint unsigned DEFAULT NULL,
  `strip` tinyint unsigned DEFAULT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `defunct` int unsigned DEFAULT NULL,
  `carrierServerId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C13516F0472FDC9C` (`carrierServerId`),
  KEY `lcrGateway_lcr_id` (`lcr_id`),
  CONSTRAINT `FK_C13516F0472FDC9C` FOREIGN KEY (`carrierServerId`) REFERENCES `CarrierServers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_lcr_gateways`
--

LOCK TABLES `kam_trunks_lcr_gateways` WRITE;
/*!40000 ALTER TABLE `kam_trunks_lcr_gateways` DISABLE KEYS */;
INSERT INTO `kam_trunks_lcr_gateways` VALUES (0,1,'LcrDummyGateway',NULL,'dummy.ivozprovider.local',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `kam_trunks_lcr_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_lcr_rule_targets`
--

DROP TABLE IF EXISTS `kam_trunks_lcr_rule_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_lcr_rule_targets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lcr_id` int unsigned NOT NULL DEFAULT '1',
  `rule_id` int unsigned NOT NULL,
  `gw_id` int unsigned NOT NULL,
  `priority` smallint unsigned NOT NULL,
  `weight` int unsigned NOT NULL DEFAULT '1',
  `outgoingRoutingId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E814F399744E0351` (`rule_id`),
  KEY `IDX_E814F39982D8D847` (`gw_id`),
  KEY `IDX_E814F3993CDE892` (`outgoingRoutingId`),
  KEY `lcrRuleTarget_lcr_id` (`lcr_id`),
  CONSTRAINT `kam_trunks_lcr_rule_targets_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `kam_trunks_lcr_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kam_trunks_lcr_rule_targets_ibfk_3` FOREIGN KEY (`gw_id`) REFERENCES `kam_trunks_lcr_gateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kam_trunks_lcr_rule_targets_ibfk_4` FOREIGN KEY (`outgoingRoutingId`) REFERENCES `OutgoingRouting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_lcr_rule_targets`
--

LOCK TABLES `kam_trunks_lcr_rule_targets` WRITE;
/*!40000 ALTER TABLE `kam_trunks_lcr_rule_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_lcr_rule_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_lcr_rules`
--

DROP TABLE IF EXISTS `kam_trunks_lcr_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_lcr_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lcr_id` int unsigned NOT NULL DEFAULT '1',
  `prefix` varchar(100) DEFAULT NULL,
  `from_uri` varchar(255) DEFAULT NULL,
  `request_uri` varchar(100) DEFAULT NULL,
  `stopper` int unsigned NOT NULL DEFAULT '0',
  `enabled` int unsigned NOT NULL DEFAULT '1',
  `routingPatternId` int unsigned DEFAULT NULL,
  `outgoingRoutingId` int unsigned NOT NULL,
  `mt_tvalue` varchar(128) DEFAULT NULL,
  `routingPatternGroupsRelPatternId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_52D75CD66D661974` (`routingPatternId`),
  KEY `lcrRule_lcr_id` (`lcr_id`),
  KEY `IDX_52D75CD63CDE892` (`outgoingRoutingId`),
  KEY `IDX_52D75CD64B03349B` (`routingPatternGroupsRelPatternId`),
  CONSTRAINT `FK_52D75CD64B03349B` FOREIGN KEY (`routingPatternGroupsRelPatternId`) REFERENCES `RoutingPatternGroupsRelPatterns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kam_trunks_lcr_rules_ibfk_4` FOREIGN KEY (`routingPatternId`) REFERENCES `RoutingPatterns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kam_trunks_lcr_rules_ibfk_5` FOREIGN KEY (`outgoingRoutingId`) REFERENCES `OutgoingRouting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_lcr_rules`
--

LOCK TABLES `kam_trunks_lcr_rules` WRITE;
/*!40000 ALTER TABLE `kam_trunks_lcr_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_lcr_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_uacreg`
--

DROP TABLE IF EXISTS `kam_trunks_uacreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trunks_uacreg` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `l_uuid` varchar(64) NOT NULL DEFAULT '',
  `l_username` varchar(64) NOT NULL DEFAULT 'unused',
  `l_domain` varchar(190) NOT NULL DEFAULT 'unused',
  `r_username` varchar(64) NOT NULL DEFAULT '',
  `r_domain` varchar(190) NOT NULL DEFAULT '',
  `realm` varchar(64) NOT NULL DEFAULT '',
  `auth_username` varchar(64) NOT NULL DEFAULT '',
  `auth_password` varchar(64) NOT NULL DEFAULT '',
  `auth_proxy` varchar(64) NOT NULL DEFAULT '',
  `expires` int NOT NULL DEFAULT '0',
  `flags` int NOT NULL DEFAULT '0',
  `reg_delay` int NOT NULL DEFAULT '0',
  `brandId` int unsigned NOT NULL,
  `ddiProviderRegistrationId` int unsigned NOT NULL,
  `auth_ha1` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `l_uuid_idx` (`l_uuid`),
  UNIQUE KEY `UNIQ_C612782140D0284C` (`ddiProviderRegistrationId`),
  KEY `IDX_C61278219CBEC244` (`brandId`),
  CONSTRAINT `FK_C6127821B6A472B7` FOREIGN KEY (`ddiProviderRegistrationId`) REFERENCES `DDIProviderRegistrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kam_trunks_uacreg_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_uacreg`
--

LOCK TABLES `kam_trunks_uacreg` WRITE;
/*!40000 ALTER TABLE `kam_trunks_uacreg` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_uacreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trusted`
--

DROP TABLE IF EXISTS `kam_trusted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_trusted` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proto` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_pattern` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ruri_pattern` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `companyId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `src_ip` (`src_ip`),
  KEY `trusted_companyId` (`companyId`),
  CONSTRAINT `FK_10A58A572480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trusted`
--

LOCK TABLES `kam_trusted` WRITE;
/*!40000 ALTER TABLE `kam_trusted` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trusted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_active_watchers`
--

DROP TABLE IF EXISTS `kam_users_active_watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_active_watchers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` varchar(128) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(64) NOT NULL,
  `to_user` varchar(64) NOT NULL,
  `to_domain` varchar(190) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `event_id` varchar(64) DEFAULT NULL,
  `to_tag` varchar(64) NOT NULL,
  `from_tag` varchar(64) NOT NULL,
  `callid` varchar(255) NOT NULL,
  `local_cseq` int NOT NULL,
  `remote_cseq` int NOT NULL,
  `contact` varchar(128) NOT NULL,
  `record_route` text,
  `expires` int NOT NULL,
  `status` int NOT NULL DEFAULT '2',
  `reason` varchar(64) DEFAULT NULL,
  `version` int NOT NULL DEFAULT '0',
  `socket_info` varchar(64) NOT NULL,
  `local_contact` varchar(128) NOT NULL,
  `from_user` varchar(64) NOT NULL,
  `from_domain` varchar(190) NOT NULL,
  `updated` int NOT NULL,
  `updated_winfo` int NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kam_users_active_watchers_idx` (`callid`,`to_tag`,`from_tag`),
  KEY `usersActiveWatcher_expires` (`expires`),
  KEY `usersActiveWatcher_pres` (`presentity_uri`,`event`),
  KEY `usersActiveWatcher_updated_idx` (`updated`),
  KEY `usersActiveWatcher_updated_winfo_idx` (`updated_winfo`,`presentity_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_active_watchers`
--

LOCK TABLES `kam_users_active_watchers` WRITE;
/*!40000 ALTER TABLE `kam_users_active_watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_active_watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_address`
--

DROP TABLE IF EXISTS `kam_users_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int unsigned NOT NULL,
  `source_address` varchar(100) NOT NULL,
  `ip_addr` varchar(50) DEFAULT NULL,
  `mask` int NOT NULL DEFAULT '32',
  `port` int NOT NULL DEFAULT '0',
  `tag` varchar(64) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usersAddress_companyId` (`companyId`),
  CONSTRAINT `FK_A53CBBF22480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_address`
--

LOCK TABLES `kam_users_address` WRITE;
/*!40000 ALTER TABLE `kam_users_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_cdrs`
--

DROP TABLE IF EXISTS `kam_users_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_cdrs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '(DC2Type:datetime)',
  `end_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '(DC2Type:datetime)',
  `duration` double NOT NULL DEFAULT '0',
  `direction` varchar(255) DEFAULT NULL,
  `caller` varchar(128) DEFAULT NULL,
  `callee` varchar(128) DEFAULT NULL,
  `diversion` varchar(64) DEFAULT NULL,
  `referee` varchar(128) DEFAULT NULL,
  `referrer` varchar(128) DEFAULT NULL,
  `callid` varchar(255) DEFAULT NULL,
  `callidHash` varchar(128) DEFAULT NULL,
  `xcallid` varchar(255) DEFAULT NULL,
  `brandId` int unsigned DEFAULT NULL,
  `companyId` int unsigned DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `friendId` int unsigned DEFAULT NULL,
  `residentialDeviceId` int unsigned DEFAULT NULL,
  `retailAccountId` int unsigned DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usersCdr_callid_direction` (`callid`,`direction`),
  KEY `usersCdr_brandId` (`brandId`),
  KEY `usersCdr_userId` (`userId`),
  KEY `usersCdr_friendId` (`friendId`),
  KEY `usersCdr_residentialDeviceId` (`residentialDeviceId`),
  KEY `IDX_238F735B5EA9D64D` (`retailAccountId`),
  KEY `usersCdr_companyId_hidden_startTime` (`companyId`,`hidden`,`start_time`),
  KEY `usersCdr_startTime` (`start_time`),
  CONSTRAINT `FK_238F735B2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_238F735B5EA9D64D` FOREIGN KEY (`retailAccountId`) REFERENCES `RetailAccounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_238F735B64B64DCC` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_238F735B893BA339` FOREIGN KEY (`friendId`) REFERENCES `Friends` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_238F735B8B329DCD` FOREIGN KEY (`residentialDeviceId`) REFERENCES `ResidentialDevices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_238F735B9CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_cdrs`
--

LOCK TABLES `kam_users_cdrs` WRITE;
/*!40000 ALTER TABLE `kam_users_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kam_users_domain`
--

DROP TABLE IF EXISTS `kam_users_domain`;
/*!50001 DROP VIEW IF EXISTS `kam_users_domain`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kam_users_domain` AS SELECT 
 1 AS `domain`,
 1 AS `did`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `kam_users_domain_attrs`
--

DROP TABLE IF EXISTS `kam_users_domain_attrs`;
/*!50001 DROP VIEW IF EXISTS `kam_users_domain_attrs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kam_users_domain_attrs` AS SELECT 
 1 AS `did`,
 1 AS `name`,
 1 AS `type`,
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kam_users_htable`
--

DROP TABLE IF EXISTS `kam_users_htable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_htable` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key_name` varchar(64) NOT NULL DEFAULT '',
  `key_type` int NOT NULL DEFAULT '0',
  `value_type` int NOT NULL DEFAULT '0',
  `key_value` varchar(128) NOT NULL DEFAULT '',
  `expires` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_htable`
--

LOCK TABLES `kam_users_htable` WRITE;
/*!40000 ALTER TABLE `kam_users_htable` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_htable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_location`
--

DROP TABLE IF EXISTS `kam_users_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_location` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(190) DEFAULT NULL,
  `contact` varchar(512) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int NOT NULL DEFAULT '1',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int NOT NULL DEFAULT '0',
  `cflags` int NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int NOT NULL DEFAULT '0',
  `server_id` int NOT NULL DEFAULT '0',
  `connection_id` int NOT NULL DEFAULT '0',
  `keepalive` int NOT NULL DEFAULT '0',
  `partition` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruid_idx` (`ruid`),
  KEY `usersLocation_account_contact_idx` (`username`,`domain`,`contact`),
  KEY `usersLocation_expires_idx` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[entity][rest]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_location`
--

LOCK TABLES `kam_users_location` WRITE;
/*!40000 ALTER TABLE `kam_users_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_location_attrs`
--

DROP TABLE IF EXISTS `kam_users_location_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_location_attrs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(190) DEFAULT NULL,
  `aname` varchar(64) NOT NULL DEFAULT '',
  `atype` int NOT NULL DEFAULT '0',
  `avalue` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `usersLocationAttr_account_record_idx` (`username`,`domain`,`ruid`),
  KEY `usersLocationAttr_last_modified_idx` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_location_attrs`
--

LOCK TABLES `kam_users_location_attrs` WRITE;
/*!40000 ALTER TABLE `kam_users_location_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_location_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_presentity`
--

DROP TABLE IF EXISTS `kam_users_presentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_presentity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `domain` varchar(190) NOT NULL,
  `event` varchar(64) NOT NULL,
  `etag` varchar(64) NOT NULL,
  `expires` int NOT NULL,
  `received_time` int NOT NULL,
  `body` blob NOT NULL,
  `sender` varchar(128) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kam_users_presentity_idx` (`username`,`domain`,`event`,`etag`),
  KEY `usersPresentity_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_presentity`
--

LOCK TABLES `kam_users_presentity` WRITE;
/*!40000 ALTER TABLE `kam_users_presentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_presentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_pua`
--

DROP TABLE IF EXISTS `kam_users_pua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_pua` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pres_uri` varchar(128) NOT NULL,
  `pres_id` varchar(255) NOT NULL,
  `event` int NOT NULL,
  `expires` int NOT NULL,
  `desired_expires` int NOT NULL,
  `flag` int NOT NULL,
  `etag` varchar(64) NOT NULL,
  `tuple_id` varchar(64) DEFAULT NULL,
  `watcher_uri` varchar(128) NOT NULL,
  `call_id` varchar(255) NOT NULL,
  `to_tag` varchar(64) NOT NULL,
  `from_tag` varchar(64) NOT NULL,
  `cseq` int NOT NULL,
  `record_route` text,
  `contact` varchar(128) NOT NULL,
  `remote_contact` varchar(128) NOT NULL,
  `version` int NOT NULL,
  `extra_headers` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kam_users_pua_idx` (`etag`,`tuple_id`,`call_id`,`from_tag`),
  KEY `usersPua_expires_idx` (`expires`),
  KEY `usersPua_dialog1_idx` (`pres_id`,`pres_uri`),
  KEY `usersPua_dialog2_idx` (`call_id`,`from_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_pua`
--

LOCK TABLES `kam_users_pua` WRITE;
/*!40000 ALTER TABLE `kam_users_pua` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_pua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_watchers`
--

DROP TABLE IF EXISTS `kam_users_watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_watchers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` varchar(128) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(190) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `status` int NOT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `inserted_time` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kam_users_watchers_idx` (`presentity_uri`,`watcher_username`,`watcher_domain`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_watchers`
--

LOCK TABLES `kam_users_watchers` WRITE;
/*!40000 ALTER TABLE `kam_users_watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_xcap`
--

DROP TABLE IF EXISTS `kam_users_xcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_users_xcap` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `domain` varchar(190) NOT NULL,
  `doc` mediumblob NOT NULL,
  `doc_type` int NOT NULL,
  `etag` varchar(64) NOT NULL,
  `source` int NOT NULL,
  `doc_uri` varchar(255) NOT NULL,
  `port` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doc_uri_idx` (`doc_uri`),
  KEY `UsersXcap_account_doc_type_uri_idx` (`username`,`domain`,`doc_type`,`doc_uri`),
  KEY `UsersXcap_account_doc_uri_idx` (`username`,`domain`,`doc_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_xcap`
--

LOCK TABLES `kam_users_xcap` WRITE;
/*!40000 ALTER TABLE `kam_users_xcap` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_xcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_version`
--

DROP TABLE IF EXISTS `kam_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kam_version` (
  `table_name` varchar(32) NOT NULL,
  `table_version` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `table_name_idx` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_version`
--

LOCK TABLES `kam_version` WRITE;
/*!40000 ALTER TABLE `kam_version` DISABLE KEYS */;
INSERT INTO `kam_version` VALUES ('kam_acc_cdrs',2),('kam_dialplan',2),('kam_dispatcher',4),('kam_rtpengine',1),('kam_trunks_address',6),('kam_trunks_dialplan',2),('kam_trunks_domain',2),('kam_trunks_domain_attrs',1),('kam_trunks_htable',2),('kam_trunks_lcr_gateways',3),('kam_trunks_lcr_rules',3),('kam_trunks_lcr_rule_targets',1),('kam_trunks_uacreg',3),('kam_trusted',6),('kam_users_active_watchers',12),('kam_users_address',6),('kam_users_domain',2),('kam_users_domain_attrs',1),('kam_users_htable',2),('kam_users_location',9),('kam_users_location_attrs',1),('kam_users_presentity',4),('kam_users_pua',7),('kam_users_watchers',3),('kam_users_xcap',4);
/*!40000 ALTER TABLE `kam_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_versions` (
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `valid` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_costs`
--

DROP TABLE IF EXISTS `sm_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_costs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cgrid` varchar(40) NOT NULL,
  `run_id` varchar(64) NOT NULL,
  `origin_host` varchar(64) NOT NULL,
  `origin_id` varchar(384) NOT NULL,
  `cost_source` varchar(64) NOT NULL,
  `usage` bigint NOT NULL,
  `cost_details` text,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `deleted_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `costid` (`cgrid`,`run_id`),
  KEY `origin_idx` (`origin_host`,`origin_id`),
  KEY `run_origin_idx` (`run_id`,`origin_id`),
  KEY `deleted_at_idx` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_costs`
--

LOCK TABLES `sm_costs` WRITE;
/*!40000 ALTER TABLE `sm_costs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sm_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_account_actions`
--

DROP TABLE IF EXISTS `tp_account_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_account_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `loadid` varchar(64) NOT NULL DEFAULT 'DATABASE',
  `tenant` varchar(64) NOT NULL,
  `account` varchar(64) NOT NULL,
  `action_plan_tag` varchar(64) DEFAULT NULL,
  `action_triggers_tag` varchar(64) DEFAULT NULL,
  `allow_negative` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `companyId` int unsigned DEFAULT NULL,
  `carrierId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9C6C0B6E2480E723` (`companyId`),
  UNIQUE KEY `unique_tp_account` (`tpid`,`loadid`,`tenant`,`account`,`companyId`),
  UNIQUE KEY `UNIQ_9C6C0B6E6709B1C` (`carrierId`),
  CONSTRAINT `FK_9C6C0B6E2480E723` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9C6C0B6E6709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_account_actions`
--

LOCK TABLES `tp_account_actions` WRITE;
/*!40000 ALTER TABLE `tp_account_actions` DISABLE KEYS */;
INSERT INTO `tp_account_actions` VALUES (1,'b1','DATABASE','b1','c1',NULL,'c1',1,0,'2020-06-10 14:44:16',1,NULL);
/*!40000 ALTER TABLE `tp_account_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tp_action_triggers`
--

DROP TABLE IF EXISTS `tp_action_triggers`;
/*!50001 DROP VIEW IF EXISTS `tp_action_triggers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tp_action_triggers` AS SELECT 
 1 AS `tpid`,
 1 AS `tag`,
 1 AS `unique_id`,
 1 AS `threshold_type`,
 1 AS `threshold_value`,
 1 AS `recurrent`,
 1 AS `balance_tag`,
 1 AS `balance_type`,
 1 AS `actions_tag`,
 1 AS `weight`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tp_actions`
--

DROP TABLE IF EXISTS `tp_actions`;
/*!50001 DROP VIEW IF EXISTS `tp_actions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tp_actions` AS SELECT 
 1 AS `tpid`,
 1 AS `tag`,
 1 AS `action`,
 1 AS `balance_tag`,
 1 AS `balance_type`,
 1 AS `extra_parameters`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tp_cdr_stats`
--

DROP TABLE IF EXISTS `tp_cdr_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_cdr_stats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `tag` varchar(64) NOT NULL,
  `queue_length` int NOT NULL DEFAULT '0',
  `time_window` varchar(8) NOT NULL DEFAULT '',
  `save_interval` varchar(8) NOT NULL DEFAULT '',
  `metrics` varchar(64) NOT NULL,
  `setup_interval` varchar(64) NOT NULL DEFAULT '',
  `tors` varchar(64) NOT NULL DEFAULT '',
  `cdr_hosts` varchar(64) NOT NULL DEFAULT '',
  `cdr_sources` varchar(64) NOT NULL DEFAULT '',
  `req_types` varchar(64) NOT NULL DEFAULT '',
  `directions` varchar(8) NOT NULL DEFAULT '',
  `tenants` varchar(64) NOT NULL DEFAULT '',
  `categories` varchar(32) NOT NULL DEFAULT '',
  `accounts` varchar(32) NOT NULL DEFAULT '',
  `subjects` varchar(64) NOT NULL DEFAULT '',
  `destination_ids` varchar(64) NOT NULL DEFAULT '',
  `ppd_interval` varchar(64) NOT NULL DEFAULT '',
  `usage_interval` varchar(64) NOT NULL DEFAULT '',
  `suppliers` varchar(64) NOT NULL DEFAULT '',
  `disconnect_causes` varchar(64) NOT NULL DEFAULT '',
  `mediation_runids` varchar(64) NOT NULL DEFAULT '',
  `rated_accounts` varchar(32) NOT NULL DEFAULT '',
  `rated_subjects` varchar(64) NOT NULL DEFAULT '',
  `cost_interval` varchar(24) NOT NULL DEFAULT '',
  `action_triggers` varchar(64) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `carrierId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CCA10B656709B1C` (`carrierId`),
  KEY `tpCdrStat_tpid` (`tpid`),
  CONSTRAINT `FK_CCA10B656709B1C` FOREIGN KEY (`carrierId`) REFERENCES `Carriers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_cdr_stats`
--

LOCK TABLES `tp_cdr_stats` WRITE;
/*!40000 ALTER TABLE `tp_cdr_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_cdr_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_cdrs`
--

DROP TABLE IF EXISTS `tp_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_cdrs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cgrid` varchar(40) NOT NULL,
  `run_id` varchar(64) NOT NULL,
  `origin_host` varchar(64) NOT NULL,
  `source` varchar(64) NOT NULL,
  `origin_id` varchar(128) NOT NULL,
  `tor` varchar(16) NOT NULL,
  `request_type` varchar(24) NOT NULL,
  `tenant` varchar(64) NOT NULL,
  `category` varchar(32) NOT NULL,
  `account` varchar(128) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `destination` varchar(128) NOT NULL,
  `setup_time` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `answer_time` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `usage` bigint NOT NULL,
  `extra_fields` longtext NOT NULL,
  `cost_source` varchar(64) NOT NULL,
  `cost` decimal(20,4) NOT NULL,
  `cost_details` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `extra_info` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `deleted_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tpCdrs_cdrrun` (`cgrid`,`run_id`,`origin_id`),
  KEY `tpCdr_originId_idx` (`origin_id`),
  KEY `tpCdr_answerTime_idx` (`answer_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_cdrs`
--

LOCK TABLES `tp_cdrs` WRITE;
/*!40000 ALTER TABLE `tp_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_derived_chargers`
--

DROP TABLE IF EXISTS `tp_derived_chargers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_derived_chargers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ivozprovider',
  `loadid` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DATABASE',
  `direction` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*out',
  `tenant` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'call',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*any',
  `subject` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '*any',
  `destination_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '*any',
  `runid` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'carrier',
  `run_filters` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `req_type_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '^*postpaid',
  `direction_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `tenant_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `category_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `account_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'carrierId',
  `subject_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'carrierId',
  `destination_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `setup_time_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `pdd_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `answer_time_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `usage_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `supplier_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `disconnect_cause_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `rated_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `cost_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*default',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `brandId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1581A0539CBEC244` (`brandId`),
  KEY `tpDerivedCharge_tpid` (`tpid`),
  CONSTRAINT `FK_1581A0539CBEC244` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_derived_chargers`
--

LOCK TABLES `tp_derived_chargers` WRITE;
/*!40000 ALTER TABLE `tp_derived_chargers` DISABLE KEYS */;
INSERT INTO `tp_derived_chargers` VALUES (1,'b1','DATABASE','*out','b1','call','*any','*any','*any','carrier','','^*postpaid','*default','*default','*default','carrierId','carrierId','*default','*default','*default','*default','*default','*default','*default','*default','*default','2020-06-10 14:44:36',1);
/*!40000 ALTER TABLE `tp_derived_chargers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_destination_rates`
--

DROP TABLE IF EXISTS `tp_destination_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_destination_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `tag` varchar(64) DEFAULT NULL,
  `destinations_tag` varchar(64) DEFAULT NULL,
  `rates_tag` varchar(64) DEFAULT NULL,
  `rounding_method` varchar(255) NOT NULL DEFAULT '*up' COMMENT '[enum:*up|*upmincost]',
  `rounding_decimals` int NOT NULL DEFAULT '4',
  `max_cost` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `max_cost_strategy` varchar(16) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `destinationRateId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4823F9F84EB67480` (`destinationRateId`),
  UNIQUE KEY `tpid_drid_dstid` (`tpid`,`tag`,`destinations_tag`),
  KEY `tpDestinationRate_tpid` (`tpid`),
  CONSTRAINT `FK_4823F9F84EB67480` FOREIGN KEY (`destinationRateId`) REFERENCES `DestinationRates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_destination_rates`
--

LOCK TABLES `tp_destination_rates` WRITE;
/*!40000 ALTER TABLE `tp_destination_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_destination_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_destinations`
--

DROP TABLE IF EXISTS `tp_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_destinations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `tag` varchar(64) DEFAULT NULL,
  `prefix` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `destinationId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C9806885BF3434FC` (`destinationId`),
  UNIQUE KEY `tpid_dest_prefix` (`tpid`,`tag`,`prefix`),
  KEY `tpDestination_tag` (`tag`),
  CONSTRAINT `FK_C9806885BF3434FC` FOREIGN KEY (`destinationId`) REFERENCES `Destinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_destinations`
--

LOCK TABLES `tp_destinations` WRITE;
/*!40000 ALTER TABLE `tp_destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_lcr_rules`
--

DROP TABLE IF EXISTS `tp_lcr_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_lcr_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `direction` varchar(8) NOT NULL DEFAULT '*out',
  `tenant` varchar(64) NOT NULL,
  `category` varchar(32) NOT NULL,
  `account` varchar(64) NOT NULL DEFAULT '*any',
  `subject` varchar(64) DEFAULT '*any',
  `destination_tag` varchar(64) DEFAULT '*any',
  `rp_category` varchar(32) NOT NULL,
  `strategy` varchar(18) NOT NULL DEFAULT '*lowest_cost',
  `strategy_params` varchar(256) DEFAULT '',
  `activation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `weight` decimal(8,2) NOT NULL DEFAULT '10.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `outgoingRoutingId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C700333B3CDE892` (`outgoingRoutingId`),
  KEY `tpLcrRule_tpid` (`tpid`),
  CONSTRAINT `FK_C700333B3CDE892` FOREIGN KEY (`outgoingRoutingId`) REFERENCES `OutgoingRouting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_lcr_rules`
--

LOCK TABLES `tp_lcr_rules` WRITE;
/*!40000 ALTER TABLE `tp_lcr_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_lcr_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_rates`
--

DROP TABLE IF EXISTS `tp_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `tag` varchar(64) DEFAULT NULL,
  `connect_fee` decimal(10,4) NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  `rate_unit` varchar(16) NOT NULL DEFAULT '60s',
  `rate_increment` varchar(16) NOT NULL,
  `group_interval_start` varchar(16) NOT NULL DEFAULT '0s',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `destinationRateId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DE7E762B4EB67480` (`destinationRateId`),
  UNIQUE KEY `unique_tprate` (`tpid`,`tag`,`group_interval_start`),
  KEY `tpRate_tpid` (`tpid`),
  CONSTRAINT `FK_DE7E762B4EB67480` FOREIGN KEY (`destinationRateId`) REFERENCES `DestinationRates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_rates`
--

LOCK TABLES `tp_rates` WRITE;
/*!40000 ALTER TABLE `tp_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_rating_plans`
--

DROP TABLE IF EXISTS `tp_rating_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_rating_plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `tag` varchar(64) DEFAULT NULL,
  `destrates_tag` varchar(64) DEFAULT NULL,
  `timing_tag` varchar(64) NOT NULL DEFAULT '*any',
  `weight` decimal(8,2) NOT NULL DEFAULT '10.00' COMMENT '(DC2Type:decimal)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `ratingPlanId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4CC2BCAB5C17F7F9` (`ratingPlanId`),
  UNIQUE KEY `tpid_rplid_destrates_timings_weight` (`tpid`,`tag`,`destrates_tag`,`timing_tag`,`weight`),
  KEY `tpRatingPlan_tpid` (`tpid`),
  CONSTRAINT `FK_4CC2BCAB5C17F7F9` FOREIGN KEY (`ratingPlanId`) REFERENCES `RatingPlans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_rating_plans`
--

LOCK TABLES `tp_rating_plans` WRITE;
/*!40000 ALTER TABLE `tp_rating_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_rating_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_rating_profiles`
--

DROP TABLE IF EXISTS `tp_rating_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_rating_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `loadid` varchar(64) NOT NULL DEFAULT 'DATABASE',
  `direction` varchar(8) NOT NULL DEFAULT '*out',
  `tenant` varchar(64) DEFAULT NULL,
  `category` varchar(32) NOT NULL DEFAULT 'call',
  `subject` varchar(64) DEFAULT NULL,
  `activation_time` varchar(32) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `rating_plan_tag` varchar(64) DEFAULT NULL,
  `fallback_subjects` varchar(64) DEFAULT NULL,
  `cdr_stat_queue_ids` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `ratingProfileId` int unsigned DEFAULT NULL,
  `outgoingRoutingRelCarrierId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tpid_loadid_tenant_category_dir_subj_atime` (`tpid`,`loadid`,`tenant`,`subject`,`category`,`direction`,`activation_time`),
  KEY `IDX_8502DE0E692AE6A8` (`ratingProfileId`),
  KEY `IDX_8502DE0E622624F7` (`outgoingRoutingRelCarrierId`),
  CONSTRAINT `FK_8502DE0E622624F7` FOREIGN KEY (`outgoingRoutingRelCarrierId`) REFERENCES `OutgoingRoutingRelCarriers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8502DE0E692AE6A8` FOREIGN KEY (`ratingProfileId`) REFERENCES `RatingProfiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_rating_profiles`
--

LOCK TABLES `tp_rating_profiles` WRITE;
/*!40000 ALTER TABLE `tp_rating_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_rating_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_timings`
--

DROP TABLE IF EXISTS `tp_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_timings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tpid` varchar(64) NOT NULL DEFAULT 'ivozprovider',
  `tag` varchar(64) DEFAULT NULL,
  `years` varchar(255) NOT NULL,
  `months` varchar(255) NOT NULL,
  `month_days` varchar(255) NOT NULL,
  `week_days` varchar(255) NOT NULL,
  `time` varchar(32) NOT NULL DEFAULT '00:00:00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime)',
  `ratingPlanId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D124F5385C17F7F9` (`ratingPlanId`),
  UNIQUE KEY `tpid_tag` (`tpid`,`tag`),
  KEY `tpTiming_tpid` (`tpid`),
  CONSTRAINT `FK_D124F5385C17F7F9` FOREIGN KEY (`ratingPlanId`) REFERENCES `RatingPlans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_timings`
--

LOCK TABLES `tp_timings` WRITE;
/*!40000 ALTER TABLE `tp_timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_versions`
--

DROP TABLE IF EXISTS `tp_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(64) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_item` (`id`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_versions`
--

LOCK TABLES `tp_versions` WRITE;
/*!40000 ALTER TABLE `tp_versions` DISABLE KEYS */;
INSERT INTO `tp_versions` VALUES (1,'TpLCR',1),(2,'TpRatingPlan',1),(3,'CostDetails',2),(4,'TpDestinationRates',1),(5,'TpThresholds',1),(6,'TpActionTriggers',1),(7,'TpAliases',1),(8,'TpDerivedChargers',1),(9,'TpRatingPlans',1),(10,'TpFilters',1),(11,'TpCdrStats',1),(12,'TpSharedGroups',1),(13,'TpDestinations',1),(14,'TpAccountActions',1),(15,'TpSuppliers',1),(16,'TpRatingProfiles',1),(17,'TpRates',1),(18,'TpResources',1),(19,'TpTiming',1),(20,'TpUsers',1),(21,'TpActions',1),(22,'TpDerivedCharges',1),(23,'TpStats',1),(24,'TpRatingProfile',1),(25,'TpLcrs',1),(26,'TpActionPlans',1),(27,'TpResource',1);
/*!40000 ALTER TABLE `tp_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ast_hints`
--

/*!50001 DROP VIEW IF EXISTS `ast_hints`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ast_hints` AS select `e`.`number` AS `exten`,concat('company',`e`.`companyId`) AS `context`,concat('PJSIP/',`a`.`sorcery_id`) AS `device` from (((`Extensions` `e` join `Users` `u` on((`u`.`id` = `e`.`userId`))) join `Terminals` `t` on((`t`.`id` = `u`.`terminalId`))) join `ast_ps_endpoints` `a` on((`a`.`terminalId` = `t`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ast_musiconhold`
--

/*!50001 DROP VIEW IF EXISTS `ast_musiconhold`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ast_musiconhold` AS select concat('brand',`MusicOnHold`.`brandId`) AS `name`,'files' AS `mode`,concat('moh/custom/brand',`MusicOnHold`.`brandId`) AS `directory`,'random' AS `sort` from `MusicOnHold` where (`MusicOnHold`.`brandId` is not null) group by `MusicOnHold`.`brandId` union select concat('company',`MusicOnHold`.`companyId`) AS `name`,'files' AS `mode`,concat('moh/custom/company',`MusicOnHold`.`companyId`) AS `directory`,'random' AS `sort` from `MusicOnHold` where (`MusicOnHold`.`companyId` is not null) group by `MusicOnHold`.`companyId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ast_ps_aors`
--

/*!50001 DROP VIEW IF EXISTS `ast_ps_aors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ast_ps_aors` AS select concat('b',`C`.`brandId`,'c',`C`.`id`,`E`.`type`,`E`.`id`,'_',`E`.`name`) AS `sorcery_id`,concat('sip:',`E`.`name`,'@',`D`.`domain`) AS `contact`,0 AS `qualify_frequency` from (((select 't' AS `type`,`T`.`id` AS `id`,`T`.`name` AS `name`,`T`.`domainId` AS `domainId`,`T`.`companyId` AS `companyId` from `Terminals` `T` union select 'f' AS `type`,`Friends`.`id` AS `id`,`Friends`.`name` AS `name`,`Friends`.`domainId` AS `domainId`,`Friends`.`companyId` AS `companyId` from `Friends` union select 'r' AS `type`,`ResidentialDevices`.`id` AS `id`,`ResidentialDevices`.`name` AS `name`,`ResidentialDevices`.`domainId` AS `domainId`,`ResidentialDevices`.`companyId` AS `companyId` from `ResidentialDevices` union select 'rt' AS `type`,`RetailAccounts`.`id` AS `id`,`RetailAccounts`.`name` AS `name`,`RetailAccounts`.`domainId` AS `domainId`,`RetailAccounts`.`companyId` AS `companyId` from `RetailAccounts`) `E` join `Companies` `C` on((`C`.`id` = `E`.`companyId`))) join `Domains` `D` on((`D`.`id` = `E`.`domainId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ast_queue_members`
--

/*!50001 DROP VIEW IF EXISTS `ast_queue_members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ast_queue_members` AS select `QM`.`id` AS `uniqueid`,concat('b',`C`.`brandId`,'c',`C`.`id`,'q',`Q`.`id`,'_',`Q`.`name`) AS `queue_name`,concat('Local/',`QM`.`id`,'@queues') AS `interface`,concat('b',`C`.`brandId`,'c',`C`.`id`,'q',`Q`.`id`,'m',`QM`.`id`) AS `membername`,concat('PJSIP/',`APE`.`sorcery_id`) AS `state_interface`,`QM`.`penalty` AS `penalty`,0 AS `paused` from (((((`QueueMembers` `QM` join `Users` `U` on((`U`.`id` = `QM`.`userId`))) join `Queues` `Q` on((`Q`.`id` = `QM`.`queueId`))) join `Terminals` `T` on((`T`.`id` = `U`.`terminalId`))) join `ast_ps_endpoints` `APE` on((`APE`.`terminalId` = `T`.`id`))) join `Companies` `C` on((`C`.`id` = `Q`.`companyId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kam_dialplan`
--

/*!50001 DROP VIEW IF EXISTS `kam_dialplan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kam_dialplan` AS select `TransformationRules`.`id` AS `id`,cast(concat(`TransformationRules`.`transformationRuleSetId`,(case when (`TransformationRules`.`type` = 'callerin') then 0 when (`TransformationRules`.`type` = 'calleein') then 1 when (`TransformationRules`.`type` = 'callerout') then 2 when (`TransformationRules`.`type` = 'calleeout') then 3 end)) as unsigned) AS `dpid`,`TransformationRules`.`priority` AS `pr`,1 AS `match_op`,`TransformationRules`.`matchExpr` AS `match_exp`,0 AS `match_len`,`TransformationRules`.`matchExpr` AS `subst_exp`,`TransformationRules`.`replaceExpr` AS `repl_exp`,`TransformationRules`.`description` AS `attrs` from `TransformationRules` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kam_trunks_domain`
--

/*!50001 DROP VIEW IF EXISTS `kam_trunks_domain`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kam_trunks_domain` AS select `Domains`.`domain` AS `domain`,NULL AS `did` from `Domains` where (`Domains`.`pointsTo` = 'proxytrunks') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kam_users_domain`
--

/*!50001 DROP VIEW IF EXISTS `kam_users_domain`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kam_users_domain` AS select `Domains`.`domain` AS `domain`,cast(`Domains`.`id` as char charset utf8) AS `did` from `Domains` where (`Domains`.`pointsTo` = 'proxyusers') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kam_users_domain_attrs`
--

/*!50001 DROP VIEW IF EXISTS `kam_users_domain_attrs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kam_users_domain_attrs` AS select cast(`D`.`id` as char charset utf8) AS `did`,'brandId' AS `name`,0 AS `type`,cast(`BCD`.`brandId` as char charset utf8) AS `value` from (`Domains` `D` join (select `Brands`.`domainId` AS `domainId`,`Brands`.`id` AS `brandId` from `Brands` union select `Companies`.`domainId` AS `domainId`,`Companies`.`brandId` AS `brandId` from `Companies`) `BCD` on((`D`.`id` = `BCD`.`domainId`))) where (`BCD`.`domainId` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tp_action_triggers`
--

/*!50001 DROP VIEW IF EXISTS `tp_action_triggers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tp_action_triggers` AS select concat('b',`Companies`.`brandId`) AS `tpid`,concat('c',`Companies`.`id`) AS `tag`,'*default' AS `unique_id`,'*max_balance_counter' AS `threshold_type`,`Companies`.`maxDailyUsage` AS `threshold_value`,1 AS `recurrent`,'*default' AS `balance_tag`,'*monetary' AS `balance_type`,'DISABLE_AND_LOG' AS `actions_tag`,0.0 AS `weight` from `Companies` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tp_actions`
--

/*!50001 DROP VIEW IF EXISTS `tp_actions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tp_actions` AS select concat('b',`Brands`.`id`) AS `tpid`,'DISABLE_AND_LOG' AS `tag`,'*call_url' AS `action`,'*default' AS `balance_tag`,'*monetary' AS `balance_type`,'http://trunks.ivozprovider.local:8001/endCompanyCalls' AS `extra_parameters` from `Brands` union select concat('b',`Brands`.`id`) AS `tpid`,'DISABLE_AND_LOG' AS `tag`,'*disable_account' AS `action`,'*default' AS `balance_tag`,'*monetary' AS `balance_type`,NULL AS `extra_parameters` from `Brands` union select concat('b',`Brands`.`id`) AS `tpid`,'DISABLE_AND_LOG' AS `tag`,'*log' AS `action`,'*default' AS `balance_tag`,'*monetary' AS `balance_type`,NULL AS `extra_parameters` from `Brands` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
