-- mart_users
--
-- Grain: one row per user
--
-- Purpose:
-- Core user dimension table used across downstream analytics.
-- Provides a stable, analytics-ready representation of users
-- for metrics such as LTV, CAC, and cohort analysis.
--
-- Key assumptions:
-- - user_id is unique and non-null
-- - User attributes are sourced from cleaned staging models
-- - This table represents the latest known state of each user


select
    *
from {{ ref('stg_users') }}