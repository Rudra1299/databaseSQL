/*Find out the list of customers from India who have rented sports movies.*/
WITH customerfinds as(SELECT customer_id
FROM rental 
WHERE inventory_id IN
(SELECT inventory_id
FROM inventory
WHERE film_id IN
(SELECT film_id
FROM film_category
WHERE category_id IN
(SELECT category_id
FROM category))))

SELECT DISTINCT *
FROM customer a INNER JOIN 
address b ON a.address_id = b.address_id
INNER JOIN city c 
ON b.city_id  = c.city_id
INNER JOIN country n
ON c.country_id = n.country_id
INNER JOIN customerfinds m
ON a.customer_id = m.customer_id
WHERE n.country  = 'India';