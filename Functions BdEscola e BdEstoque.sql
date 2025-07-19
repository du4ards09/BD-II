USE BdEscola

--Maria Eduarda
--1)Crie uma função que informada uma data da matricula, retorne o dia da semana.
CREATE FUNCTION dbo.fc_DiaSemana(@Data DATE)
RETURNS VARCHAR(40)
	AS
	BEGIN

	DECLARE @DiaSemana VARCHAR(40)
	DECLARE @Dia  INT

	SET @Dia = DATEPART(DW, @DATA)

	IF @Dia = 1
		BEGIN
	SET @DiaSemana = 'DOMINGO'
	END
	IF @Dia = 2
		BEGIN
	SET @DiaSemana = 'SEGUNDA-FEIRA'
	END
	IF @Dia = 3
		BEGIN
	SET @DiaSemana = 'TERÇA-FEIRA'
	END
	IF @Dia = 4
		BEGIN
	SET @DiaSemana = 'QUARTA-FEIRA'
	END

	IF @Dia = 5
		BEGIN
	SET @DiaSemana = 'QUINTA-FEIRA'
	END
	IF @Dia = 6
		BEGIN
	SET @DiaSemana = 'SEXTA-FEIRA'
	END
	IF @Dia = 7
		BEGIN
	SET @DiaSemana = 'SÁBADO'
	END	
		RETURN @DiaSemana
	END

	--Uso da função
	SELECT dataMatricula as 'Data Matricula',
	DiaDaSemana = dbo.fc_DiaSemana (dataMatricula) FROM tbMatricula

	DROP FUNCTION dbo.fc_DiaSemana


--Maria Eduarda
--2)Crie uma função que de acordo com a carga horária do curso exiba curso rapido ou curso extenso. (Rápido menos de 1000 horas)
CREATE FUNCTION dbo.fc_ExibirCargaHoraria (@cargaHorariaCurso INT)
	RETURNS VARCHAR(50)
	AS
	BEGIN
		DECLARE @classificacao VARCHAR(50)

		IF @cargaHorariaCurso < 1000
        SET @classificacao = 'Curso Rápido'
    ELSE
        SET @classificacao = 'Curso Extenso'

    RETURN @classificacao
	END

	--Uso da função
	SELECT nomeCurso AS 'Curso:', CargaHorariaCurso AS 'Carga Horária:', dbo.fc_ExibirCargaHoraria(CargaHorariaCurso) AS 'Classificação:' FROM tbCurso

	DROP FUNCTION dbo.fc_ExibirCargaHoraria

--Maria Eduarda
--3)Crie uma função que de acordo com o valor do curso exiba  curso caro ou curso barato. (Curso caro acima de 400).
CREATE FUNCTION dbo.fcPrecoCurso (@valorCurso DECIMAL)
	RETURNS VARCHAR(50)
	AS
	BEGIN
		DECLARE @classificacao VARCHAR(50)

		IF @valorCurso > 400
			SET @classificacao = 'Curso Caro'
		ELSE
			SET @classificacao = 'Curso Barato'

	 RETURN @classificacao
	END

	--Uso da função
	SELECT nomeCurso AS 'Curso:' , ValorCurso AS 'Valor:' , dbo.fcPrecoCurso(ValorCurso) AS 'Classificação:' FROM tbCurso

--Maria Eduarda
--4)Criar uma função que informada a data da matrícula converta-a no formato dd/mm/aaaa.
CREATE FUNCTION dbo.MudarDataMatricula (@dataMatricula DATE)
	RETURNS VARCHAR(10)
	AS
	BEGIN
		DECLARE @dataFormatada VARCHAR(10)

		SET @dataFormatada = FORMAT(@dataMatricula, 'dd/MM/yyyy', 'pt-BR')

		RETURN @dataFormatada
	END

	--Uso da função
	SELECT DataMatricula AS 'Data da Matricula', dbo.MudarDataMatricula(DataMatricula) AS 'Data em PT-BR:' FROM tbMatricula


USE BdEstoque

--Maria Eduarda
--5)Criar uma função que retorne o dia de semana da venda (no formato segunda, terça, etc) ao lado do código da venda, valor total da venda e sua data.
CREATE FUNCTION fc_RetornarDiaSemana (@idVendas INT)
RETURNS TABLE
AS
RETURN
	(SELECT idVendas,valorTotalVenda,dataVenda,FORMAT(DataVenda, 'dddd') AS DiaSemana FROM tbVendas
    WHERE
        idVendas = @idVendas
);

--Uso da função
SELECT *FROM fc_RetornarDiaSemana(1); -- Substitua "1" pelo código da venda desejado

--6)Criar uma função que receba o código do cliente e retorne o total de vendas que o cliente já realizou.
-- Criar uma função para obter o total de vendas por cliente
CREATE FUNCTION dbo.ObterTotalVendasPorCliente (@idCliente INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalVendas INT;

    SELECT @TotalVendas = ISNULL(SUM(ValorTotalVenda), 0) FROM tbVendas
		WHERE idCliente = @idCliente;

    RETURN @TotalVendas;
END;

-- Uso da função

	DECLARE @idCliente INT = 2; -- Substitua "2" pelo código do cliente desejado
	DECLARE @TotalVendas INT;

	SET @TotalVendas = dbo.ObterTotalVendasPorCliente(@idCliente);

	PRINT 'Total de Vendas do Cliente ' + CAST(@idCliente AS NVARCHAR) + ': ' + CAST(@TotalVendas AS NVARCHAR);

--ou:
SELECT idCliente, dbo.ObterTotalVendasPorCliente(idCliente) FROM TbVendas
	WHERE idCliente = 4;

--Maria Eduarda
--7)Criar uma função que receba o código de um vendedor e o mês e informe o total de vendas do vendedor no mês informado.
CREATE FUNCTION dbo.TotalVendasPorVendedorEMes (@idFornecedor INT,@Mes INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalVendas DECIMAL(18, 2);

    SELECT @TotalVendas = ISNULL(SUM(valorTotalVenda), 0)FROM tbVendas
		WHERE @idFornecedor = @idFornecedor AND MONTH(DataVenda) = @Mes;

    RETURN @TotalVendas;
END;

-- Exemplo de chamada da função
DECLARE @idFornecedor INT = 5; -- Substitua 456 pelo código do vendedor desejado
DECLARE @Mes INT = 03; -- Substitua 11 pelo número do mês desejado

DECLARE @TotalVendas DECIMAL(18, 2);

SET @TotalVendas = dbo.TotalVendasPorVendedorEMes(@idFornecedor, @Mes);

PRINT 'Total de Vendas do Vendedor ' + CAST(@idFornecedor AS NVARCHAR) + ' no Mês ' + CAST(@Mes AS NVARCHAR) + ': ' + CAST(@TotalVendas AS NVARCHAR);

--Maria Eduarda
--8)Criar uma função que usando o bdEstoque diga se o cpf do cliente é ou não válido.
CREATE FUNCTION dbo.CpfValidoOuNao(@cpfCliente VARCHAR(11))
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @INICIO INT,
            @SOMA INT,
            @DIG1 INT,
            @DIG2 INT,
            @CPF_TEMPORARIO VARCHAR(11),
            @DIGITOS_IGUAIS CHAR(1),
            @RESULTADO CHAR(1);

    SET @RESULTADO = 'N';

    --VERIFICAÇÃO SE OS DIGITOS SÃO IGUAIS:
    SET @CPF_TEMPORARIO = SUBSTRING(@cpfCliente, 1, 1);
    SET @INICIO = 1;
    SET @DIGITOS_IGUAIS = 'S';

    WHILE (@INICIO <= 11)
    BEGIN
        IF SUBSTRING(@cpfCliente, @INICIO, 1) <> @CPF_TEMPORARIO
            SET @DIGITOS_IGUAIS = 'N';

        SET @INICIO = @INICIO + 1;
    END;

    --CASO OS DIGITOS NÃO SEJAM IGUAIS, COMEÇA O CÁLCULO:
    IF @DIGITOS_IGUAIS = 'N'
    BEGIN
        --1º CÁLCULO:
        SET @SOMA = 0;
        SET @INICIO = 1;

        WHILE (@INICIO <= 9)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@cpfCliente, @INICIO, 1)) * (11 - @INICIO);
            SET @INICIO = @INICIO + 1;
        END;

        SET @DIG1 = 11 - (@SOMA % 11);

        IF @DIG1 > 9
            SET @DIG1 = 0;

        --2º CÁLCULO: 
        SET @SOMA = 0;
        SET @INICIO = 1;

        WHILE (@INICIO <= 10)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@cpfCliente, @INICIO, 1)) * (11 - @INICIO);
            SET @INICIO = @INICIO + 1;
        END;

        SET @DIG2 = 11 - (@SOMA % 11);

        IF @DIG2 > 9
            SET @DIG2 = 0;

        --VALIDAÇÃO:
        IF (@DIG1 = CONVERT(INT, SUBSTRING(@cpfCliente, LEN(@cpfCliente) - 1, 1))) AND (@DIG2 = CONVERT(INT, SUBSTRING(@cpfCliente, LEN(@cpfCliente), 1)))
            SET @RESULTADO = 'S';
        ELSE
            SET @RESULTADO = 'N';
		END;

		RETURN @RESULTADO;
END;

SELECT bdEstoque.dbo.CpfValidoOuNao(cpfCliente) AS 'CPF cliente' FROM tbCliente





