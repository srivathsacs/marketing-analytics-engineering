with source as (
    select * from {{ source('raw', 'marketing_spend') }}
)
select
    date,
    lower(source) as source,
    campaign,
    spend
from source