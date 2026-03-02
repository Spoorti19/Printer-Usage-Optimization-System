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
-- Table structure for table `optimization_recommendations`
--

DROP TABLE IF EXISTS `optimization_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optimization_recommendations` (
  `recommendation_id` varchar(10) NOT NULL,
  `printer_id` varchar(10) DEFAULT NULL,
  `department_id` varchar(10) DEFAULT NULL,
  `generated_date` date DEFAULT NULL,
  `recommendation_type` varchar(50) DEFAULT NULL,
  `description` text,
  `potential_savings` float DEFAULT NULL,
  `initial_expense` float DEFAULT NULL,
  `final_cost` float DEFAULT NULL,
  `implemented` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`recommendation_id`),
  KEY `printer_id` (`printer_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `optimization_recommendations_ibfk_1` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`printer_id`),
  CONSTRAINT `optimization_recommendations_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optimization_recommendations`
--

LOCK TABLES `optimization_recommendations` WRITE;
/*!40000 ALTER TABLE `optimization_recommendations` DISABLE KEYS */;
INSERT INTO `optimization_recommendations` VALUES ('REC001','PRN001','DEPT001','2024-01-03','toner_saving','Enable draft mode for non-client-facing documents',125.5,1480.9,1355.4,1),('REC002','PRN001','DEPT001','2024-02-03','maintenance','Schedule monthly maintenance to ensure optimal performance',85,450.5,365.5,0),('REC003','PRN001','DEPT001','2024-03-03','paper_saving','Switch to smaller paper size for internal drafts',60,546,486,1),('REC004','PRN002','DEPT002','2024-01-03','duplex','Set duplex printing as default',80.75,912.475,831.725,1),('REC005','PRN002','DEPT002','2024-02-03','toner_saving','Lower toner density for non-color prints',55,286,231,0),('REC006','PRN002','DEPT002','2024-03-03','maintenance','Regular cleaning of paper feed mechanism',40,356,316,1),('REC007','PRN003','DEPT003','2024-10-03','consolidation','Redirect large print jobs to central printer',350.25,2241.6,1891.35,0),('REC008','PRN003','DEPT003','2024-11-03','maintenance','Install software to monitor toner usage',70,693,623,1),('REC009','PRN003','DEPT003','2024-12-03','toner_saving','Use toner-saving cartridges for regular prints',110,814,704,0),('REC010','PRN004','DEPT004','2024-05-03','quota','Reduce color printing quota by 15%',95,1206.5,1111.5,1),('REC011','PRN004','DEPT004','2024-06-03','paper_saving','Enable duplex printing for all reports',70,714,644,1),('REC012','PRN004','DEPT004','2024-07-03','maintenance','Perform regular cleaning of rollers to reduce jams',60,612,552,1),('REC013','PRN005','DEPT005','2024-12-03','replacement','Replace with more efficient model',520.8,4010.16,3489.36,0),('REC014','PRN005','DEPT005','2024-03-13','paper_saving','Use recycled paper for regular printing',50,630,580,1),('REC015','PRN005','DEPT005','2024-03-14','toner_saving','Set toner saving mode for drafts and low-importance documents',40,288,248,0),('REC016','PRN006','DEPT006','2024-08-03','maintenance','Install toner level monitoring to prevent mid-job interruptions',60,648,588,1),('REC017','PRN006','DEPT006','2024-09-03','paper_saving','Switch to smaller paper size for internal memos',35,199.5,164.5,0),('REC018','PRN006','DEPT006','2024-10-03','duplex','Enable duplex printing as default',80,784,704,1),('REC019','PRN007','DEPT007','2024-03-15','toner_saving','Use grayscale mode for internal reports',110,1276,1166,1),('REC020','PRN007','DEPT007','2024-03-16','maintenance','Perform regular cleaning of paper rollers to reduce jams',50,360,310,0),('REC021','PRN007','DEPT007','2024-03-17','paper_saving','Reduce paper size for internal drafts',45,417.6,372.6,1),('REC022','PRN008','DEPT008','2024-03-18','maintenance','Schedule regular firmware updates to improve performance',40,396,356,1),('REC023','PRN008','DEPT008','2024-03-19','toner_saving','Use toner-saving mode for regular prints',100,1030,930,1),('REC024','PRN008','DEPT008','2024-03-20','paper_saving','Switch to smaller paper size for all internal communications',60,468,408,0),('REC025','PRN009','DEPT009','2024-03-21','maintenance','Install new toner-saving cartridges',55,473,418,0),('REC026','PRN009','DEPT009','2024-03-22','paper_saving','Optimize page layout to fit more content per page',45,397.35,352.35,1),('REC027','PRN009','DEPT009','2024-03-23','toner_saving','Reduce toner density for black-and-white documents',80,816,736,1),('REC028','PRN010','DEPT010','2024-03-24','maintenance','Perform regular cleaning to prevent paper jams',30,333,303,1),('REC029','PRN010','DEPT010','2024-03-25','duplex','Enable duplex printing for reports and presentations',70,413,343,0),('REC030','PRN010','DEPT010','2024-03-26','toner_saving','Switch to eco-friendly toner cartridges',95,484.5,389.5,0),('REC031','PRN011','DEPT001','2024-03-27','maintenance','Perform monthly maintenance to ensure optimal performance',60,534,474,1),('REC032','PRN011','DEPT001','2024-03-28','duplex','Enable duplex printing by default for all documents',80,824,744,1),('REC033','PRN011','DEPT001','2024-03-29','paper_saving','Switch to smaller paper size for internal memos',40,328,288,0),('REC034','PRN012','DEPT002','2024-03-30','maintenance','Install automatic paper size detection software',30,273,243,1),('REC035','PRN012','DEPT002','2024-03-31','toner_saving','Enable toner save mode for regular prints',50,290,240,0),('REC036','PRN012','DEPT002','2024-04-01','duplex','Set duplex printing as default',80,944,864,1),('REC037','PRN013','DEPT003','2024-04-02','paper_saving','Enable draft mode for non-client-facing documents',40,288,248,0),('REC038','PRN013','DEPT003','2024-04-03','maintenance','Schedule regular firmware updates to improve efficiency',70,784,714,1),('REC039','PRN013','DEPT003','2024-04-04','toner_saving','Reduce toner usage by adjusting print quality settings',100,620,520,0),('REC040','PRN014','DEPT004','2024-04-05','maintenance','Ensure that all printers are equipped with the latest drivers',45,396,351,1),('REC041','PRN014','DEPT004','2024-04-06','paper_saving','Switch to digital documentation for internal meetings',50,305,255,0),('REC042','PRN014','DEPT004','2024-04-07','duplex','Enable duplex as default for routine documents',75,817.5,742.5,1),('REC043','PRN015','DEPT005','2024-04-08','maintenance','Perform monthly maintenance to prevent downtime',65,468,403,0),('REC044','PRN015','DEPT005','2024-04-09','toner_saving','Reduce print density for drafts',45,445.5,400.5,1),('REC045','PRN015','DEPT005','2024-04-10','paper_saving','Use recycled paper for standard prints',60,306,246,0),('REC046','PRN016','DEPT006','2024-04-11','maintenance','Perform cleaning of toner cartridges every 3 months',50,310,260,0),('REC047','PRN016','DEPT006','2024-04-12','duplex','Set duplex printing as default for all reports',90,792,702,1),('REC048','PRN016','DEPT006','2024-04-13','toner_saving','Use draft mode for non-critical prints',70,553,483,0),('REC049','PRN017','DEPT007','2024-04-14','paper_saving','Switch to smaller paper size for routine internal documents',40,444,404,1),('REC050','PRN017','DEPT007','2024-04-15','maintenance','Install regular firmware updates to improve printer performance',60,510,450,1),('REC051','PRN017','DEPT007','2024-04-16','toner_saving','Activate toner save mode for black-and-white prints',50,295,245,0),('REC052','PRN018','DEPT008','2024-04-17','duplex','Enable duplex printing for reports and presentations',80,984,904,1),('REC053','PRN018','DEPT008','2024-04-18','maintenance','Ensure that the paper tray is calibrated to prevent jams',45,247.5,202.5,0),('REC054','PRN018','DEPT008','2024-04-19','paper_saving','Switch to recycled paper for regular printing',60,666,606,1),('REC055','PRN019','DEPT009','2024-04-20','toner_saving','Enable toner-saver mode for non-color prints',70,588,518,0),('REC056','PRN019','DEPT009','2024-04-21','maintenance','Schedule regular maintenance every quarter',75,915,840,1),('REC057','PRN019','DEPT009','2024-04-22','duplex','Set duplex as default for all print jobs',100,1190,1090,1),('REC058','PRN020','DEPT010','2024-04-23','maintenance','Perform monthly paper feed mechanism cleaning',45,238.5,193.5,0),('REC059','PRN020','DEPT010','2024-04-24','toner_saving','Set toner density to low for routine prints',60,672,612,1),('REC060','PRN020','DEPT010','2024-04-25','duplex','Enable duplex printing for all black-and-white documents',80,544,464,0),('REC061','PRN021','DEPT001','2024-04-26','paper_saving','Enable smaller paper size for internal drafts',40,472,432,1),('REC062','PRN021','DEPT001','2024-04-27','maintenance','Schedule quarterly cleaning of rollers and print heads',50,515,465,1),('REC063','PRN021','DEPT001','2024-04-28','toner_saving','Switch to eco-friendly toner for everyday printing',75,382.5,307.5,0),('REC064','PRN022','DEPT002','2024-04-29','duplex','Enable duplex printing for internal communications',65,799.5,734.5,1),('REC065','PRN022','DEPT002','2024-04-30','maintenance','Check for paper jams and clean feed rollers every month',30,168,138,0),('REC066','PRN022','DEPT002','2024-05-01','toner_saving','Switch to toner-saving mode for routine prints',55,550,495,1),('REC067','PRN023','DEPT003','2024-05-02','paper_saving','Use smaller paper sizes for non-official print jobs',45,508.5,463.5,1),('REC068','PRN023','DEPT003','2024-05-03','maintenance','Perform regular checks for low toner levels',30,279,249,1),('REC069','PRN023','DEPT003','2024-05-04','duplex','Enable duplex printing as default for all reports',70,504,434,0),('REC070','PRN024','DEPT004','2024-05-05','maintenance','Perform cleaning of print heads regularly',40,336,296,0),('REC071','PRN024','DEPT004','2024-05-06','toner_saving','Activate toner-saver mode for daily printing tasks',55,506,451,1),('REC072','PRN024','DEPT004','2024-05-07','duplex','Set duplex printing for all official documents',75,705,630,1),('REC073','PRN025','DEPT005','2024-05-08','maintenance','Schedule monthly firmware updates',50,380,330,0),('REC074','PRN025','DEPT005','2024-05-09','paper_saving','Switch to recycled paper for internal communications',60,552,492,1),('REC075','PRN025','DEPT005','2024-05-10','toner_saving','Set the printer to low toner density for routine prints',40,464,424,1);
/*!40000 ALTER TABLE `optimization_recommendations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-17 16:10:17
