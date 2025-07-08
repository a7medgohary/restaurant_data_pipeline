{{ config(materialized='view') }}

WITH casted_data AS (
    SELECT
        CAST(res_id AS TEXT) AS res_id,
        CAST(user_rating_aggregate_rating AS DOUBLE PRECISION) AS user_rating_aggregate_rating,
        CAST(user_rating_rating_color AS TEXT) AS user_rating_rating_color,
        CAST(user_rating_rating_text AS TEXT) AS user_rating_rating_text,
        CAST(user_rating_votes AS BIGINT) AS user_rating_votes
    FROM {{ ref('raw_restaurant_data') }}
    WHERE user_rating_aggregate_rating IS NOT NULL
)

SELECT *
FROM casted_data
