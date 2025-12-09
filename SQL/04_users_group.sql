WITH users_group AS (
SELECT
id AS user_id,
DATE_TRUNC(DATE(created_at), MONTH) AS group_month
FROM `bigquery-public-data.thelook_ecommerce.users`
),
activity AS (
SELECT
user_id,
DATE_TRUNC(DATE(created_at), MONTH) AS active_month
FROM `bigquery-public-data.thelook_ecommerce.events`
)
SELECT
group_month,
active_month,
COUNT(DISTINCT activity.user_id) AS active_users
FROM users_group
JOIN activity USING(user_id)
GROUP BY 1,2
ORDER BY 1,2;
