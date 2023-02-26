/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

WITH features AS(
    SELECT 
        film_id, unnest(special_features) AS sf
    FROM film
),
bts AS(
    SELECT
        *
    FROM features
    WHERE sf='Behind the Scenes'
),

actors AS(
    SELECT
        actor_id
    FROM film_actor
    WHERE film_actor.film_id IN (
        SELECT
            bts.film_id
        FROM bts
        )
    )   
    
SELECT  
    DISTINCT CONCAT(first_name, ' ', last_name) AS "Actor Name"
FROM actor
WHERE actor.actor_id IN(
    SELECT
        actors.actor_id
    FROM actors);

