use magazine;

INSERT into orders (user_id)
select id from users WHERE name = 'Геннадий';

INSERT into orders (user_id)
select id from users WHERE name = 'Наталья';

INSERT into orders (user_id)
select id from users WHERE name = 'Иван';

INSERT INTO orders_products (order_id,product_id,total)
SELECT LAST_INSERT_ID(), id, 2 FROM products 
WHERE name = 'Intel Core i5-7400';

INSERT INTO orders_products (order_id,product_id,total)
SELECT LAST_INSERT_ID(), id, 1 FROM products 
WHERE name In ('Intel Core i5-7400','Gigabyte H310M S2H');

INSERT INTO orders_products (order_id,product_id,total)
SELECT LAST_INSERT_ID(), id, 1 FROM products 
WHERE name In ('AMD FX-8320','ASUS ROG MAXIMUS X HERO');

								TASK 1
SELECT *
FROM users u 
WHERE id = (SELECT user_id from orders o WHERE user_id = u.id)
								TASK 2
SELECT p.name, p.price, c.name 
from products p 
JOIN catalogs c 
WHERE p.catalog_id = c.id 
