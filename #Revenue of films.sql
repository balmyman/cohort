#Revenue of films
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