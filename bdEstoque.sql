DROP DATABASE bdEstoque
CREATE DATABASE bdEstoque

USE bdEstoque

CREATE TABLE tbFabricante(
 idFabricante INT PRIMARY KEY IDENTITY (1,1)
 ,nomeFabricante VARCHAR (45) NOT NULL
)

CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (35)  NOT NULL 
	,cpfCliente CHAR (11) NOT NULL 
	,emailCliente VARCHAR (50) NOT NULL 
	,sexoCliente CHAR (1) NOT NULL
	,dataNasciCliente SMALLDATETIME NOT NULL
)

CREATE TABLE tbFornecedor(
    idFornecedor INT PRIMARY KEY IDENTITY (1,1)
	,nomeFornecedor VARCHAR (35) NOT NULL
	,contatoFornecedor VARCHAR (20) NOT NULL
)

CREATE TABLE tbVendas(
	idVendas INT PRIMARY KEY IDENTITY (1,1)
	,dataVenda SMALLDATETIME NOT NULL
	,valorTotalVenda SMALLMONEY NOT NULL
	,idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
)

CREATE TABLE tbProduto(
     idProduto INT PRIMARY KEY IDENTITY (1,1)
	 ,descricaoProduto VARCHAR (25) NOT NULL
	 ,valorProduto SMALLMONEY NOT NULL
	 ,quantidadeProduto INT  NOT NULL
	 ,idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
	 ,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
)

CREATE TABLE tbItensVendas(
	idItensVenda INT PRIMARY KEY IDENTITY (1,1)
	,idVendas INT FOREIGN KEY REFERENCES tbVendas(idVendas)
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,quantidadeItensVendas INT NOT NULL
	,subTotalVendas SMALLMONEY NOT NULL
)

 

