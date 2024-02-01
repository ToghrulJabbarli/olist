SELECT
  seller_city,
  seller_state,
  count(distinct order_id) as total_orders,
  sum(price) as total_revenue,
  avg(freight_value) as avg_freight_cost,
  ROUND(avg(datediff(day, order_purchase_timestamp, order_delivered_customer_date)),0) as avg_delivery_time
FROM  {{source("olist_stg_source","fact_orders")}}
LEFT JOIN  {{source("olist_stg_source","dim_sellers")}} using (seller_id)
GROUP BY 1, 2