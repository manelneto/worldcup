.mode columns
.headers on
.nullvalue NULL

SELECT nome
FROM Posicao
WHERE idPosicao IN (
    SELECT J.idPosicao
    FROM Jogador J JOIN Golo G ON J.idJogador = G.idJogador
    WHERE J.idSelecao <> G.idSelecao
)
ORDER BY idPosicao;

--Listar os nomes das posições dos jogadores que marcaram algum autogolo
--Ordenar por idPosição