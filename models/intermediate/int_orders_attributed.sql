with orders as (
    select * from {{ ref('stg_orders') }}
),
user_sources as (
    select * from {{ ref('stg_user_sources') }}
)
select
    o.order_id,
    o.user_id,
    o.order_date,
    o.revenue,
    u.source,
    u.campaign
from orders o
left join user_sources u
  on o.user_id = u.user_id