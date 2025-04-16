WITH base_data AS (
    SELECT
        CAST(restaurant_id AS STRING) AS restaurant_id,
        restaurant_name,
        country_code,
        CAST(average_cost_for_two AS FLOAT64) AS average_cost_for_two,
        currency,
        has_table_booking,
        has_online_delivery,
        is_delivering_now,
        switch_to_order_menu,
        CAST(price_range AS INT64) AS price_range,

        -- Classifying restaurants based on Average Cost for One (dividing by 2 for Average Cost for Two).
        CASE 
            WHEN (CAST(average_cost_for_two AS FLOAT64) / 2) < 500 THEN 'Cheap'
            WHEN (CAST(average_cost_for_two AS FLOAT64) / 2) BETWEEN 500 AND 2000 THEN 'Moderate'
            WHEN (CAST(average_cost_for_two AS FLOAT64) / 2) BETWEEN 2000 AND 5000 THEN 'Expensive'
            ELSE 'Luxury'
        END AS price_category,

        -- Categorize the price range into general categories.
        CASE
            WHEN CAST(price_range AS INT64) = 1 THEN 'Budget'
            WHEN CAST(price_range AS INT64) = 2 THEN 'Affordable'
            WHEN CAST(price_range AS INT64) = 3 THEN 'Mid-range'
            WHEN CAST(price_range AS INT64) = 4 THEN 'Premium'
            ELSE 'Undefined'
        END AS price_range_category

    FROM {{ ref('Fact_table') }}
)

SELECT
    restaurant_id,
    restaurant_name,
    country_code,
    average_cost_for_two / 2 AS average_cost_for_one,
    currency,
    has_table_booking,
    has_online_delivery,
    is_delivering_now,
    switch_to_order_menu,
    price_range,
    price_category,
    has_online_delivery AS delivery_status,
    is_delivering_now AS active_delivery_status,
    price_range_category
FROM base_data
