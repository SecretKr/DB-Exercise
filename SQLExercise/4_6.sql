SELECT t1.customer_id, customer.customer_name
FROM
(
	SELECT customer_id, COUNT(order_id) AS order_count
	FROM ordert
	GROUP BY customer_id
) AS t1
JOIN customer
ON t1.customer_id = customer.customer_id
WHERE t1.order_count = (
	SELECT MAX(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM ordert
        GROUP BY customer_id
    ) AS t2
)