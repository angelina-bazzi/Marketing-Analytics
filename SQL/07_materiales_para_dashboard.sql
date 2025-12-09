-- Tabla agregada para consumir desde Tableau/Power BI (fecha, canal, revenue, orders, users)
SELECT
DATE(o.created_at) AS date,
COALESCE(e.traffic_source, 'unknown') AS traffic_source,
COUNT(DISTINCT o.order_id) AS orders,
SUM(oi.sale_price) AS revenue,
COUNT(DISTINCT o.user_id) AS unique_buyers
FROM `bigquery-public-data.thelook_ecommerce.orders` o
JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
USING(order_id)
LEFT JOIN `bigquery-public-data.thelook_ecommerce.events` e
ON o.user_id = e.user_id
GROUP BY 1,2
ORDER BY 1 DESC;
