-- Tables created for the examples of the value with foreign key to reference to other tables
-- Schemas
-- - `surveys` (survey_id, survey_name, created_at)
-- - `questions` (question_id, survey_id, question_text)
-- - `responses` (response_id, user_id, question_id, response_text)
-- - `users` (user_id, user_name, user_email)
CREATE TABLE IF NOT EXISTS users(
	user_id SERIAL PRIMARY KEY,
	user_name varchar(50),
	user_email varchar(50)
);
CREATE TABLE IF NOT EXISTS surveys(
	survey_id SERIAL PRIMARY KEY,
	survey_name varchar(50) NOT NULL,
	created_at DATE DEFAULT CURRENT_DATE
);
CREATE TABLE IF NOT EXISTS questions(
	question_id SERIAL PRIMARY KEY,
	survey_id INT,
	question_text VARCHAR(355),
	CONSTRAINT fk_survey
		FOREIGN KEY(survey_id)
		REFERENCES surveys(survey_id)
);

CREATE TABLE IF NOT EXISTS responses(
	response_id SERIAL PRIMARY KEY,
	user_id INT,
	question_id INT,
	response_text VARCHAR(1500),
	CONSTRAINT fk_question
		FOREIGN KEY (question_id)
		REFERENCES questions(question_id),
	CONSTRAINT fk_user
		FOREIGN KEY (user_id)
		REFERENCES users(user_id)
);
