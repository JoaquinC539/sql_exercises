-- Create a view that displays the survey name, question text, response text, and
-- calculated score for each response.
CREATE OR REPLACE VIEW response_details AS
select s.survey_name,q.question_text,r.response_text,r.score from responses as r
join questions as q
on q.question_id=r.question_id
join surveys as s
on s.survey_id=q.survey_id;

select * from response_details;