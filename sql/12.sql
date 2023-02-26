/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

WITH sf AS(
    SELECT
        title, unnest(special_features) AS specft
    FROM film
),

bts AS(
    SELECT
        title
    FROM sf
    WHERE specft = 'Behind the Scenes'
),

trail AS(
    SELECT
        title
    FROM sf
    WHERE specft = 'Trailers'
),

btsandtrail AS(
    SELECT
        title
    FROM bts
    JOIN trail
    USING(title)
)

SELECT
    title
FROM btsandtrail
ORDER BY 1;
