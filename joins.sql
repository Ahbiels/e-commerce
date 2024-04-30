SELECT * FROM products p;
SELECT * FROM client c;
SELECT * FROM shopping s;

-- Seleciono todos os itens comprados e os usuários que comprou
SELECT c.id uid, 
	CONCAT(c.first_name, " ", c.last_name) Name,
	c.email "client'email",
	p.id pid,
	p.name Product,
	p.created_at "Date Purchase"
FROM client c
	INNER JOIN shopping s 
		ON s.client_id = c.id
	INNER JOIN products p 
		ON s.product_id = p.id;

-- Seleciono todos os itens que nao foram comprados
SELECT p.name as "Products not purchased"
FROM shopping s
	RIGHT JOIN products p 
		ON s.product_id = p.id
WHERE s.product_id IS NULL;

-- Seleciono todos os usuários que nao compraram nada
SELECT CONCAT(c.first_name, ' ', c.last_name) as "People who didn't buy anything" 
FROM client c 
	LEFT JOIN shopping s 
		ON s.client_id = c.id
WHERE s.client_id IS NULL;
