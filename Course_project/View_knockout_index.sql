create view ufc_knockout_index as
select id, concat(fall.name, ' ', fall.nickname) fighter, uer.landing_per_min knockout_index
from fighter_all fall join ufc_fighter uer
on fall.id = uer.fighter_all_id