use shop;
													TASK 1
DROP TABLE IF EXISTS logs;
CREATE TABLE `logs` (
  `id` bigint unsigned NOT NULL,
  `table_name` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=Archive

DROP TRIGGER users_logs
DELIMITER $$
CREATE TRIGGER users_logs AFTER INSERT ON users   
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (table_name, id, name, created_at) 
	VALUES (
	'users', 
	(SELECT u.id from users u order by id DESC LIMIT 1), 
	(SELECT u.name from users u order by id DESC LIMIT 1),
	(SELECT u.created_at from users u order by id DESC LIMIT 1));
END
DELIMITER ;

DROP TRIGGER products_logs
DELIMITER $$
CREATE TRIGGER products_logs AFTER INSERT ON products  
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (table_name, id, name, created_at) 
	VALUES (
	'products', 
	(SELECT p.id from products p order by id DESC LIMIT 1), 
	(SELECT p.name from products p order by id DESC LIMIT 1),
	(SELECT p.created_at from products p order by id DESC LIMIT 1));
END
DELIMITER ;

DROP TRIGGER catalogs_logs
DELIMITER $$
CREATE TRIGGER catalogs_logs AFTER INSERT ON catalogs   
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (table_name, created_at, id, name) 
	VALUES (
	'catalogs',
	NOW(),
	(SELECT c.id from catalogs c order by id DESC LIMIT 1), 
	(SELECT c.name from catalogs c order by id DESC LIMIT 1));
END
DELIMITER ;

INSERT INTO users (name, birthday_at) VALUES ('EUGENE', '1995-11-21');
INSERT INTO products VALUES (10, 'PC 2010', 'Сборка пк', 1000, 1, NOW(), NOW());
INSERT INTO catalogs VALUES (6, 'Звуковая карта');

													TASK 2
DELIMITER //
DROP PROCEDURE into_users
CREATE PROCEDURE into_users()
BEGIN
	DECLARE i INT DEFAULT 15;
	WHILE i < 1000000 DO
	INSERT INTO users values (i, 'Eugene', '2015-03-05', NOW(),NOW());   -- Разве что не понял как сделать рандомные значения
	SET i = i +1;
	END WHILE;
END
DELIMITER ;

CALL into_users() 

EXPLAIN SELECT * from users u WHERE id = 5555;










