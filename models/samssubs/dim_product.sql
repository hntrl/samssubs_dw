{{ config(
    materialized='table',
    schema='SAMS_SUBS',
    persist_docs={"relation": true, "columns": true}
) }}

select
    p.ProductID as ProductKey,
    p.ProductID,
    p.Name as ProductName,
    p.Cost as UnitPrice,
    '' as Description, -- description is not available in the source
    s.Length as Length,
    s.BreadType as BreadType
from {{ source('raw_ingest', 's_Product') }} p
left join {{ source('raw_ingest', 's_Sandwich') }} s
    on p.ProductID = s.ProductID
