-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: SAE41
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ok`
--

DROP TABLE IF EXISTS `ok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ok` (
  `id_meetings` int NOT NULL,
  `validation` int NOT NULL,
  PRIMARY KEY (`id_meetings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ok`
--

LOCK TABLES `ok` WRITE;
/*!40000 ALTER TABLE `ok` DISABLE KEYS */;
INSERT INTO `ok` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0);
/*!40000 ALTER TABLE `ok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdv` (
  `id_rdv` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `jour` varchar(10) NOT NULL,
  `mois` varchar(20) NOT NULL,
  `annee` varchar(10) NOT NULL,
  `heure` varchar(20) NOT NULL,
  PRIMARY KEY (`id_rdv`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdv`
--

LOCK TABLES `rdv` WRITE;
/*!40000 ALTER TABLE `rdv` DISABLE KEYS */;
INSERT INTO `rdv` VALUES (3,2,'14','juin','2023','14:00'),(7,2,'06','Octobre','2023','12:00'),(8,3,'06','Octobre','2023','12:00'),(19,12,'02','Avril','2024','12:00');
/*!40000 ALTER TABLE `rdv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dimitri','dimitri'),(2,'julien','julien'),(3,'marc','marc'),(4,'axel','axel'),(5,'mattéo','mattéo'),(6,'arthur','arthur'),(7,'kram','keam'),(8,'marc','marc'),(9,'martin','martin'),(10,'caca','caca'),(11,'prout','prout'),(12,'pierre','pierre');
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

-- Dump completed on 2023-06-22 17:40:04
