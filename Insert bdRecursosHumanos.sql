USE bdRecursosHumanos

--Maria Eduarda
INSERT INTO tbDepartamento(nomeDepartamento)
VALUES ('Compras')
	,('Vendas')
	,('TI')
	,('Markenting')

SELECT*FROM tbDepartamento

INSERT INTO tbFuncionario(nomeFuncionario,cpfFuncionario,sexoFuncionario,dataNascimentoFuncionario,salarioFuncionario,codDepartamento)
VALUES ('Maria Luisa Moura',12345678900,'F','1990-02-10',3400.00,1)
	,('Mariana Goulart',45678909299,'F','1991-04-08',2800.00,1)
	,('Pedro Paulo Vidigal',64587222388,'M','1994-05-07',5400.00,2)
	,('Carlos Calixto',83738232233,'M','1965-03-03',8900.00,2)
	,('Viviane Martins',77832233399,'F','1976-06-06',4300.00,3)
	,('Analice Mendes',83703383493,'F','1981-09-09',6800.00,3)
	,('Patricia Ishikawa',43356609300,'F','1978-05-05',4900.00,4)

SELECT*FROM tbFuncionario

INSERT INTO tbDependente(nomeDependente,dataNascimentoDependente,sexoDependente,codFuncionario)
VALUES ('Lucas Moura','10/01/2015','M',1)
	,('Carlos Calixto Jr','08/06/2000','M',4)
	,('Michele Costa Calixto','09/09/2003','F',4)
	,('Silvana Costa Calixto','04/04/2006','F',4)
	,('Arthur Mendes Silva','07/07/2010','M',6)

SELECT*FROM tbDependente