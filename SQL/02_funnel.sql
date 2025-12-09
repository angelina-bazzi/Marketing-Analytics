 
SELECT
COUNTIF(event_type = 'home') AS views,
COUNTIF(event_type = 'cart') AS add_to_carts,
COUNTIF(event_type = 'purchase') AS purchases,
SAFE_DIVIDE(COUNTIF(event_type = 'cart'), COUNTIF(event_type = 'home')) AS view_to_cart_rate,
SAFE_DIVIDE(COUNTIF(event_type = 'purchase'), COUNTIF(event_type = 'cart')) AS cart_to_purchase_rate,
SAFE_DIVIDE(COUNTIF(event_type = 'purchase'), COUNTIF(event_type = 'home')) AS overall_conversion_rate
FROM `bigquery-public-data.thelook_ecommerce.events`;
