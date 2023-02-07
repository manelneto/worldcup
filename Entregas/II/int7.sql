.mode columns
.headers on
.nullvalue NULL

SELECT *, idade - (
    SELECT round(avg(floor((julianday('2022-11-20') - julianday(dataNascimento))/365.2422))) idadeMedia
    FROM Jogador) diferenca
FROM (
    SELECT nome, pais, dataNascimento, floor((julianday('2022-11-20') - julianday(dataNascimento))/365.2422) idade
    FROM Jogador NATURAL JOIN Selecao
    ORDER BY 3
    LIMIT 10)
UNION
SELECT *, idade - (
    SELECT round(avg(floor((julianday('2022-11-20') - julianday(dataNascimento))/365.2422))) idadeMedia
    FROM Jogador) diferenca
FROM (
    SELECT nome, pais, dataNascimento, floor((julianday('2022-11-20') - julianday(dataNascimento))/365.2422) idade
    FROM Jogador NATURAL JOIN Selecao
    ORDER BY 3 DESC
    LIMIT 10)
ORDER BY 3, 1;

--Listar o nome, o país da seleção, a data de nascimento, a idade na data de início do Mundial de Futebol no Catar (20 de novembro de 2022) e a diferença entre essa idade e a idade média de todos os jogadores, dos dez jogadores mais velhos e dos dez jogadores mais novos
--Ordenar por data de nascimento e, em caso de igualdade neste critério, por nome