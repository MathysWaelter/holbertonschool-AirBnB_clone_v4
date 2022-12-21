-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES ('051f0a2e-ecb7-4aca-a878-9c966d5378db','2022-12-21 09:09:30','2022-12-21 09:09:30','Salon'),('1407e848-bcff-43e6-967c-bdc8dc0cf4b1','2022-12-21 09:09:37','2022-12-21 09:09:37','Playstation5'),('7fe3f785-6078-42c1-86b7-c9aa97270043','2022-12-21 09:09:26','2022-12-21 09:09:26','Breakfast'),('a741c448-ae7d-4e1d-9e38-823493fa8ec9','2022-12-21 09:09:23','2022-12-21 09:09:23','TV');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('2d4332d3-2b05-4217-9db1-813817c93310','2022-12-02 06:43:52','2022-12-02 06:43:52','0408b9e5-d8c5-4fd7-b25b-8990f9276d69','San Jose'),('38355369-66d2-4b3e-b2fd-11df4a81f233','2022-12-02 06:52:49','2022-12-02 06:52:49','9e495e8d-d932-443e-a727-b64c727b1c80','Fremont'),('40951c41-d8ed-4868-8fca-a82f07b29961','2022-12-02 06:41:46','2022-12-02 06:41:46','0408b9e5-d8c5-4fd7-b25b-8990f9276d69','San Francisco'),('a9fb63a0-8822-424f-881d-28cbd4da8612','2022-12-09 11:12:42','2022-12-09 11:12:42','9e495e8d-d932-443e-a727-b64c727b1c80','Montauban');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('03e18984-255e-40ad-abeb-5de34de17a52','2022-12-09 18:55:50','2022-12-09 18:55:50','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('08b6351f-ac74-45af-84ab-db4c94ccfb80','2022-12-09 18:06:03','2022-12-09 18:06:03','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('0d08ad69-b357-4426-bb0f-a349055e767b','2022-12-09 18:09:23','2022-12-09 18:09:23','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('26ae374e-9ef7-41a7-b9ba-6c4720f81516','2022-12-09 18:11:54','2022-12-09 18:11:54','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('3b7e0fc7-80bf-4605-9bda-aebded4c0888','2022-12-09 18:13:35','2022-12-09 18:13:35','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('5693f9f1-263d-4e50-8358-80d8ef9c9094','2022-12-09 19:11:39','2022-12-09 19:11:39','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('5c888584-610e-4eb7-b3e6-ef9a7ac1b0ef','2022-12-09 18:09:09','2022-12-09 18:09:09','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('5f520e34-20ed-4fb7-9a9b-6b0644474d85','2022-12-09 18:10:59','2022-12-09 18:10:59','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('73d5ee58-2034-4d35-8933-0d9c3f352166','2022-12-09 18:57:02','2022-12-09 18:57:02','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('77278ae7-6fff-428d-a06e-aa8916047505','2022-12-09 18:11:52','2022-12-09 18:11:52','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('7b0e3f53-fdb6-40af-88d2-0573b6238740','2022-12-09 18:12:18','2022-12-09 18:12:18','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('85ecd845-1862-46f6-91a1-b3644d6b44fb','2022-12-09 18:11:54','2022-12-09 18:11:54','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('92f932ec-10ea-428e-8ed9-79391a72e67c','2022-12-09 18:12:26','2022-12-09 18:12:26','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('ca2156ec-4567-40e3-a123-c466459c6015','2022-12-09 18:14:09','2022-12-09 18:14:09','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL),('e5c06666-385e-48a2-a009-42eb606fe09a','2022-12-09 17:53:08','2022-12-09 17:53:08','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Harissa',NULL,3,0,0,0,NULL,NULL),('ff850fda-c1d0-4051-a51f-d82aa95d21e4','2022-12-09 18:11:42','2022-12-09 18:11:42','2d4332d3-2b05-4217-9db1-813817c93310','39994041-1b69-491f-9c89-78c6e6866604','Holberton a esquirol',NULL,0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('c8fcf629-0dd0-4d62-900f-9f5eb6cdcf29','2022-12-11 20:58:45','2022-12-11 20:58:45','03e18984-255e-40ad-abeb-5de34de17a52','39994041-1b69-491f-9c89-78c6e6866604','texte d une review'),('d9e67ed2-b102-48a4-859e-39d965211853','2022-12-11 18:07:37','2022-12-11 18:07:37','03e18984-255e-40ad-abeb-5de34de17a52','39994041-1b69-491f-9c89-78c6e6866604','tralalilallalilaere');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('0408b9e5-d8c5-4fd7-b25b-8990f9276d69','2022-12-02 06:38:46','2022-12-02 06:38:46','California'),('421a55f1-7d82-45d9-b54c-a76916479545','2017-03-25 19:42:40','2017-03-25 19:42:40','Alabama'),('9e495e8d-d932-443e-a727-b64c727b1c80','2022-12-02 06:51:25','2022-12-02 06:51:25','France');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('39994041-1b69-491f-9c89-78c6e6866604','2022-12-09 17:43:40','2022-12-09 17:43:40','guenoel@gmail.com','test',NULL,NULL);
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

-- Dump completed on 2022-12-21  1:19:02
