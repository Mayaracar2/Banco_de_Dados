-- Exclui o banco se ele já existir
DROP DATABASE IF EXISTS streaming_db;
-- Cria o novo banco de dados 
CREATE DATABASE streaming_db;
-- Instrução para utilizar o banco criado
USE streaming_db;

-- Cria a tabela
CREATE TABLE Filme (
	idFilme INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(20),
    genero VARCHAR(30),
    ano_lancamento YEAR NOT NULL
);

-- Inclui a nova coluna para classificação etária
ALTER TABLE Filme ADD classificacao_etaria VARCHAR(10);

-- Aumenta a capacidade do título para 60 caracteres
ALTER TABLE Filme MODIFY titulo VARCHAR(60);

-- Desativa a trava de segurança para permitir updates/deletes sem WHERE por chave primária
SET SQL_SAFE_UPDATES = 0;

-- Inserção de 3 filmes
INSERT INTO Filme (titulo, genero, ano_lancamento) VALUES
('Romeu e Julieta', 'Romance', 2005),
('The Matrix', 'Action', 1999),
('Interstrelar', 'Drama', 2014);

-- Atualiza o gênero de um dos filmes
UPDATE Filme SET genero = 'Ficção Científica' WHERE titulo = 'The Matrix';

UPDATE Filme SET classificacao_etaria = '12' WHERE 	titulo = 'Romeu e Julieta';

-- Deleta o filme com o primeiro ID
DELETE FROM Filme WHERE idFilme = 1;

-- Mostra todos os dados para validar
SELECT * FROM Filme;

-- Remove todos os registros da tabela de forma rápida, reiniciando os IDs
TRUNCATE TABLE Filme;



