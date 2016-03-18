#Revenue per actor
SELECT
	a.actor_id,
	concat(a.first_name," ", a.last_name) name,
	sum(rpf.total_rental) total_revenue_per_actor

FROM film_actor fa,
		actor a,
		revenue_per_film rpf
WHERE 
		a.actor_id = fa.actor_id
		AND rpf.film_id = fa.film_id
GROUP BY 1
ORDER BY total_revenue_per_actor DESC
LIMIT 10
;
