with source as (
    select * from {{ source('raw', 'orders') }}
)
select
    order_id,
    user_id,
    order_date,
    revenue
from source