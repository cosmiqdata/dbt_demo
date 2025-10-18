{{ config(materialized='table') }}

select
  customer_id,
  customer_name,
  region_id,
  account_balance,
  comment
from {{ ref('stg_customer') }}
