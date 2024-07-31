-- Use a simple scoring algorithm where each answer has a weight, and the score is
-- the sum of weights.
-- Since I do not have a score column and is required here i add a ned column(score) to responses before the procedure
ALTER TABLE responses
ADD COLUMN score INT;
-- The procedure I made is that if the first letter is vocal has 2 of score else 1
CREATE OR REPLACE PROCEDURE calculate_response_score()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE responses
	SET score=CASE
		WHEN LOWER(SUBSTRING(response_text FROM 1 FOR 1)) IN ('a', 'e', 'i', 'o', 'u') THEN 2
		ELSE 1
	END;
END;
$$;
CALL calculate_response_score();
