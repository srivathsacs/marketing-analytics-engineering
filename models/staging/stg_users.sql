with source as (

    select *
    from {{ source('raw', 'users') }}

),

renamed as (

    select
        user_id,
        email,
        signup_date as created_at
    from source

)

select *
from renamed