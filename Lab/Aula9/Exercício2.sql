DROP DATABASE IF EXISTS loja;
CREATE DATABASE loja;
USE loja;

CREATE TABLE compra (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    preco FLOAT,
    pagamento FLOAT,
    troco FLOAT
);

DELIMITER $$

CREATE TRIGGER calculaTroco
BEFORE INSERT ON compra
FOR EACH ROW
BEGIN
    SET NEW.troco = NEW.pagamento - NEW.preco;
END $$

DELIMITER ;

INSERT INTO compra(preco, pagamento) VALUES(9.5, 10.25);
INSERT INTO compra(preco, pagamento) VALUES(25.0, 25.0);
INSERT INTO compra(preco, pagamento) VALUES(5.99, 5.99);
INSERT INTO compra(preco, pagamento) VALUES(10.99, 10.99);
INSERT INTO compra(preco, pagamento) VALUES(15.99, 15.99);

CREATE VIEW compras_maior_igual_10 AS
SELECT COUNT(*) AS quantidade_compras
FROM compra
WHERE preco >= 10;

SELECT * FROM compra;
SELECT * FROM compras_maior_igual_10;
