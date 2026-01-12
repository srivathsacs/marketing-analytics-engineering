select
    user_id,
    lower(source)   as source,
    campaign,
    signup_date
from {{ source('raw', 'user_sources') }}