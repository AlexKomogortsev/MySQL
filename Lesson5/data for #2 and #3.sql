#
# TABLE STRUCTURE FOR: catalogs
#

DROP TABLE IF EXISTS `catalogs`;

CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';

INSERT INTO `catalogs` (`id`, `name`) VALUES ('1', 'Процессоры');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('2', 'Материнские платы');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('3', 'Видеокарты');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('4', 'Жесткие диски');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('5', 'Оперативная память');


#
# TABLE STRUCTURE FOR: discounts
#

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';

#
# TABLE STRUCTURE FOR: orders
#

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';

#
# TABLE STRUCTURE FOR: orders_products
#

DROP TABLE IF EXISTS `orders_products`;

CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав заказа';

#
# TABLE STRUCTURE FOR: products
#

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';

INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('1', 'Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', '7890.00', 1, '2021-03-09 14:59:11', '2021-03-09 14:59:11');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('2', 'Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', '12700.00', 1, '2021-03-09 14:59:11', '2021-03-09 14:59:11');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('3', 'AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', '4780.00', 1, '2021-03-09 14:59:11', '2021-03-09 14:59:11');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('4', 'AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', '7120.00', 1, '2021-03-09 14:59:11', '2021-03-09 14:59:11');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('5', 'ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', '19310.00', 2, '2021-03-09 14:59:11', '2021-03-09 14:59:11');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('6', 'Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', '4790.00', 2, '2021-03-09 14:59:11', '2021-03-09 14:59:11');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('7', 'MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', '5060.00', 2, '2021-03-09 14:59:11', '2021-03-09 14:59:11');


#
# TABLE STRUCTURE FOR: storehouses
#

DROP TABLE IF EXISTS `storehouses`;

CREATE TABLE `storehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склады';

INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'error', '2009-12-05 12:31:22', '1978-03-24 16:03:02');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('2', 'architecto', '1986-01-20 15:37:38', '1972-01-15 22:28:38');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('3', 'quia', '1973-08-12 06:54:10', '1983-07-01 18:46:59');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('4', 'et', '2007-12-16 12:21:55', '1976-02-29 13:49:41');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('5', 'voluptates', '2018-05-24 23:35:19', '1982-08-30 13:10:36');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('6', 'et', '1977-01-16 13:55:12', '2003-03-17 19:27:49');


#
# TABLE STRUCTURE FOR: storehouses_products
#

DROP TABLE IF EXISTS `storehouses_products`;

CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';

INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('1', 1, 1, 8268, '2007-06-28 06:31:43', '2019-11-07 20:17:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('2', 2, 2, 5101, '1993-12-20 04:14:21', '1984-11-22 18:32:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('3', 3, 3, 0, '1991-03-18 14:01:37', '1994-04-02 13:12:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('4', 4, 4, 0, '1998-08-28 03:59:51', '2000-08-03 21:26:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('5', 5, 5, 1407, '2007-05-31 19:14:27', '1995-12-25 00:57:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('6', 6, 6, 1395, '1991-03-07 06:05:39', '1970-12-13 14:50:23');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Покупатели';

INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('1', 'consequatur', '1986-01-12', '25.05.2009 05:23', '11.08.2009 12:04');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('2', 'impedit', '1995-07-19', '10.07.1978 17:39', '27.08.2019 14:37');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('3', 'consequatur', '2017-12-21', '17.09.1972 10:32', '09.10.1986 10:13');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('4', 'incidunt', '2013-03-31', '15.04.1989 13:58', '27.07.2005 05:01');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('5', 'ut', '1995-06-26', '04.01.2018 13:33', '20.12.1987 19:33');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('6', 'quis', '1983-08-05', '02.07.1979 13:46', '21.01.1981 21:10');


