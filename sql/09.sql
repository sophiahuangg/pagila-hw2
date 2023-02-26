/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH features AS(
    SELECT
        film_id, unnest(special_features) AS special_features
    FROM film
)


SELECT
    special_features, COUNT(*)
FROM features
GROUP BY 1
ORDER BY 1;

