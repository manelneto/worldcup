PRAGMA foreign_keys = ON;

.mode columns
.headers on
.nullvalue NULL

SELECT * FROM JogoEliminatorias WHERE idJogo > 64;

INSERT INTO Jogo VALUES (65, '2022-12-07', '0-0', 2, 2, 12, 2);
INSERT INTO JogoEliminatorias VALUES (65, NULL, NULL); --empate no tempo regulamentar não desempatado

INSERT INTO Jogo VALUES (66, '2022-12-11', '1-1', 3, 3, 13, 3);
INSERT INTO JogoEliminatorias VALUES (65, '3-3', NULL); --empate no prolongamento não desempatado

INSERT INTO Jogo VALUES (67, '2022-12-15', '2-2', 4, 4, 14, 4);
INSERT INTO JogoEliminatorias VALUES (65, '4-4', '5-5'); --empate nos penáltis não desempatado

SELECT * FROM JogoEliminatorias WHERE idJogo > 64;

DELETE FROM Jogo WHERE idJogo > 64;