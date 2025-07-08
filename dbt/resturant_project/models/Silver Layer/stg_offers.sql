{{ config(materialized='view') }}

SELECT
    CAST(res_id AS TEXT) AS res_id,
    CAST(offers_offer_offer_id AS TEXT) AS offers_offer_offer_id,
    CAST(offers_offer_offer_text AS TEXT) AS offers_offer_offer_text,
    CAST(offers_offer_offer_type AS TEXT) AS offers_offer_offer_type,
    CAST(offers_offer_type AS TEXT) AS offers_offer_type,
    CAST(offers_offer_type_code AS TEXT) AS offers_offer_type_code,
    CAST(offers_offer_added_by AS TEXT) AS offers_offer_added_by,
    CAST(offers_offer_applicable_on AS TEXT) AS offers_offer_applicable_on,
    CAST(offers_offer_date_added AS TIMESTAMP) AS offers_offer_date_added,
    CAST(offers_offer_start_date AS TIMESTAMP) AS offers_offer_start_date,
    CAST(offers_offer_end_date AS TIMESTAMP) AS offers_offer_end_date,
    CAST(offers_offer_friendly_start_date AS TEXT) AS offers_offer_friendly_start_date,
    CAST(offers_offer_friendly_end_date AS TEXT) AS offers_offer_friendly_end_date,
    CASE WHEN offers_offer_is_active = 1 THEN TRUE ELSE FALSE END AS offers_offer_is_active,
    CASE WHEN offers_offer_is_editable = 1 THEN TRUE ELSE FALSE END AS offers_offer_is_editable,
    CASE WHEN offers_offer_is_valid = 1 THEN TRUE ELSE FALSE END AS offers_offer_is_valid,
    CAST(offers_offer_status AS TEXT) AS offers_offer_status,
    CAST(offers_offer_impressions AS BIGINT) AS offers_offer_impressions,
    CAST(offers_offer_voucher_id AS TEXT) AS offers_offer_voucher_id,
    CAST(offers_offer_disclaimer AS TEXT) AS offers_offer_disclaimer,
    CAST(offers_offer_share_url AS TEXT) AS offers_offer_share_url,
    CAST(offers_offer_restaurant_list AS TEXT) AS offers_offer_restaurant_list,
    CAST(offers_offer_restaurants AS TEXT) AS offers_offer_restaurants
FROM {{ ref('raw_restaurant_data') }}
WHERE res_id IS NOT NULL 
