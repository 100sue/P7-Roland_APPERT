-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: group
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `date_ajout` datetime NOT NULL,
  `date_modification` datetime NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id_idx` (`utilisateur_id`),
  KEY `publication_id_idx` (`publication_id`),
  CONSTRAINT `publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaires`
--

LOCK TABLES `commentaires` WRITE;
/*!40000 ALTER TABLE `commentaires` DISABLE KEYS */;
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
  `id_utilisateur` int NOT NULL,
  `id_publication` int NOT NULL,
  `vote` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id_idx` (`id_utilisateur`),
  KEY `publication_id_idx` (`id_publication`),
  CONSTRAINT `id_publication` FOREIGN KEY (`id_publication`) REFERENCES `publications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
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
  `message` varchar(255) DEFAULT NULL,
  `contenu` longtext,
  `date_ajout` datetime NOT NULL,
  `date_modification` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id_idx` (`utilisateur_id`),
  CONSTRAINT `posts_utilisateurs` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
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
  `image` varchar(300) DEFAULT 'http://localhost:3000/images/images.jpg',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (4,'Hertz','franck','hertzfra@hotmail.com','$2b$10$YF3VqjQQTaYp79K3QuNvpeFPFpV31AB2GvFdoSmc6koWXaKSzvpFe','images\\hipster.jpg1648198718954.jpg',0),(5,'Lafuter','Irene','Lafuterirene@sfr.com','$2b$10$iaDK4/.0kzcgTZNuWfNwtOvaplpI.ZvlK29MrtgICbdcn8bLXlPNe','images\\femme-cheveux-courts-gris.jpg1648200342551.jpg',0),(6,'Delavega','Miguel','delavega@gmail.com','$2b$10$LB3xapozQPBmA2Pge9GP1.R5IH4IPMtUsKBsu9KZvZe3r73gU3WHO','images\\Charlie-Siem.jpg1648216274358.jpg',0),(7,'Azzillat','Fatialla','fatialla@gmail.com','$2b$10$zgy.y34OXfGBb9GmV61RkuCdFWYojuWFXSyROU79Sr2hsjgWz7qO6','images\\femmevoilee.jpg1648205507562.jpg',0),(8,'appert','roland','scoreur@gmail.com','$2b$10$1R1GmUTjFxxnyGhKlD/Ct.u1mYjQ56pv2dC4kQz7cbD1dfQDrpeMe','images\\homme-moderne.jpg1648223693645.jpg',0),(9,'OBAMA','Barack','obama@usagvt.com','$2b$10$ioYyCRsZYKMTDCkt/zdtPeX9KWB3/hcMx.ebHos2Htx5J8atVe4r6','images\\BarackObamaportrait.jpg1648225018326.jpg',0),(10,'Vernes','yvan','vernes@gmail.com','$2b$10$NAKmnh.DPnhsG75YC3yTJeYE5VFLVI3PlHkbg/PQphVT1releUfhm','images\\yvan.jpg1648478563313.jpg',0),(11,'Raho','caroline','raho@gmail.com','$2b$10$F.cgDqPy0RbOo.Ys6Dc/8ewKsMm8fF0uucVIz/aBtOGK/N/D4qDb6','images\\femme-frange-brune.jpg1648453265350.jpg',0);
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

-- Dump completed on 2022-03-31 14:35:48
