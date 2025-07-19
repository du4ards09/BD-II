CREATE DATABASE bdConfeitaria

DROP DATABASE bdConfeitaria

USE bdConfeitaria
 
CREATE TABLE tbCliente (
	idCliente INT PRIMARY KEY IDENTITY (1,1)
	, nomeCLiente VARCHAR (30)
	, cpfCliente CHAR (14)
	, logradouroCliente VARCHAR (30)
	, numLogCliente VARCHAR (4)
	, compCliente VARCHAR (20)
	, bairroCliente VARCHAR (30)
	, cidadeCliente VARCHAR (25)
	, ufCliente CHAR (2)
)

CREATE TABLE tbFoneCliente (
	idFoneCliente INT PRIMARY KEY IDENTITY (1,1)
	, nmrFoneCliente VARCHAR (16)
	, idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
)

CREATE TABLE tbTipoProduto (
	idTipoProduto INT PRIMARY KEY IDENTITY (1,1)
	, descTipoProduto VARCHAR (20)
)

CREATE TABLE tbProduto (
	idProduto INT PRIMARY KEY IDENTITY (1,1)
	, valorProduto VARCHAR (12)
	, nomeProduto VARCHAR (15)
	, gramaturaProduto DECIMAL
	, idTipoProduto INT FOREIGN KEY REFERENCES tbTipoProduto (idTipoProduto)
)

CREATE TABLE tbEncomenda (
	idEncomenda INT PRIMARY KEY IDENTITY (1,1)
	, dtEncomenda CHAR (10)
	, dtEntregaEncomenda CHAR (10)
	, valorTotalEncomenda VARCHAR (12)
	, idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
)

CREATE TABLE tbItemEncomenda(
	idItemEncomenda INT PRIMARY KEY IDENTITY(1,1)
	,qtdProduto INT
	, idProduto INT FOREIGN KEY REFERENCES tbProduto (idProduto)
	, idEncomenda INT FOREIGN KEY REFERENCES tbEncomenda (idEncomenda)
)