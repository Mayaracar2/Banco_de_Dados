DROP DATABASE IF EXISTS peixaria_joel;
CREATE DATABASE peixaria_joel;
USE peixaria_joel;

CREATE TABLE Peixe (
    id_peixe INT PRIMARY KEY,
    nome_comum VARCHAR(100) NOT NULL,
    preco_kg DECIMAL(10,2) NOT NULL,
    qtd_estoque DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(20) NOT NULL,

    CHECK (preco_kg > 0),
    CHECK (qtd_estoque >= 0),
    CHECK (tipo IN ('AGUA_DOCE', 'MARINHO', 'GERAL'))
);

CREATE TABLE Peixe_Agua_Doce (
    id_peixe INT PRIMARY KEY,
    nome_cientifico VARCHAR(120) NOT NULL,
    habitat VARCHAR(80) NOT NULL,
    nivel_raridade VARCHAR(30) NOT NULL,

    FOREIGN KEY (id_peixe) REFERENCES Peixe(id_peixe),

    CHECK (nivel_raridade IN ('COMUM', 'RARO', 'EXOTICO'))
);

CREATE TABLE Peixe_Marinho (
    id_peixe INT PRIMARY KEY,
    origem VARCHAR(80) NOT NULL,
    sabor_predominante VARCHAR(80) NOT NULL,
    refrigeracao_especial BOOLEAN NOT NULL,

    FOREIGN KEY (id_peixe) REFERENCES Peixe(id_peixe)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome_completo VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Venda (
    id_venda INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_hora_venda DATETIME NOT NULL,
    data_prev_retirada DATE NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Item_Venda (
    id_venda INT,
    id_peixe INT,
    qtd_kg DECIMAL(10,2) NOT NULL,
    data_retirada_efetiva DATE NULL,

    PRIMARY KEY (id_venda, id_peixe),

    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
    FOREIGN KEY (id_peixe) REFERENCES Peixe(id_peixe),

    CHECK (qtd_kg > 0)
);DROP DATABASE IF EXISTS peixaria_joel;
CREATE DATABASE peixaria_joel;
USE peixaria_joel;

CREATE TABLE Peixe (
    id_peixe INT PRIMARY KEY,
    nome_comum VARCHAR(100) NOT NULL,
    preco_kg DECIMAL(10,2) NOT NULL,
    qtd_estoque DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(20) NOT NULL,

    CHECK (preco_kg > 0),
    CHECK (qtd_estoque >= 0),
    CHECK (tipo IN ('AGUA_DOCE', 'MARINHO', 'GERAL'))
);

CREATE TABLE Peixe_Agua_Doce (
    id_peixe INT PRIMARY KEY,
    nome_cientifico VARCHAR(120) NOT NULL,
    habitat VARCHAR(80) NOT NULL,
    nivel_raridade VARCHAR(30) NOT NULL,

    FOREIGN KEY (id_peixe) REFERENCES Peixe(id_peixe),

    CHECK (nivel_raridade IN ('COMUM', 'RARO', 'EXOTICO'))
);

CREATE TABLE Peixe_Marinho (
    id_peixe INT PRIMARY KEY,
    origem VARCHAR(80) NOT NULL,
    sabor_predominante VARCHAR(80) NOT NULL,
    refrigeracao_especial BOOLEAN NOT NULL,

    FOREIGN KEY (id_peixe) REFERENCES Peixe(id_peixe)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome_completo VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Venda (
    id_venda INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_hora_venda DATETIME NOT NULL,
    data_prev_retirada DATE NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Item_Venda (
    id_venda INT,
    id_peixe INT,
    qtd_kg DECIMAL(10,2) NOT NULL,
    data_retirada_efetiva DATE NULL,

    PRIMARY KEY (id_venda, id_peixe),

    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
    FOREIGN KEY (id_peixe) REFERENCES Peixe(id_peixe),

    CHECK (qtd_kg > 0)
);

-- 3 peixes de água doce
INSERT INTO Peixe
(id_peixe, nome_comum, preco_kg, qtd_estoque, tipo)
VALUES
(1, 'Tucunaré', 45.90, 30.00, 'AGUA_DOCE'),
(2, 'Dourado', 52.50, 25.00, 'AGUA_DOCE'),
(3, 'Pintado', 48.00, 20.00, 'AGUA_DOCE');

INSERT INTO Peixe_Agua_Doce
(id_peixe, nome_cientifico, habitat, nivel_raridade)
VALUES
(1, 'Cichla ocellaris', 'Represa', 'COMUM'),
(2, 'Salminus brasiliensis', 'Rio', 'RARO'),
(3, 'Pseudoplatystoma corruscans', 'Lago', 'EXOTICO');


-- 3 peixes marinhos
INSERT INTO Peixe
(id_peixe, nome_comum, preco_kg, qtd_estoque, tipo)
VALUES
(4, 'Robalo', 65.00, 18.00, 'MARINHO'),
(5, 'Linguado', 72.90, 15.00, 'MARINHO'),
(6, 'Atum', 89.90, 12.00, 'MARINHO');

INSERT INTO Peixe_Marinho
(id_peixe, origem, sabor_predominante, refrigeracao_especial)
VALUES
(4, 'Litoral', 'Suave', TRUE),
(5, 'Profundidade', 'Delicado', TRUE),
(6, 'Oceano aberto', 'Marcante', TRUE);


-- 2 peixes genéricos
INSERT INTO Peixe
(id_peixe, nome_comum, preco_kg, qtd_estoque, tipo)
VALUES
(7, 'Traíra', 32.00, 40.00, 'GERAL'),
(8, 'Lambari', 18.50, 60.00, 'GERAL');

INSERT INTO Cliente
(id_cliente, nome_completo, telefone)
VALUES
(1, 'João Silva', '35999990001'),
(2, 'Maria Oliveira', '35999990002'),
(3, 'Carlos Souza', '35999990003');

INSERT INTO Venda
(id_venda, id_cliente, data_hora_venda, data_prev_retirada)
VALUES
(1, 1, '2026-05-27 10:30:00', '2026-05-28'),
(2, 2, '2026-05-27 14:00:00', '2026-05-29');

INSERT INTO Item_Venda
(id_venda, id_peixe, qtd_kg, data_retirada_efetiva)
VALUES
(1, 1, 2.5, NULL),
(1, 4, 1.0, NULL);

INSERT INTO Item_Venda
(id_venda, id_peixe, qtd_kg, data_retirada_efetiva)
VALUES
(2, 2, 3.0, NULL),
(2, 7, 2.0, NULL);

UPDATE Item_Venda
SET data_retirada_efetiva = '2026-05-28'
WHERE id_venda = 1
AND id_peixe = 1;

-- Primeiro removemos os itens da venda,
-- porque Item_Venda depende da tabela Venda
DELETE FROM Item_Venda
WHERE id_venda = 1;

-- Depois removemos a venda,
-- porque Venda depende da tabela Cliente
DELETE FROM Venda
WHERE id_venda = 1;

-- Agora sim podemos remover o cliente,
-- pois não existem mais vendas ligadas a ele
DELETE FROM Cliente
WHERE id_cliente = 1;

SELECT
    v.id_venda AS codigo_venda,
    c.nome_completo,
    v.data_hora_venda,
    p.nome_comum AS peixe,
    iv.qtd_kg,
    iv.data_retirada_efetiva

FROM Venda v

JOIN Cliente c
    ON v.id_cliente = c.id_cliente

JOIN Item_Venda iv
    ON v.id_venda = iv.id_venda

LEFT JOIN Peixe p
    ON iv.id_peixe = p.id_peixe

ORDER BY v.data_hora_venda DESC;
