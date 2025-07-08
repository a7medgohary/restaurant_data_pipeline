{{ config(materialized='view') }}

SELECT
    CAST(res_id AS TEXT) AS res_id,
    CAST(zomato_events_event_photos_photo_photo_id AS TEXT) AS zomato_events_event_photos_photo_photo_id,
    CAST(zomato_events_event_photos_photo_url AS TEXT) AS zomato_events_event_photos_photo_url,
    CAST(zomato_events_event_photos_photo_thumb_url AS TEXT) AS zomato_events_event_photos_photo_thumb_url,
    CAST(zomato_events_event_photos_photo_type AS TEXT) AS zomato_events_event_photos_photo_type,
    CAST(zomato_events_event_photos_photo_order AS INTEGER) AS zomato_events_event_photos_photo_order,
    CAST(zomato_events_event_photos_photo_md5sum AS TEXT) AS zomato_events_event_photos_photo_md5sum,
    CAST(zomato_events_event_photos_photo_uuid AS TEXT) AS zomato_events_event_photos_photo_uuid
FROM {{ ref('raw_restaurant_data') }}
WHERE res_id IS NOT NULL
