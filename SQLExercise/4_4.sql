SELECT order_count.product_id, product.product_description
FROM
(
	SELECT product_id
	FROM order_line
	GROUP BY product_id
	HAVING COUNT(product_id) = (
		SELECT MAX(product_count)
		FROM (
			SELECT COUNT(product_id) AS product_count
			FROM order_line
			GROUP BY product_id
		) AS counts
	)
) AS order_count
JOIN product
ON order_count.product_id = product.product_id