-- ============================================
-- File: 03_salary_trends.sql
-- Question: How did US salaries change over time?
-- Metric: Average min/mid/max salary per year
-- ============================================

SELECT
  posted_year,
  ROUND(AVG(salary_min_usd), 2) AS avg_min_salary,
  ROUND(AVG(salary_mid_usd), 2) AS avg_mid_salary,
  ROUND(AVG(salary_max_usd), 2) AS avg_max_salary
FROM ai_jobs_us
WHERE salary_min_usd IS NOT NULL
  AND salary_mid_usd IS NOT NULL
  AND salary_max_usd IS NOT NULL
GROUP BY posted_year
ORDER BY posted_year;
