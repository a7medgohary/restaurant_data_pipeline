{{ config(materialized='view') }}

SELECT
    CAST(res_id AS TEXT) AS res_id,
    CAST(zomato_events_event_event_id AS TEXT) AS zomato_events_event_event_id,
    CAST(zomato_events_event_title AS TEXT) AS zomato_events_event_title,
    CAST(zomato_events_event_description AS TEXT) AS zomato_events_event_description,
    CAST(zomato_events_event_event_category AS TEXT) AS zomato_events_event_event_category,
    CAST(zomato_events_event_event_category_name AS TEXT) AS zomato_events_event_event_category_name,
    CAST(zomato_events_event_date_added AS TIMESTAMP) AS zomato_events_event_date_added,
    CAST(zomato_events_event_start_date AS DATE) AS zomato_events_event_start_date,
    CAST(zomato_events_event_end_date AS DATE) AS zomato_events_event_end_date,
    CAST(zomato_events_event_start_time AS TIME) AS zomato_events_event_start_time,
    CAST(zomato_events_event_end_time AS TIME) AS zomato_events_event_end_time,
    CAST(zomato_events_event_display_date AS TEXT) AS zomato_events_event_display_date,
    CAST(zomato_events_event_display_time AS TEXT) AS zomato_events_event_display_time,
    CAST(zomato_events_event_friendly_start_date AS TEXT) AS zomato_events_event_friendly_start_date,
    CAST(zomato_events_event_friendly_end_date AS TEXT) AS zomato_events_event_friendly_end_date,
    CASE WHEN zomato_events_event_is_active = 1 THEN TRUE ELSE FALSE END AS zomato_events_event_is_active,
    CASE WHEN zomato_events_event_is_end_time_set = 1 THEN TRUE ELSE FALSE END AS zomato_events_event_is_end_time_set,
    CASE WHEN zomato_events_event_is_valid = 1 THEN TRUE ELSE FALSE END AS zomato_events_event_is_valid,
    CAST(zomato_events_event_book_link AS TEXT) AS zomato_events_event_book_link,
    CAST(zomato_events_event_share_url AS TEXT) AS zomato_events_event_share_url,
    CAST(zomato_events_event_disclaimer AS TEXT) AS zomato_events_event_disclaimer,
    CAST(zomato_events_event_restaurants AS TEXT) AS zomato_events_event_restaurants
FROM {{ ref('raw_restaurant_data') }}
WHERE res_id IS NOT NULL
