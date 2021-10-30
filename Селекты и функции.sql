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
	ON u.id = l.user_id ;

CREATE OR REPLACE VIEW  user_message AS			-- Представление на вывод переписки со статусом отношений
	 SELECT (SELECT u2.firstname FROM users u2 WHERE m.from_user_id = u2.id) as Кто, 
	(SELECT u2.firstname FROM users u2 WHERE m.to_user_id = u2.id) as Кому, body Текст,
	(SELECT fr.status FROM friend_requests fr WHERE fr.initiator_user_id = m.from_user_id AND fr.target_user_id = m.to_user_id) as `Статус отношений`
	FROM messages m 
	
SELECT * from user_message						-- Проверка представления
	
	
SELECT *										-- Проверка представления
FROM nickname_country
WHERE nickname = 'Chopi';

SELECT u.firstname, SUM(p.price)               -- Селект, чтобы посмотреть общую сумму покупок пользователя
FROM users u 
JOIN library l 
ON l.user_id = u.id 
JOIN products p 
ON p.id = l.products_id
WHERE u.id = 2 ;

SELECT m.*,p.name 							-- Селект на просмотр медиафайлов игры
FROM media m
JOIN products p 
WHERE p.name = 'Diablo2' and p.id = m.product_id 

SELECT u.id, u.firstname, u.lastname, u.wallet_number, -- Селект на платежеспособных пользователей
(SELECT op2.wallet_status FROM orders_products op2 WHERE u.id = op2.user_id and op2.wallet_status = 'completed' LIMIT 1) as wallet_status    
FROM users u
WHERE u.id = (SELECT op.user_id FROM orders_products op WHERE u.id = op.user_id and op.wallet_status = 'completed' LIMIT 1)