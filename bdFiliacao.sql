DROP DATABASE bdFiliacao
CREATE DATABASE bdFiliacao
USE bdFiliacao
GO

CREATE TABLE tbPai(
	codPai INT PRIMARY KEY IDENTITY NOT NULL
	, nomePai CHAR(30) NOT NULL
	, idadePai CHAR(2) NOT NULL
)

CREATE TABLE tbFilho(
	codFilho INT PRIMARY KEY IDENTITY NOT NULL
	, nomeFilho CHAR(30) NOT NULL
	, sexoFilho CHAR(1) CHECK(sexoFilho IN ('F','M'))
)