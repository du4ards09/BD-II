USE BdHabilitacao


INSERT INTO tbMotorista (nomeMotorista, cpfMotorista, pontuacaoAcumulada, situacao)
VALUES ('Joana Bruna da Luz', '694.376.678-37', 3, 'Ativo')
	, ('Davi Emanuel Silva', '322.851.298-31', 13, 'Ativo')
	,('Thiago Heitor Viana', '073.344.358-34', 17, 'Ativo')
	,('Isabel Emily Peixoto', '614.861.028-08', 5, 'Ativo')
	,('Antonio Luan Bruno dos Santos', '763.234.898-05', 1, 'Ativo')
	,('Sophia Brenda Assis', '226.067.888-26', 15, 'Ativo')
SELECT * FROM tbMotorista

INSERT INTO tbVeiculo(placa, renavam, anoFabricacao, codMotorista)
VALUES ('FRA-7836', 48984657767, '2005', 1)
	, ('DOE-1143', 34415876642, '2009', 2)
	, ('EGD-3731', 19428626875, '1985', 3)
	, ('CRE-7773', 53237695325, '2005', 4)
	, ('DGJ-6603', 92081126249, '2010', 5)
	, ('BGT-4210', 60816436863, '2014', 6)
SELECT * FROM tbVeiculo

INSERT INTO tbMulta(dataMulta, numPontos, codVeiculo)
VALUES ('03/06/2023', 2,1)
	,('13/08/2022', 1, 1)
	,('12/07/2022', 5, 2)
	,('01/03/2023', 6, 2)
	,('09/08/2023', 2, 2)
	,('27/08/2023', 7, 3)
	,('18/06/2023', 5, 3)
	,('18/03/2022', 5, 3)
	,('02/05/2023', 3, 4)
	,('23/06/2023', 2, 4)
	,('22/06/2022', 1, 5)
	,('03/04/2023', 3, 6)
	,('15/04/2023', 5, 6)
	,('10/08/2023', 3, 6)
	,('14/06/2022', 4, 6)
SELECT * FROM tbMulta

