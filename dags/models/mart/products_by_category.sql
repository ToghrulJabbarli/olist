SELECT
  product_category_name,
  product_id,
  COUNT(distinct order_id) as total_orders,
  SUM(price) as total_revenue,
  RANK() over (partition by product_category_name order by total_revenue desc) as product_rank
FROM {{source("olist_stg_source","fact_orders")}}
JOIN {{source("olist_stg_source","dim_products")}} using (product_id)
GROUP BY 1, 2