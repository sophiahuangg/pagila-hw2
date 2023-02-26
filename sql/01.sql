/*
 * Use a subquery to select the film_id and title columns
 * for all films whose rental_rate is greater than the average.
 * Use the film table and order by title.
 *
 * HINT:
 * The postgresqltutorial.com website has a solution for this problem.
 */

WITH avgrent AS(
    SELECT 
        avg(rental_rate) AS avrr
    FROM film)

SELECT 
    film_id, title
FROM film
WHERE rental_rate > (SELECT * FROM avgrent)
ORDER BY 2;
