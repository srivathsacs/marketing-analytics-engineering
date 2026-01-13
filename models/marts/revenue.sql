select
    date_trunc('month', order_date) as month,
    sum(revenue) as revenue
from {{ ref('int_orders_attributed') }}
group by 1