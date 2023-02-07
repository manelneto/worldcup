.mode columns
.headers on
.nullvalue NULL

SELECT nome, capacidade
FROM Estadio
WHERE lower(nome) LIKE '%al%'
ORDER BY 2 DESC, 1;

--Listar o nome e a capacidade dos estádios cujo nome contém “AL” (com qualquer combinação de maiúsculas e minúsculas)
--Ordenar por capacidade decrescente e, em caso de igualdade neste critério, por nome