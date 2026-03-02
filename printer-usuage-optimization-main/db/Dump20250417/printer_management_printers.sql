CREATE DATABASE  IF NOT EXISTS `printer_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `printer_management`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: printer_management
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
INSERT INTO `printers` VALUES ('PRN001','HP LaserJet Pro M404dn','Floor 3','192.168.1.001','DEPT001','2023-01-15',15286,'active'),('PRN002','Canon imageRUNNER 1643','Floor 2','192.168.2.001','DEPT002','2022-11-05',11449,'active'),('PRN003','HP LaserJet Pro MFP M479fdw','Floor 1','192.168.3.001','DEPT003','2023-03-20',11347,'maintenance'),('PRN004','Canon imageRUNNER ADVANCE C5560i','Floor 2','192.168.4.001','DEPT004','2023-05-12',16145,'active'),('PRN005','HP LaserJet Pro M404n','Floor 3','192.168.5.001','DEPT005','2023-02-08',19586,'active'),('PRN006','Canon imageRUNNER 1435iF','Floor 1','192.168.6.001','DEPT006','2023-01-10',23704,'active'),('PRN007','HP OfficeJet Pro 9025','Floor 2','192.168.7.001','DEPT007','2023-04-01',14771,'active'),('PRN008','Canon imageRUNNER 2525i','Floor 3','192.168.8.001','DEPT008','2023-02-15',21167,'active'),('PRN009','HP LaserJet Enterprise M606dn','Floor 1','192.168.9.001','DEPT009','2023-01-30',18066,'active'),('PRN010','Canon imageRUNNER 1643','Floor 2','192.168.0.001','DEPT010','2023-03-05',12177,'active'),('PRN011','HP LaserJet Pro M404dn','Floor 3','192.168.1.002','DEPT001','2023-07-22',13986,'active'),('PRN012','Canon imageRUNNER 1643','Floor 2','192.168.2.002','DEPT002','2023-06-18',17444,'maintenance'),('PRN013','HP LaserJet Pro MFP M479fdw','Floor 1','192.168.3.002','DEPT003','2023-05-20',12847,'active'),('PRN014','Canon imageRUNNER 1643','Floor 2','192.168.4.002','DEPT004','2023-08-11',16110,'active'),('PRN015','HP LaserJet Pro M404n','Floor 3','192.168.5.002','DEPT005','2023-03-23',14710,'active'),('PRN016','Canon imageRUNNER 1435iF','Floor 1','192.168.6.002','DEPT006','2023-05-01',20796,'active'),('PRN017','HP OfficeJet Pro 9025','Floor 2','192.168.7.002','DEPT007','2023-06-02',17608,'active'),('PRN018','Canon imageRUNNER 2525i','Floor 3','192.168.8.002','DEPT008','2023-09-10',15651,'active'),('PRN019','HP LaserJet Enterprise M606dn','Floor 1','192.168.9.002','DEPT009','2023-02-17',20510,'active'),('PRN020','Canon imageRUNNER 1643','Floor 2','192.168.0.002','DEPT010','2023-04-09',17245,'active'),('PRN021','HP LaserJet Pro M404dn','Floor 3','192.168.1.003','DEPT001','2023-01-12',15894,'active'),('PRN022','Canon imageRUNNER 1643','Floor 2','192.168.2.003','DEPT002','2023-03-25',15581,'active'),('PRN023','HP LaserJet Pro MFP M479fdw','Floor 1','192.168.3.003','DEPT003','2023-06-20',11197,'active'),('PRN024','Canon imageRUNNER ADVANCE C5560i','Floor 2','192.168.4.003','DEPT004','2023-07-15',18702,'active'),('PRN025','HP LaserJet Pro M404n','Floor 3','192.168.5.003','DEPT005','2023-06-25',14370,'active');
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

-- Dump completed on 2025-04-17 16:10:12
