DROP DATABASE IF EXISTS Atividade;
CREATE DATABASE Atividade;
USE Atividade;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Cliente (
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE Equipamento (
  id_equipamento INT PRIMARY KEY,
  tipo VARCHAR(50),
  marca VARCHAR(50),
  modelo VARCHAR(50),
  id_cliente INT,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Ordem_Servico (
  id_ordem INT PRIMARY KEY,
  data_abertura DATE,
  status VARCHAR(20),
  id_equipamento INT,
  FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento)
);

CREATE TABLE Servico (
  id_servico INT PRIMARY KEY,
  descricao VARCHAR(100),
  valor DECIMAL(10,2)
);

-- Tabela intermediária (N:N)
CREATE TABLE Ordem_Servico_Servico (
  id_ordem INT,
  id_servico INT,
  PRIMARY KEY (id_ordem, id_servico),
  FOREIGN KEY (id_ordem) REFERENCES Ordem_Servico(id_ordem),
  FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

INSERT INTO Cliente VALUES
(1, 'João Silva', '99999-1111', 'joao@email.com'),
(2, 'Maria Souza', '99999-2222', 'maria@email.com'),
(3, 'Carlos Lima', '99999-3333', 'carlos@email.com');

INSERT INTO Equipamento VALUES
(1, 'Celular', 'Samsung', 'Galaxy S21', 1),
(2, 'Notebook', 'Dell', 'Inspiron', 2),
(3, 'TV', 'LG', 'SmartTV', 3),
(4, 'Celular', 'Samsung', 'Galaxy A10', 2);

INSERT INTO Ordem_Servico VALUES
(1, '2024-01-10', 'aberto', 1),
(2, '2024-01-12', 'finalizado', 2),
(3, '2024-01-15', 'aberto', 3);

INSERT INTO Servico VALUES
(1, 'Troca de tela', 300.00),
(2, 'Formatação', 150.00),
(3, 'Limpeza', 80.00);

-- ==========================================
-- QUESTÃO 1: Criar tabela de Funcionários
-- ==========================================
CREATE TABLE Funcionario (
  id_funcionario INT PRIMARY KEY,
  nome VARCHAR(100),
  cargo VARCHAR(50),
  salario DECIMAL(10,2)
);

-- QUESTÃO 2: Adicionar coluna data_contratacao
ALTER TABLE Funcionario
  ADD COLUMN data_contratacao DATE;

-- QUESTÃO 3: Remover coluna cargo
ALTER TABLE Funcionario
  DROP COLUMN cargo;

-- QUESTÃO 4: Inserir dois funcionários
INSERT INTO Funcionario VALUES
(1, 'Ana Pereira', 2500.00, '2023-03-01'),
(2, 'Bruno Costa', 3200.00, '2022-08-15');

-- QUESTÃO 5: Atualizar salário de um funcionário
UPDATE Funcionario
  SET salario = 3500.00
  WHERE id_funcionario = 1;

-- QUESTÃO 6: Excluir um funcionário
DELETE FROM Funcionario
  WHERE id_funcionario = 2;

-- QUESTÃO 7: Listar todos os clientes
SELECT * FROM Cliente;

-- QUESTÃO 8: Listar nome e telefone dos clientes
SELECT nome, telefone FROM Cliente;

-- QUESTÃO 9: Listar todos os equipamentos
SELECT * FROM Equipamento;

-- QUESTÃO 10: Equipamentos da marca Samsung
SELECT * FROM Equipamento
  WHERE marca = 'Samsung';

-- QUESTÃO 11: Ordens de serviço abertas
SELECT * FROM Ordem_Servico
  WHERE status = 'aberto';

-- QUESTÃO 12: Serviços com valor maior que 100
SELECT * FROM Servico
  WHERE valor > 100;

-- QUESTÃO 13: Clientes em ordem alfabética
SELECT * FROM Cliente
  ORDER BY nome ASC;

-- QUESTÃO 14: Equipamentos por marca de forma decrescente
SELECT * FROM Equipamento
  ORDER BY marca DESC;

-- QUESTÃO 15: Contar quantos clientes existem
SELECT COUNT(*) AS total_clientes FROM Cliente;

-- QUESTÃO 16: Contar equipamentos da marca LG
SELECT COUNT(*) AS total_lg FROM Equipamento
  WHERE marca = 'LG';
