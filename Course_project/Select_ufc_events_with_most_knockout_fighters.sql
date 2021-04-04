-- Show 10 ufc events with most knockout artists
select ut.ufc_event_id, group_concat(' ', up.fighter_id) ufc_fighter_id, sum(ki.knockout_index) event_KO_index
from ufc_pairs up join ufc_knockout_index ki
on up.fighter_id = ki.id
join ufc_fight ut
on ut.id = up.id
group by ufc_event_id
order by event_KO_index desc
limit 10;