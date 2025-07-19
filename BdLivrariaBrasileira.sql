DROP DATABASE bdLivrariaBrasileira

CREATE DATABASE bdLivrariaBrasileira

USE bdLivrariaBrasileira

CREATE TABLE tbAutor (
	idAutor INT PRIMARY KEY IDENTITY (1,1)
	,nomeAutor VARCHAR (50)
)

CREATE TABLE tbGenero (
	idGenero INT PRIMARY KEY IDENTITY (1,1)
	,nomeGenero VARCHAR(30)
)

CREATE TABLE tbEditora (
	idEditora INT PRIMARY KEY IDENTITY (1,1)
	,nomeEditora VARCHAR(30)
)

CREATE TABLE tbLivro (
	idLivro INT PRIMARY KEY IDENTITY (1,1)
	,nomeLivro VARCHAR(100)
	,numPaginas INT
	,idGenero INT FOREIGN KEY REFERENCES tbGenero (idGenero)
	,idAutor INT FOREIGN KEY REFERENCES tbAutor (idAutor)
	,idEditora INT FOREIGN KEY REFERENCES tbEditora (idEditora)
)