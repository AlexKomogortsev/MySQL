delimiter $$
CREATE DEFINER=`root`@`localhost` TRIGGER `catalogs_AFTER_INSERT` AFTER INSERT ON `catalogs` FOR EACH ROW 
BEGIN
    insert into logs values(now(), 'catalogs', new.`id`, new.`name`);
END$$
delimiter ;

delimiter $$
CREATE DEFINER=`root`@`localhost` TRIGGER `products_AFTER_INSERT` AFTER INSERT ON `products` FOR EACH ROW 
BEGIN
    insert into logs values(now(), 'products', new.`id`, new.`name`);
END$$
delimiter ;

delimiter $$
CREATE DEFINER=`root`@`localhost` TRIGGER `users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW 
BEGIN
    insert into logs values(now(), 'users', new.`id`, new.`name`);
END$$
delimiter ;