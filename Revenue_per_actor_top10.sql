#Revenue of films
DROP TEMPORARY TABLE IF EXISTS revenue_per_film;
CREATE TEMPORARY TABLE revenue_per_film
SELECT 
	f.film_id,
	f.title,
	f.rental_rate * count(*) total_rental
FROM 
	rental r, 
	inventory i,
	film f
WHERE r.inventory_id = i.inventory_id
		AND i.film_id = f.film_id
Group By 1
;

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
