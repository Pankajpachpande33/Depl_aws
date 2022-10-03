-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce_project
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `address_master`
--

DROP TABLE IF EXISTS `address_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_master` (
  `address_id` bigint NOT NULL AUTO_INCREMENT,
  `address_city` varchar(255) DEFAULT NULL,
  `address_country` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  `address_zip` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FKo1cjsvwahleesh6l2l2q84kd4` (`user_id`),
  CONSTRAINT `FKo1cjsvwahleesh6l2l2q84kd4` FOREIGN KEY (`user_id`) REFERENCES `user_list` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_master`
--

LOCK TABLES `address_master` WRITE;
/*!40000 ALTER TABLE `address_master` DISABLE KEYS */;
INSERT INTO `address_master` VALUES (1,'MALKAPUR','India','Maharashtra','RAMWADI, ward no. 9, near Ram Temple, Malkapur, Buldhana',443101,1);
/*!40000 ALTER TABLE `address_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_list`
--

DROP TABLE IF EXISTS `category_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_list` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_list`
--

LOCK TABLES `category_list` WRITE;
/*!40000 ALTER TABLE `category_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `order_quantity` int DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_master_user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK9qbw0hea3hsuinv0d1e1g6iuy` (`product_id`),
  KEY `FKanowpiygkfaj467bquijeu2ra` (`user_master_user_id`),
  CONSTRAINT `FK9qbw0hea3hsuinv0d1e1g6iuy` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`product_id`),
  CONSTRAINT `FKanowpiygkfaj467bquijeu2ra` FOREIGN KEY (`user_master_user_id`) REFERENCES `user_list` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_list` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) DEFAULT NULL,
  `product_date` date DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` float DEFAULT NULL,
  `seller_master_seller_id` bigint DEFAULT NULL,
  `subcategory_id` bigint DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKt6aktrtthcxudcnmb4yr7gaiu` (`seller_master_seller_id`),
  KEY `FKb74rnuueq3k4oes3t0tyq0ewt` (`subcategory_id`),
  CONSTRAINT `FKb74rnuueq3k4oes3t0tyq0ewt` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory_list` (`subcategory_id`),
  CONSTRAINT `FKt6aktrtthcxudcnmb4yr7gaiu` FOREIGN KEY (`seller_master_seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_list`
--

LOCK TABLES `product_list` WRITE;
/*!40000 ALTER TABLE `product_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `seller_id` bigint NOT NULL AUTO_INCREMENT,
  `seller_email` varchar(255) DEFAULT NULL,
  `seller_firstname` varchar(255) DEFAULT NULL,
  `seller_lastname` varchar(255) DEFAULT NULL,
  `seller_mobile` varchar(255) DEFAULT NULL,
  `seller_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Pankajpachpande33@gmail.com','Pankaj','Pachpande','7020657514','Pankaj@1993');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory_list`
--

DROP TABLE IF EXISTS `subcategory_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory_list` (
  `subcategory_id` bigint NOT NULL AUTO_INCREMENT,
  `status` bit(1) DEFAULT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `FKrcsvcugssq790pekggh5i5vs7` (`category_id`),
  CONSTRAINT `FKrcsvcugssq790pekggh5i5vs7` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory_list`
--

LOCK TABLES `subcategory_list` WRITE;
/*!40000 ALTER TABLE `subcategory_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategory_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_list`
--

DROP TABLE IF EXISTS `user_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_list` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_mobile` varchar(255) DEFAULT NULL,
  `user_password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_list`
--

LOCK TABLES `user_list` WRITE;
/*!40000 ALTER TABLE `user_list` DISABLE KEYS */;
INSERT INTO `user_list` VALUES (1,'Pankajpachpande33@gmail.com','Pankaj','Pachpande','7020657514','Pankaj@1993');
/*!40000 ALTER TABLE `user_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03  9:17:27
