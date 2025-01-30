{{
    config(
        materialized='view'
    )
}}

with 

source as (

    select * from {{ source('snowflake_sample_data_tpch_sf1', 'orders') }}

),

renamed as (

    select
        o_orderkey as order_key,
        o_custkey as customer_key,
        o_orderstatus as order_status,
        o_totalprice as total_price,
        o_orderdate as order_date,
        o_orderpriority as order_priority,
        o_clerk as clerk,
        o_shippriority as ship_priority,
        o_comment as comment

    from source

)

select * from renamed
