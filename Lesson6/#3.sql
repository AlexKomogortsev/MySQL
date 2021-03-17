select count(*) as sum_of_likes
from (select * from profile
order by birthday desc
limit 10) p INNER JOIN vk_5.like l
on p.user_id = l.user_id;