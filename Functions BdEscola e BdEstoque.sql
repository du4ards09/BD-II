USE BdEscola

--Maria Eduarda
--1)Crie uma fun��o que informada uma data da matricula, retorne o dia da semana.
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
	SET @DiaSemana = 'TER�A-FEIRA'
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
	SET @DiaSemana = 'S�BADO'
	END	
		RETURN @DiaSemana
	END

	--Uso da fun��o
	SELECT dataMatricula as 'Data Matricula',
	DiaDaSemana = dbo.fc_DiaSemana (dataMatricula) FROM tbMatricula

	DROP FUNCTION dbo.fc_DiaSemana


--Maria Eduarda
--2)Crie uma fun��o que de acordo com a carga hor�ria do curso exiba curso rapido ou curso extenso. (R�pido menos de 1000 horas)
CREATE FUNCTION dbo.fc_ExibirCargaHoraria (@cargaHorariaCurso INT)
	RETURNS VARCHAR(50)
	AS
	BEGIN
		DECLARE @classificacao VARCHAR(50)

		IF @cargaHorariaCurso < 1000
        SET @classificacao = 'Curso R�pido'
    ELSE
        SET @classificacao = 'Curso Extenso'

    RETURN @classificacao
	END

	--Uso da fun��o
	SELECT nomeCurso AS 'Curso:', CargaHorariaCurso AS 'Carga Hor�ria:', dbo.fc_ExibirCargaHoraria(CargaHorariaCurso) AS 'Classifica��o:' FROM tbCurso

	DROP FUNCTION dbo.fc_ExibirCargaHoraria

--Maria Eduarda
--3)Crie uma fun��o que de acordo com o valor do curso exiba  curso caro ou curso barato. (Curso caro acima de 400).
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

	--Uso da fun��o
	SELECT nomeCurso AS 'Curso:' , ValorCurso AS 'Valor:' , dbo.fcPrecoCurso(ValorCurso) AS 'Classifica��o:' FROM tbCurso

--Maria Eduarda
--4)Criar uma fun��o que informada a data da matr�cula converta-a no formato dd/mm/aaaa.
CREATE FUNCTION dbo.MudarDataMatricula (@dataMatricula DATE)
	RETURNS VARCHAR(10)
	AS
	BEGIN
		DECLARE @dataFormatada VARCHAR(10)

		SET @dataFormatada = FORMAT(@dataMatricula, 'dd/MM/yyyy', 'pt-BR')

		RETURN @dataFormatada
	END

	--Uso da fun��o
	SELECT DataMatricula AS 'Data da Matricula', dbo.MudarDataMatricula(DataMatricula) AS 'Data em PT-BR:' FROM tbMatricula


USE BdEstoque

--Maria Eduarda
--5)Criar uma fun��o que retorne o dia de semana da venda (no formato segunda, ter�a, etc) ao lado do c�digo da venda, valor total da venda e sua data.
CREATE FUNCTION fc_RetornarDiaSemana (@idVendas INT)
RETURNS TABLE
AS
RETURN
	(SELECT idVendas,valorTotalVenda,dataVenda,FORMAT(DataVenda, 'dddd') AS DiaSemana FROM tbVendas
    WHERE
        idVendas = @idVendas
);

--Uso da fun��o
SELECT *FROM fc_RetornarDiaSemana(1); -- Substitua "1" pelo c�digo da venda desejado

--6)Criar uma fun��o que receba o c�digo do cliente e retorne o total de vendas que o cliente j� realizou.
-- Criar uma fun��o para obter o total de vendas por cliente
CREATE FUNCTION dbo.ObterTotalVendasPorCliente (@idCliente INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalVendas INT;

    SELECT @TotalVendas = ISNULL(SUM(ValorTotalVenda), 0) FROM tbVendas
		WHERE idCliente = @idCliente;

    RETURN @TotalVendas;
END;

-- Uso da fun��o

	DECLARE @idCliente INT = 2; -- Substitua "2" pelo c�digo do cliente desejado
	DECLARE @TotalVendas INT;

	SET @TotalVendas = dbo.ObterTotalVendasPorCliente(@idCliente);

	PRINT 'Total de Vendas do Cliente ' + CAST(@idCliente AS NVARCHAR) + ': ' + CAST(@TotalVendas AS NVARCHAR);

--ou:
SELECT idCliente, dbo.ObterTotalVendasPorCliente(idCliente) FROM TbVendas
	WHERE idCliente = 4;

--Maria Eduarda
--7)Criar uma fun��o que receba o c�digo de um vendedor e o m�s e informe o total de vendas do vendedor no m�s informado.
CREATE FUNCTION dbo.TotalVendasPorVendedorEMes (@idFornecedor INT,@Mes INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalVendas DECIMAL(18, 2);

    SELECT @TotalVendas = ISNULL(SUM(valorTotalVenda), 0)FROM tbVendas
		WHERE @idFornecedor = @idFornecedor AND MONTH(DataVenda) = @Mes;

    RETURN @TotalVendas;
END;

-- Exemplo de chamada da fun��o
DECLARE @idFornecedor INT = 5; -- Substitua 456 pelo c�digo do vendedor desejado
DECLARE @Mes INT = 03; -- Substitua 11 pelo n�mero do m�s desejado

DECLARE @TotalVendas DECIMAL(18, 2);

SET @TotalVendas = dbo.TotalVendasPorVendedorEMes(@idFornecedor, @Mes);

PRINT 'Total de Vendas do Vendedor ' + CAST(@idFornecedor AS NVARCHAR) + ' no M�s ' + CAST(@Mes AS NVARCHAR) + ': ' + CAST(@TotalVendas AS NVARCHAR);

--Maria Eduarda
--8)Criar uma fun��o que usando o bdEstoque diga se o cpf do cliente � ou n�o v�lido.
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

    --VERIFICA��O SE OS DIGITOS S�O IGUAIS:
    SET @CPF_TEMPORARIO = SUBSTRING(@cpfCliente, 1, 1);
    SET @INICIO = 1;
    SET @DIGITOS_IGUAIS = 'S';

    WHILE (@INICIO <= 11)
    BEGIN
        IF SUBSTRING(@cpfCliente, @INICIO, 1) <> @CPF_TEMPORARIO
            SET @DIGITOS_IGUAIS = 'N';

        SET @INICIO = @INICIO + 1;
    END;

    --CASO OS DIGITOS N�O SEJAM IGUAIS, COME�A O C�LCULO:
    IF @DIGITOS_IGUAIS = 'N'
    BEGIN
        --1� C�LCULO:
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

        --2� C�LCULO: 
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

        --VALIDA��O:
        IF (@DIG1 = CONVERT(INT, SUBSTRING(@cpfCliente, LEN(@cpfCliente) - 1, 1))) AND (@DIG2 = CONVERT(INT, SUBSTRING(@cpfCliente, LEN(@cpfCliente), 1)))
            SET @RESULTADO = 'S';
        ELSE
            SET @RESULTADO = 'N';
		END;

		RETURN @RESULTADO;
END;

SELECT bdEstoque.dbo.CpfValidoOuNao(cpfCliente) AS 'CPF cliente' FROM tbCliente





