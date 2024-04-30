SELECT c.id uid,
CONCAT(c.first_name, ' ',c.last_name) Name,
COUNT(p.id) "Purchased Items",
SUM(p.price) "Total purchase",
MAX(p.price) "Purchase more expensive",
(SELECT p2.name FROM products p2 WHERE p2.price = MAX(p.price) limit 1) "Most expensive item purchased"
FROM client c 
	INNER JOIN shopping s
		ON s.client_id = c.id
	INNER JOIN products p 
		ON s.product_id = p.id
GROUP BY s.client_id;