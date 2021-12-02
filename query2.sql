/*Find out the top 3 rented horror movies.*/
SELECT a.title, c.name, COUNT(*) as rented
FROM film a INNER JOIN film_category b
ON a.film_id = b.film_id
INNER JOIN category c
ON b.category_id = c.category_id
INNER JOIN inventory n
ON a.film_id = n.film_id
INNER JOIN rental r
ON r.inventory_id = n.inventory_id
GROUP BY title, name
HAVING name = 'horror'
ORDER BY rented desc
limit 3;

