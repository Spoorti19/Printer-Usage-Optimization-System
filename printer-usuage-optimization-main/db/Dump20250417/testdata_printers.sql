CREATE DATABASE  IF NOT EXISTS `testdata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testdata`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: testdata
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printers` (
  `printer_id` varchar(10) NOT NULL,
  `model` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `department_id` varchar(10) DEFAULT NULL,
  `installation_date` date DEFAULT NULL,
  `total_page_count` int DEFAULT NULL,
  `status` enum('active','inactive','maintenance') DEFAULT NULL,
  PRIMARY KEY (`printer_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `printers_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
INSERT INTO `printers` VALUES ('PRN026','HP LaserJet Pro M404dn','Floor4','192.168.4.1','DEPT008','2022-05-17',1140,'inactive'),('PRN027','HP LaserJet Pro MFP M428fdw','Floor1','192.168.1.1','DEPT001','2022-05-28',713,'active'),('PRN028','HP DeskJet 2755e','Floor1','192.168.1.2','DEPT001','2022-07-20',1081,'active'),('PRN029','HP ENVY Inspire 7955e','Floor1','192.168.1.3','DEPT006','2022-09-02',998,'inactive'),('PRN030','HP OfficeJet Pro 9015e','Floor2','192.168.2.1','DEPT005','2022-10-02',1611,'active'),('PRN031','HP Smart Tank 7602','Floor3','192.168.3.1','DEPT009','2022-12-27',856,'active'),('PRN032','HP LaserJet Tank 2504dw','Floor3','192.168.3.2','DEPT010','2023-02-07',1352,'inactive'),('PRN033','HP Color LaserJet Pro MFP M479fdw','Floor2','192.168.2.2','DEPT002','2023-04-23',683,'maintenance'),('PRN034','HP DeskJet Plus 4155','Floor2','192.168.2.3','DEPT006','2023-05-05',829,'active'),('PRN035','HP ENVY 6455e','Floor1','192.168.1.4','DEPT003','2023-06-20',177,'inactive'),('PRN036','HP OfficeJet 200 Mobile','Floor1','192.168.1.5','DEPT006','2023-07-01',761,'active'),('PRN037','HP Tango X','Floor1','192.168.1.6','DEPT005','2023-09-06',1590,'active'),('PRN038','HP LaserJet Pro M15w','Floor1','192.168.1.7','DEPT003','2023-10-11',181,'maintenance'),('PRN039','HP OfficeJet Pro 8025e','Floor2','192.168.2.4','DEPT008','2023-11-07',997,'inactive'),('PRN040','HP Smart Tank 7301','Floor1','192.168.1.8','DEPT009','2023-11-25',411,'inactive'),('PRN041','HP DeskJet 4155e','Floor2','192.168.2.5','DEPT006','2023-12-03',1048,'maintenance'),('PRN042','HP LaserJet M209dwe','Floor4','192.168.4.2','DEPT002','2024-01-22',483,'maintenance'),('PRN043','HP Color LaserJet Pro M255dw','Floor3','192.168.3.3','DEPT010','2024-04-25',1419,'inactive'),('PRN044','HP OfficeJet 250 Mobile All-in-One','Floor4','192.168.4.3','DEPT005','2024-07-03',1777,'active'),('PRN045','HP Neverstop Laser MFP 1202w','Floor4','192.168.4.4','DEPT006','2024-09-30',919,'active'),('PRN046','HP DeskJet 3755','Floor1','192.168.1.9','DEPT007','2024-10-08',777,'inactive'),('PRN047','HP LaserJet Pro MFP M227fdw','Floor1','192.168.1.10','DEPT004','2024-10-16',1610,'maintenance'),('PRN048','HP ENVY 6055e','Floor2','192.168.2.6','DEPT008','2024-11-03',1378,'active'),('PRN049','HP Color LaserJet Enterprise MFP M480f','Floor1','192.168.1.11','DEPT001','2025-02-18',756,'inactive'),('PRN050','HP LaserJet Enterprise MFP M528dn','Floor1','192.168.1.12','DEPT004','2025-02-22',1683,'maintenance');
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-17 16:10:25
