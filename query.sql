SELECT
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city,
  o.Date AS order_date,
  o.Quantity AS order_qty,
  p.ProdName AS product_name,
  p.Price AS product_price,
  cat.CategoryName AS category_name,
  (o.Quantity * p.Price) AS total_sales
FROM
  `sales_data.orders` AS o
JOIN
  `sales_data.customers` AS c
ON
  CAST(o.CustomerID AS STRING) = CAST(c.CustomerID AS STRING)
JOIN
  `sales_data.products` AS p
ON
  CAST(o.ProdNumber AS STRING) = CAST(p.ProdNumber AS STRING)
JOIN
  `sales_data.category` AS cat
ON
  CAST(p.Category AS STRING) = CAST(cat.CategoryID AS STRING)
ORDER BY
  o.Date ASC;