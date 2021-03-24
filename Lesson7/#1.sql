select u.name, o.* from users u
inner join orders o
on u.id = o.user_id