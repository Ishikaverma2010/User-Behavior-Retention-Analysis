-- Repeat Purchase Rate
SELECT 
  COUNT(DISTINCT CASE WHEN purchase_count > 1 THEN user_id END) * 100.0 
  / COUNT(DISTINCT user_id) AS repeat_purchase_rate
FROM (
  SELECT user_id, COUNT(*) AS purchase_count
  FROM data
  WHERE action = 'purchase'
  GROUP BY user_id
) t;

-- Conversion by Session Duration
SELECT 
  CASE 
    WHEN session_duration < 60 THEN 'Low'
    WHEN session_duration BETWEEN 60 AND 180 THEN 'Medium'
    ELSE 'High'
  END AS session_bucket,
  COUNT(CASE WHEN action='purchase' THEN 1 END)*1.0 /
  COUNT(CASE WHEN action='view' THEN 1 END) AS conversion_rate
FROM data
GROUP BY session_bucket;
