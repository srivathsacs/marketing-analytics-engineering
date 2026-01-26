select
  avg(lifetime_revenue) as avg_customer_ltv
from {{ ref('customer_ltv') }}
