{{ config(materialized='view') }}

SELECT
    CAST(res_id AS TEXT) AS res_id,
    CASE WHEN has_online_delivery = 1 THEN TRUE ELSE FALSE END AS has_online_delivery,
    CASE WHEN has_table_booking = 1 THEN TRUE ELSE FALSE END AS has_table_booking,
    CASE WHEN is_delivering_now = 1 THEN TRUE ELSE FALSE END AS is_delivering_now,
    CASE WHEN switch_to_order_menu = 1 THEN TRUE ELSE FALSE END AS switch_to_order_menu
FROM {{ ref('raw_restaurant_data') }}
WHERE res_id IS NOT NULL
