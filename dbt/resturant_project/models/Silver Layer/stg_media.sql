{{ config(materialized='view') }}

SELECT
    CAST(res_id AS TEXT) AS res_id,
    CAST(url AS TEXT) AS url,
    CAST(deeplink AS TEXT) AS deeplink,
    CAST(book_url AS TEXT) AS book_url,
    CAST(menu_url AS TEXT) AS menu_url,
    CAST(order_deeplink AS TEXT) AS order_deeplink,
    CAST(order_url AS TEXT) AS order_url,
    CAST(photos_url AS TEXT) AS photos_url,
    CAST(events_url AS TEXT) AS events_url,
    CAST(featured_image AS TEXT) AS featured_image,
    CAST(thumb AS TEXT) AS thumb
FROM {{ ref('raw_restaurant_data') }}
WHERE res_id IS NOT NULL
