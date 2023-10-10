CREATE DATABASE  IF NOT EXISTS `churchbasics` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `churchbasics`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: churchbasics
-- ------------------------------------------------------
-- Server version	8.0.22

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

--
-- Table structure for table `callings`
--

DROP TABLE IF EXISTS `callings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `callings` (
  `callingId` int unsigned NOT NULL AUTO_INCREMENT,
  `callingName` varchar(45) NOT NULL,
  PRIMARY KEY (`callingId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callings`
--

LOCK TABLES `callings` WRITE;
/*!40000 ALTER TABLE `callings` DISABLE KEYS */;
INSERT INTO `callings` VALUES (1,'Bishop'),(2,'First Counselor'),(3,'Second Counselor'),(4,'Secretary'),(5,'Assistant Secretary'),(6,'Executive Secretary'),(7,'Clerk'),(8,'Assistant Clerk'),(9,'President'),(10,'Specialist'),(11,'Teacher'),(12,'Minister'),(13,'Missionary'),(14,'1st Assistant'),(15,'2nd Assistant'),(16,'Chorister'),(17,'Pianist');
/*!40000 ALTER TABLE `callings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `memberId` int unsigned NOT NULL AUTO_INCREMENT,
  `memberFirstname` varchar(30) NOT NULL,
  `memberLastname` varchar(45) NOT NULL,
  `unitId` int unsigned NOT NULL,
  PRIMARY KEY (`memberId`),
  KEY `fk_members_units_idx` (`unitId`),
  CONSTRAINT `fk_members_units` FOREIGN KEY (`unitId`) REFERENCES `units` (`unitId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Blaine','Robertson',2),(2,'Lori','Robertson',2),(3,'Reed','Eborn',4);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `organizationId` int unsigned NOT NULL AUTO_INCREMENT,
  `organizationName` varchar(45) NOT NULL,
  PRIMARY KEY (`organizationId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Bishopric'),(2,'Activities'),(3,'Deacon Quorum'),(4,'Teacher Quorum'),(5,'Priest Quorum'),(6,'Elder Quorum'),(7,'Primary'),(8,'Relief Society'),(9,'Sunday School'),(10,'Young Women'),(11,'Young Men'),(12,'Presidency');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgCallings`
--

DROP TABLE IF EXISTS `orgCallings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orgCallings` (
  `organizationId` int unsigned NOT NULL,
  `callingId` int unsigned NOT NULL,
  PRIMARY KEY (`organizationId`,`callingId`),
  KEY `fk_organizations_has_callings_callings1_idx` (`callingId`),
  KEY `fk_organizations_has_callings_organizations1_idx` (`organizationId`),
  CONSTRAINT `fk_organizations_has_callings_callings1` FOREIGN KEY (`callingId`) REFERENCES `callings` (`callingId`),
  CONSTRAINT `fk_organizations_has_callings_organizations1` FOREIGN KEY (`organizationId`) REFERENCES `organizations` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgCallings`
--

LOCK TABLES `orgCallings` WRITE;
/*!40000 ALTER TABLE `orgCallings` DISABLE KEYS */;
INSERT INTO `orgCallings` VALUES (1,1),(1,2),(3,2),(4,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(1,3),(3,3),(4,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(3,4),(4,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(6,5),(1,6),(12,6),(1,7),(12,7),(1,8),(12,8),(3,9),(4,9),(6,9),(7,9),(8,9),(9,9),(10,9),(11,9),(12,9),(2,10),(10,10),(11,10),(6,11),(7,11),(8,11),(9,11),(4,12),(5,12),(6,12),(8,12),(5,14),(5,15),(7,16),(8,16),(7,17),(8,17);
/*!40000 ALTER TABLE `orgCallings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_has_units`
--

DROP TABLE IF EXISTS `unit_has_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit_has_units` (
  `parentUnitId` int unsigned NOT NULL,
  `childUnitId` int unsigned NOT NULL,
  PRIMARY KEY (`parentUnitId`,`childUnitId`),
  KEY `fk_units_has_units_units2_idx` (`childUnitId`),
  KEY `fk_units_has_units_units1_idx` (`parentUnitId`),
  CONSTRAINT `fk_unit_has_units_units1` FOREIGN KEY (`parentUnitId`) REFERENCES `units` (`unitId`),
  CONSTRAINT `fk_unit_has_units_units2` FOREIGN KEY (`childUnitId`) REFERENCES `units` (`unitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_has_units`
--

LOCK TABLES `unit_has_units` WRITE;
/*!40000 ALTER TABLE `unit_has_units` DISABLE KEYS */;
INSERT INTO `unit_has_units` VALUES (1,2),(3,4),(3,5);
/*!40000 ALTER TABLE `unit_has_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitOrgs`
--

DROP TABLE IF EXISTS `unitOrgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitOrgs` (
  `unitId` int unsigned NOT NULL,
  `organizationId` int unsigned NOT NULL,
  PRIMARY KEY (`unitId`,`organizationId`),
  KEY `fk_units_has_organizations_organizations1_idx` (`organizationId`),
  KEY `fk_units_has_organizations_units1_idx` (`unitId`),
  CONSTRAINT `fk_units_has_organizations_organizations1` FOREIGN KEY (`organizationId`) REFERENCES `organizations` (`organizationId`),
  CONSTRAINT `fk_units_has_organizations_units1` FOREIGN KEY (`unitId`) REFERENCES `units` (`unitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitOrgs`
--

LOCK TABLES `unitOrgs` WRITE;
/*!40000 ALTER TABLE `unitOrgs` DISABLE KEYS */;
INSERT INTO `unitOrgs` VALUES (2,1),(1,2),(2,2),(2,3),(2,4),(2,5),(2,6),(1,7),(2,7),(1,8),(2,8),(1,9),(2,9),(1,10),(2,10),(1,11),(2,11),(1,12),(2,12);
/*!40000 ALTER TABLE `unitOrgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `unitId` int unsigned NOT NULL AUTO_INCREMENT,
  `unitName` varchar(100) NOT NULL,
  `unitType` enum('Branch','Ward','District','Stake') NOT NULL DEFAULT 'Ward',
  PRIMARY KEY (`unitId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Rexburg Idaho','Stake'),(2,'Burton 1st','Ward'),(3,'Paris Idaho','Stake'),(4,'Laketown','Ward'),(5,'Garden City','Ward');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10 11:04:51
