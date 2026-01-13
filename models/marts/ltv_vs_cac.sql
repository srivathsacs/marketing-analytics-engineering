with ltv as (
    select * from {{ ref('campaign_ltv') }}
),
cac as (
    select
        date_trunc('month', date) as month,
        source,
        campaign,
        sum(spend) as spend
    from {{ ref('stg_marketing_spend') }}
    group by 1, 2, 3
),
customers as (
    select
        source,
        campaign,
        count(distinct user_id) as customers
    from {{ ref('mart_users_with_source') }}
    group by 1, 2
)
select
    l.source,
    l.campaign,
    l.lifetime_revenue / nullif(c.spend / nullif(u.customers,0),0) as ltv_to_cac
from ltv l
left join cac c
  on l.source = c.source and l.campaign = c.campaign
left join customers u
  on l.source = u.source and l.campaign = u.campaign