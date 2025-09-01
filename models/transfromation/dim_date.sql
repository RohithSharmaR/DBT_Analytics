with date_col as (
    {{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="current_date()"
   )
}}
)

select
    date_day as date_day,
    month(date_day) as month_day,
    day(date_day) as day_day,
    week(date_day) as week_day,
    {{ dbt_date.iso_week_of_year("date_day") }} as iso_week_of_year ,
    {{ dbt_date.day_name("date_day") }} as day_of_week_short_name
    from
    date_col
    order by
    date_day desc