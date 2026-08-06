
CREATE DATABASE IF NOT EXISTS techenews_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE techenews_db;

CREATE TABLE IF NOT EXISTS noticias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    conteudo TEXT NOT NULL,
    imagem VARCHAR(500),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO noticias (titulo, categoria, conteudo, imagem) VALUES
('iPhone 16 é lançado com IA integrada', 'Tecnologia', 
 'A Apple apresentou o novo iPhone 16 com recursos de inteligência artificial que prometem revolucionar a forma como usamos smartphones.', 
 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400'),

('Robôs domésticos chegam ao Brasil', 'Inovação', 
 'Empresas brasileiras começam a importar robôs assistentes para tarefas domésticas. O preço ainda é alto, mas a tendência é de queda.', 
 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400'),

('Nova rede 6G já está em testes', 'Internet', 
 'Pesquisadores da Coreia do Sul anunciaram os primeiros testes bem-sucedidos da rede 6G, prometendo velocidades 50x maiores que o 5G.', 
 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=400');

SELECT * FROM noticias;

