-- Insere valores na tabela Client
INSERT INTO client (first_name, last_name, email, salary)
VALUES (
	"Angelo", "Fidelis", "angelo@gmail.com", round(rand()*10000, 2)
),(
	"Pedro", "Henrique", "Pedrouro@gmail.com", round(rand()*10000, 2)
),(
	"Thais", "Pereira", "tata@gmail.com", round(rand()*10000, 2)
),(
	"Joao", "Maria", "naruto@gmail.com", round(rand()*10000, 2)
),(
	"Maria", "Fernanda", "fernandinha@gmail.com", round(rand()*10000, 2)
),(
	"Caio", "Silva", "maicaio@gmail.com", round(rand()*10000, 2)
);

SELECT * FROM client;

-- Insere valores na tabela products
INSERT INTO products (name, description, price) VALUES
('Caneca Inteligente', 'Uma caneca com tecnologia de aquecimento automático, mantendo sua bebida na temperatura ideal.', ROUND(RAND()*10000, 2)),
('Tênis de Corrida Leve', 'Tênis projetado para corredores, oferecendo suporte e leveza para maximizar o desempenho.', ROUND(RAND()*10000, 2)),
('Carregador Solar Portátil', 'Carregador portátil que utiliza energia solar para recarregar seus dispositivos em qualquer lugar.', ROUND(RAND()*10000, 2)),
('Fone de Ouvido com Cancelamento de Ruído', 'Fones de ouvido que utilizam tecnologia avançada para cancelar ruídos externos, proporcionando uma experiência de áudio imersiva.', ROUND(RAND()*10000, 2)),
('Mochila com USB Integrado', 'Mochila moderna com porta USB integrada para carregar seus dispositivos enquanto se desloca.', ROUND(RAND()*10000, 2)),
('Câmera de Segurança Wi-Fi', 'Câmera de segurança que se conecta via Wi-Fi, permitindo monitoramento remoto através de aplicativos móveis.', ROUND(RAND()*10000, 2)),
('Teclado Mecânico RGB', 'Teclado mecânico com iluminação RGB personalizável para uma experiência de digitação e jogos otimizada.', ROUND(RAND()*10000, 2)),
('Purificador de Ar Inteligente', 'Purificador que detecta e filtra automaticamente poluentes do ar, mantendo o ambiente saudável.', ROUND(RAND()*10000, 2)),
('Lâmpada Inteligente', 'Lâmpada que pode ser controlada remotamente via aplicativo, com ajustes de cor e intensidade.', ROUND(RAND()*10000, 2)),
('Smartwatch com Monitoramento de Saúde', 'Relógio inteligente que monitora atividades físicas, batimentos cardíacos e padrões de sono.', ROUND(RAND()*10000, 2)),
('Kit de Jardinagem Inteligente', 'Conjunto de ferramentas para jardinagem que inclui sensores de umidade do solo e luz, otimizando o cuidado com as plantas.', ROUND(RAND()*10000, 2)),
('Livro Eletrônico à Prova d Água', 'E-reader resistente à água, permitindo a leitura confortável até mesmo na banheira ou na praia.', ROUND(RAND()*10000, 2)),
('Panela de Pressão Elétrica', 'Panela elétrica que cozinha alimentos rapidamente sob pressão, com vários modos de cozimento pré-definidos.', ROUND(RAND()*10000, 2)),
('Bicicleta Elétrica Dobrável', 'Bicicleta com assistência elétrica e design dobrável para fácil transporte e armazenamento.', ROUND(RAND()*10000, 2)),
('Óculos de Realidade Virtual', 'Óculos de VR para uma imersão completa em jogos e experiências virtuais, compatível com múltiplas plataformas.', ROUND(RAND()*10000, 2))
;

SELECT * FROM products;

-- Gera um produto para um usuário manualmente
INSERT INTO shopping(client_id, product_id) 
SELECT id, (select id from products where id = 3) from client
WHERE id = 2;

-- Gera um produto para um usuário Automaticamente a cada execucao
INSERT IGNORE INTO shopping (client_id, product_id)
SELECT
    (SELECT id FROM client ORDER BY RAND() LIMIT 1),
    (SELECT id FROM products ORDER BY RAND() LIMIT 1)
FROM (SELECT 1) as tmp; 


SELECT * from shopping;

TRUNCATE TABLE shopping;

