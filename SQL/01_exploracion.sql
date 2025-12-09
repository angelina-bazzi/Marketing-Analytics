-- Exploración básica de tablas y conteos
SELECT
'events' AS table_name,
COUNT(*) AS `Rows`
FROM `bigquery-public-data.thelook_ecommerce.events`
UNION ALL
SELECT
'users', COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.users`
UNION ALL
SELECT
'orders', COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.orders`
UNION ALL
SELECT
'order_items', COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.order_items`
UNION ALL
SELECT
'products', COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.products`;