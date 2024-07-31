-- OPTIMIZED qUERY
SELECT 
	s.survey_name,
    q.question_text,
    r.response_text FROM responses AS r
JOIN questions AS q ON r.question_id=q.question_id
JOIN surveys AS s ON q.survey_id=s.survey_id;