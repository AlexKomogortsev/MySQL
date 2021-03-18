SELECT count(p.gender) as likes, p.gender 
from profile p inner join vk_5.like l
on p.user_id = l.user_id
group by gender;