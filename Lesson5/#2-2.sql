select birthday, count(*) as sum_of_days
from (select id, name, dayname(date_format(birthday_at, '%2021-%m-%d')) as birthday, weekday(date_format(birthday_at, '%2021-%m-%d')) as birthdaynum from users) birthdays group by birthday order by birthdaynum;