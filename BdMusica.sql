DROP DATABASE bdGravadora
CREATE DATABASE bdGravadora
USE bdGravadora
GO

CREATE TABLE tbAutor(
	codAutor INT PRIMARY KEY IDENTITY (1,1)
	,nomeAutor VARCHAR(40) NOT NULL
)

CREATE TABLE tbMusica(
	codMusica INT PRIMARY KEY IDENTITY (1,1)
	,nomeMusica VARCHAR(30) NOT NULL
	,duracaoMusica TIME NOT NULL
	,dataComposicaoMusica DATE NOT NULL
	,valorDireitoAutoralMusica SMALLMONEY NOT NULL
)

CREATE TABLE tbAutoria(
	codAutoria INT PRIMARY KEY IDENTITY (1,1)
	,codAutor INT FOREIGN KEY REFERENCES tbAutor (codAutor)
	,codMusica INT FOREIGN KEY REFERENCES tbMusica (codMusica)
)

