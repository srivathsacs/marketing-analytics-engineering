with source as (
    select * from {{ source('raw', 'orders') }}
)
select
ID            as order_id,
USER_ID       as user_id,
CUSTOMER_NAME as customer_name,
PRODUCT       as product,
AMOUNT        as revenue,
ORDER_DATE    as order_date

from source