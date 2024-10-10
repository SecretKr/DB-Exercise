SElECT ot.customer_id, customer.customer_name
FROM(
	SELECT customer_id
	FROM ordert
	WHERE order_date BETWEEN '2020-01-10 00:00:00' AND '2020-01-15 23:59:59'
	GROUP BY customer_id
) AS ot
JOIN customer
ON ot.customer_id = customer.customer_id