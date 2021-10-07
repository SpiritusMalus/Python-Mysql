											КУРСОВОЙ ПРОЕКТ
Данная база данных создана на основе платформы по покупке видеоигр - Epic Games,
В данной базе данных вы сможете: 
1)Зарегистрировать нового пользователя(users,profiles)
2)Дружить и обмениваться сообщениями(friend_requests, messages)
3)Посмотреть интересующие вас видеоигры:
	В таблице products вы найдете список игр, game_genre показывает жанр игры
	Таблица media хранит в себе видео и изображения игр
4)Если понравилась игра, можете её приобрести(orders_products) и даже получить на неё скидку!(discounts)
5)После покупки в вашу библиотеку видеоигр добавится соответвующая игра и сможете окунуться в виртуальный мир!(library)

CREATE DATABASE EpicGames;
use EpicGames;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint unsigned DEFAULT NULL,
  `wallet_number` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';

DROP TABLE IF EXISTS profiles;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `country` tinytext NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `home_index` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint unsigned NOT NULL,
  `target_user_id` bigint unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  CONSTRAINT `initiator_user_id_FK` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `target_user_id_FK` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS game_genre;
CREATE TABLE `game_genre`(
	`id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
	`genre` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `genre` (`genre`)
) 

DROP TABLE IF EXISTS products;
CREATE TABLE `products`(
	`id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` text NOT NULL,
	`price` bigint UNSIGNED NOT NULL,
	`game_genre_id` bigint UNSIGNED NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `game_genre_FK` FOREIGN KEY (`game_genre_id`) REFERENCES `game_genre` (`id`)
) 

DROP TABLE IF EXISTS discounts;
CREATE TABLE `discounts` (
  `id` SERIAL PRIMARY KEY,
  `user_id` bigint UNSIGNED,
  `products_id` bigint UNSIGNED NOT NULL,
  `discount` FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` DATETIME,
  `finished_at` DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  CONSTRAINT `products_id_FK` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id_FK5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE `orders_products` (
  `id` SERIAL PRIMARY KEY,
  `user_id` bigint UNSIGNED,
  `products_id` bigint UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `user_id_FK3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `products_id_FK2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS library;
CREATE TABLE `library`(
	`id` SERIAL PRIMARY KEY,
	`user_id` bigint UNSIGNED,
	`products_id` bigint UNSIGNED,
	`game_name` varchar(255) DEFAULT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `products_id_FK3` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
	CONSTRAINT `user_id_FK1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)

DROP TABLE IF EXISTS messages;
CREATE TABLE `messages` (
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `from_user_id_FK` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `to_user_id_FK` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS media_type;
CREATE TABLE `media_type` (
	`id` SERIAL,
	`type` varchar(255) NOT NULL,
	UNIQUE KEY `type` (`type`)
)

DROP TABLE IF EXISTS media;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `product_id` (`product_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_product_idFK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DELIMITER $$
CREATE TRIGGER library_add AFTER INSERT ON orders_products   -- Триггер на заполнение library купленными играми
FOR EACH ROW 
BEGIN 
	INSERT INTO library (user_id, products_id) SELECT op.user_id, op.products_id from orders_products op order by id desc limit 1;
	UPDATE library SET game_name = (SELECT name from products p WHERE products_id = p.id);
END
DELIMITER ;

DELIMITER $$
DROP FUNCTION IF EXISTS name_user$$      -- Функция на выдачу имени по его id
CREATE FUNCTION name_user(us_name INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE total VARCHAR(255);
	SET total = (SELECT firstname FROM users u WHERE u.id = us_name);
	RETURN total;
END 
DELIMITER ;

SELECT name_user(1)

DELIMITER $$
DROP PROCEDURE IF EXISTS string_user      -- Процедура на выдачу имени по его id
CREATE PROCEDURE string_user(us_name INT)
BEGIN	
	SELECT * FROM users u WHERE u.id = us_name;
END
DELIMITER ;

CALL string_user(1)
 
CREATE OR REPLACE VIEW  nickname_country AS     -- Представление на вывод Ника,Страны и игру из библиотеки
	SELECT u.nickname, p.country, l.game_name 
	FROM users u 
	INNER JOIN profiles p 
	ON p.user_id = u.id
	INNER JOIN library l 
	ON u.id = l.id ;

SELECT *
FROM nickname_country
WHERE nickname = 'Malum';




















