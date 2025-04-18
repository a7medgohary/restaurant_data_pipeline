SELECT
    `Restaurant ID` AS restaurant_id,
    `Restaurant Name` AS restaurant_name,
    `Country Code` AS country_code,
    `City` AS city,
    `Cuisines` AS cuisines,
    `Address` AS address,
    `Locality` AS locality,
    `Locality Verbose` AS locality_verbose,
    `Longitude` AS longitude,
    `Latitude` AS latitude,
    `Average Cost for two` AS average_cost_for_two,
    `Currency` AS currency,
    `Has Table Booking` AS has_table_booking,
    `Has Online delivery` AS has_online_delivery,
    `Is delivering now` AS is_delivering_now,
    `Switch to order menu` AS switch_to_order_menu,
    `Price range` AS price_range,
    `Aggregate rating` AS aggregate_rating,
    `Rating color` AS rating_color,
    `Rating text` AS rating_text,
    `Votes` AS votes
FROM {{ source('food_delivery', 'resturant') }}
