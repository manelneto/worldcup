PRAGMA foreign_keys = ON;

CREATE TRIGGER PreencherJogoGrupos
AFTER INSERT ON Jogo
FOR EACH ROW
WHEN New.idFase = (SELECT idFase FROM Fase Where nome = 'Fase de Grupos')
BEGIN
    INSERT INTO JogoGrupos VALUES (New.idJogo,
        CASE
        WHEN julianday(New.data) = julianday('2022-11-20')
            THEN 1
        ELSE ceiling((julianday(New.data) - julianday('2022-11-20'))/4)
        END,
        CASE
        WHEN substr(New.resultadoRegulamentar, 0, instr(New.resultadoRegulamentar, '-')) - substr(New.resultadoRegulamentar, instr(New.resultadoRegulamentar, '-') + 1) > 0
            THEN 3
        WHEN substr(New.resultadoRegulamentar, 0, instr(New.resultadoRegulamentar, '-')) - substr(New.resultadoRegulamentar, instr(New.resultadoRegulamentar, '-') + 1) < 0
            THEN 0
        ELSE 1
        END,
        CASE
        WHEN substr(New.resultadoRegulamentar, 0, instr(New.resultadoRegulamentar, '-')) - substr(New.resultadoRegulamentar, instr(New.resultadoRegulamentar, '-') + 1) < 0
            THEN 3
        WHEN substr(New.resultadoRegulamentar, 0, instr(New.resultadoRegulamentar, '-')) - substr(New.resultadoRegulamentar, instr(New.resultadoRegulamentar, '-') + 1) > 0
            THEN 0
        ELSE 1
        END);
END;