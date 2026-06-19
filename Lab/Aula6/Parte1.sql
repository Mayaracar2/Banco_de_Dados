DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    descricao TEXT
);

-- 2. Criar usuário
CREATE USER 'dev_junior'@'%' IDENTIFIED BY 'senha_segura';

-- 3. Permissão só de leitura
GRANT SELECT ON ecommerce.* TO 'dev_junior'@'%';
FLUSH PRIVILEGES;

-- 4. Adicionar INSERT na tabela produtos
GRANT INSERT ON ecommerce.produtos TO 'dev_junior'@'%';
FLUSH PRIVILEGES;

-- 5. Revogar INSERT
REVOKE INSERT ON ecommerce.produtos FROM 'dev_junior'@'%';
FLUSH PRIVILEGES;
