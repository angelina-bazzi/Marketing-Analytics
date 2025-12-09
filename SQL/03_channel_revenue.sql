SELECT
COALESCE(e.traffic_source, 'unknown') AS traffic_source,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM(oi.sale_price) AS total_revenue,
SAFE_DIVIDE(SUM(oi.sale_price), COUNT(DISTINCT o.order_id)) AS avg_ticket
FROM `bigquery-public-data.thelook_ecommerce.events` e
JOIN `bigquery-public-data.thelook_ecommerce.orders` o
ON e.user_id = o.user_id
JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
ON o.order_id = oi.order_id
