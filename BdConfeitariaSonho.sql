--DROP DATABASE BdConfeitariaSonho (Caso Precise ;))
CREATE DATABASE BdConfeitariaSonho
GO
USE BdConfeitariaSonho

--INICIANDO O BANCO:
CREATE TABLE tbCategoria(
	codCategoria INT PRIMARY KEY IDENTITY (1,1)
	,nomeCategoria VARCHAR(40) NOT NULL
)

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR(50) NOT NULL
	,dataNascimento DATE NOT NULL
	,cpfCliente VARCHAR(15) NOT NULL
	,sexoCliente VARCHAR(2) NOT NULL
	,rua VARCHAR(70) NOT NULL
	,numCasa VARCHAR(5) NOT NULL
	,cep VARCHAR(13) NOT NULL
	,bairro VARCHAR(50) NOT NULL
	,cidade VARCHAR(50) NOT NULL
	,estado VARCHAR(50) NOT NULL
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeProduto VARCHAR(50) NOT NULL
	,precoKilo MONEY NOT NULL
	,codCategoria INT FOREIGN KEY REFERENCES tbCategoria(codCategoria)
)

CREATE TABLE tbEncomenda(
	codEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,dataEncomenda DATE NOT NULL
	,dataEntrega DATE NOT NULL
	,valorTotal MONEY NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbItensEncomenda(
	codItensEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,qtdeKilos DECIMAL
	,subTotal MONEY NOT NULL
	,codEncomenda INT FOREIGN KEY REFERENCES tbEncomenda(codEncomenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
)