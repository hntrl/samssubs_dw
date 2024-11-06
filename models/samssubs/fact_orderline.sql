{{ config(
    materialized='table',
    schema='SAMS_SUBS',
    persist_docs={"relation": true, "columns": true}
) }}

select 
    p.ProductKey as ProductKey,
    s.StoreKey as StoreKey,
    c.CustomerKey as CustomerKey,
    e.EmployeeKey as EmployeeKey,
    d.DateKey as OrderDateKey,
    ol.OrderNo as OrderNum,
    o.PointsEarned as PointsEarned,
    ol.Quantity as Quantity,
    (ol.LinePrice / ol.Quantity) as UnitPrice
from {{ source('raw_ingest', 's_OrderLineItem') }} ol
left join {{ source('raw_ingest', 's_Order') }} o
    on ol.OrderNo = o.OrderNo
left join {{ ref('dim_product') }} p
    on ol.ProductID = p.ProductID
left join {{ ref('dim_store') }} s
    on o.StoreID = s.StoreID
left join {{ ref('dim_customer') }} c
    on o.CustomerID = c.CustomerID
left join {{ ref('dim_employee') }} e
    on o.EmployeeID = e.EmployeeID
left join {{ ref('dim_date') }} d
    on o.OrderDate = d.Date
