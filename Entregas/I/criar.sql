DROP TABLE IF EXISTS Grupo;

CREATE TABLE Grupo
(
	idGrupo INTEGER CONSTRAINT GrupoIdGrupoNotNull NOT NULL,
	letra TEXT CONSTRAINT GrupoLetraValida CHECK (letra >= 'A' AND letra <= 'H'),
	CONSTRAINT GrupoPK PRIMARY KEY (idGrupo),
	CONSTRAINT GrupoLetraCK UNIQUE (letra)
);

DROP TABLE IF EXISTS Selecao;

CREATE TABLE Selecao
(
	idSelecao INTEGER CONSTRAINT SelecaoIdSelecaoNotNull NOT NULL,
	pais TEXT CONSTRAINT SelecaoPaisNotNull NOT NULL,
	idGrupo INTEGER CONSTRAINT SelecaoIdGrupoNotNull NOT NULL,
	CONSTRAINT SelecaoPK PRIMARY KEY (idSelecao),
	CONSTRAINT SelecaoGrupoFK FOREIGN KEY (idGrupo) REFERENCES Grupo ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT SelecaoPaisCK UNIQUE (pais)
);

DROP TABLE IF EXISTS Classificacao;

CREATE TABLE Classificacao
(
	idSelecao INTEGER CONSTRAINT ClassificacaoIdSelecaoNotNull NOT NULL,
	idGrupo INTEGER CONSTRAINT ClassificacaoIdGrupoNotNull NOT NULL,
	posicao INTEGER CONSTRAINT ClassificacaoPosicaoValida CHECK (posicao >= 1 AND posicao <= 4),
	CONSTRAINT ClassificacaoPK PRIMARY KEY (idSelecao),
	CONSTRAINT ClassificacaoSelecaoFK FOREIGN KEY (idSelecao) REFERENCES Selecao ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT ClassificacaoGrupoFK FOREIGN KEY (idGrupo) REFERENCES Grupo ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT ClassificacaoGrupoPosicaoCK UNIQUE (idGrupo, posicao)
);

DROP TABLE IF EXISTS Posicao;

CREATE TABLE Posicao
(
	idPosicao INTEGER CONSTRAINT PosicaoIdPosicaoNotNull NOT NULL,
	nome TEXT CONSTRAINT PosicaoNomeNotNull NOT NULL,
	CONSTRAINT PosicaoPK PRIMARY KEY (idPosicao),
	CONSTRAINT PosicaoNomeCK UNIQUE (nome)
);

DROP TABLE IF EXISTS Jogador;

CREATE TABLE Jogador
(
	idJogador INTEGER CONSTRAINT JogadorIdJogadorNotNull NOT NULL,
	numero INTEGER CONSTRAINT numeroValido CHECK (numero >= 1 AND numero <= 26),
	nome TEXT CONSTRAINT JogadorNomeNotNull NOT NULL,
	dataNascimento DATE CONSTRAINT JogadorDataNascimentoNotNull NOT NULL,
	idPosicao INTEGER CONSTRAINT JogadorIdPosicaoNotNull NOT NULL,
	idSelecao INTEGER CONSTRAINT JogadorIdSelecaoNotNull NOT NULL,
	CONSTRAINT JogadorPK PRIMARY KEY (idJogador),
	CONSTRAINT JogadorPosicaoFK FOREIGN KEY (idPosicao) REFERENCES Posicao ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT JogadorSelecaoFK FOREIGN KEY (idSelecao) REFERENCES Selecao ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT JogadorNumeroSelecaoCK UNIQUE (numero, idSelecao)
);

DROP TABLE IF EXISTS Estadio;

CREATE TABLE Estadio
(
	idEstadio INTEGER CONSTRAINT EstadioIdEstadioNotNull NOT NULL,
	nome TEXT CONSTRAINT EstadioNomeNotNull NOT NULL,
	capacidade INTEGER CONSTRAINT capacidadePositiva CHECK (capacidade > 0),
	CONSTRAINT EstadioPK PRIMARY KEY (idEstadio),
	CONSTRAINT EstadioNomeCK UNIQUE (nome)
);

DROP TABLE IF EXISTS Fase;

CREATE TABLE Fase
(
	idFase INTEGER CONSTRAINT FaseIdFaseNotNull NOT NULL,
	nome TEXT CONSTRAINT FaseNomeNotNull NOT NULL,
	dataInicio DATE CONSTRAINT dataInicioValida CHECK (dataInicio >= '2022-11-20'),
	dataFim DATE CONSTRAINT dataFimValida CHECK (dataFim <= '2022-12-18'),
	CONSTRAINT FasePK PRIMARY KEY (idFase),
	CONSTRAINT FaseNomeCK UNIQUE (nome),
	CONSTRAINT FaseDataInicioCK UNIQUE (dataInicio),
	CONSTRAINT FaseDataFimCK UNIQUE (dataFim),
	CONSTRAINT FaseDatasValidas CHECK (dataInicio <= dataFim)
);

DROP TABLE IF EXISTS Jogo;

CREATE TABLE Jogo
(
	idJogo INTEGER CONSTRAINT JogoIdJogoNotNull NOT NULL,
	data DATE CONSTRAINT dataValida CHECK (data >= '2022-11-20' AND data <= '2022-12-18'),
	resultadoRegulamentar TEXT CONSTRAINT JogoResultadoRegulamentarNotNull NOT NULL,
	idEstadio INTEGER CONSTRAINT JogoIdEstadioNotNull NOT NULL,
	idVisitada INTEGER CONSTRAINT JogoIdVisitadaNotNull NOT NULL,
	idVisitante INTEGER CONSTRAINT JogoIdVisitanteNotNull NOT NULL,
	idFase INTEGER CONSTRAINT JogoIdFaseNotNull NOT NULL,
	CONSTRAINT JogoPK PRIMARY KEY (idJogo)
	CONSTRAINT JogoEstadioFK FOREIGN KEY (idEstadio) REFERENCES Estadio ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT JogoVisitadaFK FOREIGN KEY (idVisitada) REFERENCES Selecao ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT JogoVisitanteFK FOREIGN KEY (idVisitante) REFERENCES Selecao ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT JogoFaseFK FOREIGN KEY (idFase) REFERENCES Fase ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT JogoDataEstadioCK UNIQUE (data, idEstadio),
	CONSTRAINT JogoDataVisitadaCK UNIQUE (data, idVisitada),
	CONSTRAINT JogoDataVisitanteCK UNIQUE (data, idVisitante),
	CONSTRAINT JogoVisitadaVisitanteFaseCK UNIQUE (idVisitada, idVisitante, idFase)
);

DROP TABLE IF EXISTS Golo;

CREATE TABLE Golo
(
	idGolo INTEGER CONSTRAINT GoloIdGoloNotNull NOT NULL,
	minuto INTEGER CONSTRAINT minutoPositivo CHECK (minuto > 0),
	idJogador INTEGER CONSTRAINT GoloIdJogadorNotNull NOT NULL,
	idSelecao INTEGER CONSTRAINT GoloIdSelecaoNotNull NOT NULL,
	idJogo INTEGER CONSTRAINT GoloIdJogoNotNull NOT NULL,
	CONSTRAINT GoloPK PRIMARY KEY (idGolo),
	CONSTRAINT GoloJogadorFK FOREIGN KEY (idJogador) REFERENCES Jogador ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT GoloSelecaoFK FOREIGN KEY (idSelecao) REFERENCES Selecao ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT GoloJogoFK FOREIGN KEY (idJogo) REFERENCES Jogo ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS JogoGrupos;

CREATE TABLE JogoGrupos
(
	idJogo INTEGER CONSTRAINT JogoGruposIdJogoNotNull NOT NULL,
	jornada INTEGER CONSTRAINT jornadaValida CHECK (jornada >= 1 AND jornada <= 3),
	pontosVisitada INTEGER CONSTRAINT pontosVisitadaValidos CHECK (pontosVisitada = 0 OR pontosVisitada = 1 OR pontosVisitada = 3),
	pontosVisitante INTEGER CONSTRAINT pontosVisitanteValidos CHECK (pontosVisitante = 0 OR pontosVisitante = 1 OR pontosVisitante = 3),
	CONSTRAINT JogoGruposPK PRIMARY KEY (idJogo),
	CONSTRAINT JogoGruposJogoFK FOREIGN KEY (idJogo) REFERENCES Jogo ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT JogoPontosValidos CHECK (pontosVisitada + pontosVisitante = 2 OR pontosVisitada + pontosVisitante = 3)
);

DROP TABLE IF EXISTS JogoEliminatorias;

CREATE TABLE JogoEliminatorias
(
	idJogo INTEGER CONSTRAINT JogoEliminatoriasIdJogoNotNull NOT NULL,
	resultadoProlongamento TEXT,
	resultadoPenaltis TEXT,
	CONSTRAINT JogoEliminatoriasPK PRIMARY KEY (idJogo),
	CONSTRAINT JogoEliminatoriasJogoFK FOREIGN KEY (idJogo) REFERENCES Jogo ON UPDATE CASCADE ON DELETE CASCADE
);