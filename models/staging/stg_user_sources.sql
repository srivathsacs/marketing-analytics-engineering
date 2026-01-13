with source as (

    select *
    from {{ source('raw', 'user_sources') }}

),

renamed as (

    select
        user_id,
        lower(source) as source,
        campaign,
        signup_date as acquired_at
    from source

)

select *
from renamed