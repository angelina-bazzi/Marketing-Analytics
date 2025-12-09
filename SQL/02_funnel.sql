WITH base AS (
SELECT
user_id,
event_type,
DATE(created_at) AS date
FROM `bigquery-public-data.thelook_ecommerce.events`
)

SELECT
COUNTIF(event_type = 'view') AS views,
COUNTIF(event_type = 'add_to_cart') AS add_to_carts,
COUNTIF(event_type = 'purchase') AS purchases,
SAFE_DIVIDE(COUNTIF(event_type = 'add_to_cart'), COUNTIF(event_type = 'view')) AS view_to_cart_rate,
SAFE_DIVIDE(COUNTIF(event_type = 'purchase'), COUNTIF(event_type = 'add_to_cart')) AS cart_to_purchase_rate,
SAFE_DIVIDE(COUNTIF(event_type = 'purchase'), COUNTIF(event_type = 'view')) AS overall_conversion_rate
FROM base;
