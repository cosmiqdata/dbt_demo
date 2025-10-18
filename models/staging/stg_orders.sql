with src as (
  select * from {{ source('tpch','ORDERS') }}
)
select
  O_ORDERKEY     as order_id,
  O_CUSTKEY      as customer_id,
  try_to_date(O_ORDERDATE) as order_date,
  O_TOTALPRICE   as order_total
from src
