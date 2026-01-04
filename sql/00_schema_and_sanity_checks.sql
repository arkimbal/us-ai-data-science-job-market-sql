-- ============================================
-- File: 00_schema_and_sanity_checks.sql
-- Purpose: Inspect schema and basic data health
-- ============================================

PRAGMA table_info(ai_jobs);

SELECT COUNT(*) AS total_job_postings
FROM ai_jobs;

SELECT
  MIN(posted_year) AS min_year,
  MAX(posted_year) AS max_year
FROM ai_jobs;

SELECT
  country,
  COUNT(*) AS num_jobs
FROM ai_jobs
GROUP BY country
ORDER BY num_jobs DESC
LIMIT 10;

SELECT
  remote_type,
  COUNT(*) AS num_jobs
FROM ai_jobs
GROUP BY remote_type
ORDER BY num_jobs DESC;

SELECT
  experience_level,
  COUNT(*) AS num_jobs
FROM ai_jobs
GROUP BY experience_level
ORDER BY num_jobs DESC;
