with orders as (
    select * from {{ ref('stg_orders') }}
),
users as (
    select * from {{ ref('stg_users') }}
),
user_sources as (
    select * from {{ ref('stg_user_sources') }}
)
select
    o.order_id,
    o.customer_name,
    o.order_date,
    o.revenue,
    s.source,
    s.campaign
from orders o
left join users u
    on o.USER_ID = u.USER_ID
left join user_sources s
    on u.user_id = s.user_id