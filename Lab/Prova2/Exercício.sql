DROP DATABASE IF EXISTS oficina_db;
CREATE DATABASE oficina_db;
USE oficina_db;

-- Tabela Cliente
CREATE TABLE Cliente (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(50) NOT NULL,
 email VARCHAR(80) NOT NULL UNIQUE,
 telefone VARCHAR(15),
 cidade VARCHAR(40) DEFAULT 'São Paulo' 
);
-- Tabela Veiculo
CREATE TABLE Veiculo (
 placa CHAR(7) PRIMARY KEY,
 modelo VARCHAR(30) NOT NULL,
 marca VARCHAR(20) NOT NULL,
 ano INT NOT NULL,
 diaria DECIMAL(8,2) NOT NULL,
 status ENUM (  'DISPONIVEL','ALUGADO' , 'MANUTENCAO' ) DEFAULT 'DISPONIVEL'
);
-- Tabela Aluguel
CREATE TABLE Aluguel (
 id INT AUTO_INCREMENT PRIMARY KEY,
 cliente_id INT NOT NULL,
 veiculo_placa CHAR(7) NOT NULL,
 data_inicio DATE NOT NULL,
 data_fim DATE NOT NULL,
 valor_total DECIMAL(10,2),
 FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
 FOREIGN KEY (veiculo_placa) REFERENCES Veiculo(placa)
);

-- Inserção de dados
INSERT INTO Cliente (nome, email, telefone) VALUES
('Ana Silva', 'ana@email.com', '11999999999'),
('Carlos Souza', 'carlos@email.com', '11988888888');
INSERT INTO Veiculo (placa, modelo, marca, ano, diaria, status) VALUES
('ABC1234', 'Civic', 'Honda', 2020, 150.00, 'DISPONIVEL'),
('DEF5678', 'Uno', 'Fiat', 2018, 80.00, 'ALUGADO'),
('GHI9012', 'Corolla', 'Toyota', 2022, 200.00, 'MANUTENCAO');

INSERT INTO Aluguel (cliente_id, veiculo_placa, data_inicio, data_fim,
valor_total) VALUES
(1, 'ABC1234', '2025-06-01', '2025-06-05', NULL),
(2, 'DEF5678', '2025-06-02', '2025-06-07', NULL);

-- Questão 2
DROP USER IF EXISTS 'estagiario'@'%';

CREATE USER 'estagiario'@'%' IDENTIFIED BY 'estagio123';

GRANT SELECT ON oficina_db.* TO 'estagiario'@'%';

REVOKE SELECT ON oficina_db.Aluguel FROM 'estagiario'@'%';

-- Questão 3
SELECT 
    Cliente.nome,
    Veiculo.modelo,
    Aluguel.data_inicio,
    Aluguel.valor_total
FROM Cliente, Veiculo, Alguel
INNER JOIN oficina_db
ON Cliente.id = oficina_db.cliente_id;


-- Questão 4
DELIMITER $$

CREATE PROCEDURE AtualizarValorAluguel(
    IN id_aluguel INT,
    IN diaria_do_veiculo DECIMAL(5,2) -- CHECK ((data_fim <= data_inicio) = 1)
)
BEGIN
    UPDATE Aluguel
    SET valor_total = (DATEDIFF(data_fim, data_inicio)) * diaria_do_veiculo
    WHERE valor_total = valor_total_Aluguel;
END $$

DELIMITER ;

-- Questão 5
DELIMITER $$

CREATE FUNCTION DiasAluguel(id_aluguel INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN data_fim -  data_inicio;
END $$

DELIMITER ;

-- Questão 6
CREATE VIEW veiculos_status  AS
SELECT 
    placa AS placa_Veiculo,
    modelo,
    status,
    diaria 
FROM Veiculo
WHERE status != 'MANUTENCAO';

-- Questão 7
DELIMITER $$

CREATE TRIGGER before_insert_aluguel 
BEFORE UPDATE ON Aluguel
FOR EACH ROW
BEGIN
    IF NEW.status = 'DISPONIVEL'
        SET NEW.status = 'Veículo não está disponível para aluguel';
    END IF;
END $$

DELIMITER ;
