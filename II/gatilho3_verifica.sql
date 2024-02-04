PRAGMA foreign_keys = ON;

.mode columns
.headers on
.nullvalue NULL

UPDATE Classificacao
SET posicao = NULL
WHERE posicao <= 2;

SELECT * FROM SelecoesApuradas;

INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 20;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 25;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 11;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 31;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 1;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 21;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 12;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 2;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 16;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 27;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 19;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 8;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 4;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 28;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 1 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 22;
INSERT INTO SelecoesApuradas SELECT letra, idSelecao, pais, 2 FROM Grupo NATURAL JOIN Selecao NATURAL JOIN Classificacao WHERE idSelecao = 17;

SELECT * FROM SelecoesApuradas;