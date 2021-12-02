/*Find out the number of R rated movies rented by “SUSAN WILSON”*/
SELECT CONCAT_WS(' ', first_name, last_name) as name, Count(*)
FROM film f INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r 
ON i.inventory_id = r.inventory_id
INNER JOIN customer c
ON c.customer_id = r.customer_id
WHERE CONCAT_WS(' ', first_name, last_name) = 'SUSAN WILSON' AND rating = 'R'
GROUP BY name;