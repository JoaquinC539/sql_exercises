-- Set of basic indexed to optimze the performance for Joins
CREATE INDEX idx_survey
ON questions(survey_id);
CREATE INDEX idx_questions
ON responses(question_id);
CREATE INDEX idx_user
ON responses(user_id);