WITH seller_metrics AS (
  SELECT
    seller_id,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(price) AS total_earns,
    ROUND(AVG(review_score),2) AS avg_rating
  FROM {{source("olist_stg_source","stg_order_items")}} oi
  LEFT JOIN {{source("olist_stg_source","stg_order_reviews")}} r ON oi.order_id = r.order_id
  LEFT JOIN {{source("olist_stg_source","stg_orders")}} o ON oi.order_id = o.order_id
  GROUP BY seller_id
)

SELECT
  s.seller_id,
  s.seller_city,
  s.seller_state,
  cm.total_orders,
  cm.total_earns,
  cm.avg_rating
FROM {{source("olist_stg_source","stg_sellers")}} s
LEFT JOIN seller_metrics cm ON s.seller_id = cm.seller_id
