-- ============================================
-- File: 01_clean_view.sql
-- Purpose: Create clean, analysis-ready view
-- ============================================

DROP VIEW IF EXISTS ai_jobs_clean;

CREATE VIEW ai_jobs_clean AS
SELECT
  job_id,
  TRIM(job_title) AS job_title,
  TRIM(company_type) AS company_type,
  TRIM(industry) AS industry,
  TRIM(country) AS country,
  TRIM(city) AS city,
  TRIM(remote_type) AS remote_type,
  TRIM(experience_level) AS experience_level,
  TRIM(employment_type) AS employment_type,
  TRIM(company_size) AS company_size,
  min_experience_years,
  salary_min_usd,
  salary_max_usd,
  (salary_min_usd + salary_max_usd) / 2.0 AS salary_mid_usd,
  posted_year
FROM ai_jobs;
