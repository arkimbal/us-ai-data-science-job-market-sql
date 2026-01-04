-- ============================================
-- File: 04_remote_work_trends.sql
-- Question: How did US remote/hybrid/onsite distribution change over time?
-- ============================================

WITH year_totals AS (
  SELECT
    posted_year,
    COUNT(*) AS total_jobs
  FROM ai_jobs_us
  WHERE remote_type IS NOT NULL
  GROUP BY posted_year
)
SELECT
  a.posted_year,
  a.remote_type,
  COUNT(*) AS num_jobs,
  ROUND(100.0 * COUNT(*) / t.total_jobs, 2) AS pct_jobs
FROM ai_jobs_us a
JOIN year_totals t
  ON a.posted_year = t.posted_year
WHERE a.remote_type IS NOT NULL
GROUP BY a.posted_year, a.remote_type, t.total_jobs
ORDER BY a.posted_year, num_jobs DESC;
