-- ============================================
-- File: 02_demand_over_time.sql
-- Question: How many US AI & Data Science jobs were posted each year?
-- ============================================

SELECT
  posted_year,
  COUNT(*) AS num_jobs
FROM ai_jobs_us
GROUP BY posted_year
ORDER BY posted_year;
