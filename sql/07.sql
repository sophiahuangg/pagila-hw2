/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

WITH usres AS(
    SELECT 
        customer_id
    FROM customer
    JOIN address
    USING(address_id)
    JOIN city
    USING(city_id)
    JOIN country
    USING(country_id)
    WHERE country_id = 103
),

rent1 AS(
    SELECT 
        title, customer_id
    FROM inventory
    JOIN film
    USING(film_id)
    JOIN rental
    USING(inventory_id)
),

usrent AS(
    SELECT
        *
    FROM rent1
    WHERE rent1.customer_id IN (SELECT * FROM usres)
)

SELECT
    DISTINCT title
FROM rent1
WHERE rent1.title NOT IN (SELECT title FROM usrent)
ORDER BY 1;
