{{ config(materialized='view') }}

WITH casted_data AS (
    SELECT
        CAST(res_id AS TEXT) AS res_id,
        CAST(location_address AS TEXT) AS location_address,
        CAST(location_city AS TEXT) AS location_city,
        CAST(location_city_id AS INTEGER) AS location_city_id,
        CAST(location_country_id AS INTEGER) AS location_country_id,
        CAST(location_latitude AS DOUBLE PRECISION) AS location_latitude,
        CAST(location_longitude AS DOUBLE PRECISION) AS location_longitude,
        CAST(location_locality AS TEXT) AS location_locality,
        CAST(location_locality_verbose AS TEXT) AS location_locality_verbose,
        CAST(location_zipcode AS TEXT) AS location_zipcode
    FROM {{ ref('raw_restaurant_data') }}
    WHERE location_address IS NOT NULL
)

SELECT *
FROM casted_data
