with src as (
  select * from {{ source('tpch','CUSTOMER') }}
),
dedup AS (
  SELECT *
  FROM src
  WHERE C_ACCTBAL > 8000
  QUALIFY RANK() OVER (PARTITION BY C_NAME ORDER BY  C_CUSTKEY DESC) = 1
)
SELECT 
  C_CUSTKEY:: STRING      as customer_id,
  C_NAME         as customer_name,
  C_NATIONKEY    as region_id,
  C_ACCTBAL      as account_balance,
  C_COMMENT      as comment
FROM 
  dedup