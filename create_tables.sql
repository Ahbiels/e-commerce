-- Cria tabela Client
USE ecommerce;
CREATE TABLE client(
	id INT AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(155) NOT NULL,
	last_name VARCHAR(155) NOT NULL,
	email VARCHAR(155) NOT NULL,
	salary DECIMAL(8,2) NULL,
	
	CONSTRAINT primary_key_id PRIMARY KEY (id),
	CONSTRAINT unique_key_email UNIQUE KEY (email)
);

ALTER TABLE client ADD COLUMN created_at DATETIME DEFAULT now() NULL;
ALTER TABLE client ADD COLUMN updated_at DATETIME DEFAULT now() on update now() NULL;

DROP TABLE client;

-- Criando a tabela produtos
CREATE TABLE products(
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	description TEXT NOT NULL,
	price DECIMAL(8,2) NOT NULL,
	
	CONSTRAINT primary_key_id_products PRIMARY KEY (id)
);
ALTER TABLE products ADD COLUMN created_at DATETIME DEFAULT now() NULL;

DROP TABLE products;

-- Criando a tabela shopping (intermédio da tabela products e client)
CREATE TABLE shopping(
	product_id INT NOT NULL,
	client_id INT NOT NULL,
	
	CONSTRAINT client_product_primary_key PRIMARY KEY (product_id, client_id),
	CONSTRAINT foreign_key_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT foreign_key_client FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE ON UPDATE CASCADE	
);

DROP TABLE shopping;

ALTER TABLE shopping ADD COLUMN created_at DATETIME DEFAULT now() NULL;

-- Visualizar as informacoes das tabelas criadas
DESCRIBE products;
DESCRIBE client;
DESCRIBE shopping;

