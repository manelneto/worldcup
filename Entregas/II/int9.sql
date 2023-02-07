.mode columns
.headers on
.nullvalue NULL

SELECT *, round(1.0 * numeroGolos/numeroJogos, 1) golosPorJogo
FROM (
    SELECT nome, count(DISTINCT idGolo) numeroGolos, count(DISTINCT idJogo) numeroJogos
    FROM Estadio NATURAL JOIN Jogo NATURAL JOIN Golo
    GROUP BY 1
    HAVING numeroJogos >= (SELECT count(*) FROM Jogo)/(SELECT count(*) FROM Estadio)
)
ORDER BY 4 DESC;

--Listar o nome, o número de golos, o número de jogos e a média de golos por jogo de cada estádio no qual se realizaram pelo menos N jogos, sendo N o número total de jogos do Mundial de Futebol no Catar a dividir pelo número total de estádios (ou seja, o número de jogos que seriam realizados em cada estádio se houvesse uma divisão indiscriminada de jogos por estádio)
--Ordenar por número de golos por jogo descrescente
--Pretende-se descobrir qual o estádio mais “vantajoso” para ver um jogo, na perspetiva de ver mais golos, dada uma amostra de jogos minimamente significativa