-- mart_channel_performance
--
-- Grain: one row per marketing channel per reporting period
--
-- Purpose:
-- Aggregated marketing performance metrics by acquisition channel.
-- Designed for high-level reporting and decision-making by
-- marketing and growth stakeholders.
--
-- Key assumptions:
-- - Marketing spend is reported at the channel level
-- - Revenue attribution follows a last-touch model
-- - Metrics are aggregated consistently across sources


select
    source,
    campaign,
    count(*) as users
from {{ ref('mart_users_with_source') }}
group by 1, 2