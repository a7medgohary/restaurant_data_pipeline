{{ config(materialized='table') }}

WITH offers_data AS (
    SELECT * FROM {{ ref('stg_offers') }}
),

active_offers AS (
    SELECT 
        res_id,
        offers_offer_offer_id,
        offers_offer_offer_text,
        offers_offer_offer_type,
        offers_offer_start_date,
        offers_offer_end_date,
        offers_offer_is_active,
        offers_offer_impressions,

        -- Calculate offer duration
        (CAST(offers_offer_end_date AS DATE) - CAST(offers_offer_start_date AS DATE)) AS offer_duration_days,

        -- Categorize offer type
        CASE 
            WHEN LOWER(offers_offer_offer_type) LIKE '%discount%' THEN 'Discount'
            WHEN LOWER(offers_offer_offer_type) LIKE '%delivery%' THEN 'Delivery'
            WHEN LOWER(offers_offer_offer_type) LIKE '%combo%' THEN 'Combo'
            ELSE 'Other'
        END AS offer_category

    FROM offers_data
    WHERE --CAST(offers_offer_is_active AS TEXT) ILIKE 't'
       CAST(offers_offer_end_date AS DATE) >= CURRENT_DATE
)

SELECT * FROM active_offers
