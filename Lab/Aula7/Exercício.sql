-- ================================================
-- BANCO: financeiro
-- ================================================
CREATE DATABASE financeiro;
USE financeiro;

CREATE TABLE contas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titular VARCHAR(100),
    saldo NUMERIC(10,2)
);

INSERT INTO contas (titular, saldo) VALUES
    ('Alice', 1500.00),
    ('Bruno', 200.00),
    ('Carla', 800.00);


-- ================================================
-- EXERCÍCIO 1 — COMMIT
-- ================================================
START TRANSACTION;
    UPDATE contas SET saldo = saldo - 300 WHERE id = 1; -- Alice perde 300
    UPDATE contas SET saldo = saldo + 300 WHERE id = 2; -- Bruno ganha 300
COMMIT;

SELECT * FROM contas;

-- Agora refazendo com ROLLBACK
UPDATE contas SET saldo = 1500.00 WHERE id = 1; -- reset Alice
UPDATE contas SET saldo = 200.00  WHERE id = 2; -- reset Bruno

START TRANSACTION;
    UPDATE contas SET saldo = saldo - 300 WHERE id = 1;
    UPDATE contas SET saldo = saldo + 300 WHERE id = 2;
ROLLBACK; -- nada muda no banco

SELECT * FROM contas; -- saldos originais


-- ================================================
-- EXERCÍCIO 2 — SAVEPOINT
-- ================================================
START TRANSACTION;
    UPDATE contas SET saldo = saldo - 100 WHERE id = 3; -- Carla perde 100
    UPDATE contas SET saldo = saldo + 100 WHERE id = 1; -- Alice ganha 100

    SAVEPOINT sp1;

    UPDATE contas SET saldo = saldo - 100 WHERE id = 3; -- Carla perde mais 100
    UPDATE contas SET saldo = saldo + 100 WHERE id = 2; -- Bruno ganha 100

    ROLLBACK TO sp1; -- desfaz só a segunda transferência (Carla -> Bruno)
COMMIT;

SELECT * FROM contas;
-- Resultado: apenas Carla -> Alice foi salva


-- ================================================
-- EXERCÍCIO 3 — Análise
-- ================================================
-- Apenas o primeiro UPDATE chega ao banco (Alice -200).
-- O ROLLBACK TO sp1 desfaz o segundo UPDATE antes do COMMIT.
START TRANSACTION;
    UPDATE contas SET saldo = saldo - 200 WHERE id = 1;
    SAVEPOINT sp1;
    UPDATE contas SET saldo = saldo + 200 WHERE id = 2;
    ROLLBACK TO sp1; -- desfaz o UPDATE do id=2
COMMIT;
-- Resultado: id=1 com -200, id=2 sem alteração
