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

-- a) Criar a role
CREATE ROLE 'role_vendas';

-- b) Permissão apenas nas colunas nome e preco
GRANT SELECT (nome, preco) ON ecommerce.produtos TO 'role_vendas';

-- c) Criar usuário e atribuir a role
CREATE USER 'vendedor_1'@'%' IDENTIFIED BY 'senha_segura';
GRANT 'role_vendas' TO 'vendedor_1'@'%';
SET DEFAULT ROLE 'role_vendas' TO 'vendedor_1'@'%';

FLUSH PRIVILEGES;

-- d) Vai dar erro, pois ele só tem permissão nas colunas nome e preco. O MySQL vai retornar: ERROR 1142 (42000): SELECT command denied to user 'vendedor_1'@'localhost' for table 'produtos'.
