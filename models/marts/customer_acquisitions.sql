select
    date_trunc('month', created_at) as month,
    count(distinct user_id) as customers
from {{ ref('mart_users') }}
group by 1