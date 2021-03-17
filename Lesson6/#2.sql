select p.firstname, p.lastname, m.to_user_id, fr.to_user_id
from profile p inner join message m
on p.user_id = m.from_user_id
inner join friend_request fr
on m.to_user_id = fr.to_user_id
where m.from_user_id = fr.from_user_id;
