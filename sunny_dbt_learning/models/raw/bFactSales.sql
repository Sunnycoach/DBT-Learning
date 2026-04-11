{{config(materialized = 'view', schema='testconfig')}}

select * from {{source('source', 'fact_sales')}}