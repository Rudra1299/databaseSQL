/*Find out the PG-13 rated comedy movies.*/
use sakila;
SELECT a.title, a.rating, c.name
from film a INNER JOIN film_category b
ON a.film_id = b.film_id
INNER JOIN category c
ON b.category_id = c.category_id
WHERE c.name = 'Comedy' AND a.rating = 'PG-13';

