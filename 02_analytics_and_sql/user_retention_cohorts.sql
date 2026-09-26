-- Monthly Cohort Retention Analysis (Compatible with PostgreSQL / BigQuery / Snowflake)
WITH user_first_touch AS (
    SELECT 
        user_id,
        DATE_TRUNC('month', MIN(activity_date)) AS cohort_month
    FROM user_activity_log
    GROUP BY 1
),
monthly_activity AS (
    SELECT DISTINCT
        user_id,
        DATE_TRUNC('month', activity_date) AS activity_month
    FROM user_activity_log
),
cohort_size AS (
    SELECT 
        cohort_month,
        COUNT(DISTINCT user_id) AS total_users
    FROM user_first_touch
    GROUP BY 1
)
SELECT 
    f.cohort_month,
    c.total_users,
    ROUND((EXTRACT(YEAR FROM m.activity_month) - EXTRACT(YEAR FROM f.cohort_month)) * 12 + 
          (EXTRACT(MONTH FROM m.activity_month) - EXTRACT(MONTH FROM f.cohort_month))) AS month_number,
    COUNT(DISTINCT m.user_id) AS active_users,
    ROUND(COUNT(DISTINCT m.user_id)::NUMERIC / c.total_users * 100, 2) AS retention_rate_percentage
FROM user_first_touch f
JOIN monthly_activity m ON f.user_id = m.user_id AND m.activity_month >= f.cohort_month
JOIN cohort_size c ON f.cohort_month = c.cohort_month
GROUP BY 1, 2, 3
ORDER BY 1, 3;
