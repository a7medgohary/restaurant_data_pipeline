SELECT *
FROM {{ source('food_delivery', 'country_code') }}