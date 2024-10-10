SELECT t1.customer_id, customer.customer_name, t1.order_count
FROM
(
	SELECT customer_id, COUNT(order_id) AS order_count
	FROM ordert
	GROUP BY customer_id
) AS t1
JOIN customer
ON t1.customer_id = customer.customer_id
ORDER BY t1.order_count DESC