# Write your MySQL query statement below
WITH tmp AS (
SELECT
    question_id,
    SUM(CASE WHEN answer_id IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*) AS rate
FROM SurveyLog
GROUP BY question_id)
SELECT
question_id AS survey_log
FROM tmp
WHERE rate IN (SELECT MAX(rate) FROM tmp);
