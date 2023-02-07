.mode columns
.headers on
.nullvalue NULL

SELECT * FROM
(SELECT pais, resultadoRegulamentar Oitavos FROM Selecao, Jogo NATURAL JOIN Fase WHERE (idVisitada = idSelecao OR idVisitante = idSelecao) AND nome = 'Oitavos-de-Final') LEFT OUTER JOIN
(SELECT pais, resultadoRegulamentar Quartos FROM Selecao, Jogo NATURAL JOIN Fase WHERE (idVisitada = idSelecao OR idVisitante = idSelecao) AND nome = 'Quartos-de-Final') USING(pais) LEFT OUTER JOIN
(SELECT pais, resultadoRegulamentar Meias FROM Selecao, Jogo NATURAL JOIN Fase WHERE (idVisitada = idSelecao OR idVisitante = idSelecao) AND nome = 'Meias-Finais') USING(pais) LEFT OUTER JOIN
(SELECT pais, resultadoRegulamentar Final FROM Selecao, Jogo NATURAL JOIN Fase WHERE (idVisitada = idSelecao OR idVisitante = idSelecao) AND nome = 'Final') USING(pais)
ORDER BY 5 DESC, 4 DESC, 3 DESC, 1;

--Listar o país das seleções que passaram à fase a eliminar e os resultados regulamentares que obtiveram em cada jogo da fase a eliminar até serem eliminadas (a partir do jogo em que a seleção foi eliminada, o resultado a apresentar deve ser NULL)
--Ordenar de modo que os valores NULL fiquem nas últimas linhas de cada coluna em que podem aparecer (resultados dos quartos-de-final, meias-finais e final) e, em caso de igualdade neste critério, por país
--Pretende-se apresentar uma versão simplificada do “quadro” da fase a eliminar, isto é, uma tabela que indica em que jogo da fase a eliminar cada seleção foi eliminada (e o resultado regulamentar que ditou essa eliminação), pelo que não se apresenta o jogo de atribuição do terceiro e quarto lugares