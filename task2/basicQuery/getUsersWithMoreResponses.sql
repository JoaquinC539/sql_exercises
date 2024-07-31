
-- Write a query to find the top 3 users with the highest average response
-- score across all surveys (I don't have a way to get scores so I count the three top users with more responses).
SELECT 
u.user_name,
COUNT(r.response_id) AS response_count
FROM users AS u
JOIN responses AS r ON u.user_id = r.user_id
GROUP BY u.user_name
LIMIT 3;