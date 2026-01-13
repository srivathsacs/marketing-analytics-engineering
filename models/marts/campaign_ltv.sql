select
    source,
    campaign,
    sum(revenue) as lifetime_revenue
from {{ ref('int_orders_attributed') }}
group by 1, 2