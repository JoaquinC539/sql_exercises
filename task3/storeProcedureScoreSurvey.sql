-- Write a stored procedure that calculates the score for a survey based on responses.ç
-- Using based in the logic and query of Task2 getScorePerSurvery.sql
-- Set as function since it is a query and there is not data to calculate the score
create or replace function get_scores_per_survey(
	survey INT
)
returns table (survey_name varchar(50), average_score NUMERIC) 
language plpgsql
as $$
begin
	RETURN QUERY
	SELECT 
    s.survey_name,
    AVG(r.response_id) AS average_score
	FROM 
		surveys AS s
	JOIN 
		questions AS q ON s.survey_id = q.survey_id
	JOIN 
		responses AS r ON q.question_id = r.question_id
	WHERE s.survey_id=survey
	
	GROUP BY 
		s.survey_name;
end;
$$;

SELECT * FROM get_scores_per_survey(1);


