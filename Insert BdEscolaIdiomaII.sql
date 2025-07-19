USE bdEscolaIdioma

INSERT INTO tbCurso (nomeCurso, valorCurso)
VALUES
	('Inglês', 356)
	,('Alemão', 450)
	,('Espanhol', 433)
SELECT*FROM tbCurso
	
INSERT INTO tbAluno (nomeAluno, rgAluno,cpfAluno,logradouro, numero, complemento, cep, bairro, cidade, dataNascimento)
VALUES
	('José Carlos', '5.553.45-56', '452.984.517-53', 'Rua Severino Solto Maior', '5', 'Bloco B', '46464-451', 'Cidade Tiradentes', 'São Paulo', 2002/06/07)
	,('Lucas Silva', '78.858.16-84', '123.456.789-10', 'Rua Taboa', 19, '', '12345-678', 'Vila Yolanda II', 'São Paulo', 2000/04/27)
	,('Tio Baú', '12.345.67-89', '455.451.545-50', 'Rua Taboa', 17, '', '12345-678', 'Vila Yolanda II', 'São Paulo', 1989/05/05)
SELECT*FROM tbAluno
	
INSERT INTO tbNivel (descricaoNivel)
VALUES
	('Basico')
	,('Médio')
	,('Avançado')
SELECT*FROM tbNivel
	
INSERT INTO tbPeriodo (descricaoPeriodo)
VALUES
	('Manhã')
	,('Tarde')
	,('Noite')
SELECT*FROM tbPeriodo
