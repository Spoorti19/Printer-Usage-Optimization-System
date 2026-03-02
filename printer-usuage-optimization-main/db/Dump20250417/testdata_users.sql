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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `department_id` varchar(10) DEFAULT NULL,
  `quota_allocated` int DEFAULT NULL,
  `quota_used` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('USR095','Helyn Fattore','helyn.fattore@company.com','DEPT004',870,570),('USR096','Bridget Blackstone','bridget.blackstone@company.com','DEPT007',480,450),('USR097','Tadio Fumagalli','tadio.fumagalli@company.com','DEPT005',490,480),('USR098','Candide O\'Brollachain','candide.o\'brollachain@company.com','DEPT005',840,400),('USR099','Arley Grebner','arley.grebner@company.com','DEPT008',670,880),('USR100','Friederike Gladyer','friederike.gladyer@company.com','DEPT005',820,870),('USR101','Karlotte Glanders','karlotte.glanders@company.com','DEPT010',690,890),('USR102','Granny Leatherborrow','granny.leatherborrow@company.com','DEPT009',530,560),('USR103','Andy Wasylkiewicz','andy.wasylkiewicz@company.com','DEPT008',590,920),('USR104','Bastian Feldhuhn','bastian.feldhuhn@company.com','DEPT007',910,840),('USR105','Cyrille Reggler','cyrille.reggler@company.com','DEPT004',960,640),('USR106','Karney Quinney','karney.quinney@company.com','DEPT004',970,520),('USR107','Megen Morman','megen.morman@company.com','DEPT004',820,650),('USR108','Essa Woodham','essa.woodham@company.com','DEPT010',500,440),('USR109','Cyndie Shevlin','cyndie.shevlin@company.com','DEPT001',430,440),('USR110','Willem Lackinton','willem.lackinton@company.com','DEPT002',900,470),('USR111','Mitchel Clawson','mitchel.clawson@company.com','DEPT004',550,920),('USR112','Yule Houlahan','yule.houlahan@company.com','DEPT005',910,900),('USR113','Maiga Cawt','maiga.cawt@company.com','DEPT010',880,530),('USR114','Filippa Salvadori','filippa.salvadori@company.com','DEPT005',440,630),('USR115','Cordie Merryfield','cordie.merryfield@company.com','DEPT009',910,830),('USR116','Harbert McLurg','harbert.mclurg@company.com','DEPT005',640,430),('USR117','Rayshell Beesley','rayshell.beesley@company.com','DEPT008',520,510),('USR118','Harman Vann','harman.vann@company.com','DEPT001',880,600),('USR119','Hermon Guilloneau','hermon.guilloneau@company.com','DEPT005',780,750),('USR120','Gail Scully','gail.scully@company.com','DEPT002',490,420),('USR121','Parke Grundy','parke.grundy@company.com','DEPT008',480,970),('USR122','Francisca Monan','francisca.monan@company.com','DEPT008',820,560),('USR123','Jobie Abbs','jobie.abbs@company.com','DEPT004',630,710),('USR124','Harrison Scothorn','harrison.scothorn@company.com','DEPT005',430,600),('USR125','Oona Goodluck','oona.goodluck@company.com','DEPT010',480,900),('USR126','Carlota Haet','carlota.haet@company.com','DEPT006',530,430),('USR127','Gelya Woolvin','gelya.woolvin@company.com','DEPT004',950,980),('USR128','Vinnie Ferrarello','vinnie.ferrarello@company.com','DEPT003',430,760),('USR129','Arlette Stemson','arlette.stemson@company.com','DEPT006',920,580),('USR130','Rolfe Pawle','rolfe.pawle@company.com','DEPT005',590,580),('USR131','Kellen Storek','kellen.storek@company.com','DEPT010',620,620),('USR132','Theresita Symes','theresita.symes@company.com','DEPT003',640,460),('USR133','Roddy Patience','roddy.patience@company.com','DEPT009',930,720),('USR134','Tomaso Whicher','tomaso.whicher@company.com','DEPT006',800,570),('USR135','Elinor Cristofari','elinor.cristofari@company.com','DEPT008',490,530),('USR136','Jefferson Burnsides','jefferson.burnsides@company.com','DEPT005',940,960),('USR137','L;urette Elleyne','l;urette.elleyne@company.com','DEPT006',450,500),('USR138','Karleen Hairyes','karleen.hairyes@company.com','DEPT010',980,660),('USR139','Faina Crimin','faina.crimin@company.com','DEPT007',470,600),('USR140','Banky Preston','banky.preston@company.com','DEPT010',470,980),('USR141','Helge Gives','helge.gives@company.com','DEPT004',970,450),('USR142','Ashil Timothy','ashil.timothy@company.com','DEPT008',700,890),('USR143','Chen Choupin','chen.choupin@company.com','DEPT005',880,680),('USR144','Benjy Branwhite','benjy.branwhite@company.com','DEPT001',740,440),('USR145','Opaline Bresson','opaline.bresson@company.com','DEPT002',830,680),('USR146','Read Bool','read.bool@company.com','DEPT001',400,770),('USR147','Conn Prettyman','conn.prettyman@company.com','DEPT004',510,540),('USR148','Aime Hallam','aime.hallam@company.com','DEPT006',800,860),('USR149','Brena Lober','brena.lober@company.com','DEPT006',430,460),('USR150','Misty Matashkin','misty.matashkin@company.com','DEPT007',450,540);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-17 16:10:23
