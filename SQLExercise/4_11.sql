SElECT ct.customer_id, ct.customer_name
FROM customer ct
LEFT JOIN ordert ot
ON ct.customer_id = ot.customer_id
WHERE ot.customer_id IS NULL