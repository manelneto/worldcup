.mode columns
.headers on
.nullvalue NULL

SELECT nome, numero, pais, golosJogador, round(1.0 * golosJogador/golosSelecao * 100, 1) percentagemGolosSelecao
FROM (
    SELECT idJogador, idSelecao, count(*) golosJogador
    FROM Jogador NATURAL JOIN Golo
    GROUP BY 1
    HAVING golosJogador > 0) golosIndividual NATURAL JOIN
    (SELECT idSelecao, count(*) golosSelecao
    FROM Selecao NATURAL JOIN Golo
    GROUP BY 1
    HAVING golosSelecao > 0) golosColetivo NATURAL JOIN Jogador Natural JOIN Selecao
ORDER BY 3, 5 DESC, 4 DESC, 2;

--Listar o nome, o número da camisola, o país da seleção, o número de golos e a correspondente percentagem no total de golos da seleção dos jogadores que marcaram pelo menos um golo
--Ordenar por país e, em caso de igualdade neste critério, por percentagem decrescente e, em caso de igualdade neste critério, por número de golos decrescente e, em caso de igualdade neste critério, por número da camisola
--Pretende-se analisar a “dependência” que cada seleção tem de jogadores individuais