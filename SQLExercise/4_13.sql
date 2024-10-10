SELECT total_payment
FROM(
	SElECT ol.order_id, SUM(ol.ordered_quantity * pd.standard_price) AS total_payment
	FROM order_line ol
	JOIN product pd
	ON ol.product_id = pd.product_id
	GROUP BY ol.order_id
) AS total_price
WHERE order_id = 3