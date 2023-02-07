.mode columns
.headers on
.nullvalue NULL

SELECT nome, pais, numero
FROM Jogador NATURAL JOIN Selecao NATURAL JOIN (
    SELECT idJogador, count(*) GolosFaseGrupos
    FROM Golo G NATURAL JOIN Jogo J NATURAL JOIN Fase F
    WHERE F.nome = 'Fase de Grupos'
    GROUP BY 1) FaseGrupos
WHERE EXISTS (
    SELECT *
    FROM (
        SELECT idJogador, count(*) GolosFaseEliminar
        FROM Golo G NATURAL JOIN Jogo J NATURAL JOIN Fase F
        WHERE F.nome <> 'Fase de Grupos'
        GROUP BY 1) FaseEliminar
    WHERE FaseGrupos.idJogador = FaseEliminar.idJogador
)
ORDER BY 3, 1;

--Listar o nome, o país da seleção e o número da camisola dos jogadores que marcaram golo na fase de grupos e na fase a eliminar
--Ordenar por número da camisola e, em caso de igualdade neste critério, por nome