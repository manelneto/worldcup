.mode columns
.headers on
.nullvalue NULL

SELECT pais
FROM Selecao
WHERE NOT EXISTS (
    SELECT *
    FROM Jogo NATURAL JOIN Fase
    WHERE nome = 'Fase de Grupos' AND ((idVisitada = idSelecao AND substr(resultadoRegulamentar, 0, instr(resultadoRegulamentar, '-')) = '0') OR (idVisitante = idSelecao AND substr(resultadoRegulamentar, instr(resultadoRegulamentar, '-') + 1) = '0'))
)
ORDER BY 1;

--Listar o país das seleções que marcaram golo em todos os jogos da fase de grupos
--Ordenar por país