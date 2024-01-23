WITH customer_metrics AS (
  SELECT
    customer_id,
    AVG(price) AS avg_order_value,
    SUM(CASE WHEN order_status = 'delivered' THEN price ELSE 0 END) AS total_spent,
    SUM(CASE WHEN order_status = 'delivered' THEN 1 ELSE 0 END) AS total_delivered_orders,
    Round(AVG(DATEDIFF(day, order_purchase_timestamp::DATE, order_delivered_customer_date::DATE)),0) AS avg_delivery_time_by_days
  FROM {{source("olist_stg_source","stg_orders")}} o
  LEFT JOIN {{source("olist_stg_source","stg_order_items")}} oi USING (order_id)
  GROUP BY customer_id
)
SELECT
  customer_id,
  customer_unique_id,
  customer_city,
  customer_state,
  avg_order_value,
  total_spent,
  total_delivered_orders,
  avg_delivery_time_by_days
FROM {{source("olist_stg_source","stg_customers")}}
LEFT JOIN customer_metrics USING (customer_id)
