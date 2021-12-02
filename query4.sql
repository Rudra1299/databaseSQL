/*Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.*/
WITH customerIds AS (SELECT customer_id 
FROM rental
WHERE inventory_id iN
(SELECT inventory_id
FROM inventory
WHERE film_id IN
(SELECT film_id
FROM film_actor
WHERE actor_id IN
(SELECT actor_id
FROM actor
 WHERE CONCAT_WS(' ', first_name, last_name) = 'NICK WAHLBERG'
))))


SELECT DISTINCT *
FROM customer a INNER JOIN 
address b ON a.address_id = b.address_id
INNER JOIN city c 
ON b.city_id  = c.city_id
INNER JOIN country n
ON c.country_id = n.country_id
INNER JOIN customerIds m
ON a.customer_id = m.customer_id
WHERE n.country  = 'Canada';