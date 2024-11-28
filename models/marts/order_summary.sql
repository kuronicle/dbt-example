{{
    config(
        materialized="table"
    )
}}

with customer as (
    select * from {{ ref('stg_snowflake_sample_data_tpch_sf1__customer') }}
),

orders as (
    select * from {{ ref('stg_snowflake_sample_data_tpch_sf1__orders') }}
),

orders_summary as (
    select
        sum(orders.o_totalprice) as total_price,
        count(orders.o_custkey) as order_count,
        orders.o_custkey
    from 
        orders 
    group by
        orders.o_custkey
)

select 
    customer.c_name,
    orders_summary.total_price,
    orders_summary.order_count
from 
    orders_summary
    left join customer on orders_summary.o_custkey = customer.c_custkey
