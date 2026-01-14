with source as (
    select * from {{ source('raw', 'orders') }}
)
select
    "id"            as order_id,
    "customer_name" as customer_name,
    "product"       as product,
    "amount"        as revenue,
    "order_date"    as order_date
from source