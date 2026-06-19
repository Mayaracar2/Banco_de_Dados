USE meu_banco_comida;
DROP TABLE IF EXISTS Lanche;

CREATE TABLE Lanche (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30),
    preco DOUBLE,
    qntDisp INT
);

INSERT INTO Lanche (id, nome, preco, qntDisp) VALUES (1, 'Empada', 5.60, 2);
INSERT INTO Lanche (id, nome, preco, qntDisp) VALUES (2, 'Coxinha', 6.00, 3);
INSERT INTO Lanche (id, nome, preco, qntDisp) VALUES (4, 'Sanduíche', 7.50, 1);

SELECT COUNT(*) 
FROM Lanche
WHERE qntDisp >= 2;

SELECT AVG(Preco) AS MediaPreco
FROM Lanche;

INSERT INTO Lanche (id, nome, preco, qntDisp) VALUES (3, 'Esfirra', 6.00, 2);
INSERT INTO Lanche (id, nome, preco, qntDisp) VALUES (5, 'Pastel', 5.00, 4);

SELECT nome
FROM Lanche
ORDER BY preco ASC
LIMIT 1;

UPDATE Lanche
SET preco = 6.00
WHERE id = 1;

SELECT SUM(preco) AS TotalCompra
FROM Lanche
WHERE preco <> 6.00;
