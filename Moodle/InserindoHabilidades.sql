CREATE TABLE Habilidades (
	Id INT PRIMARY KEY,
    Atributo_base VARCHAR(45),
    Descricao VARCHAR(100)
);

INSERT INTO Habilidades VALUES
(1,'Corrida longa', 'Constituição'),
(2,'Corrida de arrancada', 'Força'),
(3,'Acrobacia', 'Destreza'),
(4,'Tiro com arco', 'Destreza');

SELECT * FROM Habilidades;
