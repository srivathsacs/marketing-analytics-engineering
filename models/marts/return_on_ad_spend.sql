with revenue as (
    select * from {{ ref('revenue') }}
),
spend as (
    select
        date_trunc('month', date) as month,
        sum(spend) as spend
    from {{ ref('stg_marketing_spend') }}
    group by 1
)
select
    r.month,
    r.revenue / nullif(s.spend, 0) as roas
from revenue r
left join spend s
  on r.month = s.month