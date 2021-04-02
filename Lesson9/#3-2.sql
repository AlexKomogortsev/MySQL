CREATE DEFINER=`root`@`localhost` TRIGGER `products_BEFORE_INSERT` BEFORE INSERT ON `products` FOR EACH ROW BEGIN
	if isnull(new.name) + isnull(new.description) = 2 then
		signal sqlstate '45000'
		set message_text = 'too many null values';
    end if;

END