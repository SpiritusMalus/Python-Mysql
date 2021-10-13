-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: EpicGames
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `products_id` bigint unsigned NOT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `products_id_FK` (`products_id`),
  CONSTRAINT `products_id_FK` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id_FK5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,1,0.5,'2015-05-05 15:33:05','2021-10-12 22:02:12','2021-10-12 22:02:12','2021-10-12 22:02:12'),(2,2,4,0.2,'2011-05-05 15:35:05','2021-10-12 22:02:12','2021-10-12 22:02:12','2021-10-12 22:02:12'),(3,5,5,0.1,'2021-10-12 22:02:12','2031-05-05 15:33:05','2021-10-12 22:02:12','2021-10-12 22:02:12'),(4,1,5,0.3,'2015-05-05 12:33:05','2022-05-05 15:33:05','2021-10-12 22:02:12','2021-10-12 22:02:12');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint unsigned NOT NULL COMMENT 'Инициатор дружбы',
  `target_user_id` bigint unsigned NOT NULL COMMENT 'Цель дружбы',
  `status` enum('requested','approved','declined','unfriended') DEFAULT NULL COMMENT 'Статус дружбы',
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время подачи дружбы',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления статуса дружбы',
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id_FK` (`target_user_id`),
  CONSTRAINT `initiator_user_id_FK` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `target_user_id_FK` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заявки в друзья';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,2,'approved','2021-10-12 22:00:52','2021-10-12 22:00:52'),(1,9,'requested','2021-10-12 22:00:52','2021-10-12 22:00:52'),(2,5,'declined','2021-10-12 22:00:52','2021-10-12 22:00:52'),(2,10,'requested','2021-10-12 22:00:52','2021-10-12 22:00:52'),(3,1,'approved','2021-10-12 22:00:52','2021-10-12 22:00:52'),(4,3,'approved','2021-10-12 22:00:52','2021-10-12 22:00:52'),(6,5,'unfriended','2021-10-12 22:00:52','2021-10-12 22:00:52'),(7,3,'approved','2021-10-12 22:00:52','2021-10-12 22:00:52'),(10,9,'unfriended','2021-10-12 22:00:52','2021-10-12 22:00:52');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_genre`
--

DROP TABLE IF EXISTS `game_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_genre` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) NOT NULL COMMENT 'Жанр игры',
  PRIMARY KEY (`id`),
  UNIQUE KEY `genre` (`genre`) COMMENT 'Уникальный ключ для жанра игры'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Жанры игр';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_genre`
--

LOCK TABLES `game_genre` WRITE;
/*!40000 ALTER TABLE `game_genre` DISABLE KEYS */;
INSERT INTO `game_genre` VALUES (3,'Action'),(2,'Adventure'),(8,'Arcade'),(9,'Fighting'),(1,'Horror'),(10,'MMORPG'),(7,'Moba'),(4,'RPG'),(6,'Simulation'),(5,'Strategy');
/*!40000 ALTER TABLE `game_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `products_id` bigint unsigned DEFAULT NULL,
  `game_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `products_id_FK3` (`products_id`),
  CONSTRAINT `products_id_FK3` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id_FK1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Библиотека видеоигр';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,2,1,'Dota2','2021-10-12 23:19:01'),(2,3,3,'Diablo2','2021-10-12 23:19:01'),(3,4,2,'CS:GO','2021-10-12 23:19:01'),(4,2,3,'Diablo2','2021-10-12 23:19:01'),(5,9,2,'CS:GO','2021-10-12 23:19:01'),(6,8,4,'Diablo3','2021-10-12 23:19:01'),(7,5,2,'CS:GO','2021-10-12 23:19:01'),(8,10,8,'Mass Effect','2021-10-12 23:19:01'),(9,7,7,'TESV','2021-10-12 23:19:01'),(10,5,7,'TESV','2021-10-12 23:19:01');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `body` text,
  `filename` varchar(255) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `metadata` longtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`),
  CONSTRAINT `media_product_idFK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Медиафайлы для игр';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,2,1,'Здесь показан геймплей игры','Dota2Gameplay',2000000,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46'),(2,1,1,'Прокачка персонажа','Dota2lvlup',2031,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46'),(3,2,2,'Здесь показан геймплей игры','CSGOGameplay',2000000,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46'),(4,1,2,'Пейзаж игры','CSGOMAP',3315,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46'),(5,2,3,'Здесь показан геймплей игры','D2Gameplay',6246477,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46'),(6,1,3,'Убийство Диабло','D2KillBoSS',15555,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46'),(7,2,4,'Здесь показан геймплей игры','D3Gameplay',1351366,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46'),(8,1,4,'Показана карта с прокачкой','D3MAPLVLUP',8855,NULL,'2021-10-12 22:03:46','2021-10-12 22:03:46');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Тип медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,'Photo'),(2,'Video');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `to_user_id_FK` (`to_user_id`),
  CONSTRAINT `from_user_id_FK` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `to_user_id_FK` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сообщение юзеров друг другу';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,'Привет, как дела?','2021-10-12 22:03:05'),(3,9,'Сегодня холодно, не пойду','2021-10-12 22:03:05'),(4,3,'как это чё это ','2021-10-12 22:03:05'),(5,6,'Верни деньги','2021-10-12 22:03:05');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nickname_country`
--

DROP TABLE IF EXISTS `nickname_country`;
/*!50001 DROP VIEW IF EXISTS `nickname_country`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nickname_country` AS SELECT 
 1 AS `nickname`,
 1 AS `country`,
 1 AS `game_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `products_id` bigint unsigned DEFAULT NULL,
  `wallet_status` enum('denied','completed') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id_FK3` (`user_id`),
  KEY `products_id_FK2` (`products_id`),
  CONSTRAINT `products_id_FK2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id_FK3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,2,1,'completed','2021-10-12 23:19:01'),(2,3,3,'completed','2021-10-12 23:19:01'),(3,4,2,'completed','2021-10-12 23:19:01'),(4,2,4,'denied','2021-10-12 23:19:01'),(5,2,3,'completed','2021-10-12 23:19:01'),(6,9,2,'completed','2021-10-12 23:19:01'),(7,8,4,'completed','2021-10-12 23:19:01'),(8,6,3,'denied','2021-10-12 23:19:01'),(9,5,2,'completed','2021-10-12 23:19:01'),(10,10,8,'completed','2021-10-12 23:19:01'),(11,7,7,'completed','2021-10-12 23:19:01'),(12,5,3,'denied','2021-10-12 23:19:01'),(13,5,7,'completed','2021-10-12 23:19:01');
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library_add` AFTER INSERT ON `orders_products` FOR EACH ROW BEGIN
	IF NEW.wallet_status = 'completed' THEN 
		INSERT INTO library (user_id, products_id) SELECT op.user_id, op.products_id from orders_products op order by id desc limit 1;
		UPDATE library SET game_name = (SELECT name from products p WHERE products_id = p.id);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` bigint unsigned NOT NULL,
  `game_genre_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_genre_FK` (`game_genre_id`),
  CONSTRAINT `game_genre_FK` FOREIGN KEY (`game_genre_id`) REFERENCES `game_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Каталог игр';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Dota2','Игра, где ты оставишь свою молодость',0,2),(2,'CS:GO','Убивай, радуйся',0,2),(3,'Diablo2','РПГ, которая затянет надолго',2000,1),(4,'Diablo3','Вторая часть была лучше, извините',3111,1),(5,'Dark Souls','РПГ хард кор, смотри не умри',1500,4),(6,'Black book','Карточная игра с элементами РПГ',1559,1),(7,'TESV','РПГ в стиле средневековья',569,4),(8,'Mass Effect','Шутер, в котором вы спасете целую галактику',3999,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `country` varchar(50) NOT NULL COMMENT 'Страна',
  `address` varchar(255) DEFAULT NULL COMMENT 'Полный адресс',
  `home_index` int unsigned DEFAULT NULL COMMENT 'Индекс',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания профиля',
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Russia','Moscow, andreev street, 50-2',31351,'2021-10-12 22:00:33'),(2,'Russia','Moskowsky, twer street, 50-3',647457,'2021-10-12 22:00:33'),(3,'Russia','Zelenograd, horvat street, 777-2',68685,'2021-10-12 22:00:33'),(4,'Mordovia','Moklod, pruz street, 666-3',76886,'2021-10-12 22:00:33'),(5,'Prusia','Something, qeqefa street, 133-2',45747,'2021-10-12 22:00:33'),(6,'USA','New York, dfdfsaf street, 8355-3',457457,'2021-10-12 22:00:33'),(7,'Japan','Tokyo, efefe street, 1488-2',1364165,'2021-10-12 22:00:33'),(8,'England','London, thtehh street, 1533-3',136136,'2021-10-12 22:00:33'),(9,'Chernogory','Gongo, wrgrgr street, 1233-2',164143613,'2021-10-12 22:00:33'),(10,'Ukrain','Kiev, grgxffg street, 228-3',161646,'2021-10-12 22:00:33');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!50001 DROP VIEW IF EXISTS `user_message`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_message` AS SELECT 
 1 AS `Кто`,
 1 AS `Кому`,
 1 AS `Текст`,
 1 AS `Статус отношений`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL COMMENT 'Имя',
  `lastname` varchar(50) NOT NULL COMMENT 'Фамилия',
  `nickname` varchar(50) NOT NULL COMMENT 'Ник',
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `wallet_number` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `wallet_number` (`wallet_number`),
  KEY `users_firstname_lastname_nickname_idx` (`firstname`,`lastname`,`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Eugene','Tikhonenko','Malum','Lana211@yandex.ru','13995',89103311983,61616136136),(2,'Dmitry','Chertovsky','Chopi','i13jekf@yandex.ru','13513',89153351983,616555536136),(3,'Ivan','Morozov','krendel','porkt@mail.ru','14883',8193599135,6161688836136),(4,'Alex','Toward','coornb','i13jekf@gmail.com','665155',113501305,616167836136),(5,'Alexandre','Tolkin','Welovegames','kikikaewr@yandex.ru','356737',13513613,618098136136),(6,'Barry','Baskov','chashazolotaya','lolfyk@yandex.ru','6746',46757357357,616163156136),(7,'Kirill','Wolodkin','Vikrid','33fasedf1@yandex.ru','3576357',8468468468,616147586136),(8,'Petr','Samburov','Sumsung','_244rsg@tare.com','6758568',35724626246,61618736136),(9,'Toward','Kokorin','TK18','faeff@br.ru','4635735',3573576868,6161656851616),(10,'Bruse','Vayne','TryHard','13513ref@g.ru','37325',8946835746,6161667836);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `nickname_country`
--

/*!50001 DROP VIEW IF EXISTS `nickname_country`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nickname_country` AS select `u`.`nickname` AS `nickname`,`p`.`country` AS `country`,`l`.`game_name` AS `game_name` from ((`users` `u` join `profiles` `p` on((`p`.`user_id` = `u`.`id`))) join `library` `l` on((`u`.`id` = `l`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_message`
--

/*!50001 DROP VIEW IF EXISTS `user_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_message` AS select (select `u2`.`firstname` from `users` `u2` where (`m`.`from_user_id` = `u2`.`id`)) AS `Кто`,(select `u2`.`firstname` from `users` `u2` where (`m`.`to_user_id` = `u2`.`id`)) AS `Кому`,`m`.`body` AS `Текст`,(select `fr`.`status` from `friend_requests` `fr` where ((`fr`.`initiator_user_id` = `m`.`from_user_id`) and (`fr`.`target_user_id` = `m`.`to_user_id`))) AS `Статус отношений` from `messages` `m` */;
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

-- Dump completed on 2021-10-13 17:42:16
