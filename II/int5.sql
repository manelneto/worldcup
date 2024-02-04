.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT letra, pais
FROM Grupo NATURAL JOIN Selecao
WHERE idGrupo NOT IN (
    SELECT idGrupo
    FROM (
        SELECT idSelecao, idGrupo, sum(pontosVisitada) totalPontosVisitada
        FROM Selecao, JogoGrupos NATURAL JOIN Jogo
        WHERE idSelecao = idVisitada
        GROUP BY 1) Visitadas NATURAL JOIN
        (SELECT idSelecao, idGrupo, sum(pontosVisitante) totalPontosVisitante
        FROM Selecao, JogoGrupos NATURAL JOIN Jogo
        WHERE idSelecao = idVisitante
        GROUP BY 1) Visitantes
    WHERE totalPontosVisitada + totalPontosVisitante < 3
)
ORDER BY 1, 2;

--Listar a letra dos grupos e o país das seleções de cada grupo em que todas as seleções conquistaram pelo menos três pontos
--Ordenar por letra, e em caso de igualdade neste critério, por país