PRAGMA foreign_keys = ON;

.mode columns
.headers on
.nullvalue NULL

SELECT * FROM JogoGrupos WHERE idJogo > 64;

INSERT INTO Jogo VALUES (65, '2022-11-20', '1-0', 8, 1, 2, 1); --vitória da equipa visitada na jornada 1
INSERT INTO Jogo VALUES (66, '2022-11-24', '0-0', 7, 3, 4, 1); --empate na jornada 1
INSERT INTO Jogo VALUES (67, '2022-11-25', '0-1', 6, 5, 6, 1); --derrota da equipa visitda na jornada 2
INSERT INTO Jogo VALUES (68, '2022-11-28', '2-1', 5, 7, 8, 1); --vitória da equipa visitada na jornada 2
INSERT INTO Jogo VALUES (69, '2022-11-29', '1-1', 4, 9, 10, 1); --empate na jornada 3
INSERT INTO Jogo VALUES (70, '2022-12-02', '1-2', 3, 11, 12, 1); --derrota da equipa visitada na jornada 3

SELECT * FROM JogoGrupos WHERE idJogo > 64;

DELETE FROM Jogo WHERE idJogo > 64;