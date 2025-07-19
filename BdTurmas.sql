--DROP DATABASE bdTurmas;
CREATE DATABASE bdTurmas
USE bdTurmas
GO

CREATE TABLE tb2A(
	Rm INT PRIMARY KEY 
	,nome VARCHAR (100)
	,status  VARCHAR (30)
)

CREATE TABLE tb2B(

	Rm INT PRIMARY KEY 
	,nome VARCHAR (100)
	,status  VARCHAR (30)
)

CREATE TABLE tbTerceiro(

	RmTerceiro INT PRIMARY KEY 
	,nomeTerceiro VARCHAR (100)
	,statusTerceiro  VARCHAR (30)
)

INSERT INTO tb2A(Rm,nome,status)
	VALUES(290,'Gabrielly','APROVADO')
		,(287,'Alexandra','REPROVADO')
		,(222,'Fernanda','REPROVADO')
		,(358,'Gustavo','APROVADO')
		,(123,'Jany','APROVADO')
		,(459,'Lucas','REPROVADO')
		,(795,'Gabriel','APROVADO')
		,(963,'Leandro','APROVADO')
		,(452,'Vanessa','APROVADO')
		,(789,'Melissa','APROVADO')

SELECT * FROM tb2A


INSERT INTO tb2B(Rm,nome,status)
	VALUES(685,'Gabrielly','APROVADO')
		,(475,'Kauan','REPROVADO')
		,(227,'Leonardo','REPROVADO')
		,(362,'Henrique','APROVADO')
		,(321,'Vinicius','APROVADO')
		,(258,'Lucas','APROVADO')
		,(946,'Ana','APROVADO')
		,(251,'Ester','APROVADO')
		,(738,'Felipe','APROVADO')
		,(472,'Fabiano','REPROVADO')

SELECT * FROM tb2B