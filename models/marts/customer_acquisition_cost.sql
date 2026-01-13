with spend as (
    select
        date_trunc('month', date) as month,
        sum(spend) as spend
    from {{ ref('stg_marketing_spend') }}
    group by 1
),
customers as (
    select * from {{ ref('customer_acquisitions') }}
)
select
    s.month,
    s.spend / nullif(c.customers, 0) as cac
from spend s
left join customers c
  on s.month = c.month