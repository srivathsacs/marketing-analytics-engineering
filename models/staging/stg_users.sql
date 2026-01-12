select
  user_id,
  email,
  signup_date
from {{ source('raw', 'users') }}