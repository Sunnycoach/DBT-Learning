with bFactSales as 
(
    select 
        sales_id,
        product_sk,
        customer_sk,
        {{multiply('quantity', 'unit_price')}} as calculatedGrossAmount,
        gross_amount,
        payment_method
    from 
        {{ ref('bFactSales') }}
),
bProdcuct as 
(
    select
        product_sk,
        category
    from
        {{ ref('bProduct') }}
),
bCustomer as 
(
    select
        customer_sk,
        gender
    from
        {{ ref('bCustomer') }}
),
joinedQuery as
(
select 
    s.sales_id,
    s.gross_amount,
    s.payment_method,
    p.category,
    c.gender,
    s.calculatedGrossAmount
from
    bFactSales s
join
    bProduct p
on
    s.product_sk = p.product_sk
join
    bCustomer c
on
    s.customer_sk = c.customer_sk
)
select 
    category,
    gender,
    Round(sum(gross_amount),2) as totalGrossAmount
from
    joinedQuery
group by
    category,
    gender
order by
    totalGrossAmount desc