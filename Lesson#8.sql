
use vk2;

							TASK 1

SELECT COUNT(*) as Количество, from_user_id as Дружище_id
FROM messages m
JOIN friend_requests fr
ON to_user_id = 261 and from_user_id = initiator_user_id and status = 'approved'  
GROUP BY from_user_id
ORDER BY Количество DESC LIMIT 1;

							TASK 2

SELECT p.user_id, COUNT(*) as likes, birthday
FROM profiles p 
JOIN likes l ON l.user_id = p.user_id 
GROUP BY p.user_id 
ORDER BY birthday DESC LIMIT 10;

							TASK 3		Определить кто больше поставил лайков М или Ж ?

SELECT COUNT(*) as Количество, gender
FROM likes l
JOIN profiles p ON p.user_id = l.user_id 
GROUP BY gender 
ORDER BY Количество DESC ;



