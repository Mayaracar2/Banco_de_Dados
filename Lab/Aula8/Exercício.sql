-- CRIAÇÃO DAS TABELAS
DROP DATABASE IF EXISTS concessionaria;
CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE Pessoa (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    telefone CHAR(14) NOT NULL
);

CREATE TABLE Carro (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(45) NOT NULL
);

CREATE TABLE Pessoa_has_Carro (
    idPessoa INT NOT NULL,
    idCarro INT NOT NULL,
    dataAquisicao DATE NOT NULL,

    PRIMARY KEY (idPessoa, idCarro),

    FOREIGN KEY (idPessoa)
        REFERENCES Pessoa(Id)
        ON DELETE CASCADE,

    FOREIGN KEY (idCarro)
        REFERENCES Carro(Id)
        ON DELETE CASCADE
);

-- INSERÇÃO DE DADOS

-- Inserir pessoas
INSERT INTO Pessoa (nome, idade, telefone) VALUES
('João Silva', 28, '(11)98765-4321'),
('Maria Santos', 35, '(21)97654-3210'),
('Pedro Oliveira', 42, '(31)96543-2109'),
('Ana Costa', 31, '(41)95432-1098'),
('Carlos Souza', 25, '(51)94321-0987'),
('Juliana Lima', 29, '(61)93210-9876'),
('Roberto Alves', 38, '(71)92109-8765');

-- Inserir carros
INSERT INTO Carro (nome, marca, ano, cor) VALUES
('Civic', 'Honda', 2020, 'Preto'),
('Corolla', 'Toyota', 2021, 'Branco'),
('Gol', 'Volkswagen', 2019, 'Prata'),
('HB20', 'Hyundai', 2022, 'Vermelho'),
('Onix', 'Chevrolet', 2021, 'Azul'),
('Compass', 'Jeep', 2023, 'Branco'),
('Kicks', 'Nissan', 2020, 'Laranja'),
('T-Cross', 'Volkswagen', 2022, 'Cinza'),
('Creta', 'Hyundai', 2023, 'Preto');

-- Inserir relacionamentos
INSERT INTO Pessoa_has_Carro (idPessoa, idCarro, dataAquisicao) VALUES
(1, 1, '2020-05-15'),
(1, 3, '2021-08-20'),
(2, 2, '2021-03-10'),
(2, 6, '2023-01-25'),
(3, 4, '2022-07-18'),
(4, 5, '2021-11-30'),
(5, 7, '2020-09-12'),
(6, 8, '2022-04-05'),
(6, 9, '2023-06-14');

-- EXERCÍCIO 1

SELECT P.nome, P.idade
FROM Pessoa P
INNER JOIN Pessoa_has_Carro PC
    ON P.Id = PC.idPessoa;

-- EXERCÍCIO 2

SELECT P.nome
FROM Pessoa P
INNER JOIN Pessoa_has_Carro PC
    ON P.Id = PC.idPessoa
GROUP BY P.Id, P.nome
HAVING COUNT(PC.idCarro) > 1;

-- EXERCÍCIO 3

SELECT
    P.nome AS Pessoa,
    C.nome AS Carro
FROM Pessoa P
INNER JOIN Pessoa_has_Carro PC
    ON P.Id = PC.idPessoa
INNER JOIN Carro C
    ON C.Id = PC.idCarro;
    
-- EXERCÍCIO 4

SELECT
    P.nome AS Pessoa,
    C.nome AS Carro,
    C.marca AS Marca
FROM Pessoa P
INNER JOIN Pessoa_has_Carro PC
    ON P.Id = PC.idPessoa
INNER JOIN Carro C
    ON C.Id = PC.idCarro
ORDER BY P.nome;

-- EXERCÍCIO 5

SELECT DISTINCT P.*
FROM Pessoa P
INNER JOIN Pessoa_has_Carro PC
    ON P.Id = PC.idPessoa
INNER JOIN Carro C
    ON C.Id = PC.idCarro
WHERE C.marca IN ('Honda', 'Hyundai');
