drop procedure if exists best_fighter;
create procedure best_fighter()
	select fr.name, sum(best.wins) wins, sum(worst.losses) losses from
	fighter_all fr left join
	(select fr.id id, count(ft.winner) wins
	from fighter_all fr join fight_all ft
	on fr.id = ft.winner
	group by fr.id) best
	on fr.id = best.id
	left join (select fr.id, count(ft.loser) losses
	from fighter_all fr join fight_all ft
	on fr.id = ft.loser
	group by fr.id) worst
	on fr.id = worst.id
	group by name
	order by wins desc, losses asc
    limit 1;