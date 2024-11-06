{{ config(
    materialized='table',
    schema='SAMS_SUBS',
    persist_docs={"relation": true, "columns": true},
) }}

-- No source data exists for inventory information, but we should still define an empty schema
select
    0 as EmployeeKey,
    0 as DateKey, 
    0 as StoreKey,
    0 as ProductKey,
    0 as QuantityChange,
where 1=0
