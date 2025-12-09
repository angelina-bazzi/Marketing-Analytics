WITH first_event AS (
SELECT
user_id,
MIN(created_at) AS first_visit
FROM `bigquery-public-data.thelook_ecommerce.events`
GROUP BY user_id
),
first_purchase AS (
SELECT
user_id,
MIN(created_at) AS first_purchase
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY user_id
)
SELECT
fe.user_id,
fe.first_visit,
fp.first_purchase,
TIMESTAMP_DIFF(fp.first_purchase, fe.first_visit, DAY) AS days_to_convert
FROM first_event fe
JOIN first_purchase fp USING(user_id)
ORDER BY days_to_convert
LIMIT 200;
