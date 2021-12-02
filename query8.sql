/*Find out the total sales from Animation movies*/
WITH table1 as
(SELECT name, title, a.film_id
FROM film a INNER JOIN film_category b
ON a.film_id = b.film_id
INNER JOIN category c
ON b.category_id = c.category_id)

, table2 as (
SELECT payment_id, amount, c.film_id
FROM payment p INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory c 
ON r.inventory_id = c.inventory_id
)

SELECT name, Count(payment_id)
FROM table1 t1 INNER JOIN table2 t2
ON t1.film_id = t2.film_id
GROUP BY name
HAVING name = 'Animation';


