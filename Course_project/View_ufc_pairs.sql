create view ufc_pairs as
select id, red_id fighter_id
from ufc_fight
union all
select id, blue_id fighter_id
from ufc_fight
order by id