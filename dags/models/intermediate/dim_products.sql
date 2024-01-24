WITH product_metrics AS (
  SELECT
    product_id,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(price),2) AS avg_price
  FROM {{source("olist_stg_source","stg_order_items")}} oi
  GROUP BY product_id
),
product_reviews AS (
  SELECT
    product_id,
    ROUND(AVG(review_score),2) AS avg_rating,
    COUNT(review_score) AS total_reviews
  FROM {{source("olist_stg_source","stg_order_items")}} oi
  LEFT JOIN {{source("olist_stg_source","stg_order_reviews")}} r ON oi.order_id = r.order_id
  GROUP BY product_id
)

SELECT
  p.product_id,
  p.product_category_name,
  cm.total_orders,
  cm.avg_price,
  cr.avg_rating,
  cr.total_reviews
FROM  {{source("olist_stg_source","stg_products")}} p
LEFT JOIN product_metrics cm ON p.product_id = cm.product_id
LEFT JOIN product_reviews cr ON p.product_id = cr.product_id
