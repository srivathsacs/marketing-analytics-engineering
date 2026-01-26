select
  l.avg_customer_ltv,
  c.cac,
  l.avg_customer_ltv / nullif(c.cac, 0) as ltv_to_cac
from {{ ref('avg_customer_ltv') }} l
cross join {{ ref('blended_cac') }} c
