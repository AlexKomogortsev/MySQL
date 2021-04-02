CREATE DEFINER=`root`@`localhost` FUNCTION `hello`(what_time time) RETURNS varchar(45) CHARSET utf8mb4
    NO SQL
BEGIN
    return if(what_time between '06:00:01' and '12:00:00', 'Доброе утро',
	if(what_time between '12:00:01' and '18:00:00', 'Добрый день',
    if(what_time between '18:00:01' and '00:00:00','Добрый вечер', 'Доброй ночи')));
END