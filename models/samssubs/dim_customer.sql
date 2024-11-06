{{ config(
    materialized='table',
    schema='SAMS_SUBS',
    persist_docs={"relation": true, "columns": true}
) }}

select
    CustomerID as CustomerKey,
    CustomerID,
    d.DateKey as DOB,
    FirstName,
    LastName,
    PhoneNumber
from {{ source('raw_ingest', 's_Customer') }} c
join {{ ref('dim_date')}} d
    on c.DOB = d.Date
