-- ============================================
-- File: 05_salary_by_experience.sql
-- Question: How do US salaries differ by experience level over time?
-- ============================================

SELECT
  posted_year,
  experience_level,
  ROUND(AVG(salary_mid_usd), 2) AS avg_mid_salary
FROM ai_jobs_us
WHERE salary_mid_usd IS NOT NULL
  AND experience_level IS NOT NULL
GROUP BY posted_year, experience_level
ORDER BY posted_year, avg_mid_salary DESC;
