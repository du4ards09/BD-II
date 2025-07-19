DROP DATABASE BdEscola
CREATE DATABASE BdEscola
USE BdEscola
GO

--COMEÇANDO O BANCO 
CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY IDENTITY(1,1)
		,nomeAluno VARCHAR(30) NOT NULL
		,dataNascimentoAluno SMALLDATETIME NOT NULL
		,rgAluno VARCHAR(15) NOT NULL
		,naturalidadeAluno VARCHAR(2) NOT NULL
)

CREATE TABLE tbCurso(
	codCurso INT PRIMARY KEY IDENTITY(1,1)
		,nomeCurso VARCHAR(30) NOT NULL
		,cargaHorariaCurso INT NOT NULL
		,valorCurso SMALLMONEY NOT NULL
)

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
		,nomeTurma VARCHAR(30) NOT NULL
		,horarioTurma SMALLDATETIME NOT NULL
		,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
)

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
		,dataMatricula DATE NOT NULL
		,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
		,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)