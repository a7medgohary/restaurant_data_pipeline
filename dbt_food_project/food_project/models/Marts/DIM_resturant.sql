WITH cleaned AS (
    SELECT 
        restaurant_id,
        restaurant_name,
        cuisines,
        aggregate_rating,
        rating_color,
        rating_text,
        votes
    FROM {{ ref('stg_resturant') }}
)
SELECT *
FROM cleaned
WHERE restaurant_id IS NOT NULL
