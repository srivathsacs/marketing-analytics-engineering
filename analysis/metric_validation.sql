-- =========================================================
-- Metric Validation & Sanity Checks
-- =========================================================
-- These queries are intended to be run manually after dbt
-- builds to validate business correctness of key metrics.
-- =========================================================


-- 1. User distribution by acquisition source
-- Sanity check: user counts should look reasonable and non-zero
select
    source,
    count(*) as users
from mart_users_with_source
group by 1
order by users desc;


-- 2. Check for orphaned users after joins
-- Sanity check: should return 0 rows
select
    count(*) as orphaned_users
from mart_users_with_source u
left join mart_users m
    on u.user_id = m.user_id
where m.user_id is null;


-- 3. Channel-level user counts
-- Sanity check: validate aggregation grain
select
    source,
    campaign,
    users
from mart_channel_performance
order by users desc;


-- 4. Global user count consistency
-- Sanity check: totals should align across core marts
select
    (select count(*) from mart_users) as total_users,
    (select count(distinct user_id) from mart_users_with_source) as users_with_source;