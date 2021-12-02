/*Find out the number of movies in which “SEAN WILLIAMS” acted.*/
SELECT CONCAT_WS(' ', first_name, last_name) as 'Actor Name', COUNT(*) 'number of movies'
FROM actor a INNER JOIN film_actor f
ON a.actor_id = f.actor_id
WHERE CONCAT(first_name, ' ', last_name) = 'SEAN WILLIAMS'
GROUP BY first_name, last_name;