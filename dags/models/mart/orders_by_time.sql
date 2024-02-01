SELECT
  DATE(order_purchase_timestamp) as date,
  COUNT(Distinct order_id) as total_orders,
  sum(price) as total_revenue,
  ROUND(avg(freight_value),2) as avg_freight_cost
FROM  {{source("olist_stg_source","fact_orders")}}
GROUP BY 1
ORDER BY date