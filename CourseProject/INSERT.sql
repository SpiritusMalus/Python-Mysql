
INSERT INTO `users` VALUES (1,'Eugene', 'Tikhonenko', 'Malum', 'Lana211@yandex.ru', 13995, 89103311983, 61616136136);
INSERT INTO `users` VALUES (2,'Dmitry', 'Chertovsky', 'Chopi', 'i13jekf@yandex.ru', 13513, 89153351983, 616555536136);
INSERT INTO `users` VALUES (3,'Ivan', 'Morozov', 'krendel', 'porkt@mail.ru', 14883, 8193599135, 6161688836136);
INSERT INTO `users` VALUES (4,'Alex', 'Toward', 'coornb', 'i13jekf@gmail.com', 665155, 113501305, 616167836136);
INSERT INTO `users` VALUES (5,'Alexandre', 'Tolkin', 'Welovegames', 'kikikaewr@yandex.ru', 356737, 13513613, 618098136136);
INSERT INTO `users` VALUES (6,'Barry', 'Baskov', 'chashazolotaya', 'lolfyk@yandex.ru', 6746, 46757357357, 616163156136);
INSERT INTO `users` VALUES (7,'Kirill', 'Wolodkin', 'Vikrid', '33fasedf1@yandex.ru', 3576357, 8468468468, 616147586136);
INSERT INTO `users` VALUES (8,'Petr', 'Samburov', 'Sumsung', '_244rsg@tare.com', 6758568, 35724626246, 61618736136);
INSERT INTO `users` VALUES (9,'Toward', 'Kokorin', 'TK18', 'faeff@br.ru', 4635735, 3573576868, 6161656851616);
INSERT INTO `users` VALUES (10,'Bruse', 'Vayne', 'TryHard', '13513ref@g.ru', 37325, 8946835746, 6161667836);

INSERT INTO `profiles` VALUES (1, 'Russia', 'Moscow, andreev street, 50-2', 31351, NOW());
INSERT INTO `profiles` VALUES (2, 'Russia', 'Moskowsky, twer street, 50-3', 647457, NOW());
INSERT INTO `profiles` VALUES (3, 'Russia', 'Zelenograd, horvat street, 777-2', 68685, NOW());
INSERT INTO `profiles` VALUES (4, 'Mordovia', 'Moklod, pruz street, 666-3', 76886, NOW());
INSERT INTO `profiles` VALUES (5, 'Prusia', 'Something, qeqefa street, 133-2', 45747, NOW());
INSERT INTO `profiles` VALUES (6, 'USA', 'New York, dfdfsaf street, 8355-3', 457457, NOW());
INSERT INTO `profiles` VALUES (7, 'Japan', 'Tokyo, efefe street, 1488-2', 1364165, NOW());
INSERT INTO `profiles` VALUES (8, 'England', 'London, thtehh street, 1533-3', 136136, NOW());
INSERT INTO `profiles` VALUES (9, 'Chernogory', 'Gongo, wrgrgr street, 1233-2', 164143613, NOW());
INSERT INTO `profiles` VALUES (10, 'Ukrain', 'Kiev, grgxffg street, 228-3', 161646, NOW());

INSERT INTO `friend_requests` VALUES (1, 2, 'approved', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (2, 5, 'declined', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (3, 1, 'approved', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (6, 5, 'unfriended', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (7, 3, 'approved', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (1, 9, 'requested', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (10, 9, 'unfriended', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (2, 10, 'requested', NOW(), NOW());
INSERT INTO `friend_requests` VALUES (4, 3, 'approved', NOW(), NOW());

INSERT INTO `game_genre` VALUES (1, 'Horror');
INSERT INTO `game_genre` VALUES (2, 'Adventure');
INSERT INTO `game_genre` VALUES (3, 'Action');
INSERT INTO `game_genre` VALUES (4, 'RPG');
INSERT INTO `game_genre` VALUES (5, 'Strategy');
INSERT INTO `game_genre` VALUES (6, 'Simulation');
INSERT INTO `game_genre` VALUES (7, 'Moba');
INSERT INTO `game_genre` VALUES (8, 'Arcade');
INSERT INTO `game_genre` VALUES (9, 'Fighting');
INSERT INTO `game_genre` VALUES (10, 'MMORPG');

INSERT INTO `products` VALUES (1, 'Dota2', 'Игра, где ты оставишь свою молодость', 0, 2);
INSERT INTO `products` VALUES (2, 'CS:GO', 'Убивай, радуйся', 0, 2);
INSERT INTO `products` VALUES (3, 'Diablo2', 'РПГ, которая затянет надолго', 2000, 1);
INSERT INTO `products` VALUES (4, 'Diablo3', 'Вторая часть была лучше, извините', 3111, 1);
INSERT INTO `products` VALUES (5, 'Dark Souls', 'РПГ хард кор, смотри не умри', 1500, 4);

INSERT INTO `discounts` VALUES (1, 1, 1, 0.5, '2015-05-05 15:33:05', NOW(), NOW(), NOW());
INSERT INTO `discounts` VALUES (2, 2, 4, 0.2, '2011-05-05 15:35:05', NOW(), NOW(), NOW());
INSERT INTO `discounts` VALUES (3, 5, 5, 0.1, NOW(), '2031-05-05 15:33:05', NOW(), NOW());
INSERT INTO `discounts` VALUES (4, 1, 5, 0.3, '2015-05-05 12:33:05', '2022-05-05 15:33:05', NOW(), NOW());

INSERT INTO `orders_products` VALUES (1, 2, 1, NOW(),NOW());
INSERT INTO `orders_products` VALUES (2, 3, 3, NOW(),NOW());
INSERT INTO `orders_products` VALUES (3, 4, 2, NOW(),NOW());
INSERT INTO `orders_products` VALUES (4, 2, 4, NOW(),NOW());
INSERT INTO `orders_products` VALUES (5, 2, 3, NOW(),NOW());

INSERT INTO `library` VALUES (1, 1, NOW(),NOW());
INSERT INTO `library` VALUES (2, 2, NOW(),NOW());
INSERT INTO `library` VALUES (3, 4, NOW(),NOW());
INSERT INTO `library` VALUES (4, 3, NOW(),NOW());

INSERT INTO `messages` VALUES (1, 2, 'Привет, как дела?', NOW());
INSERT INTO `messages` VALUES (5, 6, 'Верни деньги', NOW());
INSERT INTO `messages` VALUES (3, 9, 'Сегодня холодно, не пойду', NOW());
INSERT INTO `messages` VALUES (4, 3, 'как это чё это ', NOW());

INSERT INTO `media_type` VALUES (1,'Photo');
INSERT INTO `media_type` VALUES (2,'Video');

INSERT INTO `media` VALUES (1, 2, 1, 'Здесь показан геймплей игры','Dota2Gameplay', 2000000, NULL, NOW(), NOW());
INSERT INTO `media` VALUES (2, 1, 1, 'Прокачка персонажа','Dota2lvlup', 2031, NULL, NOW(), NOW());
INSERT INTO `media` VALUES (3, 2, 2, 'Здесь показан геймплей игры','CSGOGameplay', 2000000, NULL, NOW(), NOW());
INSERT INTO `media` VALUES (4, 1, 2, 'Пейзаж игры','CSGOMAP', 3315, NULL, NOW(), NOW());
INSERT INTO `media` VALUES (5, 2, 3, 'Здесь показан геймплей игры','D2Gameplay', 6246477, NULL, NOW(), NOW());
INSERT INTO `media` VALUES (6, 1, 3, 'Убийство Диабло','D2KillBoSS', 15555, NULL, NOW(), NOW());
INSERT INTO `media` VALUES (7, 2, 4, 'Здесь показан геймплей игры','D3Gameplay', 1351366, NULL, NOW(), NOW());
INSERT INTO `media` VALUES (8, 1, 4, 'Показана карта с прокачкой','D3MAPLVLUP', 8855, NULL, NOW(), NOW());








