{{ config(materialized='view') }}

WITH casted_data AS (
    SELECT
        CAST(res_id AS TEXT) AS res_id,
        CAST(res_name AS TEXT) AS res_name,
        CAST(cuisines AS TEXT) AS cuisines,
        CAST(currency AS TEXT) AS currency_raw,
        CAST(average_cost_for_two AS NUMERIC) AS average_cost_for_two,
        CAST(price_range AS BIGINT) AS price_range,
        CAST(establishment_types AS TEXT) AS establishment_types,
        CAST(apikey AS TEXT) AS apikey
    FROM {{ ref('raw_restaurant_data') }}
    WHERE res_id IS NOT NULL
),

currency_mapped AS (
    SELECT
        *,
        CASE 
            WHEN currency_raw = '$' THEN 'USD'
            WHEN currency_raw = 'Rs.' THEN 'INR'
            WHEN currency_raw = 'AED' THEN 'AED'
            WHEN currency_raw = 'QR' THEN 'QAR'
            WHEN currency_raw = 'NZ$' THEN 'NZD'
            WHEN currency_raw = 'TL' THEN 'TRY'
            WHEN currency_raw = '£' THEN 'GBP'
            WHEN currency_raw = 'R$' THEN 'BRL'
            WHEN currency_raw = 'LKR' THEN 'LKR'
            WHEN currency_raw = 'R' THEN 'ZAR'
            WHEN currency_raw = 'P' THEN 'BWP'
            WHEN currency_raw = 'IDR' THEN 'IDR'
            ELSE 'UNKNOWN'
        END AS currency
    FROM casted_data
),

currency_rates AS (
    SELECT * FROM (
        VALUES
            ('USD', 1.00),
            ('INR', 1/85.69),
            ('AED', 1/3.6725),
            ('QAR', 1/3.64),
            ('NZD', 1/1.6459),
            ('TRY', 0.02513),
            ('GBP', 1/1.3703),
            ('BRL', 0.18314),
            ('LKR', 0.00277),
            ('ZAR', 0.055),
            ('BWP', 0.072),
            ('IDR', 0.000062)
    ) AS r(currency, rate_usd)
),

final AS (
    SELECT
        c.res_id,
        c.res_name,
        c.cuisines,
        c.currency,
        c.average_cost_for_two,
        ROUND((c.average_cost_for_two * r.rate_usd)::NUMERIC, 2) AS avg_cost_usd,
        c.price_range,
        c.establishment_types,
        c.apikey
    FROM currency_mapped AS c
    LEFT JOIN currency_rates AS r
        ON c.currency = r.currency
)

SELECT
    *,
    CASE 
        WHEN price_range = 1 THEN 'Low'
        WHEN price_range = 2 THEN 'Medium'
        WHEN price_range = 3 THEN 'High'
        WHEN price_range = 4 THEN 'Luxury'
        ELSE 'Unknown'
    END AS price_category
FROM final
