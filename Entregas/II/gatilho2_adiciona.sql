PRAGMA foreign_keys = ON;

CREATE TRIGGER VerificarEmpateFaseEliminar
BEFORE INSERT ON JogoEliminatorias
FOR EACH ROW
WHEN
    substr(New.resultadoPenaltis, 0, instr(New.resultadoPenaltis, '-')) = substr(New.resultadoPenaltis, instr(New.resultadoPenaltis, '-') + 1)
    OR (New.resultadoPenaltis IS NULL AND substr(New.resultadoProlongamento, 0, instr(New.resultadoProlongamento, '-')) = substr(New.resultadoProlongamento, instr(New.resultadoProlongamento, '-') + 1))
    OR (New.resultadoPenaltis IS NULL AND New.resultadoPenaltis IS NULL AND
        (SELECT substr(resultadoRegulamentar, 0, instr(resultadoRegulamentar, '-')) FROM Jogo WHERE New.idJogo = Jogo.idJogo) = (SELECT substr(resultadoRegulamentar, instr(resultadoRegulamentar, '-') + 1) FROM Jogo WHERE New.idJogo = Jogo.idJogo)
    )
BEGIN
    SELECT raise(abort, 'Um jogo da fase a eliminar não pode terminar empatado. O jogo deve ser desempatado no prolongamento (resultadoProlongamento) ou, se permanecer empatado, nos penáltis (resultadoPenaltis).');
END;