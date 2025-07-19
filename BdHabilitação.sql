--DROP DATABASE BdHabilitacao caso precise (;)
CREATE DATABASE BdHabilitacao
USE BdHabilitacao
GO 

--INICIANDO O BANCO:
CREATE TABLE tbMotorista(
	codMotorista INT PRIMARY KEY IDENTITY(1,1)
	,nomeMotorista VARCHAR(70) NOT NULL
	,cpfMotorista VARCHAR(15) NOT NULL
	,pontuacaoAcumulada INT NOT NULL
	,situacao VARCHAR (80) NOT NULL
)

CREATE TABLE tbVeiculo(
	codVeiculo INT PRIMARY KEY IDENTITY(1,1)
	,placa VARCHAR(10) NOT NULL
	,renavam VARCHAR(12) NOT NULL
	,anoFabricacao DATE NOT NULL
	,codMotorista INT FOREIGN KEY REFERENCES tbMotorista(codMotorista)
)

CREATE TABLE tbMulta(
	codMulta INT PRIMARY KEY IDENTITY(1,1)
	,dataMulta DATE NOT NULL
	,numPontos INT NOT NULL
	,codVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(codVeiculo)
)