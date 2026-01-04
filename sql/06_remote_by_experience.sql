-- ============================================
-- File: 06_remote_by_experience.sql
-- Question: In the latest year, how does remote work vary by experience level (US)?
-- ============================================

SELECT
  experience_level,
  remote_type,
  COUNT(*) AS num_jobs,
  ROUND(
    100.0 * COUNT(*) /
    SUM(COUNT(*)) OVER (PARTITION BY experience_level),
    2
  ) AS pct_within_experience
FROM ai_jobs_us
WHERE posted_year = (SELECT MAX(posted_year) FROM ai_jobs_us)
  AND experience_level IS NOT NULL
  AND remote_type IS NOT NULL
GROUP BY experience_level, remote_type
ORDER BY experience_level, num_jobs DESC;
