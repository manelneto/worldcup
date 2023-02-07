PRAGMA foreign_keys = ON;

CREATE VIEW SelecoesApuradas AS
SELECT letra, idSelecao, pais, posicao
FROM Selecao NATURAL JOIN Grupo NATURAL JOIN Classificacao
WHERE posicao <= 2
ORDER BY 1, 4;

CREATE TRIGGER InserirSelecaoApurada
INSTEAD OF INSERT ON SelecoesApuradas
FOR EACH ROW
BEGIN
    UPDATE Classificacao
    SET posicao = New.posicao
    WHERE idSelecao = New.idSelecao;
END;