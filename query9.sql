/*Find out the top 3 rented category of movies by “PATRICIA JOHNSON” */

WITH table2 AS (SELECT f1.film_id, name, title
FROM film f1 INNER JOIN film_category f2
ON f1.film_id = f2.film_id
INNER JOIN category c1
ON c1.category_id = f2.category_id
)

,table3 as (
SELECT payment_id, c.film_id
FROM payment p INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory c 
ON r.inventory_id = c.inventory_id
INNER JOIN customer n
ON p.customer_id = n.customer_id
WHERE CONCAT_WS(' ', first_name, last_name) = 'patricia johnson'
)

SELECT name, COUNT(payment_id) as count
FROM table2 t2 INNER JOIN table3 t3
ON t2.film_id = t3.film_id
GROUP BY name
ORDER BY count DESC
LIMIT 3;