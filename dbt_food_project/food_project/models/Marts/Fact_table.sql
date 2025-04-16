WITH cleaned AS (
    SELECT 
        restaurant_id,
        restaurant_name,
        country_code,
        average_cost_for_two,
        currency,
        has_table_booking,
        has_online_delivery,
        is_delivering_now,
        switch_to_order_menu,
        price_range
    FROM {{ ref('stg_resturant') }}
)
SELECT *
FROM cleaned
