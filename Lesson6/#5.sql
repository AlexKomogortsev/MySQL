select concat(p.firstname, ' ', p.lastname) as user, sum(activities) from
profile p inner join
(select uc.user_id as user_id, community_activities as activities from
(select count(community_id) as community_activities, user_id from user_community
group by user_id) uc
union all
select l.user_id, l.likes as activities from
(select count(id) as likes, user_id from vk_5.like
group by user_id) l
union all
select m.user_id, m.medias as activities from
(select count(id) as medias, user_id from media
group by user_id) m) activities
on p.user_id = activities.user_id
group by p.user_id
order by sum(activities)
limit 10
