-- Write a query to determine the distribution of responses for each question
-- in a specific survey (e.g., count of each response).
-- Run specific distribution of responses using a survey id as filter (understand tha distribution is the number of repetitons (count)
-- by question
SELECT 
    q.question_id,
    q.survey_id,
    COUNT(r.response_id) AS response_count
FROM 
    questions  AS q
JOIN 
    responses AS r ON q.question_id = r.question_id
WHERE 
    q.survey_id = 1 --Survey filter
GROUP BY 
    q.question_id,q.survey_id
ORDER BY 
    q.question_id