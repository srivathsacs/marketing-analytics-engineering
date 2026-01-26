with spend as (
  select sum(spend) as total_spend
  from {{ ref('stg_marketing_spend') }}
),
customers as (
  select count(distinct user_id) as customers
  from {{ ref('mart_users_with_source') }}
)
select
  total_spend / nullif(customers, 0) as cac
from spend, customers
