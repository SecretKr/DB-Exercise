SELECT product_id, SUM(ordered_quantity)
FROM order_line
GROUP BY product_id
HAVING SUM(ordered_quantity) = (
	SELECT MAX(SUM(ordered_quantity))
	FROM (
		SELECT SUM(ordered_quantity) AS s
		FROM order_line
		GROUP BY product_id
	) AS counts
)