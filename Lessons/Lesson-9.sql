									  Транзакции
										TASK 1
										
DELETE FROM sample.users WHERE id = 1;   -- Удалил, чтобы записать снова
START TRANSACTION;  
INSERT INTO sample.users 
SELECT * from shop.users u WHERE id = 1; 
Commit;

										TASK 2

CREATE VIEW name_prod_name_cat(name, name_cat) 
	AS SELECT p.name, c.name from products p, catalogs c WHERE p.catalog_id = c.id ;
	
SELECT * FROM name_prod_name_cat;

								  Хранимые процедуры..
										TASK 1

DELIMITER //
DROP PROCEDURE IF EXISTS hello

CREATE PROCEDURE hello()
BEGIN
	CASE
		WHEN CURTIME() BETWEEN '06:00:00' and '12:00:00' THEN SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' and '18:00:00' THEN SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' and '00:00:00' THEN SELECT 'Добрый вечер';
		ELSE SELECT 'Доброй ночи';
	END CASE;
END

DELIMITER ;
CALL hello()

								TASK 2
								
DELIMITER //
use shop;
CREATE TRIGGER check_products BEFORE INSERT ON products
FOR EACH ROW 
BEGIN 
	IF(ISNULL(NEW.name) and ISNULL(NEW.desription)) THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Значение NULL Недопустимо';
	END IF;
END 
DELIMITER ;

INSERT INTO products (name, desription, price, catalog_id)
VALUES (NULL,NULL, 5000, 2);  -- Тут ошибка

INSERT INTO products (name, desription, price, catalog_id)
VALUES (NULL,'Grange', 5000, 2);

INSERT INTO products (name, desription, price, catalog_id)
VALUES ('Trader',NULL, 5000, 2);











