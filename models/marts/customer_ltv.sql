select
  user_id,
  sum(revenue) as lifetime_revenue
from {{ ref('int_orders_attributed') }}
where user_id is not null
group by user_id
