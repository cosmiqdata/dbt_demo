{{ config(materialized='table') }}

select
  o.customer_id,
  count(*)                       as order_count,
  sum(o.order_total)             as order_total_amount,
  min(o.order_date)              as first_order_date,
  max(o.order_date)              as last_order_date
from {{ ref('stg_orders') }} o
group by 1
