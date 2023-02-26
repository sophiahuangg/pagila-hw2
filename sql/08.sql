/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH ratedg AS(
    SELECT
        title
    FROM film
    WHERE rating = 'G'
),

features AS(
    SELECT
        title, unnest(special_features) AS trailers
    FROM film
),

trail AS(
    SELECT
        *
    FROM features
    WHERE trailers = 'Trailers'
)

SELECT 
    title
FROM ratedg WHERE title IN(
    SELECT 
        title
    FROM trail
);
