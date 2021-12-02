/*Find out the number of sci-fi movies rented by the store managed by Jon Stephens.*/
WITH category_ids AS(
SELECT category_id
FROM film_category
WHERE film_id IN
(SELECT film_id
FROM inventory
WHERE store_id IN
(SELECT store_id
FROM staff
WHERE CONCAT_WS(' ', first_name, last_name) = 'Jon Stephens'
)))

SELECT name, COUNT(*) as count
FROM film a INNER JOIN film_category b
ON a.film_id = b.film_id
INNER JOIN category c
ON c.category_id = b.category_id
INNER JOIN category_ids n
ON n.category_id = c.category_id
WHERE name = 'sci-fi'
GROUP BY name
