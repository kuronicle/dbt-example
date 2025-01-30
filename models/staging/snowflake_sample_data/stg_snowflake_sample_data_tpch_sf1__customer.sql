{{
    config(
        materialized='view'
    )
}}

with 

source as (

    select * from {{ source('snowflake_sample_data_tpch_sf1', 'customer') }}

),

renamed as (

    select
        c_custkey as customer_key,
        c_name as name,
        c_address as address,
        c_nationkey as nation_key,
        c_phone as phone,
        c_acctbal as acctbal,
        c_mktsegment as market_segment,
        c_comment as comment

    from source

)

select * from renamed
