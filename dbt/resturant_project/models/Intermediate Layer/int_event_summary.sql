{{ config(materialized='table') }}

WITH events_data AS (
    SELECT * FROM {{ ref('stg_events') }}
),

event_photos AS (
    SELECT * FROM {{ ref('stg_event_photos') }}
),

events_with_photos AS (
    SELECT 
        e.res_id,
        e.zomato_events_event_event_id,
        e.zomato_events_event_title,
        e.zomato_events_event_category_name,
        e.zomato_events_event_start_date,
        e.zomato_events_event_end_date,
        e.zomato_events_event_is_active,
        
        -- Count photos per event
        COUNT(ep.zomato_events_event_photos_photo_photo_id) AS photo_count,
        
        -- Event duration
        (e.zomato_events_event_end_date - e.zomato_events_event_start_date) AS event_duration_days,
        
        -- Event status
        CASE 
            WHEN e.zomato_events_event_end_date < CURRENT_DATE THEN 'Past'
            WHEN e.zomato_events_event_start_date > CURRENT_DATE THEN 'Upcoming'
            ELSE 'Ongoing'
        END AS event_status
        
    FROM events_data e
    LEFT JOIN event_photos ep 
        ON e.res_id = ep.res_id 
        AND e.zomato_events_event_event_id = ep.zomato_events_event_photos_photo_event_id  -- تأكد إن ده فعلاً العمود الصح في الصور
    WHERE e.zomato_events_event_is_active = TRUE
    GROUP BY 
        e.res_id,
        e.zomato_events_event_event_id,
        e.zomato_events_event_title,
        e.zomato_events_event_category_name,
        e.zomato_events_event_start_date,
        e.zomato_events_event_end_date,
        e.zomato_events_event_is_active
)

SELECT * FROM events_with_photos
