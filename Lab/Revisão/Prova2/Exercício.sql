DROP DATABASE IF EXISTS revisao_db;
CREATE DATABASE revisao_db;
USE revisao_db;

-- Questão 1
CREATE TABLE Aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    curso VARCHAR(30)
);

ALTER TABLE Aluno
ADD ano_entrada INT NOT NULL;

-- Questão 2
DROP USER IF EXISTS 'estagiario'@'%';

CREATE USER 'estagiario'@'%' IDENTIFIED BY '123';

GRANT SELECT ON revisao_db.* TO 'estagiario'@'%';

REVOKE SELECT ON revisao_db.* FROM 'estagiario'@'%';

-- Questão 3
CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

INSERT INTO Cliente (nome)
VALUES ('Ana'), ('Carlos');

INSERT INTO Pedido (cliente_id, valor)
VALUES (1, 100),
       (1, 50),
       (2, 200);

SELECT 
    Cliente.nome,
    Pedido.valor
FROM Cliente
INNER JOIN Pedido
ON Cliente.id = Pedido.cliente_id;

-- Questão 4
DELIMITER $$

CREATE PROCEDURE AumentarValor(
    IN id_pedido INT,
    IN percentual DECIMAL(5,2)
)
BEGIN
    UPDATE Pedido
    SET valor = valor + (valor * percentual / 100)
    WHERE id = id_pedido;
END $$

DELIMITER ;

-- Questão 5
DELIMITER $$

CREATE FUNCTION Dobro(numero DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN numero * 2;
END $$

DELIMITER ;

-- Questão 6
CREATE VIEW pedidos_resumo AS
SELECT 
    id AS id_pedido,
    valor
FROM Pedido
WHERE valor > 50;

-- Questão 7
DELIMITER $$

CREATE TRIGGER antes_atualizar_pedido
BEFORE UPDATE ON Pedido
FOR EACH ROW
BEGIN
    IF NEW.valor < 10 THEN
        SET NEW.valor = 10;
    END IF;
END $$

DELIMITER ;
