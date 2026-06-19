DROP DATABASE IF EXISTS empresa_funcionarios;
CREATE DATABASE empresa_funcionarios;
USE empresa_funcionarios;

CREATE TABLE Funcionario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    departamento VARCHAR(20),
    email VARCHAR(100)
);

DELIMITER $$

CREATE FUNCTION criaEmailFuncionario(nome VARCHAR(50), departamento VARCHAR(20))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(nome, '@', departamento, '.empresa.com');
END $$

CREATE PROCEDURE insereFuncionario(
    IN p_nome VARCHAR(50),
    IN p_idade INT,
    IN p_departamento VARCHAR(20)
)
BEGIN
    INSERT INTO Funcionario(nome, idade, departamento, email)
    VALUES (
        p_nome,
        p_idade,
        p_departamento,
        criaEmailFuncionario(p_nome, p_departamento)
    );
END $$

DELIMITER ;

CALL insereFuncionario('Carlos', 30, 'rh');
CALL insereFuncionario('Lucia', 27, 'ti');
CALL insereFuncionario('Bruno', 35, 'adm');

SELECT * FROM Funcionario;
