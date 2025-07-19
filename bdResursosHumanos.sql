DROP DATABASE bdRecursosHumanos
CREATE DATABASE bdRecursosHumanos
USE bdRecursosHumanos
GO 

--Maria Eduarda
CREATE TABLE tbDepartamento(
	codDepartamento INT PRIMARY KEY IDENTITY(1,1)
		,nomeDepartamento VARCHAR(40) NOT NULL
)

CREATE TABLE tbFuncionario(
	codFuncionario INT PRIMARY KEY IDENTITY(1,1)
		,nomeFuncionario VARCHAR(50) NOT NULL
		,cpfFuncionario VARCHAR(20) NOT NULL
		,sexoFuncionario VARCHAR(2) NOT NULL
		,dataNascimentoFuncionario SMALLDATETIME NOT NULL
		,salarioFuncionario SMALLMONEY NOT NULL
		, codDepartamento INT FOREIGN KEY REFERENCES tbDepartamento(codDepartamento)
)

CREATE TABLE tbDependente(
	codDependente INT PRIMARY KEY IDENTITY(1,1)
		,nomeDependente VARCHAR(60) NOT NULL
		,dataNascimentoDependente SMALLDATETIME NOT NULL
		,sexoDependente VARCHAR(2) NOT NULL
		,codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(codFuncionario)
)