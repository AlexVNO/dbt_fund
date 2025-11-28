with payments as (
    select 
        order_id,
        amount 
    from {{ ref('stg_stripe__payments') }}
),    
customer_orders as (
    select customer_id, order_id from {{ ref('stg_jaffle_shop__orders') }}
),
fct_orders as (
    select 
        o.customer_id,
        o.order_id,
        p.amount
    from customer_orders o
    inner join payments p ON p.order_id = o.order_id
)
select * from fct_orders