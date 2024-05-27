-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: warehouse_management
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `article_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (4,'Article Name','Article Code','Article Variant','Article Description',100,2,1),(5,'Article Name','Article Code','Article Variant','Article Description',100,2,1),(8,NULL,NULL,NULL,NULL,200,2,1),(9,NULL,NULL,NULL,NULL,200,2,1),(10,NULL,NULL,NULL,NULL,200,2,1),(11,NULL,NULL,NULL,NULL,200,2,1),(12,NULL,NULL,NULL,NULL,200,2,1),(13,NULL,NULL,NULL,NULL,200,2,1),(14,NULL,NULL,NULL,NULL,200,2,1),(15,NULL,NULL,NULL,NULL,200,2,1),(16,NULL,NULL,NULL,NULL,200,2,1),(17,NULL,NULL,NULL,NULL,200,2,1),(18,NULL,NULL,NULL,NULL,200,2,1),(19,NULL,NULL,NULL,NULL,200,2,1),(20,NULL,NULL,NULL,NULL,200,2,1),(21,NULL,NULL,NULL,NULL,200,2,1),(22,NULL,NULL,NULL,NULL,200,2,1),(23,NULL,NULL,NULL,NULL,200,2,1),(24,NULL,NULL,NULL,NULL,200,2,1),(25,NULL,NULL,NULL,NULL,200,2,1),(26,NULL,NULL,NULL,NULL,200,2,1),(27,NULL,NULL,NULL,NULL,200,2,1),(28,NULL,NULL,NULL,NULL,200,2,1),(29,NULL,NULL,NULL,NULL,200,2,1),(30,NULL,NULL,NULL,NULL,200,2,1),(31,NULL,NULL,NULL,NULL,200,2,1),(32,NULL,NULL,NULL,NULL,200,2,1),(33,NULL,NULL,NULL,NULL,200,2,1),(34,NULL,NULL,NULL,NULL,200,2,1),(35,NULL,NULL,NULL,NULL,200,2,1),(36,NULL,NULL,NULL,NULL,200,2,1),(37,NULL,NULL,NULL,NULL,200,2,1),(38,NULL,NULL,NULL,NULL,200,2,1),(39,NULL,NULL,NULL,NULL,200,2,2),(40,NULL,NULL,NULL,NULL,200,2,4),(41,NULL,NULL,NULL,NULL,200,2,7),(42,NULL,NULL,NULL,NULL,200,2,8),(43,NULL,NULL,NULL,NULL,200,2,1),(44,NULL,NULL,NULL,NULL,200,2,2),(45,NULL,NULL,NULL,NULL,200,2,4),(46,NULL,NULL,NULL,NULL,200,2,7),(47,NULL,NULL,NULL,NULL,200,2,8),(48,NULL,NULL,NULL,NULL,200,2,1),(49,NULL,NULL,NULL,NULL,200,2,2),(50,NULL,NULL,NULL,NULL,200,2,4),(51,NULL,NULL,NULL,NULL,200,2,7),(52,NULL,NULL,NULL,NULL,200,2,8),(53,NULL,NULL,NULL,NULL,200,2,1),(54,NULL,NULL,NULL,NULL,200,2,2),(55,NULL,NULL,NULL,NULL,200,2,4),(56,NULL,NULL,NULL,NULL,200,2,7),(57,NULL,NULL,NULL,NULL,200,2,8),(58,NULL,NULL,NULL,NULL,200,2,1),(59,NULL,NULL,NULL,NULL,200,2,2),(60,NULL,NULL,NULL,NULL,200,2,4),(61,NULL,NULL,NULL,NULL,200,2,7),(62,NULL,NULL,NULL,NULL,200,2,8),(63,NULL,NULL,NULL,NULL,200,2,1),(64,NULL,NULL,NULL,NULL,200,2,2),(65,NULL,NULL,NULL,NULL,200,2,4),(66,NULL,NULL,NULL,NULL,200,2,7),(67,NULL,NULL,NULL,NULL,200,2,8),(68,NULL,NULL,NULL,NULL,200,2,1),(69,NULL,NULL,NULL,NULL,200,2,2),(70,NULL,NULL,NULL,NULL,200,2,4),(71,NULL,NULL,NULL,NULL,200,2,7),(72,NULL,NULL,NULL,NULL,200,2,8),(73,NULL,NULL,NULL,NULL,200,2,1),(74,NULL,NULL,NULL,NULL,200,2,2),(75,NULL,NULL,NULL,NULL,200,2,4),(76,NULL,NULL,NULL,NULL,200,2,7),(77,NULL,NULL,NULL,NULL,200,2,8),(78,NULL,NULL,NULL,NULL,200,2,1),(79,NULL,NULL,NULL,NULL,200,2,2),(80,NULL,NULL,NULL,NULL,200,2,4),(81,NULL,NULL,NULL,NULL,200,2,7),(82,NULL,NULL,NULL,NULL,200,2,8),(83,NULL,NULL,NULL,NULL,200,2,1),(84,NULL,NULL,NULL,NULL,200,2,2),(85,NULL,NULL,NULL,NULL,200,2,4),(86,NULL,NULL,NULL,NULL,200,2,7),(87,NULL,NULL,NULL,NULL,200,2,8),(88,NULL,NULL,NULL,NULL,200,2,1),(89,NULL,NULL,NULL,NULL,200,2,2),(90,NULL,NULL,NULL,NULL,200,2,4),(91,NULL,NULL,NULL,NULL,200,2,7),(92,NULL,NULL,NULL,NULL,200,2,8),(93,NULL,NULL,NULL,NULL,200,2,1),(94,NULL,NULL,NULL,NULL,200,2,2),(95,NULL,NULL,NULL,NULL,200,2,4),(96,NULL,NULL,NULL,NULL,200,2,7),(97,NULL,NULL,NULL,NULL,200,2,8),(98,NULL,NULL,NULL,NULL,200,2,1),(99,NULL,NULL,NULL,NULL,200,2,2),(100,NULL,NULL,NULL,NULL,200,2,4),(101,NULL,NULL,NULL,NULL,200,2,7),(102,NULL,NULL,NULL,NULL,200,2,8),(103,NULL,NULL,NULL,NULL,200,2,1),(104,NULL,NULL,NULL,NULL,200,2,2),(105,NULL,NULL,NULL,NULL,200,2,4),(106,NULL,NULL,NULL,NULL,200,2,7),(107,NULL,NULL,NULL,NULL,200,2,8),(108,NULL,NULL,NULL,NULL,200,2,1),(109,NULL,NULL,NULL,NULL,200,2,2),(110,NULL,NULL,NULL,NULL,200,2,4),(111,NULL,NULL,NULL,NULL,200,2,7),(112,NULL,NULL,NULL,NULL,200,2,8),(113,NULL,NULL,NULL,NULL,200,2,1),(114,NULL,NULL,NULL,NULL,200,2,2),(115,NULL,NULL,NULL,NULL,200,2,3),(116,NULL,NULL,NULL,NULL,200,2,4),(117,NULL,NULL,NULL,NULL,200,2,5),(118,NULL,NULL,NULL,NULL,200,2,7),(119,NULL,NULL,NULL,NULL,200,2,8),(120,NULL,NULL,NULL,NULL,200,2,9),(121,NULL,NULL,NULL,NULL,200,2,10),(122,NULL,NULL,NULL,NULL,200,2,11),(123,NULL,NULL,NULL,NULL,200,2,12),(124,NULL,NULL,NULL,NULL,200,2,1),(125,NULL,NULL,NULL,NULL,200,2,2),(126,NULL,NULL,NULL,NULL,200,2,3),(127,NULL,NULL,NULL,NULL,200,2,4),(128,NULL,NULL,NULL,NULL,200,2,5),(129,NULL,NULL,NULL,NULL,200,2,7),(130,NULL,NULL,NULL,NULL,200,2,8),(131,NULL,NULL,NULL,NULL,200,2,9),(132,NULL,NULL,NULL,NULL,200,2,10),(133,NULL,NULL,NULL,NULL,200,2,11),(134,NULL,NULL,NULL,NULL,200,2,12),(135,NULL,NULL,NULL,NULL,200,2,1),(136,NULL,NULL,NULL,NULL,200,2,2),(137,NULL,NULL,NULL,NULL,200,2,3),(138,NULL,NULL,NULL,NULL,200,2,4),(139,NULL,NULL,NULL,NULL,200,2,5),(140,NULL,NULL,NULL,NULL,200,2,7),(141,NULL,NULL,NULL,NULL,200,2,8),(142,NULL,NULL,NULL,NULL,200,2,9),(143,NULL,NULL,NULL,NULL,200,2,10),(144,NULL,NULL,NULL,NULL,200,2,11),(145,NULL,NULL,NULL,NULL,200,2,12),(146,NULL,NULL,NULL,NULL,200,2,1),(147,NULL,NULL,NULL,NULL,200,2,2),(148,NULL,NULL,NULL,NULL,200,2,3),(149,NULL,NULL,NULL,NULL,200,2,4),(150,NULL,NULL,NULL,NULL,200,2,5),(151,NULL,NULL,NULL,NULL,200,2,7),(152,NULL,NULL,NULL,NULL,200,2,8),(153,NULL,NULL,NULL,NULL,200,2,9),(154,NULL,NULL,NULL,NULL,200,2,10),(155,NULL,NULL,NULL,NULL,200,2,11),(156,NULL,NULL,NULL,NULL,200,2,12),(157,NULL,NULL,NULL,NULL,200,2,1),(158,NULL,NULL,NULL,NULL,200,2,2),(159,NULL,NULL,NULL,NULL,200,2,3),(160,NULL,NULL,NULL,NULL,200,2,4),(161,NULL,NULL,NULL,NULL,200,2,5),(162,NULL,NULL,NULL,NULL,200,2,7),(163,NULL,NULL,NULL,NULL,200,2,8),(164,NULL,NULL,NULL,NULL,200,2,9),(165,NULL,NULL,NULL,NULL,200,2,10),(166,NULL,NULL,NULL,NULL,200,2,11),(167,NULL,NULL,NULL,NULL,200,2,12),(168,NULL,NULL,NULL,NULL,200,2,1),(169,NULL,NULL,NULL,NULL,200,2,2),(170,NULL,NULL,NULL,NULL,200,2,3),(171,NULL,NULL,NULL,NULL,200,2,4),(172,NULL,NULL,NULL,NULL,200,2,5),(173,NULL,NULL,NULL,NULL,200,2,7),(174,NULL,NULL,NULL,NULL,200,2,8),(175,NULL,NULL,NULL,NULL,200,2,9),(176,NULL,NULL,NULL,NULL,200,2,10),(177,NULL,NULL,NULL,NULL,200,2,11),(178,NULL,NULL,NULL,NULL,200,2,12),(179,NULL,NULL,NULL,NULL,200,2,1),(180,NULL,NULL,NULL,NULL,200,2,2),(181,NULL,NULL,NULL,NULL,200,2,3),(182,NULL,NULL,NULL,NULL,200,2,4),(183,NULL,NULL,NULL,NULL,200,2,5),(184,NULL,NULL,NULL,NULL,200,2,7),(185,NULL,NULL,NULL,NULL,200,2,8),(186,NULL,NULL,NULL,NULL,200,2,9),(187,NULL,NULL,NULL,NULL,200,2,10),(188,NULL,NULL,NULL,NULL,200,2,11),(189,NULL,NULL,NULL,NULL,200,2,12),(190,NULL,NULL,NULL,NULL,200,2,1),(191,NULL,NULL,NULL,NULL,200,2,2),(192,NULL,NULL,NULL,NULL,200,2,3),(193,NULL,NULL,NULL,NULL,200,2,4),(194,NULL,NULL,NULL,NULL,200,2,5),(195,NULL,NULL,NULL,NULL,200,2,7),(196,NULL,NULL,NULL,NULL,200,2,8),(197,NULL,NULL,NULL,NULL,200,2,9),(198,NULL,NULL,NULL,NULL,200,2,10),(199,NULL,NULL,NULL,NULL,200,2,11),(200,NULL,NULL,NULL,NULL,200,2,12),(201,NULL,NULL,NULL,NULL,200,2,1),(202,NULL,NULL,NULL,NULL,200,2,2),(203,NULL,NULL,NULL,NULL,200,2,3),(204,NULL,NULL,NULL,NULL,200,2,4),(205,NULL,NULL,NULL,NULL,200,2,5),(206,NULL,NULL,NULL,NULL,200,2,7),(207,NULL,NULL,NULL,NULL,200,2,8),(208,NULL,NULL,NULL,NULL,200,2,9),(209,NULL,NULL,NULL,NULL,200,2,10),(210,NULL,NULL,NULL,NULL,200,2,11),(211,NULL,NULL,NULL,NULL,200,2,12),(212,NULL,NULL,NULL,NULL,200,2,1),(213,NULL,NULL,NULL,NULL,200,2,2),(214,NULL,NULL,NULL,NULL,200,2,3),(215,NULL,NULL,NULL,NULL,200,2,4),(216,NULL,NULL,NULL,NULL,200,2,5),(217,NULL,NULL,NULL,NULL,200,2,7),(218,NULL,NULL,NULL,NULL,200,2,8),(219,NULL,NULL,NULL,NULL,200,2,9),(220,NULL,NULL,NULL,NULL,200,2,10),(221,NULL,NULL,NULL,NULL,200,2,11),(222,NULL,NULL,NULL,NULL,200,2,12),(223,NULL,NULL,NULL,NULL,200,2,1),(224,NULL,NULL,NULL,NULL,200,2,2),(225,NULL,NULL,NULL,NULL,200,2,3),(226,NULL,NULL,NULL,NULL,200,2,4),(227,NULL,NULL,NULL,NULL,200,2,5),(228,NULL,NULL,NULL,NULL,200,2,7),(229,NULL,NULL,NULL,NULL,200,2,8),(230,NULL,NULL,NULL,NULL,200,2,9),(231,NULL,NULL,NULL,NULL,200,2,10),(232,NULL,NULL,NULL,NULL,200,2,11),(233,NULL,NULL,NULL,NULL,200,2,12),(234,NULL,NULL,NULL,NULL,200,2,1),(235,NULL,NULL,NULL,NULL,200,2,2),(236,NULL,NULL,NULL,NULL,200,2,3),(237,NULL,NULL,NULL,NULL,200,2,4),(238,NULL,NULL,NULL,NULL,200,2,5),(239,NULL,NULL,NULL,NULL,200,2,7),(240,NULL,NULL,NULL,NULL,200,2,8),(241,NULL,NULL,NULL,NULL,200,2,9),(242,NULL,NULL,NULL,NULL,200,2,10),(243,NULL,NULL,NULL,NULL,200,2,11),(244,NULL,NULL,NULL,NULL,200,2,12),(245,NULL,NULL,NULL,NULL,200,2,1),(246,NULL,NULL,NULL,NULL,200,2,2),(247,NULL,NULL,NULL,NULL,200,2,3),(248,NULL,NULL,NULL,NULL,200,2,4),(249,NULL,NULL,NULL,NULL,200,2,5),(250,NULL,NULL,NULL,NULL,200,2,7),(251,NULL,NULL,NULL,NULL,200,2,8),(252,NULL,NULL,NULL,NULL,200,2,9),(253,NULL,NULL,NULL,NULL,200,2,10),(254,NULL,NULL,NULL,NULL,200,2,11),(255,NULL,NULL,NULL,NULL,200,2,12),(256,NULL,NULL,NULL,NULL,200,2,1),(257,NULL,NULL,NULL,NULL,200,2,2),(258,NULL,NULL,NULL,NULL,200,2,3),(259,NULL,NULL,NULL,NULL,200,2,4),(260,NULL,NULL,NULL,NULL,200,2,5),(261,NULL,NULL,NULL,NULL,200,2,7),(262,NULL,NULL,NULL,NULL,200,2,8),(263,NULL,NULL,NULL,NULL,200,2,9),(264,NULL,NULL,NULL,NULL,200,2,10),(265,NULL,NULL,NULL,NULL,200,2,11),(266,NULL,NULL,NULL,NULL,200,2,12),(267,NULL,NULL,NULL,NULL,200,2,1),(268,NULL,NULL,NULL,NULL,200,2,2),(269,NULL,NULL,NULL,NULL,200,2,3),(270,NULL,NULL,NULL,NULL,200,2,4),(271,NULL,NULL,NULL,NULL,200,2,5),(272,NULL,NULL,NULL,NULL,200,2,7),(273,NULL,NULL,NULL,NULL,200,2,8),(274,NULL,NULL,NULL,NULL,200,2,9),(275,NULL,NULL,NULL,NULL,200,2,10),(276,NULL,NULL,NULL,NULL,200,2,11),(277,NULL,NULL,NULL,NULL,200,2,12),(279,NULL,NULL,NULL,NULL,200,33,1),(280,NULL,NULL,NULL,NULL,200,33,2),(281,NULL,NULL,NULL,NULL,200,33,3),(282,NULL,NULL,NULL,NULL,200,33,4),(283,NULL,NULL,NULL,NULL,200,33,5),(284,NULL,NULL,NULL,NULL,200,33,7),(285,NULL,NULL,NULL,NULL,200,33,8),(286,NULL,NULL,NULL,NULL,200,33,9),(287,NULL,NULL,NULL,NULL,200,33,10),(288,NULL,NULL,NULL,NULL,200,33,11),(289,NULL,NULL,NULL,NULL,200,33,12),(290,NULL,NULL,NULL,NULL,200,33,1),(291,NULL,NULL,NULL,NULL,200,33,2),(292,NULL,NULL,NULL,NULL,200,33,3),(293,NULL,NULL,NULL,NULL,200,33,4),(294,NULL,NULL,NULL,NULL,200,33,5),(295,NULL,NULL,NULL,NULL,200,33,7),(296,NULL,NULL,NULL,NULL,200,33,8),(297,NULL,NULL,NULL,NULL,200,33,9),(298,NULL,NULL,NULL,NULL,200,33,10),(299,NULL,NULL,NULL,NULL,200,33,11),(300,NULL,NULL,NULL,NULL,200,33,12),(301,NULL,NULL,NULL,NULL,200,33,1),(302,NULL,NULL,NULL,NULL,200,33,2),(303,NULL,NULL,NULL,NULL,200,33,3),(304,NULL,NULL,NULL,NULL,200,33,4),(305,NULL,NULL,NULL,NULL,200,33,5),(306,NULL,NULL,NULL,NULL,200,33,7),(307,NULL,NULL,NULL,NULL,200,33,8),(308,NULL,NULL,NULL,NULL,200,33,9),(309,NULL,NULL,NULL,NULL,200,33,10),(310,NULL,NULL,NULL,NULL,200,33,11),(311,NULL,NULL,NULL,NULL,200,33,12),(312,NULL,NULL,NULL,NULL,200,33,1),(313,NULL,NULL,NULL,NULL,200,33,2),(314,NULL,NULL,NULL,NULL,200,33,3),(315,NULL,NULL,NULL,NULL,200,33,4),(316,NULL,NULL,NULL,NULL,200,33,5),(317,NULL,NULL,NULL,NULL,200,33,7),(318,NULL,NULL,NULL,NULL,200,33,8),(319,NULL,NULL,NULL,NULL,200,33,9),(320,NULL,NULL,NULL,NULL,200,33,10),(321,NULL,NULL,NULL,NULL,200,33,11),(322,NULL,NULL,NULL,NULL,200,33,12),(323,NULL,NULL,NULL,NULL,200,33,1),(324,NULL,NULL,NULL,NULL,200,33,2),(325,NULL,NULL,NULL,NULL,200,33,3),(326,NULL,NULL,NULL,NULL,200,33,4),(327,NULL,NULL,NULL,NULL,200,33,5),(328,NULL,NULL,NULL,NULL,200,33,7),(329,NULL,NULL,NULL,NULL,200,33,8),(330,NULL,NULL,NULL,NULL,200,33,9),(331,NULL,NULL,NULL,NULL,200,33,10),(332,NULL,NULL,NULL,NULL,200,33,11),(333,NULL,NULL,NULL,NULL,200,33,12),(334,NULL,NULL,NULL,NULL,200,33,1),(335,NULL,NULL,NULL,NULL,200,33,2),(336,NULL,NULL,NULL,NULL,200,33,3),(337,NULL,NULL,NULL,NULL,200,33,4),(338,NULL,NULL,NULL,NULL,200,33,5),(339,NULL,NULL,NULL,NULL,200,33,7),(340,NULL,NULL,NULL,NULL,200,33,8),(341,NULL,NULL,NULL,NULL,200,33,9),(342,NULL,NULL,NULL,NULL,200,33,10),(343,NULL,NULL,NULL,NULL,200,33,11),(344,NULL,NULL,NULL,NULL,200,33,12),(345,NULL,NULL,NULL,NULL,200,33,1),(346,NULL,NULL,NULL,NULL,200,33,2),(347,NULL,NULL,NULL,NULL,200,33,3),(348,NULL,NULL,NULL,NULL,200,33,4),(349,NULL,NULL,NULL,NULL,200,33,5),(350,NULL,NULL,NULL,NULL,200,33,7),(351,NULL,NULL,NULL,NULL,200,33,8),(352,NULL,NULL,NULL,NULL,200,33,9),(353,NULL,NULL,NULL,NULL,200,33,10),(354,NULL,NULL,NULL,NULL,200,33,11),(355,NULL,NULL,NULL,NULL,200,33,12),(356,NULL,NULL,NULL,NULL,200,33,1),(357,NULL,NULL,NULL,NULL,200,33,2),(358,NULL,NULL,NULL,NULL,200,33,3),(359,NULL,NULL,NULL,NULL,200,33,4),(360,NULL,NULL,NULL,NULL,200,33,5),(361,NULL,NULL,NULL,NULL,200,33,7),(362,NULL,NULL,NULL,NULL,200,33,8),(363,NULL,NULL,NULL,NULL,200,33,9),(364,NULL,NULL,NULL,NULL,200,33,10),(365,NULL,NULL,NULL,NULL,200,33,11),(366,NULL,NULL,NULL,NULL,200,33,12),(367,NULL,NULL,NULL,NULL,200,33,1),(368,NULL,NULL,NULL,NULL,200,33,2),(369,NULL,NULL,NULL,NULL,200,33,3),(370,NULL,NULL,NULL,NULL,200,33,4),(371,NULL,NULL,NULL,NULL,200,33,5),(372,NULL,NULL,NULL,NULL,200,33,7),(373,NULL,NULL,NULL,NULL,200,33,8),(374,NULL,NULL,NULL,NULL,200,33,9),(375,NULL,NULL,NULL,NULL,200,33,10),(376,NULL,NULL,NULL,NULL,200,33,11),(377,NULL,NULL,NULL,NULL,200,33,12),(378,NULL,NULL,NULL,NULL,200,33,1),(379,NULL,NULL,NULL,NULL,200,33,2),(380,NULL,NULL,NULL,NULL,200,33,3),(381,NULL,NULL,NULL,NULL,200,33,4),(382,NULL,NULL,NULL,NULL,200,33,5),(383,NULL,NULL,NULL,NULL,200,33,7),(384,NULL,NULL,NULL,NULL,200,33,8),(385,NULL,NULL,NULL,NULL,200,33,9),(386,NULL,NULL,NULL,NULL,200,33,10),(387,NULL,NULL,NULL,NULL,200,33,11),(388,NULL,NULL,NULL,NULL,200,33,12),(389,NULL,NULL,NULL,NULL,200,33,1),(390,NULL,NULL,NULL,NULL,200,33,2),(391,NULL,NULL,NULL,NULL,200,33,3),(392,NULL,NULL,NULL,NULL,200,33,4),(393,NULL,NULL,NULL,NULL,200,33,5),(394,NULL,NULL,NULL,NULL,200,33,7),(395,NULL,NULL,NULL,NULL,200,33,8),(396,NULL,NULL,NULL,NULL,200,33,9),(397,NULL,NULL,NULL,NULL,200,33,10),(398,NULL,NULL,NULL,NULL,200,33,11),(399,NULL,NULL,NULL,NULL,200,33,12),(400,NULL,NULL,NULL,NULL,200,33,1),(401,NULL,NULL,NULL,NULL,200,33,2),(402,NULL,NULL,NULL,NULL,200,33,3),(403,NULL,NULL,NULL,NULL,200,33,4),(404,NULL,NULL,NULL,NULL,200,33,5),(405,NULL,NULL,NULL,NULL,200,33,7),(406,NULL,NULL,NULL,NULL,200,33,8),(407,NULL,NULL,NULL,NULL,200,33,9),(408,NULL,NULL,NULL,NULL,200,33,10),(409,NULL,NULL,NULL,NULL,200,33,11),(410,NULL,NULL,NULL,NULL,200,33,12),(411,NULL,NULL,NULL,NULL,200,33,1),(412,NULL,NULL,NULL,NULL,200,33,2),(413,NULL,NULL,NULL,NULL,200,33,3),(414,NULL,NULL,NULL,NULL,200,33,4),(415,NULL,NULL,NULL,NULL,200,33,5),(416,NULL,NULL,NULL,NULL,200,33,7),(417,NULL,NULL,NULL,NULL,200,33,8),(418,NULL,NULL,NULL,NULL,200,33,9),(419,NULL,NULL,NULL,NULL,200,33,10),(420,NULL,NULL,NULL,NULL,200,33,11),(421,NULL,NULL,NULL,NULL,200,33,12),(422,NULL,NULL,NULL,NULL,200,33,1),(423,NULL,NULL,NULL,NULL,200,33,2),(424,NULL,NULL,NULL,NULL,200,33,3),(425,NULL,NULL,NULL,NULL,200,33,4),(426,NULL,NULL,NULL,NULL,200,33,5),(427,NULL,NULL,NULL,NULL,200,33,7),(428,NULL,NULL,NULL,NULL,200,33,8),(429,NULL,NULL,NULL,NULL,200,33,9),(430,NULL,NULL,NULL,NULL,200,33,10),(431,NULL,NULL,NULL,NULL,200,33,11),(432,NULL,NULL,NULL,NULL,200,33,12),(433,NULL,NULL,NULL,NULL,200,33,1),(434,NULL,NULL,NULL,NULL,200,33,2),(435,NULL,NULL,NULL,NULL,200,33,3),(436,NULL,NULL,NULL,NULL,200,33,4),(437,NULL,NULL,NULL,NULL,200,33,5),(438,NULL,NULL,NULL,NULL,200,33,7),(439,NULL,NULL,NULL,NULL,200,33,8),(440,NULL,NULL,NULL,NULL,200,33,9),(441,NULL,NULL,NULL,NULL,200,33,10),(442,NULL,NULL,NULL,NULL,200,33,11),(443,NULL,NULL,NULL,NULL,200,33,12);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_warehouse_inventory` AFTER INSERT ON `article` FOR EACH ROW BEGIN
    INSERT INTO warehouse_inventory (warehouse_id, article_id, product_id)
    VALUES (NEW.warehouse_id, NEW.id, NEW.product_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!50001 DROP VIEW IF EXISTS `cart_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_details` AS SELECT 
 1 AS `cart_id`,
 1 AS `article_name`,
 1 AS `article_code`,
 1 AS `article_variant`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int DEFAULT NULL,
  `article_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (2,1,4),(3,1,4),(4,1,5),(7,2,33),(8,2,23),(9,2,24),(10,2,35),(11,2,279),(12,2,290),(13,3,23),(14,3,24),(15,3,35),(16,3,279),(17,3,290),(18,4,23),(19,4,24),(20,4,35),(21,4,279),(22,4,290),(23,5,23),(24,5,24),(25,5,35),(26,5,279),(27,5,290),(28,6,23),(29,6,24),(30,6,35),(31,6,279),(32,6,290),(33,7,23),(34,7,24),(35,7,35),(36,7,279),(37,7,290),(38,8,23),(39,8,24),(40,8,35),(41,8,279),(42,8,290),(43,9,23),(44,9,24),(45,9,35),(46,9,279),(47,9,290);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cart_value`
--

DROP TABLE IF EXISTS `cart_value`;
/*!50001 DROP VIEW IF EXISTS `cart_value`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_value` AS SELECT 
 1 AS `cart_id`,
 1 AS `total_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Category Name','Category Description'),(2,'A','Consumer Electronics'),(3,'A2','Phones and Telecommunication'),(4,'A3a','Nokia Mobile Phones'),(5,'A3b','Xiaomi Mobile Phones'),(6,'A3c','Huawei Mobile Phones'),(7,'A3d','Apple Mobile Phones'),(8,'A3e','Samsung Mobile Phones'),(9,'A3f','LG Mobile Phones'),(10,'A4','Computers and Tablets'),(11,'A4a','Desktop Computers'),(12,'A4b','Laptops'),(13,'A4c','Tablets'),(14,'A4d','2-in-1 Laptops'),(15,'A4e','Gaming Laptops'),(16,'B','Home Appliances'),(17,'B2','Kitchen Appliances'),(18,'B2a','Refrigerators'),(19,'B2b','Ovens'),(20,'B2c','Microwaves'),(21,'B2d','Dishwashers'),(22,'B2e','Toasters');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `shipping_address_id` int DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_shipping_address` (`shipping_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'John','Doe',2,'john.doe@example.com','1234567890','USA','10001','New York'),(3,'Jane','Doe',4,'jane.doe@example.com','1234567890','USA','10001','New York'),(4,'igor','tadić',5,'igortadicsudo@admin.hr','1234567890','Croatia','10001','Zagreb'),(5,'Vinko','Horvat',6,'itsvinko@kupac.hr','41320841','Croatia','10000','Zagreb'),(6,'Dobrožizna','Pribislava',7,'dobrozizna@pribislava.com','413201321','Slovenia','10321','Maribor'),(7,'Destiny','Wiggins',NULL,'shaneyoung@example.net','001-583-518-2254x95022','Cyprus','26271','Mccormickland'),(8,'Megan','Clements',NULL,'dustin77@example.net','6954872725','Lithuania','28493','Ronaldside'),(9,'Benjamin','Perry',NULL,'colton27@example.org','(613)600-6494x410','Armenia','10407','Woodtown'),(10,'David','Juarez',NULL,'torreskathleen@example.net','465-895-1497','Greenland','36644','Amberchester'),(11,'Katie','Burns',NULL,'nwilliams@example.net','4967451850','Kiribati','16620','North Charlesmouth'),(12,'Wendy','Lambert',NULL,'jenkinslori@example.org','708.952.4909x847','Yemen','86784','Port Jonathan'),(13,'Darryl','Murillo',NULL,'michellele@example.net','749-495-2453x49449','Equatorial Guinea','99469','West Jeffrey'),(14,'Andrew','Jensen',NULL,'pparker@example.com','687.306.9034','Kenya','17026','East Kaitlynport'),(15,'David','Nguyen',NULL,'michael36@example.net','889-574-8614x7429','Nauru','83595','Michelemouth'),(16,'Jordan','Martinez',NULL,'luis41@example.net','484.484.5852x079','Korea','90590','Karenland'),(17,'Melissa','Camacho',NULL,'michael26@example.com','673.338.1088','Swaziland','46292','Ryanshire'),(18,'Jason','Ellis',NULL,'psexton@example.org','364.732.7159','Cuba','23265','New Deborahborough'),(19,'Joseph','Watkins',NULL,'ppratt@example.org','+1-772-240-7570x221','Timor-Leste','14656','Andersonborough'),(20,'Cindy','Sherman',NULL,'rdean@example.com','484.480.6059','Senegal','11633','New Wendyland'),(21,'Kathryn','Smith',NULL,'ravensmith@example.net','896.955.2906','Thailand','80483','Frazierhaven'),(22,'Heather','Drake',NULL,'kristasanders@example.org','(644)282-6041','Saint Lucia','90734','Jonesville'),(23,'Jonathon','Lucas',NULL,'nancywhite@example.com','701.282.0637x022','Algeria','80346','Heatherfort'),(24,'Jaclyn','Lester',NULL,'fsanchez@example.net','9794013820','Syrian Arab Republic','87592','Hoganport'),(25,'Alexandra','Nichols',NULL,'nathaniel62@example.com','815.675.9911x5527','British Indian Ocean Territory (Chagos Archipelago)','51122','Grahamfort'),(26,'Beth','Miller',NULL,'morrisangie@example.com','001-376-487-8261x838','Tanzania','91359','North Jonathan'),(27,'Johnny','Brooks',NULL,'thomasyoung@example.com','(693)912-9426x110','Jordan','73039','North Raymondport'),(28,'Mary','Stuart',NULL,'jamesbrown@example.com','+1-662-261-5735x1588','Anguilla','89117','Lake Michael'),(29,'Kevin','Torres',NULL,'vriley@example.com','+1-910-481-7274','United States Minor Outlying Islands','63542','Youngshire'),(30,'Anthony','Walker',NULL,'robertperez@example.org','(559)373-2938','Nicaragua','94533','Matthewfurt'),(31,'Daniel','Spears',NULL,'thomasmark@example.org','264-874-8576','Russian Federation','96858','Churchfort'),(32,'Sarah','Hurst',NULL,'pricechristian@example.com','(399)211-4577x65956','Brazil','53260','New Donnaland'),(33,'Darlene','Adams',NULL,'millsnoah@example.net','+1-847-647-0890','Nepal','39918','New Justinmouth'),(34,'Kelli','Pittman',NULL,'williambrown@example.net','(830)811-0271','Cuba','09971','Amberchester'),(35,'Spencer','Ramirez',NULL,'nconway@example.net','430.647.7666x168','Iraq','59954','Brianburgh'),(36,'Megan','Davis',NULL,'taylor97@example.com','+1-657-627-8387x972','Lesotho','89451','Taylorhaven'),(37,'Lori','Beard',NULL,'romeromegan@example.com','9979871530','Turkmenistan','47014','Andreside'),(38,'Adam','Guerra',NULL,'destinyramirez@example.net','+1-991-315-8608x93995','Bouvet Island (Bouvetoya)','36804','South Erica'),(39,'James','Perez',NULL,'smithjeremiah@example.net','496-804-6215x1058','Sri Lanka','34824','East Eric'),(40,'Crystal','Neal',NULL,'tfrazier@example.org','(463)275-0784','Korea','68767','Lauraville'),(41,'Luke','Gonzalez',NULL,'ljohnson@example.net','368.708.6960','Nigeria','51068','South Cassandra'),(42,'Jamie','Brown',NULL,'obrown@example.net','001-983-914-2786','Tokelau','53209','Port Walter'),(43,'Kevin','Yang',NULL,'warethomas@example.net','001-988-423-3119','Northern Mariana Islands','72318','Martinezbury'),(44,'Sarah','Snyder',NULL,'dramirez@example.org','870.864.4993','Kyrgyz Republic','55699','East Judith'),(45,'Michael','Ali',NULL,'william94@example.com','+1-304-218-6638x9748','Norfolk Island','31870','Normanview'),(46,'Bradley','Brown',NULL,'martha23@example.org','(737)399-7078x7608','Faroe Islands','27323','West Donaldborough'),(47,'Shirley','Le',NULL,'sharon96@example.com','001-648-778-6392','Saint Lucia','56361','Johnsonshire'),(48,'Hunter','Day',NULL,'simmonsjeffrey@example.net','(511)814-8629x7366','Kuwait','02003','Lambborough'),(49,'Kristin','Hoover',NULL,'jordan07@example.org','+1-826-366-7564x7872','Finland','04060','Grossport'),(50,'Brandon','Allen',NULL,'jhudson@example.org','+1-575-738-8004x6709','Venezuela','79922','Lake Miguel'),(51,'Megan','Ayala',NULL,'rwilson@example.com','(929)845-2075x02339','Central African Republic','47965','Cindystad'),(52,'Tina','Lowe',NULL,'richardchase@example.org','001-777-530-1495','Venezuela','89968','South Jasonstad'),(53,'Nicholas','Jones',NULL,'dkhan@example.org','2116544181','India','50519','Donaldville'),(54,'Jasmine','Mills',NULL,'tina80@example.com','(685)800-0952','Palestinian Territory','43291','East Rachel'),(55,'David','Clark',NULL,'justin73@example.com','001-584-961-5593x007','Grenada','49079','Port Christopher'),(56,'Brenda','Lang',NULL,'pamelabell@example.org','758-771-7912','Portugal','19512','East Shawn'),(57,'Brian','Pearson',NULL,'bmeyer@example.com','(680)519-3752x5962','Guadeloupe','70446','Riverashire'),(58,'Miguel','Hopkins',NULL,'michellerojas@example.org','(540)771-8463','Papua New Guinea','65933','Eatonburgh'),(59,'Matthew','Miller',NULL,'kevincook@example.org','482-796-0320','Kuwait','34030','Sanchezshire'),(60,'Donald','Lyons',NULL,'bryan96@example.net','001-660-208-8423x578','Bahamas','34538','Houseberg'),(61,'Ethan','Brooks',NULL,'watsonerika@example.net','873-926-3059x5019','Maldives','16450','East Michaelmouth'),(62,'Richard','Patterson',NULL,'shawnbarrett@example.net','(827)638-0571','Faroe Islands','70283','Lake Teresaland'),(63,'Thomas','Butler',NULL,'john47@example.com','+1-655-990-9317x53519','Malawi','20203','Shawfort'),(64,'Henry','Nelson',NULL,'rjackson@example.net','9886700003','French Southern Territories','45079','Angelabury'),(65,'Keith','Dixon',NULL,'cchang@example.com','+1-884-747-8189x962','Germany','28789','Robertshire'),(66,'Andrea','Mendez',NULL,'dwayne20@example.com','852-478-5721x332','Pitcairn Islands','02043','Willieville'),(67,'Kevin','Burnett',NULL,'johnanderson@example.com','617.282.6081','Lesotho','89795','Hayesland'),(68,'Tara','Hubbard',NULL,'heather24@example.net','001-885-395-5071x3283','Saint Kitts and Nevis','08331','East Randallfort'),(69,'Carla','Bartlett',NULL,'gary89@example.org','001-879-906-7435x21152','Mali','19504','East Karentown'),(70,'Kevin','Raymond',NULL,'nichole65@example.net','(894)557-3980x693','Algeria','82910','Port Destinyfort'),(71,'Robert','Campbell',NULL,'joshuajohnson@example.net','+1-405-246-0316x87605','Papua New Guinea','24057','South Dustinside'),(72,'William','Perkins',NULL,'mbrown@example.org','699-534-5521x99889','Namibia','84343','Jenniferbury'),(73,'Julie','Marshall',NULL,'duncancole@example.net','001-458-545-9291x455','Monaco','09078','Lake Christine'),(74,'Johnny','Jenkins',NULL,'stoneeric@example.org','397.547.0016','South Georgia and the South Sandwich Islands','04374','Davischester'),(75,'Ryan','Swanson',NULL,'cabrerajason@example.org','+1-771-908-8115x9699','French Southern Territories','92880','North Bradleymouth'),(76,'Ashley','Barrett',NULL,'xbrown@example.org','+1-288-895-0238x7302','Vanuatu','88854','Kaiserbury'),(77,'Michael','Miller',NULL,'qgilbert@example.net','869-560-1550x7949','Bangladesh','77015','North Dominiquefurt'),(78,'Craig','Dean',NULL,'garciasean@example.net','413.649.6968','Kiribati','97282','Port Sherrychester'),(79,'Karen','Jones',NULL,'richardsandoval@example.net','8616167649','Myanmar','01259','South Andrea'),(80,'Harold','Poole',NULL,'jacqueline24@example.net','221.827.3408x6443','Azerbaijan','98246','Millertown'),(81,'Jeremy','Miller',NULL,'robertgreen@example.com','001-647-394-4143x4189','Kiribati','99938','North Maria'),(82,'Derrick','Foster',NULL,'williamsmolly@example.com','7425173099','Albania','24219','New Michael'),(83,'Corey','Strickland',NULL,'fwilliams@example.com','001-556-698-8662x6232','Suriname','17364','North Troyberg'),(84,'Ryan','Carter',NULL,'martin59@example.org','(749)411-2418x321','Guadeloupe','78920','Ashleyfort'),(85,'Darren','Jones',NULL,'victoriasimmons@example.net','(438)297-1277x427','Trinidad and Tobago','30328','Port Margaret'),(86,'Paula','Harvey',NULL,'icollins@example.org','365.831.0181x09351','Austria','77622','Heathershire'),(87,'Allison','Rodriguez',NULL,'vward@example.com','826.752.7283','Kiribati','26468','East Stephenport'),(88,'Diane','Mendez',NULL,'hudsonkevin@example.net','(902)481-4022','Tajikistan','82475','Sheltonstad'),(89,'Cindy','Walker',NULL,'frenchjessica@example.com','001-943-838-6798x809','Central African Republic','07627','Port Stephanie'),(90,'Megan','Gamble',NULL,'guerrerologan@example.net','+1-661-945-8935x3730','Korea','57828','South Daniellechester'),(91,'Mark','Taylor',NULL,'frederick00@example.net','(675)764-0981x49876','Malta','79911','Michaelton'),(92,'Stephanie','White',NULL,'mbond@example.org','287-385-2799x50430','Croatia','02720','South Sydney'),(93,'Brian','Baker',NULL,'jonesmary@example.org','(849)335-8140','Cote d\'Ivoire','40515','West Ronaldberg'),(94,'Nicole','Davidson',NULL,'yvonne12@example.org','411.704.2444x815','Turks and Caicos Islands','19014','East Phillip'),(95,'Clayton','Henry',NULL,'perezerica@example.org','7958794744','Albania','52136','Lake James'),(96,'Daniel','Stevenson',NULL,'arthurcollins@example.net','+1-358-594-9474x47525','Belarus','15268','Lake Danielfurt'),(97,'Richard','Cannon',NULL,'jamesblair@example.org','(852)371-0026x37170','San Marino','47455','West Caitlin'),(98,'Glenda','Gillespie',NULL,'rjones@example.org','(755)747-8573','Saint Helena','11874','Kellyhaven'),(99,'Cole','Mitchell',NULL,'gmartin@example.net','677.298.3405','Niue','59053','Carriestad'),(100,'Shannon','Lowe',NULL,'shane16@example.org','001-989-683-4377','Liechtenstein','85447','Cainmouth'),(101,'Rodney','Mcgee',NULL,'sandramata@example.net','+1-981-369-9542','Timor-Leste','51545','Bonniemouth'),(102,'Peggy','Harris',NULL,'stonehector@example.org','4953091743','Sudan','41236','East Ryan'),(103,'Bryan','Chang',NULL,'timothylong@example.net','267.397.0185x364','Maldives','49196','Rebeccaland'),(104,'Andrea','Edwards',NULL,'hillisaiah@example.com','(689)892-6006x21337','Guyana','80874','East Cristinafurt'),(105,'Virginia','Kirk',NULL,'aarontorres@example.com','(924)703-2464','Panama','33707','South Marcusfurt'),(106,'William','Moran',NULL,'andrea23@example.com','248.641.1965','Zambia','91006','Walshhaven'),(107,'Jason','Chambers',NULL,'kim53@example.net','(318)912-9045x8776','Spain','93285','Hopkinstown'),(108,'Sean','Burke',NULL,'amy20@example.com','001-744-320-1391x123','Jamaica','90577','Smithborough'),(109,'Candice','Johnson',NULL,'jbennett@example.com','001-741-691-4979x6886','Canada','71134','Andrewview'),(110,'Justin','Rojas',NULL,'aaronhunt@example.com','(833)422-3446','Costa Rica','72779','Mosesland'),(111,'Cynthia','Woods',NULL,'andrea49@example.net','001-866-753-3589','Pitcairn Islands','21419','South Robert'),(112,'Joan','Fowler',NULL,'cannonshannon@example.com','001-357-345-0521x804','Western Sahara','65429','Melissachester'),(113,'Darryl','Porter',NULL,'samuelhamilton@example.org','(491)215-8981','American Samoa','79297','Cannonton'),(114,'Deborah','Nichols',NULL,'richard63@example.com','+1-967-974-3189','Sao Tome and Principe','18356','Jacobshaven'),(115,'Melissa','Hill',NULL,'jesusgarrison@example.org','289.715.6462x826','Bouvet Island (Bouvetoya)','67907','West Bruce'),(116,'Brianna','Harris',NULL,'gsummers@example.net','(586)717-4554x2090','Libyan Arab Jamahiriya','07959','Bryantown'),(117,'Christy','Bates',NULL,'ijohnson@example.net','+1-309-601-8256x840','Dominican Republic','09141','Greentown'),(118,'Samuel','Dickerson',NULL,'lukeward@example.com','(952)979-5600x5856','Syrian Arab Republic','96442','South Jameshaven'),(119,'Christopher','Morgan',NULL,'donald73@example.org','8032879501','Wallis and Futuna','23086','Jillstad'),(120,'Jerry','Leon',NULL,'tfoster@example.org','(348)419-7641x1404','Wallis and Futuna','31828','Lamberthaven'),(121,'Lorraine','Miller',NULL,'awise@example.org','(279)710-9666','Greece','82879','South Rhondashire'),(122,'Christina','Cummings',NULL,'barryjones@example.org','001-424-714-6189x44980','Dominica','46353','Garciafort'),(123,'Jeffrey','Doyle',NULL,'rcummings@example.com','001-669-255-6769','Lithuania','95410','West Kellyside'),(124,'Sandra','Hurley',NULL,'brownbobby@example.net','001-997-580-9640x44806','Slovenia','38923','Jillfurt'),(125,'Beth','Villa',NULL,'dennisgomez@example.com','802-343-7592','Italy','27473','East Pamela'),(126,'Melissa','Vargas',NULL,'vgibson@example.com','(368)717-1988x3780','Martinique','58000','Solisborough'),(127,'Jessica','Brown',NULL,'annamcintosh@example.net','(996)493-2826','Albania','98214','North Joy'),(128,'Marilyn','Grant',NULL,'khunter@example.net','895-520-9578x2281','Mexico','17550','Gomezfurt'),(129,'Joseph','Davis',NULL,'josebrown@example.com','2798451233','Angola','12549','Weisschester'),(130,'Sarah','Walker',NULL,'alicynthia@example.com','9199700605','Ireland','75937','North Thomas'),(131,'Darren','Kramer',NULL,'justin75@example.org','475.757.9536','Moldova','48314','Dicksonmouth'),(132,'John','Shaffer',NULL,'ljones@example.net','213.309.9697x917','Morocco','56236','New Leviview'),(133,'Tracy','Parker',NULL,'averyjames@example.com','9827189462','Singapore','12618','Andrewton'),(134,'Michelle','Hernandez',NULL,'kelseysnyder@example.net','(866)546-6978','Finland','06538','Deannabury'),(135,'Samuel','Yates',NULL,'jessemejia@example.com','001-479-706-5195','Guam','25399','Williamshaven'),(136,'Karen','Galvan',NULL,'zalvarez@example.org','592.437.9376x5652','Ireland','19554','Weststad'),(137,'Charles','Romero',NULL,'craig94@example.com','+1-863-346-0651x128','Paraguay','52009','East Elizabethborough'),(138,'Erik','Livingston',NULL,'nicholas48@example.org','001-489-664-0200x9053','Wallis and Futuna','19595','Robinsonmouth'),(139,'Katelyn','Johnston',NULL,'fwoods@example.net','(738)665-5269','Vietnam','86486','Hendricksland'),(140,'Mary','Davis',NULL,'jreynolds@example.com','2392057835','Netherlands Antilles','43552','North Wesleyhaven'),(141,'Michael','Martinez',NULL,'jacobjones@example.net','(619)675-3600x8994','Bolivia','34598','Burnettberg'),(142,'Mary','Owens',NULL,'erica91@example.org','+1-518-610-8845x601','Fiji','78500','Melissamouth'),(143,'Shannon','Sandoval',NULL,'davissydney@example.net','709.571.5851x131','Malaysia','75355','Herreraberg'),(144,'Amanda','Yates',NULL,'esingleton@example.com','+1-252-487-1878x803','San Marino','24198','West Kaylabury'),(145,'Angela','Meadows',NULL,'veleznancy@example.org','3359831160','United States Virgin Islands','57620','Lake Michael'),(146,'Kaitlin','Lee',NULL,'kathy56@example.com','9525794666','Rwanda','74235','North James'),(147,'Lisa','Adams',NULL,'mramos@example.com','532.970.2118x32116','Belize','85748','Joyside'),(148,'Rita','Goodwin',NULL,'craig05@example.net','+1-898-653-7986x1556','Gambia','31009','East Jeremy'),(149,'Pamela','Velazquez',NULL,'emilyerickson@example.net','357-965-5491x919','Peru','67213','Singletonland'),(150,'Cindy','Montgomery',NULL,'kelly16@example.com','+1-278-655-1088x56914','Guinea-Bissau','78451','New James'),(151,'Daniel','Sanchez',NULL,'sadams@example.org','792-385-4434','Estonia','75383','Shawnside'),(152,'Gary','Robinson',NULL,'johnsonjill@example.net','+1-433-664-9836','Malaysia','18695','Robertfort'),(153,'Lisa','Peterson',NULL,'kmitchell@example.com','303.532.2936x39293','United States Minor Outlying Islands','92906','Port Ricardo'),(154,'Ashley','Beck',NULL,'nwilliams@example.com','001-652-739-3239','Bouvet Island (Bouvetoya)','69337','Hansenland'),(155,'Katherine','Rogers',NULL,'agreen@example.com','271.969.4242x0423','Cambodia','20469','Lake John'),(156,'Elizabeth','Fuller',NULL,'qarmstrong@example.org','(384)527-5891','Austria','37252','New Davidborough'),(157,'Scott','Johnson',NULL,'fjohnson@example.org','001-706-394-3314x20713','Ukraine','54442','Aliciachester'),(158,'Kelly','Lowery',NULL,'mariahcasey@example.com','391-881-5255','Sweden','94326','West Steveborough'),(159,'Edward','Bullock',NULL,'markrandolph@example.net','279.568.6347x68912','Latvia','69075','South Sara'),(160,'Kendra','Jackson',NULL,'lisa98@example.net','001-396-545-7348x8094','Azerbaijan','12592','Scottberg'),(161,'Susan','Jarvis',NULL,'upatton@example.net','973.622.4723','Saint Martin','47303','East Larry'),(162,'Ann','Miller',NULL,'kathygonzalez@example.com','+1-687-287-2698x40367','Yemen','35175','West Aprilborough'),(163,'David','Bowers',NULL,'mark58@example.org','(395)870-8943','Costa Rica','58224','South Marktown'),(164,'Bob','Porter',NULL,'nicholas92@example.com','675-559-5617','Zimbabwe','52459','North Nancyborough'),(165,'David','Jacobs',NULL,'iwilliams@example.com','001-995-300-6442','India','17473','New Jennifer'),(166,'Heather','Braun',NULL,'bwatts@example.net','748.334.5846x69386','Peru','66266','Perezfort'),(167,'Angela','Chang',NULL,'gregory19@example.net','423-985-9415x023','Turkey','79509','Richardfort'),(168,'Amanda','Garcia',NULL,'callahanlinda@example.com','842.879.2972','Azerbaijan','25878','East Tammy'),(169,'Patricia','Jones',NULL,'nathan57@example.org','816.489.4408x406','Equatorial Guinea','36913','Matthewchester'),(170,'Gabriel','Jones',NULL,'gbeck@example.net','493-812-7988x7979','San Marino','67693','Lawrencefort'),(171,'Jennifer','Russo',NULL,'muellerryan@example.org','+1-717-425-6262x42460','Denmark','58327','Christophertown'),(172,'Megan','Strickland',NULL,'twilson@example.com','330.336.1654','Hong Kong','99024','Kempfort'),(173,'Mary','Patel',NULL,'bjackson@example.org','766-248-9428','Israel','41304','Wolfeport'),(174,'Angela','Miller',NULL,'claudia22@example.net','642-851-8934','Pakistan','49539','Lozanoland'),(175,'Eric','Taylor',NULL,'pageashley@example.org','001-679-700-8782x978','Saint Lucia','24639','Kimberlyfort'),(176,'Jennifer','Banks',NULL,'thompsonmiguel@example.com','695.960.5792x826','Slovakia (Slovak Republic)','96118','Austinmouth'),(177,'Tabitha','Green',NULL,'browningjohn@example.org','824-220-7684','Isle of Man','47386','South Jeffreymouth'),(178,'Morgan','Beck',NULL,'dmcclain@example.org','(517)506-9685x88636','Ukraine','81171','Floresport'),(179,'Christine','Ross',NULL,'qhendricks@example.org','001-644-437-2956','Zambia','15506','New Aaronstad'),(180,'Rachel','Lin',NULL,'kevingomez@example.org','+1-366-683-5212','Marshall Islands','83133','Connerfort'),(181,'Ryan','Reyes',NULL,'mollybender@example.org','(364)554-1544x887','Mayotte','04594','Jessicatown'),(182,'Tom','Mcmillan',NULL,'wayne57@example.net','(474)506-6498x037','Turks and Caicos Islands','14656','West Laura'),(183,'Sarah','Saunders',NULL,'nortonadam@example.com','842.886.1137','Martinique','25651','West Traciburgh'),(184,'Susan','Fischer',NULL,'ysanchez@example.org','4329450345','Cambodia','06368','Reedville'),(185,'Laura','Williams',NULL,'clogan@example.org','736.243.6362x9282','Slovenia','85357','West Tina'),(186,'John','Johnson',NULL,'myersdaniel@example.net','231.243.5220x88649','Burundi','36854','East Kimberlyshire'),(187,'Chris','Phillips',NULL,'kaitlynsmith@example.com','8062080162','Guam','63101','Cynthiastad'),(188,'David','Young',NULL,'landrykelly@example.net','245.738.1600','Uruguay','38214','South Wanda'),(189,'Brent','Bowers',NULL,'velazquezricky@example.com','3296861430','China','63925','Matthewfort'),(190,'Alicia','Howell',NULL,'leblancrobert@example.com','4046098378','Italy','50435','West Marcmouth'),(191,'Sandra','Smith',NULL,'smithlaura@example.net','+1-823-409-8249','Poland','55201','South Melissa'),(192,'Paul','Johnson',NULL,'rnelson@example.net','5189993129','India','37376','Lake Victoria'),(193,'Isaac','Ramirez',NULL,'jasmine52@example.com','(388)662-7123x3295','Mauritius','75272','Melissamouth'),(194,'Kelly','Hendricks',NULL,'crawfordsarah@example.net','531-727-6926','United Arab Emirates','99106','Reyesborough'),(195,'Shawn','Mcdaniel',NULL,'mmurray@example.net','+1-502-267-5471x782','Zambia','34383','Roweshire'),(196,'Denise','Williams',NULL,'vlewis@example.org','+1-604-241-8993x0989','Tuvalu','23427','Micheleville'),(197,'Jonathan','Parker',NULL,'amercer@example.org','794.868.6546','Saint Kitts and Nevis','07937','Jaredfurt'),(198,'Dawn','Perez',NULL,'vaughndebbie@example.org','+1-717-890-1018x339','Malaysia','14017','East Matthew'),(199,'Samuel','Gonzalez',NULL,'tracy61@example.com','889-847-5095x6001','Liberia','28420','Cathyfort'),(200,'Gregory','Singleton',NULL,'megansheppard@example.net','202-380-2859','French Polynesia','44482','Lake Teresatown'),(201,'Michael','Perkins',NULL,'uduncan@example.org','232-260-7798x86572','Jamaica','79785','Martinmouth'),(202,'Darryl','Patterson',NULL,'emily28@example.org','(911)574-5815x93667','Algeria','24055','Robertmouth'),(203,'Tyler','Rojas',NULL,'omichael@example.com','+1-599-295-8896','Barbados','33931','West Thomasfurt'),(204,'Benjamin','Church',NULL,'tyler59@example.net','838.514.5025','Timor-Leste','28847','Frankview'),(205,'Brian','Walton',NULL,'hessjustin@example.org','001-403-847-6098','Montserrat','11729','South Evan'),(206,'Danielle','Martin',NULL,'thomaskelly@example.net','001-288-886-6343','United Arab Emirates','34453','South Paul'),(307,'Laura','Galešić',NULL,'victorpoelitz@example.com','0800 43 94','Zypern','42184858','Karlsruhe'),(308,'Gereon','Dvojak',NULL,'karlakocijancic@example.net','060 937 021','Kolumbija','42184858','Greiz'),(309,'Dario','Lovrić',NULL,'ijagarinec@example.net','+49(0)8234 359214','Honduras','42184858','Pag'),(310,'Liesbeth','Langern',NULL,'miletudor@example.com','+49(0) 757056592','Sjeverni Marijanski Otoci','42184858','Sveti Ivan Zelina'),(311,'Sophie','Schuchhardt',NULL,'ika60@example.net','+49(0)8910480161','Dschibuti','42184858','Novi Marof'),(312,'Toni','Zimmer',NULL,'penicjosko@example.org','+49(0)1901800403','Bahrein','42184858','Nin'),(313,'Ika','Lasić',NULL,'martindizdar@example.com','052 422 768','Afghanistan','42184858','Omiš'),(314,'Nika','Rust',NULL,'spoljaricmateja@example.net','099 1906 265','Guyana','42184858','Bergzabern'),(315,'Leon','Radman',NULL,'gordanarahija@example.net','031 176 750','Tadschikistan','42184858','Wunsiedel'),(316,'Wera','Staničić',NULL,'joskosobota@example.org','034 369 316','Côte d’Ivoire','42184858','Koprivnica'),(317,'Ružica','Ribičić',NULL,'fmisicher@example.com','03370 41631','Liberija','42184858','Wertingen'),(318,'Pavao','Kühnert',NULL,'hethurclaus-dieter@example.org','031 846 898','Barbados','42184858','Schmölln'),(319,'Magdalena','Müller',NULL,'victorkrebs@example.org','00353156111','Falklandinseln','42184858','Forchheim'),(320,'Antun','Roso',NULL,'bjelisjulijana@example.com','074 460 991','St. Kitts und Nevis','42184858','Berchtesgaden'),(321,'Luka','Schmidt',NULL,'zdravko35@example.net','033 048 182','Indija','42184858','Dugo Selo'),(322,'Dalibor','Geisler',NULL,'mstanic@example.net','040 805 438','Luxemburg','42184858','Königs Wusterhausen'),(323,'Branko','Bender',NULL,'stiffelswantje@example.net','042 891 883','Britanski Djevičanski Otoci','42184858','Novigrad'),(324,'Mirjana','Perišić',NULL,'cichoriussandro@example.org','03294 16181','Belgien','42184858','Burgdorf'),(325,'Anđela','Koch',NULL,'skupnjakantonio@example.net','020 995 416','Wallis und Futuna','42184858','Buzet'),(326,'Herrmann','Davids',NULL,'rochusheser@example.com','+49(0)3642 51239','Bahrain','42184858','Wurzen'),(327,'Ingmar','Lazar',NULL,'jvidov@example.com','(09123) 12214','Kap Verde','42184858','Dessau'),(328,'Elizabeta','Liović',NULL,'aschomber@example.org','040 937 649','Antarktis','42184858','Prelog'),(329,'Dario','Seip',NULL,'loefflerrosemarie@example.org','020 827 606','Nigerija','42184858','Calau'),(330,'Helmut','Röhrdanz',NULL,'gutezdenka@example.org','+49(0)1235722531','Kiribati','42184858','Geithain'),(331,'Ivana','Koch II',NULL,'matovinakarlo@example.net','(07832) 65757','Malediven','42184858','Imotski'),(332,'Nataša','Kolega',NULL,'jnorac@example.com','0800 86 28','Äußeres Ozeanien','42184858','Mursko Središće'),(333,'Ilija','Šantić',NULL,'iflego@example.com','+49(0)0950 368483','Nördliche Marianen','42184858','Požega'),(334,'Yilmaz','Ugrinić',NULL,'barbarajemric@example.com','03477437811','Iran, Islamska Republika','42184858','Vodnjan'),(335,'Alla','Šitum',NULL,'joskoklaric@example.com','+49 (0) 4926 056887','Paraguay','42184858','Saulgau'),(336,'Mate','Banovac',NULL,'hornigklaus-d@example.com','095 6789 014','Palästinensische Gebiete','42184858','Našice'),(337,'Ildiko','Culi',NULL,'austermuehletilly@example.net','03761 726490','Mikronesien','42184858','Berlin'),(338,'Enver','Kauzlarić',NULL,'opalic@example.com','(04858) 586376','Kanada','42184858','Poreč'),(339,'Olga','Adler',NULL,'annetteliebelt@example.com','04193 334829','Turks- und Caicosinseln','42184858','Spremberg'),(340,'Dominik','Vidović',NULL,'ivajuretic@example.net','092 8515 620','Russische Föderation','42184858','Bad Kreuznach'),(341,'Mohammad','Majstorović',NULL,'thanelgerti@example.org','+49(0) 073849884','Niger','42184858','Hammelburg'),(342,'Ljiljana','Schäfer',NULL,'igor28@example.org','0950502432','Malediven','42184858','Bogen'),(343,'Jadranka','Gunpf',NULL,'antoinetteloechel@example.net','(00375) 13803','Britische Jungferninseln','42184858','Vukovar'),(344,'Ivka','Ullmann',NULL,'sanja54@example.net','098 1964 511','Philippinen','42184858','Sangerhausen'),(345,'Gordana','Jagečić',NULL,'ikolega@example.com','09383 017809','Čile','42184858','Zadar'),(346,'Hanno','Blümel',NULL,'hvukusic@example.net','01 0963 327','St. Barthélemy','42184858','Freital'),(347,'Patrik','Jagečić',NULL,'dragicatudic@example.net','+49(0)3781 042300','Kazakstan','42184858','Wernigerode'),(348,'Zdravko','Johann',NULL,'zbeckmann@example.com','034 486 654','Ujedinjeni Arapski Emirati','42184858','Auerbach'),(349,'Fernando','Salz',NULL,'katakolic@example.org','+49(0)1400 999014','Färöer','42184858','Säckingen'),(350,'Alex','Hölzenbecher',NULL,'albina79@example.net','033 392 062','Sv. Lucija','42184858','Petrinja'),(351,'Teresa','Etzler',NULL,'bernhard12@example.com','020 436 335','Tokelau','42184858','Supetar'),(352,'Gerta','Maraš',NULL,'matija37@example.net','(04314) 22773','Sonderverwaltungszone Hongkong','42184858','Opuzen'),(353,'Felicia','Henck',NULL,'markoorlovic@example.com','097 7803 715','Samoa','42184858','Glina'),(354,'Laura','Heintze',NULL,'toni62@example.com','049 690 364','Russische Föderation','42184858','Perleberg'),(355,'Fedor','Hoffmann',NULL,'rholt@example.net','095 6818 852','São Tomé und Príncipe','42184858','Poreč'),(356,'Priska','Piljek',NULL,'gordana37@example.net','(09163) 551903','Zypern','42184858','Dugo Selo'),(357,'Karl-Wilhelm','Bloch',NULL,'bucanacdarko@example.net','074 613 144','Sonderverwaltungszone Macao','42184858','Riesa'),(358,'Ilija','Gredičak',NULL,'marin29@example.com','05029 597953','Uzbekistan','42184858','Crikvenica'),(359,'Pero','Martin',NULL,'klaus-werner17@example.org','022 782 049','Alandski otoci','42184858','Ochsenfurt'),(360,'Nicolaus','Schleich',NULL,'simarafuma@example.org','023 101 311','Bulgarien','42184858','Crikvenica'),(361,'Suzana','Piljek',NULL,'steficajagecic@example.org','042 274 557','Malezija','42184858','Havelberg'),(362,'Katarina','Horvatek',NULL,'ssalz@example.org','032 006 352','Turska','42184858','Pirmasens'),(363,'Michail','Krebs',NULL,'alfstumpf@example.com','04701 87608','Singapur','42184858','Gunzenhausen'),(364,'Zvonko','Štefanec',NULL,'tilmannbauer@example.com','020 148 178','Sirija','42184858','Ebermannstadt'),(365,'Danijel','Kostolzin',NULL,'matejabaljak@example.com','+49(0)0369 383107','Honduras','42184858','Vilsbiburg'),(366,'Patrik','Zimmer',NULL,'kerekovicdragica@example.org','021 874 701','Französisch-Polynesien','42184858','Amberg'),(367,'Hakan','Gligora',NULL,'steymiroslav@example.com','06212081793','Vereinigte Arabische Emirate','42184858','Rathenow'),(368,'Pero','Križan',NULL,'jgroettner@example.org','+49(0)9637 467584','Kokosovi Otoci','42184858','Krapina'),(369,'Nikša','Bošnjaković',NULL,'trubinortwin@example.net','051 120 030','Ägypten','42184858','Luckau'),(370,'Folkert','Junken',NULL,'qbauer@example.com','+49(0)0436910395','Bugarska','42184858','Sigmaringen'),(371,'Nikolaj','Kreusel',NULL,'eberthsemra@example.com','042 101 846','Gvajana','42184858','Sveta Nedelja'),(372,'Gordana','Kallert',NULL,'karlovicdanijel@example.net','034 270 981','Sonderverwaltungszone Macao','42184858','Aachen'),(373,'Ante','Tudić',NULL,'snjezanaplese@example.org','00599472256','Saudijska Arabija','42184858','Warendorf'),(374,'Gerald','Hermighausen',NULL,'vlasicdjuro@example.org','040 131 936','São Tomé und Príncipe','42184858','Pinneberg'),(375,'Dušan','Juncken',NULL,'ingo38@example.org','+49(0)1863 308000','Spanien','42184858','Sternberg'),(376,'Hanspeter','Sedlar',NULL,'aleksejsaeuberlich@example.com','+49 (0) 9026 124867','Tadschikistan','42184858','Wolfratshausen'),(377,'Sara','Legović',NULL,'oterzic@example.org','+49(0) 769127150','St. Barthélemy','42184858','Varaždin'),(378,'Eckard','Döring',NULL,'damir07@example.net','(04052) 80363','Mauricijus','42184858','Rudolstadt'),(379,'Šime','Babić',NULL,'natali27@example.net','+49(0)4023 65832','Liberija','42184858','Wesel'),(380,'Käthe','Steckel',NULL,'adrian15@example.org','+49(0)2606794637','Kiribati','42184858','Nova Gradiška'),(381,'Barbara','Brlek',NULL,'jaehnjonathan@example.net','+49 (0) 8493 932232','Saudijska Arabija','42184858','Karlovac'),(382,'Jozo','Andrijašević',NULL,'gerta16@example.net','051 303 367','Litauen','42184858','Bjelovar'),(383,'Ruža','Boucsein',NULL,'joachim82@example.com','06133274819','Philippinen','42184858','Mali Lošinj'),(384,'Mara','Tomić',NULL,'katerinamitschke@example.org','+49(0)8462800539','Brasilien','42184858','Klanjec'),(385,'Veit','Trub',NULL,'zeljka19@example.org','074 852 674','Filipini','42184858','Đurđevac'),(386,'Vesna','Božanić',NULL,'hnohlmans@example.net','+49(0) 824792308','Liberia','42184858','Marienberg'),(387,'Mesut','Karz',NULL,'sasa95@example.org','(00900) 427995','Sjeverni Marijanski Otoci','42184858','Kamenz'),(388,'Marijana','Alković',NULL,'damir21@example.com','+49(0)6266682987','Mali','42184858','Trogir'),(389,'Marica','Žugec',NULL,'elisabetladeck@example.org','033 713 273','Tunis','42184858','Calau'),(390,'Ignaz','Schottin',NULL,'zoravukman@example.com','+49(0)3908408968','Luxemburg','42184858','Schweinfurt'),(391,'Stavros','Paffrath',NULL,'sanjavuk@example.org','091 8238 691','Französisch-Guayana','42184858','Eisenberg'),(392,'Hans-Jochen','Mihelčić',NULL,'lidijazupanic@example.com','+49(0)8298 460606','Paraguay','42184858','Kutjevo'),(393,'Mladen','Horak',NULL,'stolledward@example.net','+49(0)1283436710','Schweiz','42184858','Ludwigslust'),(394,'Milka','Marasović',NULL,'kelecicjele@example.net','048 786 972','Španjolska','42184858','Rovinj'),(395,'Lana','Cvetković',NULL,'nikolinamatesa@example.com','053 585 263','Tanzanija','42184858','Miltenberg'),(396,'Ante','Dussen van',NULL,'anicichana@example.com','022 107 116','Namibia','42184858','Neu-Ulm'),(397,'Ivica','Brezjan',NULL,'henschelbayram@example.net','040 065 083','Kiribati','42184858','Worbis'),(398,'Jana','Šalić',NULL,'alwinekitzmann@example.org','033 515 338','Kasachstan','42184858','Lepoglava'),(399,'Susana','Kusch',NULL,'mzorbach@example.net','097 9453 517','Obala Slonovače','42184858','Čakovec'),(400,'Mira','Maloča',NULL,'diedrich84@example.net','00866 748653','Kuba','42184858','Hersbruck'),(401,'Joana','Seip',NULL,'nina58@example.com','(06142) 934616','Ägypten','42184858','Kastav'),(402,'Anton','Urlić',NULL,'ymilas@example.net','049 781 728','Kuba','42184858','Bad Liebenwerda'),(403,'Jakov','Siering',NULL,'genovevamangold@example.org','098 2884 905','Puerto Rico','42184858','Lipik'),(404,'Sandra','Vučetić',NULL,'tomislav26@example.org','(02074) 60100','Japan','42184858','Garešnica'),(405,'Katherina','Jäntsch',NULL,'nhornig@example.com','022 364 393','Kaimaninseln','42184858','Rathenow'),(406,'Guntram','Šokčević',NULL,'seideleditha@example.org','097 3422 975','Tajvan','42184858','Slavonski Brod');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `shipping_address_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_cart_id` (`cart_id`),
  KEY `fk_customer_order_customer` (`customer_id`),
  KEY `fk_customer_order_warehouse` (`warehouse_id`),
  KEY `fk_customer_order_shipping_address` (`shipping_address_id`),
  CONSTRAINT `fk_customer_order_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `fk_customer_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_customer_order_shipping_address` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`id`),
  CONSTRAINT `fk_customer_order_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (4,1,2,2,'2024-05-05 12:03:42','PROCESSING',1),(5,2,2,2,'2024-05-11 00:31:02','PROCESSING',11),(6,3,3,4,'2024-05-11 00:31:02','PROCESSING',10),(7,4,4,5,'2024-05-11 00:31:02','PROCESSING',9),(8,5,5,6,'2024-05-11 00:31:02','SHIPPED',2),(9,6,6,7,'2024-05-11 00:31:02','PROCESSING',11),(10,7,2,2,'2024-05-11 00:33:01','PROCESSING',12),(11,8,3,4,'2024-05-11 00:33:01','PROCESSING',12),(12,9,4,5,'2024-05-11 00:33:01','PROCESSING',10),(13,10,5,6,'2024-05-11 00:33:01','PROCESSING',3),(14,11,6,7,'2024-05-11 00:33:01','PROCESSING',12);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_status_and_warehouse_id` BEFORE INSERT ON `customer_order` FOR EACH ROW begin
	set new.status = 'PROCESSING';
	set new.warehouse_id = (SELECT id FROM warehouse ORDER BY RAND() LIMIT 1);
	set new.order_date = NOW();
	set new.shipping_address_id = (SELECT shipping_address_id FROM customer WHERE id = NEW.customer_id);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `customer_order_status_shipped`
--

DROP TABLE IF EXISTS `customer_order_status_shipped`;
/*!50001 DROP VIEW IF EXISTS `customer_order_status_shipped`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order_status_shipped` AS SELECT 
 1 AS `id`,
 1 AS `order_date`,
 1 AS `status`,
 1 AS `warehouse_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_order_view`
--

DROP TABLE IF EXISTS `customer_order_view`;
/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order_view` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `order_date`,
 1 AS `status`,
 1 AS `address`,
 1 AS `warehouse_name`,
 1 AS `warehouse_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!50001 DROP VIEW IF EXISTS `customer_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_orders` AS SELECT 
 1 AS `order_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `order_date`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_to_shipping_address`
--

DROP TABLE IF EXISTS `customer_to_shipping_address`;
/*!50001 DROP VIEW IF EXISTS `customer_to_shipping_address`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_to_shipping_address` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `phone`,
 1 AS `country`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customers_from_croatia`
--

DROP TABLE IF EXISTS `customers_from_croatia`;
/*!50001 DROP VIEW IF EXISTS `customers_from_croatia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customers_from_croatia` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `processed_order_count_by_warehouse`
--

DROP TABLE IF EXISTS `processed_order_count_by_warehouse`;
/*!50001 DROP VIEW IF EXISTS `processed_order_count_by_warehouse`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `processed_order_count_by_warehouse` AS SELECT 
 1 AS `warehouse_id`,
 1 AS `warehouse_name`,
 1 AS `total_orders_processed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'Product Name','Product Description',1,'Product Code'),(33,'Apple iPhone 13','Apple iPhone 13 with 128GB Storage',1,'P1'),(34,'Samsung Galaxy S21','Samsung Galaxy S21 with 128GB Storage',1,'P2'),(35,'Dell XPS 15','Dell XPS 15 Laptop with Intel i7',2,'P3'),(36,'MacBook Pro','Apple MacBook Pro with M1 Chip',2,'P4'),(37,'Sony WH-1000XM4','Sony WH-1000XM4 Wireless Noise-Cancelling Headphones',3,'P5'),(38,'Bose QuietComfort 35 II','Bose QuietComfort 35 II Wireless Bluetooth Headphones',3,'P6'),(39,'Instant Pot Duo','Instant Pot Duo 7-in-1 Electric Pressure Cooker',4,'P7'),(40,'Ninja Professional Countertop Blender','Ninja Professional Countertop Blender with 1100-Watt Base',4,'P8'),(41,'Kindle Paperwhite','Kindle Paperwhite – Now Waterproof with 2x the Storage',5,'P9'),(42,'Fire TV Stick 4K','Fire TV Stick 4K streaming device with Alexa Voice Remote',5,'P10'),(43,'PlayStation 5 Console','PlayStation 5 Console',6,'P11'),(44,'Xbox Series X','Xbox Series X',6,'P12'),(45,'LEGO Star Wars: The Mandalorian The Razor Crest','LEGO Star Wars: The Mandalorian The Razor Crest Building Kit',7,'P13'),(46,'Monopoly Classic Game','Monopoly Classic Game',7,'P14'),(47,'Fitbit Charge 4','Fitbit Charge 4 Fitness and Activity Tracker',8,'P15'),(48,'Garmin Forerunner 245','Garmin Forerunner 245, GPS Running Smartwatch',8,'P16'),(49,'The Alchemist','The Alchemist, Paperback – Deckle Edge',9,'P17'),(50,'Becoming','Becoming by Michelle Obama, Hardcover',9,'P18'),(51,'CeraVe Moisturizing Cream','CeraVe Moisturizing Cream for Normal to Dry Skin',10,'P19'),(52,'Neutrogena Hydro Boost Hyaluronic Acid Hydrating Water Gel','Neutrogena Hydro Boost Hyaluronic Acid Hydrating Water Gel Daily Face Moisturizer',10,'P20'),(53,'Tide PODS Laundry Detergent Liquid Pacs','Tide PODS Laundry Detergent Liquid Pacs, Clean Breeze Scent',11,'P21'),(54,'Bounty Quick-Size Paper Towels','Bounty Quick-Size Paper Towels, White, 12 Family Rolls',11,'P22'),(55,'Philips Sonicare ProtectiveClean 6100 Rechargeable Electric Toothbrush','Philips Sonicare ProtectiveClean 6100 Rechargeable Electric Toothbrush, White',12,'P23'),(56,'Oral-B Pro 1000 CrossAction Electric Toothbrush','Oral-B Pro 1000 CrossAction Electric Toothbrush, Black',12,'P24'),(57,'Fujifilm X-T4 Mirrorless Camera','Fujifilm X-T4 Mirrorless Camera Body - Black',13,'P25'),(58,'Canon EOS R6 Full-Frame Mirrorless Camera','Canon EOS R6 Full-Frame Mirrorless Camera with 4K Video',13,'P26'),(59,'KitchenAid Artisan Series 5-Qt. Stand Mixer','KitchenAid Artisan Series 5-Qt. Stand Mixer with Pouring Shield - Empire Red',14,'P27'),(60,'Cuisinart DFP-14BCNY 14-Cup Food Processor','Cuisinart DFP-14BCNY 14-Cup Food Processor, Brushed Stainless Steel - Silver',14,'P28'),(61,'Philips Hue White and Color Ambiance LED Smart Light Bulb Starter Kit','Philips Hue White and Color Ambiance LED Smart Light Bulb Starter Kit',15,'P29'),(62,'Nest Learning Thermostat','Nest Learning Thermostat, 3rd Gen, Smart Thermostat, Stainless Steel',15,'P30'),(63,'LG OLED TV','LG OLED TV with AI ThinQ',16,'P31'),(64,'Samsung QLED TV','Samsung QLED 4K UHD Smart TV',16,'P32'),(65,'Sony Bravia TV','Sony Bravia OLED 4K UHD Smart TV',16,'P33'),(66,'Vizio P-Series TV','Vizio P-Series Quantum X 4K HDR Smart TV',16,'P34'),(67,'TCL 6-Series TV','TCL 6-Series 4K UHD Dolby Vision HDR QLED Roku Smart TV',16,'P35');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_to_product_trait`
--

DROP TABLE IF EXISTS `product_to_product_trait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_to_product_trait` (
  `product_id` int NOT NULL,
  `product_trait_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`product_trait_id`),
  KEY `product_trait_id` (`product_trait_id`),
  CONSTRAINT `product_to_product_trait_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_to_product_trait_ibfk_2` FOREIGN KEY (`product_trait_id`) REFERENCES `product_trait` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_to_product_trait`
--

LOCK TABLES `product_to_product_trait` WRITE;
/*!40000 ALTER TABLE `product_to_product_trait` DISABLE KEYS */;
INSERT INTO `product_to_product_trait` VALUES (2,1);
/*!40000 ALTER TABLE `product_to_product_trait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_trait`
--

DROP TABLE IF EXISTS `product_trait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_trait` (
  `id` int NOT NULL AUTO_INCREMENT,
  `weight_kg` double DEFAULT NULL,
  `dimensions_mm` varchar(255) DEFAULT NULL,
  `consumer_product` tinyint(1) DEFAULT NULL,
  `fragile` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_trait`
--

LOCK TABLES `product_trait` WRITE;
/*!40000 ALTER TABLE `product_trait` DISABLE KEYS */;
INSERT INTO `product_trait` VALUES (1,1.5,'150x100x50',1,0),(2,2.3,'200x150x100',1,1),(3,0.5,'100x100x100',0,0),(4,3,'300x200x150',1,0),(5,1.2,'150x150x150',0,1),(6,2.5,'250x200x150',1,0),(7,0.3,'30x30x30',0,1),(8,4,'400x300x200',1,1),(9,0.8,'80x80x80',0,0),(10,1.7,'170x130x90',1,1),(11,2.9,'290x210x140',0,0),(12,0.6,'60x60x60',1,1),(13,3.5,'350x250x200',0,1),(14,1,'100x100x100',1,0),(15,2,'200x150x100',0,1),(16,0.4,'40x40x40',1,1),(17,3.2,'320x230x150',0,0),(18,1.6,'160x120x80',1,1),(19,2.8,'280x200x130',0,1),(20,0.7,'70x70x70',1,0),(21,3.7,'370x270x180',0,1),(22,1.3,'130x100x70',1,1),(23,2.6,'260x190x120',0,0),(24,0.2,'20x20x20',1,1),(25,3.4,'340x240x160',0,1),(26,1.8,'180x140x90',1,0),(27,2.7,'270x200x130',0,1),(28,0.9,'90x90x90',1,1),(29,3.6,'360x260x170',0,0),(30,1.4,'140x110x70',1,1);
/*!40000 ALTER TABLE `product_trait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_shipping_address` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,'123 Main St','New York','NY','10001','USA'),(2,'123 Main St','New York','NY','10001','USA'),(3,'123 Main St','New York','NY','10001','USA'),(4,'123 Main St','New York','NY','10001','USA'),(5,'Avenue Street 1','Sofia','Sofia','437184','Bulgaria'),(6,'Cooney Village 32','Zagreb','Zagreb','10000','Croatia'),(7,'City Street 51','Maribor','Maribor','10321','Slovenia'),(8,'988 Watkins Well\nAngelahaven, PA 90821','North Rhonda','Oklahoma','75799','Aruba'),(9,'69295 Gibbs Divide Suite 938\nEast Jason, OH 79045','Port Ann','South Carolina','14226','Mauritius'),(10,'4886 Spence Trail Apt. 970\nPort Marcburgh, DC 96621','Melaniestad','Minnesota','38778','Mongolia'),(11,'2165 Mercedes Rapids Suite 292\nEast Robertview, NY 42983','Harriston','Louisiana','86223','Chile'),(12,'2384 Pacheco Lane\nTaylorfurt, AL 76470','Port Tracibury','Utah','03577','San Marino'),(13,'USS Bridges\nFPO AA 97227','East Jason','Washington','83467','Eritrea'),(14,'6024 Carter Springs Apt. 234\nElizabethfort, MT 72484','East Steven','Alaska','24917','Gabon'),(15,'717 Mary Pines\nMitchellland, RI 06971','Alexanderside','North Dakota','13006','Central African Republic'),(16,'78768 Michelle Meadows\nSouth Christina, AK 39494','Lake Amychester','Michigan','35612','Sierra Leone'),(17,'7232 William Islands\nBrianburgh, TX 92289','Lake Kelly','Rhode Island','80763','Guinea'),(18,'7883 Joseph Springs Apt. 741\nDoyletown, MD 59305','Lake Valerietown','Delaware','48780','Yemen'),(19,'USNV Miller\nFPO AE 12093','Parkershire','Massachusetts','23749','Azerbaijan'),(20,'43337 Adams Path Apt. 895\nPort Jacqueline, MO 14363','Jeremyburgh','West Virginia','07409','Libyan Arab Jamahiriya'),(21,'2011 Kenneth Isle\nSouth Jamesville, MH 85165','Thomasfort','Colorado','77503','Honduras'),(22,'29460 Lisa Skyway\nPort Courtneyburgh, PA 97663','Port David','Alabama','01749','Cocos (Keeling) Islands'),(23,'91183 Fischer Forges\nShellyberg, MA 03199','Parkermouth','Wisconsin','73173','Malta'),(24,'5632 Martinez Wells Apt. 487\nEast Natalieport, VI 59084','Mayerland','Oklahoma','04653','Timor-Leste'),(25,'215 Duncan Summit\nLake Richardport, RI 28498','Anneburgh','Alabama','14775','Djibouti'),(26,'1148 Sierra Trail\nWest Nathan, CA 36672','East Christinaland','South Dakota','90121','Guinea-Bissau'),(27,'4319 Alvarez Burgs\nLake William, WY 75000','Adrianberg','West Virginia','16163','Antarctica (the territory South of 60 deg S)'),(28,'9594 Duran Lodge\nFernandezstad, AK 66947','Port Dustinmouth','Montana','96384','Ireland'),(29,'91391 Williams Creek Apt. 093\nColemanport, PA 89500','Garciaport','North Carolina','51588','Uruguay'),(30,'50629 Jose Landing Apt. 612\nNew Carlos, PW 82936','Lake Lindsay','Colorado','68016','Grenada'),(31,'58740 Dwayne Meadow Apt. 955\nAdamfort, HI 74710','Lake Stephanie','South Dakota','26364','British Indian Ocean Territory (Chagos Archipelago)'),(32,'630 Kelly Hollow Apt. 295\nIanview, AL 24730','Bradleytown','Illinois','97849','Swaziland'),(33,'Unit 0252 Box 9885\nDPO AA 91722','East Cole','Tennessee','13793','Qatar'),(34,'722 Stephenson Orchard Suite 373\nLake Kara, IL 23346','New Christopherfort','Arizona','65803','Slovenia'),(35,'Unit 2245 Box 4355\nDPO AA 74515','New Richardport','Virginia','97639','Tanzania'),(36,'62607 Nolan Viaduct\nTrevinoborough, NM 61800','West Allisonfurt','Ohio','05147','Antigua and Barbuda'),(37,'055 Dennis Streets Suite 755\nGonzalezfort, OH 60136','New Andrewland','Florida','67215','Egypt'),(38,'1204 Allison Radial Suite 432\nTurnerton, MT 86671','Robinborough','Florida','40475','Ireland'),(39,'USCGC Juarez\nFPO AA 86491','New Teresaville','Virginia','40323','Ghana'),(40,'2684 Guerra Harbors\nSweeneytown, MT 75201','North Dorothybury','Maryland','70097','Cyprus'),(41,'74271 Melinda Street Suite 192\nPort Lauren, AS 24824','Kiddberg','Missouri','87470','Antigua and Barbuda'),(42,'PSC 4769, Box 4949\nAPO AA 21736','Cohenshire','Nebraska','61356','Sweden'),(43,'93196 Kevin Greens\nSouth Mollybury, OH 05675','Matthewfurt','Alabama','99310','Niger'),(44,'807 Graham Fords\nEast Taylor, IA 15528','North Jessicafurt','Iowa','99722','Malta'),(45,'00121 Jones Wall\nAlyssachester, TX 35660','Simsborough','New Hampshire','34078','Tonga'),(46,'560 Washington Courts Suite 837\nJoshuachester, MT 15903','South Jennaview','New Mexico','50286','Singapore'),(47,'Unit 4511 Box 1408\nDPO AA 18116','Alexanderfort','Utah','38091','Kenya'),(48,'PSC 1104, Box 1250\nAPO AE 24730','North Tammy','Massachusetts','80863','Tunisia'),(49,'Unit 8803 Box 3480\nDPO AE 76304','Wolfebury','Kansas','34129','Bahamas'),(50,'5992 Daniel Port Suite 232\nKatiefurt, NJ 21782','Brandonmouth','Oregon','04308','Malta'),(51,'33208 Paul Creek\nNorth Markstad, AR 66524','Lisahaven','New York','49983','Saint Lucia'),(52,'649 Anderson Court Suite 302\nMaryhaven, MN 01731','Christyville','Utah','59901','Micronesia'),(53,'7655 Jennifer Underpass\nNew Robertfort, MI 73947','Lake John','Wyoming','41978','United States Minor Outlying Islands'),(54,'66159 Megan Hollow Apt. 861\nPatriciamouth, NY 88838','Mclaughlinville','Maine','55875','Venezuela'),(55,'016 April Courts Apt. 216\nMcguireville, HI 48831','Kelseyborough','West Virginia','66997','Liberia'),(56,'PSC 5669, Box 3395\nAPO AE 99606','Anthonyside','Wyoming','26554','Panama'),(57,'539 Bradley Turnpike Apt. 708\nAngelhaven, NY 40542','Lisafurt','Georgia','72859','El Salvador'),(58,'Jurišićeva 57\n65871 Duga Resa','Valpovo','Šibensko-kninska','90976','Finska'),(59,'Kraljevečki odvojak 83\n24631 Senj','Klanjec','Krapinsko-zagorska','90976','Sv. Vincent i Grenadini'),(60,'Goljak 7\n20305 Garešnica','Metković','Thüringen','90976','Slowakei'),(61,'Mlinarska 9c\n16622 Supetar','Duga Resa','Sisačko-moslavačka','90976','Malawi'),(62,'Srebrnjak 418\n22113 Umag','Soest','Rheinland-Pfalz','90976','Sv. Vincent i Grenadini'),(63,'Girschnerweg 910\n08283 Burgdorf','Dinslaken','Dubrovačko-neretvanska','90976','Nepal'),(64,'Svibovac 28\n25743 Sinj','Pag','Baden-Württemberg','90976','Kongo'),(65,'Mlinske 4a\n95730 Belišće','Ravensburg','Bremen','90976','Ungarn'),(66,'Heydrichring 0/9\n10514 Ilmenau','Naila','Sisačko-moslavačka','90976','Šri Lanka'),(67,'Krokerstraße 4/7\n45340 Bad Freienwalde','Hofgeismar','Saarland','90976','Sv. Vincent i Grenadini'),(68,'Zamenhofova 1a\n29285 Makarska','Augsburg','Zadarska','90976','Mikronesien'),(69,'Löwerstraße 270\n60420 Oranienburg','Bakar','Virovitičko-podravska','90976','Somalia'),(70,'Herrmanngasse 545\n16301 Gotha','Split','Saarland','90976','Mauricijus'),(71,'Orlovac 9a\n63228 Bjelovar','Krk','Krapinsko-zagorska','90976','Sveti Martin'),(72,'Stephan-Mitschke-Ring 6\n17066 Dachau','Ingolstadt','Primorsko-goranska','90976','Kamerun'),(73,'Hesseallee 6\n72942 Teterow','Buje','Bayern','90976','Tokelau'),(74,'Schmiedtring 5/1\n45034 Monschau','Đurđevac','Varaždinska','90976','Nordmazedonien'),(75,'Kabusweg 1\n03155 Ueckermünde','Trogir','Hamburg','90976','Antarktis'),(76,'Mihaljevac 8a\n76076 Oroslavje','Nauen','Varaždinska','90976','Dänemark'),(77,'Täscheweg 7\n22919 Guben','Samobor','Niedersachsen','90976','Curacao'),(78,'Šilobodov put 5a\n38164 Velika Gorica','Sveti Ivan Zelina','Bremen','90976','Aserbaidschan'),(79,'Zamenhofova 9c\n96726 Delnice','Witzenhausen','Zagrebačka','90976','Salamunovi Otoci'),(80,'Dvoranski prečac 2b\n48625 Čakovec','Bad Liebenwerda','Saarland','90976','Nauru'),(81,'Martinstr. 4\n96630 Lichtenfels','Melsungen','Zadarska','90976','Otok Heard i Otoci McDonald'),(82,'Male 2a/3\n89655 Đurđevac','Nova Gradiška','Dubrovačko-neretvanska','90976','Kambodscha'),(83,'Justine-Plath-Platz 065\n28348 Naila','Lüdinghausen','Niedersachsen','90976','Gambia'),(84,'H.-Dieter-Stadelmann-Weg 06\n58998 Emmendingen','Finsterwalde','Berlin','90976','Martinique'),(85,'Saban-Rogner-Straße 766\n10410 Ahaus','München','Krapinsko-zagorska','90976','Kuba'),(86,'Dvoranski prečac 3b\n70471 Bakar','Crikvenica','Istarska','90976','Mali'),(87,'Perivoj biskupa Stjepana II. 3b\n52191 Ivanec','Vodnjan','Dubrovačko-neretvanska','90976','Wallis und Futuna'),(88,'Gradec 1a\n59850 Senj','Amberg','Istarska','90976','Eritrea'),(89,'Etzoldallee 34\n98652 Bad Mergentheim','Cuxhaven','Saarland','90976','Južni Sudan'),(90,'Lissi-Hertrampf-Weg 0/3\n38876 Saulgau','Ogulin','Šibensko-kninska','90976','Gambija'),(91,'Višnjičke 6a\n84906 Dugo Selo','Mühldorf am Inn','Sachsen-Anhalt','90976','Zapadna Sahara'),(92,'Jagodnjak 202\n30781 Jastrebarsko','Đakovo','Sachsen-Anhalt','90976','Bangladesch'),(93,'Strossmayerovo šetalište 7a\n64281 Novi Marof','Büsingen am Hochrhein','Saarland','90976','Vereinigtes Königreich'),(94,'Nadeschda-Fechner-Platz 7/5\n52228 Bautzen','Vrlika','Virovitičko-podravska','90976','Deutschland'),(95,'Zamenhofove 0a/2\n51728 Velika Gorica','Eberswalde','Primorsko-goranska','90976','Vietnam'),(96,'Alf-Benthin-Straße 6\n28232 Lüdenscheid','Oroslavje','Ličko-senjska','90976','Honduras'),(97,'Hans-Christian-Rudolph-Weg 47\n85945 Wittstock','Miesbach','Požeško-slavonska','90976','Swasiland'),(98,'Hansjoachim-Riehl-Ring 0\n45679 Eichstätt','Jastrebarsko','Brodsko-posavska','90976','Serbien'),(99,'Paffrathplatz 1/9\n60886 Rehau','Daruvar','Bayern','90976','Demokratische Volksrepublik Korea'),(100,'Kaptol 3b/6\n25407 Kutjevo','Iserlohn','Krapinsko-zagorska','90976','Tuvalu'),(101,'Franca-Trub-Gasse 1/7\n21196 Ansbach','Hrvatska Kostajnica','Požeško-slavonska','90976','Spanien'),(102,'Medveščak 3b/4\n98765 Čabar','Amberg','Brodsko-posavska','90976','Libyen'),(103,'Zamenhofove 799\n20282 Rovinj','Varaždin','Niedersachsen','90976','Maršalovi Otoci'),(104,'Kamenita 28\n64251 Buje','Bremervörde','Sachsen-Anhalt','90976','Amerikanisch-Ozeanien'),(105,'Eberthgasse 7/2\n89536 Wernigerode','Tecklenburg','Sachsen','90976','Gambia'),(106,'Mihaljevac 4a/1\n11931 Jastrebarsko','Prenzlau','Niedersachsen','90976','Kiribati'),(107,'Bučarova 2c\n82043 Klanjec','Vechta','Ličko-senjska','90976','Frankreich');
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_product_inventory`
--

DROP TABLE IF EXISTS `total_product_inventory`;
/*!50001 DROP VIEW IF EXISTS `total_product_inventory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_product_inventory` AS SELECT 
 1 AS `product_id`,
 1 AS `total_quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `totalCapacity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Warehouse Name','Warehouse Address','Warehouse City','Warehouse State','Warehouse Zip','Warehouse Country','Warehouse Phone','Warehouse Email',100),(2,'UK_London','123 Main St','London','England','E1 6AN','UK','123-456-7890','warehouse1@example.com',1000),(3,'France_Paris','456 Market St','Paris','Ile-de-France','75001','France','234-567-8901','warehouse2@example.com',2000),(4,'Germany_Berlin','789 Broadway','Berlin','Berlin','10115','Germany','345-678-9012','warehouse3@example.com',3000),(5,'Spain_Madrid','321 State St','Madrid','Madrid','28001','Spain','456-789-0123','warehouse4@example.com',4000),(6,'Italy_Rome','654 Elm St','Rome','Lazio','00118','Italy','567-890-1234','warehouse5@example.com',5000),(7,'Netherlands_Amsterdam','987 Pine St','Amsterdam','North Holland','1011','Netherlands','678-901-2345','warehouse6@example.com',6000),(8,'Belgium_Brussels','147 Oak St','Brussels','Brussels','1000','Belgium','789-012-3456','warehouse7@example.com',7000),(9,'Sweden_Stockholm','258 Maple St','Stockholm','Stockholm','111 21','Sweden','890-123-4567','warehouse8@example.com',8000),(10,'Poland_Warsaw','369 Cedar St','Warsaw','Masovian','00-001','Poland','901-234-5678','warehouse9@example.com',9000),(11,'Portugal_Lisbon','741 Spruce St','Lisbon','Lisbon','1100-061','Portugal','012-345-6789','warehouse10@example.com',10000),(12,'Croatia_Zagreb','Radnicka 25','Zagreb','Croatia','10000','Croatia','123-456-7899','warehouse11@example.com',2000);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `warehouse_article_count`
--

DROP TABLE IF EXISTS `warehouse_article_count`;
/*!50001 DROP VIEW IF EXISTS `warehouse_article_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `warehouse_article_count` AS SELECT 
 1 AS `warehouse_id`,
 1 AS `total_articles`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `warehouse_inventory`
--

DROP TABLE IF EXISTS `warehouse_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_inventory` (
  `warehouse_id` int NOT NULL,
  `article_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`,`article_id`),
  KEY `article_id` (`article_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `warehouse_inventory_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`),
  CONSTRAINT `warehouse_inventory_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `warehouse_inventory_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_inventory`
--

LOCK TABLES `warehouse_inventory` WRITE;
/*!40000 ALTER TABLE `warehouse_inventory` DISABLE KEYS */;
INSERT INTO `warehouse_inventory` VALUES (1,23,2),(1,24,2),(1,25,2),(1,26,2),(1,27,2),(1,28,2),(1,29,2),(1,30,2),(1,31,2),(1,32,2),(1,33,2),(1,34,2),(1,35,2),(1,36,2),(1,37,2),(1,38,2),(1,43,2),(1,48,2),(1,53,2),(1,58,2),(1,63,2),(1,68,2),(1,73,2),(1,78,2),(1,83,2),(1,88,2),(1,93,2),(1,98,2),(1,103,2),(1,108,2),(1,113,2),(1,124,2),(1,135,2),(1,146,2),(1,157,2),(1,168,2),(1,179,2),(1,190,2),(1,201,2),(1,212,2),(1,223,2),(1,234,2),(1,245,2),(1,256,2),(1,267,2),(2,39,2),(2,44,2),(2,49,2),(2,54,2),(2,59,2),(2,64,2),(2,69,2),(2,74,2),(2,79,2),(2,84,2),(2,89,2),(2,94,2),(2,99,2),(2,104,2),(2,109,2),(2,114,2),(2,125,2),(2,136,2),(2,147,2),(2,158,2),(2,169,2),(2,180,2),(2,191,2),(2,202,2),(2,213,2),(2,224,2),(2,235,2),(2,246,2),(2,257,2),(2,268,2),(3,115,2),(3,126,2),(3,137,2),(3,148,2),(3,159,2),(3,170,2),(3,181,2),(3,192,2),(3,203,2),(3,214,2),(3,225,2),(3,236,2),(3,247,2),(3,258,2),(3,269,2),(4,40,2),(4,45,2),(4,50,2),(4,55,2),(4,60,2),(4,65,2),(4,70,2),(4,75,2),(4,80,2),(4,85,2),(4,90,2),(4,95,2),(4,100,2),(4,105,2),(4,110,2),(4,116,2),(4,127,2),(4,138,2),(4,149,2),(4,160,2),(4,171,2),(4,182,2),(4,193,2),(4,204,2),(4,215,2),(4,226,2),(4,237,2),(4,248,2),(4,259,2),(4,270,2),(5,117,2),(5,128,2),(5,139,2),(5,150,2),(5,161,2),(5,172,2),(5,183,2),(5,194,2),(5,205,2),(5,216,2),(5,227,2),(5,238,2),(5,249,2),(5,260,2),(5,271,2),(7,41,2),(7,46,2),(7,51,2),(7,56,2),(7,61,2),(7,66,2),(7,71,2),(7,76,2),(7,81,2),(7,86,2),(7,91,2),(7,96,2),(7,101,2),(7,106,2),(7,111,2),(7,118,2),(7,129,2),(7,140,2),(7,151,2),(7,162,2),(7,173,2),(7,184,2),(7,195,2),(7,206,2),(7,217,2),(7,228,2),(7,239,2),(7,250,2),(7,261,2),(7,272,2),(8,42,2),(8,47,2),(8,52,2),(8,57,2),(8,62,2),(8,67,2),(8,72,2),(8,77,2),(8,82,2),(8,87,2),(8,92,2),(8,97,2),(8,102,2),(8,107,2),(8,112,2),(8,119,2),(8,130,2),(8,141,2),(8,152,2),(8,163,2),(8,174,2),(8,185,2),(8,196,2),(8,207,2),(8,218,2),(8,229,2),(8,240,2),(8,251,2),(8,262,2),(8,273,2),(9,120,2),(9,131,2),(9,142,2),(9,153,2),(9,164,2),(9,175,2),(9,186,2),(9,197,2),(9,208,2),(9,219,2),(9,230,2),(9,241,2),(9,252,2),(9,263,2),(9,274,2),(10,121,2),(10,132,2),(10,143,2),(10,154,2),(10,165,2),(10,176,2),(10,187,2),(10,198,2),(10,209,2),(10,220,2),(10,231,2),(10,242,2),(10,253,2),(10,264,2),(10,275,2),(11,122,2),(11,133,2),(11,144,2),(11,155,2),(11,166,2),(11,177,2),(11,188,2),(11,199,2),(11,210,2),(11,221,2),(11,232,2),(11,243,2),(11,254,2),(11,265,2),(11,276,2),(12,123,2),(12,134,2),(12,145,2),(12,156,2),(12,167,2),(12,178,2),(12,189,2),(12,200,2),(12,211,2),(12,222,2),(12,233,2),(12,244,2),(12,255,2),(12,266,2),(12,277,2),(1,279,33),(1,290,33),(1,301,33),(1,312,33),(1,323,33),(1,334,33),(1,345,33),(1,356,33),(1,367,33),(1,378,33),(1,389,33),(1,400,33),(1,411,33),(1,422,33),(1,433,33),(2,280,33),(2,291,33),(2,302,33),(2,313,33),(2,324,33),(2,335,33),(2,346,33),(2,357,33),(2,368,33),(2,379,33),(2,390,33),(2,401,33),(2,412,33),(2,423,33),(2,434,33),(3,281,33),(3,292,33),(3,303,33),(3,314,33),(3,325,33),(3,336,33),(3,347,33),(3,358,33),(3,369,33),(3,380,33),(3,391,33),(3,402,33),(3,413,33),(3,424,33),(3,435,33),(4,282,33),(4,293,33),(4,304,33),(4,315,33),(4,326,33),(4,337,33),(4,348,33),(4,359,33),(4,370,33),(4,381,33),(4,392,33),(4,403,33),(4,414,33),(4,425,33),(4,436,33),(5,283,33),(5,294,33),(5,305,33),(5,316,33),(5,327,33),(5,338,33),(5,349,33),(5,360,33),(5,371,33),(5,382,33),(5,393,33),(5,404,33),(5,415,33),(5,426,33),(5,437,33),(7,284,33),(7,295,33),(7,306,33),(7,317,33),(7,328,33),(7,339,33),(7,350,33),(7,361,33),(7,372,33),(7,383,33),(7,394,33),(7,405,33),(7,416,33),(7,427,33),(7,438,33),(8,285,33),(8,296,33),(8,307,33),(8,318,33),(8,329,33),(8,340,33),(8,351,33),(8,362,33),(8,373,33),(8,384,33),(8,395,33),(8,406,33),(8,417,33),(8,428,33),(8,439,33),(9,286,33),(9,297,33),(9,308,33),(9,319,33),(9,330,33),(9,341,33),(9,352,33),(9,363,33),(9,374,33),(9,385,33),(9,396,33),(9,407,33),(9,418,33),(9,429,33),(9,440,33),(10,287,33),(10,298,33),(10,309,33),(10,320,33),(10,331,33),(10,342,33),(10,353,33),(10,364,33),(10,375,33),(10,386,33),(10,397,33),(10,408,33),(10,419,33),(10,430,33),(10,441,33),(11,288,33),(11,299,33),(11,310,33),(11,321,33),(11,332,33),(11,343,33),(11,354,33),(11,365,33),(11,376,33),(11,387,33),(11,398,33),(11,409,33),(11,420,33),(11,431,33),(11,442,33),(12,289,33),(12,300,33),(12,311,33),(12,322,33),(12,333,33),(12,344,33),(12,355,33),(12,366,33),(12,377,33),(12,388,33),(12,399,33),(12,410,33),(12,421,33),(12,432,33),(12,443,33);
/*!40000 ALTER TABLE `warehouse_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cart_details`
--

/*!50001 DROP VIEW IF EXISTS `cart_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_details` AS select `c`.`id` AS `cart_id`,`a`.`name` AS `article_name`,`a`.`code` AS `article_code`,`a`.`variant` AS `article_variant` from ((`cart_item` `ci` join `article` `a` on((`ci`.`article_id` = `a`.`id`))) join `cart` `c` on((`ci`.`cart_id` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cart_value`
--

/*!50001 DROP VIEW IF EXISTS `cart_value`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_value` AS select `ci`.`cart_id` AS `cart_id`,sum(`a`.`price`) AS `total_value` from (`cart_item` `ci` join `article` `a` on((`ci`.`article_id` = `a`.`id`))) group by `ci`.`cart_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_order_status_shipped`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_status_shipped`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_status_shipped` AS select `customer_order`.`id` AS `id`,`customer_order`.`order_date` AS `order_date`,`customer_order`.`status` AS `status`,`customer_order`.`warehouse_id` AS `warehouse_id` from `customer_order` where (`customer_order`.`status` = 'SHIPPED') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_order_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_view` AS select `c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`o`.`order_date` AS `order_date`,`o`.`status` AS `status`,`s`.`address` AS `address`,`w`.`name` AS `warehouse_name`,`w`.`address` AS `warehouse_address` from (((`customer_order` `o` join `customer` `c` on((`o`.`customer_id` = `c`.`id`))) join `shipping_address` `s` on((`o`.`shipping_address_id` = `s`.`id`))) join `warehouse` `w` on((`o`.`warehouse_id` = `w`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_orders`
--

/*!50001 DROP VIEW IF EXISTS `customer_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_orders` AS select `co`.`id` AS `order_id`,`cu`.`first_name` AS `first_name`,`cu`.`last_name` AS `last_name`,`co`.`order_date` AS `order_date`,`co`.`status` AS `status` from (`customer_order` `co` join `customer` `cu` on((`co`.`customer_id` = `cu`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_to_shipping_address`
--

/*!50001 DROP VIEW IF EXISTS `customer_to_shipping_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_to_shipping_address` AS select `c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`c`.`phone` AS `phone`,`c`.`country` AS `country`,`s`.`address` AS `address` from (`customer` `c` join `shipping_address` `s` on((`c`.`shipping_address_id` = `s`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customers_from_croatia`
--

/*!50001 DROP VIEW IF EXISTS `customers_from_croatia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customers_from_croatia` AS select `customer`.`first_name` AS `first_name`,`customer`.`last_name` AS `last_name` from `customer` where (`customer`.`country` = 'Croatia') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `processed_order_count_by_warehouse`
--

/*!50001 DROP VIEW IF EXISTS `processed_order_count_by_warehouse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `processed_order_count_by_warehouse` AS select `w`.`id` AS `warehouse_id`,`w`.`name` AS `warehouse_name`,count(`o`.`id`) AS `total_orders_processed` from (`warehouse` `w` left join `customer_order` `o` on((`w`.`id` = `o`.`warehouse_id`))) group by `w`.`id`,`w`.`name` order by `total_orders_processed` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_product_inventory`
--

/*!50001 DROP VIEW IF EXISTS `total_product_inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_product_inventory` AS select `warehouse_inventory`.`product_id` AS `product_id`,count(0) AS `total_quantity` from `warehouse_inventory` group by `warehouse_inventory`.`product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `warehouse_article_count`
--

/*!50001 DROP VIEW IF EXISTS `warehouse_article_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `warehouse_article_count` AS select `warehouse_inventory`.`warehouse_id` AS `warehouse_id`,count(0) AS `total_articles` from `warehouse_inventory` group by `warehouse_inventory`.`warehouse_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 21:34:23
