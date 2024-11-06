{{ config(
    materialized='table',
    schema='SAMS_SUBS',
    persist_docs={"relation": true, "columns": true}
) }}

select
    EmployeeID as EmployeeKey,
    EmployeeID,
    d.DateKey as DOB,
    FirstName,
    LastName
from {{ source('raw_ingest', 's_Employee') }} e
join {{ ref('dim_date')}} d
    on e.DOB = d.Date
