-- Write a query to calculate the average score for each survey, grouped by
-- survey name (I don't get what this means so I avg the _id).
SELECT 
    s.survey_name,
    AVG(r.response_id) AS average_score
FROM 
    surveys AS s
JOIN 
    questions AS q ON s.survey_id = q.survey_id
JOIN 
    responses AS r ON q.question_id = r.question_id
GROUP BY 
    s.survey_name;