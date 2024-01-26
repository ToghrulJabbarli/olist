with cte_order_details as (
  select
    o.order_id,
    o.customer_id,
    o.order_status,
    oi.seller_id,
    oi.product_id,
    oi.price,
    oi.freight_value,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    op.payment_type
  FROM {{source("olist_stg_source","stg_orders")}} o
  LEFT JOIN  {{source("olist_stg_source","stg_order_items")}} oi on o.order_id = oi.order_id
  LEFT JOIN {{source("olist_stg_source","stg_order_payments")}} op on o.order_id = op.order_id
)
SELECT * FROM cte_order_details