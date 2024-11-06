{{ config(
    materialized='table',
    schema='SAMS_SUBS',
    persist_docs={"relation": true, "columns": true}
) }}

with cte_date as (
  {{ dbt_date.get_date_dimension('1900-01-01', '2050-12-31')}}
)
select
  date_day as DateKey,
  date_day as Date,
  day_of_week as DayOfWeek,
  day_of_month as DayOfMonth,
  month_of_year as MonthOfYear,
  month_name as MonthName,
  quarter_of_year as Quarter,
  year_number as Year,
  week_of_year as WeekOfYear
from cte_date