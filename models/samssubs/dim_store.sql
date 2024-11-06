{{ config(
    materialized='table',
    schema='SAMS_SUBS',
    persist_docs={"relation": true, "columns": true}
) }}

select 
    StoreID as StoreKey,
    StoreID,
    Address as StreetAddress,
    City,
    State,
    Zipcode
from {{ source('raw_ingest', 's_Store') }}