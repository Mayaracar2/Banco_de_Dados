DROP DATABASE IF EXISTS Prova;
CREATE DATABASE Prova;
USE Prova;
SET SQL_SAFE_UPDATES=0;

CREATE TABLE Jogos (
	Id INT PRIMARY KEY,
    Nome VARCHAR(45),
    Desenvolvedor VARCHAR(45),
    Data_lanCamento VARCHAR(45),
    Tema VARCHAR(45),
    Preco DECIMAL(10,2)
);

INSERT INTO Jogos VALUES
(1,'The Binding of Isaac' , 'Edmund McMillen' , '04-11-2014' , 'Roguelike' , 27.99),
(2,'Hades' , 'Supergiant Games' , '17-09-2020' , 'Roguelike' , 73.99),
(3,'Subnautica' , 'Unknown Worlds' , '23-01-2018' , 'Sobrevivência' , 124.50),
(4,'Pragmata' , 'CAPCOM' , '17-04-2026' , 'Ação' , 259.00),
(5,'Rayman Origins' , 'Ubisoft' , '29-03-2012' , 'Plataforma' , 59.99),
(6,'Rainbow Six Siege' , 'Ubisoft' , '01-12-2015' , 'FPS' , 0.00);

ALTER TABLE Jogos 
ADD COLUMN classificacao_indicativa INT;

ALTER TABLE Jogos
DROP COLUMN Tema;

INSERT INTO Jogos VALUES
(8 ,'Agua e fogo' , 'Edmund Fernandes' , '10-11-2022' , 30.99, 12),
(9 ,'Caçador de fantasmas' , 'Michael Torres' , '26-06-2005' , 50.99, 16);

UPDATE Jogos
SET Preco = 60.00 WHERE Id = 2;

DELETE FROM Jogos WHERE Id = 1;

SELECT * FROM Jogos;

SELECT Nome , Preco FROM Jogos;

SELECT * FROM Jogos 
WHERE Desenvolvedor = 'Ubisoft';

SELECT * FROM Jogos
WHERE Preco > 100;

SELECT * FROM Jogos
ORDER BY Nome ASC;

SELECT COUNT(*) AS Total_Jogos FROM Jogos;

SELECT COUNT(*) AS Total_Jogos FROM Jogos WHERE Desenvolvedor;

