SELECT AVG(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25)) as Average_Age FROM shop2.users;

