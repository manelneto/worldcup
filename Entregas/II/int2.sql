.mode columns
.headers on
.nullvalue NULL

SELECT pais, round(avg(length(nome)), 1) comprimentoMedio
FROM Jogador NATURAL JOIN Selecao
GROUP BY 1
ORDER BY 2, 1;

--Listar o país das seleções e o comprimento médio dos nomes dos jogadores de cada seleção (arredondado às décimas)
--Ordenar por comprimento médio dos nomes dos jogadores e, em caso de igualdade neste critério, por país