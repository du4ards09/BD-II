CREATE DATABASE bdOrgNG

USE bdOrgNG

CREATE TABLE tbStatus(
	idStatus INT PRIMARY KEY IDENTITY(1,1)
	,descStatus VARCHAR(30) NOT NULL
)

CREATE TABLE tbSexo(
	idSexo INT PRIMARY KEY IDENTITY(1,1)
	,descSexo VARCHAR(30) NOT NULL
)

CREATE TABLE tbCrianca(
	idCrianca INT PRIMARY KEY IDENTITY(1,1)
	,nomeCrianca VARCHAR(100) NOT NULL
	,dtNascCrianca SMALLDATETIME NOT NULL
	,cpfCrianca CHAR(11)
	,idStatus INT FOREIGN KEY REFERENCES tbStatus(idStatus)
	,idSexo INT FOREIGN KEY REFERENCES tbSexo(idSexo)
)

CREATE TABLE tbGenitor(
	idGenitor INT PRIMARY KEY IDENTITY(1,1)
	,nomeGenitor VARCHAR(40) NOT NULL
	,cpfGenitor CHAR(11)
)

CREATE TABLE tbFiliacao(
	idFiliacao INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
	,idGenitor INT FOREIGN KEY REFERENCES tbGenitor(idGenitor)
)

CREATE TABLE tbProntuario(
	idProntuario INT PRIMARY KEY IDENTITY(1,1)
	,dataAbertura SMALLDATETIME NOT NULL
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
)

CREATE TABLE tbDoenca(
	idDoenca INT PRIMARY KEY IDENTITY(1,1)
	,nomeDoenca VARCHAR(30) NOT NULL
	,cid VARCHAR(40) NOT NULL
)

CREATE TABLE tbProntuarioDoenca(
	idProntuarioDoenca INT PRIMARY KEY IDENTITY(1,1)
	,dataAcometimento SMALLDATETIME NOT NULL
	,idProntuario INT FOREIGN KEY REFERENCES tbProntuario(idProntuario)
	,idDoenca INT FOREIGN KEY REFERENCES tbDoenca(idDoenca)
)

CREATE TABLE tbObservacaoCrianca(
	idObservacaoCrianca INT PRIMARY KEY IDENTITY(1,1)
	,obsCrianca VARCHAR(200) NOT NULL
	,dataObseervacaoCrianca SMALLDATETIME NOT NULL
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
)

CREATE TABLE  tbPadrinho(
	idPadrinho INT PRIMARY KEY IDENTITY(1,1)
	,nomePadrinho VARCHAR(40) NOT NULL
	,cpfPadrinho CHAR(11) NOT NULL
)

CREATE TABLE tbApadrinhamento(
	idApadrinhamento INT PRIMARY KEY IDENTITY(1,1)
	,dataApadrinhamento SMALLDATETIME NOT NULL
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
	,idPadrinho INT FOREIGN KEY REFERENCES tbPadrinho(idPadrinho)
)