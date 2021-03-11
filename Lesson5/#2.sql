UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i') where id > 0;
UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i') where id > 0;
SELECT * FROM users