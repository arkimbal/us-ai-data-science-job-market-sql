-- ============================================
-- File: 07_industry_snapshot_latest_year.sql
-- Question: Which US industries offer the highest typical salaries (latest year)?
-- ============================================

SELECT
  industry,
  COUNT(*) AS num_jobs,
  ROUND(AVG(salary_mid_usd), 2) AS avg_mid_salary
FROM ai_jobs_us
WHERE posted_year = (SELECT MAX(posted_year) FROM ai_jobs_us)
  AND industry IS NOT NULL
  AND salary_mid_usd IS NOT NULL
GROUP BY industry
HAVING COUNT(*) >= 50
ORDER BY avg_mid_salary DESC;
