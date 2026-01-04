-- ============================================
-- File: 01a_clean_view_us.sql
-- Purpose: US-only analytical view
-- ============================================

DROP VIEW IF EXISTS ai_jobs_us;

CREATE VIEW ai_jobs_us AS
SELECT *
FROM ai_jobs_clean
WHERE country = 'USA';
