/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

WITH filmid AS(
    SELECT
        film_id, title
    FROM film
),

inv AS(
    SELECT
        film_id
    FROM inventory
)

SELECT
    DISTINCT title
FROM filmid
LEFT JOIN inv
USING(film_id)
WHERE inv.film_id IS NULL;
