select
    u.user_id,
    u.email,
    u.created_at,
    s.source,
    s.campaign
from {{ ref('stg_users') }} u
left join {{ ref('stg_user_sources') }} s
    on u.user_id = s.user_id