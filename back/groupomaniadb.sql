CREATE DATABASE  IF NOT EXISTS `groupomaniadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `groupomaniadb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomaniadb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentaires` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL DEFAULT '0',
  `publication_id` int NOT NULL DEFAULT '0',
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2_publications_id` (`publication_id`),
  KEY `FK1_utilisateurs_id` (`utilisateur_id`),
  CONSTRAINT `FK1_id_utilisateurs` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK2_publications_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaires`
--

LOCK TABLES `commentaires` WRITE;
/*!40000 ALTER TABLE `commentaires` DISABLE KEYS */;
INSERT INTO `commentaires` VALUES (7,12,10,'2022-09-14 11:07:05','2022-09-14 11:07:05','Bienvenue a toutes les équipes de groupomania !'),(8,4,11,'2022-09-15 08:10:49','2022-09-15 08:10:49','tout fonctionne bien !!!'),(9,4,12,'2022-09-15 08:11:35','2022-09-15 08:11:35','Intéressant !!'),(10,8,12,'2022-09-15 08:14:14','2022-09-15 08:14:14','Vous etes dur M.Delavega !!!'),(11,8,10,'2022-09-15 08:15:44','2022-09-15 08:15:44','Bienvenue a toute la team de Recherche et Développement !!!'),(13,2,12,'2022-09-15 15:35:12','2022-09-15 15:35:12','De tres bonnes idées !'),(14,2,10,'2022-09-15 16:33:38','2022-09-15 16:33:38','Welcome a tous !!'),(15,2,15,'2022-09-16 06:36:05','2022-09-16 06:36:05','Huuuummm !!! ');
/*!40000 ALTER TABLE `commentaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `publication_id` int NOT NULL,
  `vote` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_utilisateurs_id` (`utilisateur_id`),
  KEY `FK3_publications_id` (`publication_id`),
  CONSTRAINT `FK1_utilisateurs_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK3_publications_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (17,2,10,NULL),(18,12,10,NULL),(19,12,12,NULL),(20,12,12,NULL),(21,12,12,NULL),(22,4,12,NULL),(23,8,11,NULL),(24,8,12,NULL),(25,8,11,NULL),(27,8,11,NULL),(28,2,11,NULL),(29,2,12,NULL),(30,2,15,NULL),(31,2,10,NULL),(32,2,15,NULL);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `message` text,
  `contenu` text,
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `media` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_posts_utilisateurs` (`utilisateur_id`),
  CONSTRAINT `FK_posts_utilisateurs` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (10,2,'Bonjour à tous et bienvenue sur le nouveau site de groupomania !!!','','2022-09-14 10:50:50','2022-09-14 10:50:50','/images/robots.jpg_1663152650815.jpg'),(11,12,'Un beau travail, du point de vue du développement !!!\r\nJe félicite toute la team des devs !!','','2022-09-14 11:05:52','2022-09-14 11:05:52',NULL),(12,12,'Site fonctionnel dans les temps impartis, agréable d\'utilisation, une expérience utilisateur intéressante.\r\nBon travail, continuez sur cette lancée !!','','2022-09-14 11:18:14','2022-09-14 11:18:14','/images/developpement-web-featured.jpg_1663154294217.jpg'),(15,8,'Ma recette de fondant au chocolat : une vraie merveille !!','','2022-09-15 09:01:11','2022-09-15 09:01:11','/images/gateaux.jpg_1663232471046.jpg');
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT 'http://localhost:3000/images/images.jpg',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_utilisateurs_authority` (`isAdmin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'Hertz','franck','hertzfra@hotmail.com','$2b$10$z8aGNbUB8lHSzDRVUETUoeORqdNMbv/xF2IdXMEUytLgroA69G50O','images\\hipster.jpg1648821445317.jpg',0),(2,'OBAMA','Barack','obama@usagvt.com','$2b$10$OSgg6lst5KO8PIMOPbHEJu.bpIpl/yaRAer7Nh2BYiCrLwrS4Pqfu','images\\BarackObamaportrait.jpg1648822297668.jpg',0),(3,'Azzillat','Fatialla','fatialla@gmail.com','$2b$10$dSb88.tMG6SdDULFAE1AG.blRFozTZtarOZFAq6NZsyWOMBvS59kq','images\\femmevoilee.jpg1648822731682.jpg',0),(4,'Delavega','Miguel','delavega@gmail.com','$2b$10$m/1HbBXrgl.r8uCOOBzfB.61rULXmIqJZBuPByt1PO1nyw9WxXo/.','images\\Charlie-Siem.jpg1648823418176.jpg',0),(5,'LaCheffe','Jocelyne','lacheffe@sfr.fr','$2b$10$KN5HvZFUqzezmaxzBEerQOWZN6ZbGjazhdcqEL.4SprcS2uGQHAa.','images\\femme-cheveux-courts-gris.jpg1648823759815.jpg',0),(6,'Raho','caroline','raho@gmail.com','$2b$10$KOJaGNejdjmszAN5XinFledkChv4HRle5tKitabaNbxaKda/HQnSS','images\\fashion-office-fashion-business.jpg1648824211123.jpg',0),(8,'Lafuter','Irene','Lafuterirene@sfr.com','$2b$10$FeHFfuSUL4QeHiTtPnD0r.2ZmGyTloI3ZI2rBNStnXNsnSRMtNwo2','images\\femme-frange-brune.jpg1648825145384.jpg',0),(9,'APPERT','Roland','scoreur@gmail.com','$2b$10$jXysMvvISdF/NTqeDn6x3eVZBNxwdSD9PFhS5Ha5D8HIkFfw2DY52','images\\homme-moderne.jpg1648825778558.jpg',0),(12,'Ngassa','Jason','ngassa@test.com','$2b$10$zNZekK.e47nIniwP0mCayuNtC3FiTCsPsCgAmRdat7CparfFBu8ou','images\\jason.jpeg_1662879020593.jpeg_1663153392494.jpeg',0);
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16  9:51:17
