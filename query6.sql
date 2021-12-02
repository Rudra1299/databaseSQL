/*Find out the number of documentaries with deleted scenes*/
SELECT name ,count(*) 'count'
FROM film a INNER JOIN film_category b
ON a.film_id = b.film_id
INNER JOIN category c
ON b.category_id = c.category_id
WHERE name = 'documentary' AND special_features LIKE '%deleted scenes%'
GROUP BY name;

