WITH cleaned AS (
    SELECT 
        restaurant_id,
        country_code,
        city,
        address,
        locality,
        locality_verbose,
        longitude,
        latitude
    FROM {{ ref('stg_resturant') }}
)
SELECT *
FROM cleaned
WHERE restaurant_id IS NOT NULL
