select
    source,
    campaign,
    count(*) as users
from {{ ref('mart_users_with_source') }}
group by 1, 2