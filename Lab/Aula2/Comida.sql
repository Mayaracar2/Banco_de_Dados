CREATE DATABASE meu_banco_comida;
USE meu_banco_comida;

CREATE TABLE Comida (
   ID INT AUTO_INCREMENT PRIMARY KEY,
   Nome VARCHAR(100),
   Tipo VARCHAR(100),
   Preco DECIMAL(10,2)
);

INSERT INTO Comida (Nome, Tipo, Preco) VALUES ('Pizza', 'Salgado', 35.00);
INSERT INTO Comida (Nome, Tipo, Preco) VALUES ('Hamburguer', 'Lanche', 25.00);
INSERT INTO Comida (Nome, Tipo, Preco) VALUES ('Sorvete', 'Sobremesa', 12.00);

SELECT Nome FROM Comida;

UPDATE Comida SET Nome = 'Pizza Grande' WHERE ID = 1;

SET SQL_SAFE_UPDATES = 1;
DELETE FROM Comida WHERE Preco = 25.00;

SELECT SUM(Preco) AS Valor_Total FROM Comida;


