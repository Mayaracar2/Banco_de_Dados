DROP DATABASE IF EXISTS Tabela;
CREATE DATABASE IF NOT EXISTS Tabela;
USE Tabela;

-- =========================
-- RELAÇÃO 1:1
-- Pessoa <-> Passaporte
-- =========================

CREATE TABLE Pessoa (
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT
);

CREATE TABLE Passaporte (
    id_passaporte INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(20) UNIQUE,
    id_pessoa INT UNIQUE,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);

INSERT INTO Pessoa (nome, idade) VALUES
('Lucas', 21),
('Ana', 25);

INSERT INTO Passaporte (numero, id_pessoa) VALUES
('BR123456', 1),
('BR654321', 2);

-- =========================
-- RELAÇÃO 1:N
-- Departamento -> Funcionarios
-- Um departamento pode ter varios funcionarios
-- =========================

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_departamento VARCHAR(100)
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento)
        REFERENCES Departamento(id_departamento)
);

INSERT INTO Departamento (nome_departamento) VALUES
('TI'),
('RH');

INSERT INTO Funcionario (nome, salario, id_departamento) VALUES
('Carlos', 3500.00, 1),
('Marina', 4200.00, 1),
('Julia', 2800.00, 2);

-- =========================
-- RELAÇÃO N:M
-- Alunos <-> Cursos
-- =========================

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100)
);

-- tabela intermediaria
CREATE TABLE Aluno_Curso (
    id_aluno INT,
    id_curso INT,
    PRIMARY KEY (id_aluno, id_curso),

    FOREIGN KEY (id_aluno)
        REFERENCES Aluno(id_aluno),

    FOREIGN KEY (id_curso)
        REFERENCES Curso(id_curso)
);

INSERT INTO Aluno (nome) VALUES
('Pedro'),
('Fernanda');

INSERT INTO Curso (nome_curso) VALUES
('MySQL'),
('Java'),
('Python');

INSERT INTO Aluno_Curso (id_aluno, id_curso) VALUES
(1,1),
(1,2),
(2,2),
(2,3);

-- =========================
-- TESTES COM JOIN
-- =========================

-- 1:1
SELECT p.nome, pa.numero
FROM Pessoa p
JOIN Passaporte pa
ON p.id_pessoa = pa.id_pessoa;

-- 1:N
SELECT f.nome, d.nome_departamento
FROM Funcionario f
JOIN Departamento d
ON f.id_departamento = d.id_departamento;

-- N:M
SELECT a.nome, c.nome_curso
FROM Aluno a
JOIN Aluno_Curso ac
ON a.id_aluno = ac.id_aluno
JOIN Curso c
ON ac.id_curso = c.id_curso;