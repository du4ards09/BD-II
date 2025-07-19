USE BdConfeitariaSonho

--Maria Eduarda Lima
--A)Criar uma StoredProcedure para inserir as categorias de produto conforme abaixo: Ao inserir uma categoria de produto, confirmar pelo seu nome se o mesmo já existe no banco de dados. Nesse caso, enviar uma mensagem com essa situação ao usuário.
CREATE PROCEDURE spInserindoCategorias
	@nomeCategoria VARCHAR(40) 
AS
	DECLARE @codCategoria INT
	IF EXISTS(SELECT codCategoria FROM tbCategoria
		WHERE nomeCategoria LIKE @nomeCategoria)
	BEGIN
		PRINT('Impossível cadastrar! Categoria com o nome: '+@nomeCategoria+ ' já está cadastrada!')
	END
	ELSE
	BEGIN
		INSERT INTO tbCategoria(nomeCategoria)
		VALUES (@nomeCategoria)
		SET @codCategoria= (SELECT MAX(codCategoria) FROM tbCategoria)
		PRINT('Categoria '+@nomeCategoria+' cadastrado com sucesso')
	END

EXEC spInserindoCategorias 'Bolo Festa'
EXEC spInserindoCategorias 'Bolo Simples'
EXEC spInserindoCategorias 'Torta'
EXEC spInserindoCategorias 'Salgado'
EXEC spInserindoCategorias 'Vegano'

SELECT * FROM tbCategoria

--Marcus
--B)Criar  uma  Stored Procedure  para  inserir os  produtos abaixo,  sendo  que,  a  procedure  deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado:
CREATE PROCEDURE spInserirProduto
	@nomeProduto VARCHAR(50)
	,@precoKilo MONEY
	,@codCategoria INT

AS
	DECLARE @codProduto INT
	IF EXISTS(SELECT codProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
	BEGIN
		PRINT ('Não foi possivel realizar! Produto: ' + @nomeProduto + ', Já cadastrado')
	END
	ELSE
	BEGIN
		INSERT INTO tbProduto(nomeProduto,precoKilo,codCategoria)
		VALUES(@nomeProduto,@precoKilo,@codCategoria)
		 SET @codProduto= (SELECT MAX(codProduto) FROM tbProduto)
		 PRINT('Produto: ' +@nomeProduto+ ' cadastrado com sucesso!')

	END

EXEC spInserirProduto 'Bolo Floresta Negra',42.00,1
EXEC spInserirProduto 'Bolo Prestígio',43.00,1
EXEC spInserirProduto 'Bolo Nutella',44.00,1
EXEC spInserirProduto 'Bolo Formigueiro',17.00,2
EXEC spInserirProduto'Bolo de cenoura',19.00,2
EXEC spInserirProduto 'Torta de palmito',45.00,3
EXEC spInserirProduto 'Torta de frango e catupiry',47.00,3
EXEC spInserirProduto'Torta de escarola',44.00,3
EXEC spInserirProduto 'Coxinha de frango',25.00,4
EXEC spInserirProduto 'Esfiha carne',27.00,4
EXEC spInserirProduto 'Folhado queijo',31.00,4
EXEC spInserirProduto 'Risoles de palmito',29.00,44

SELECT * FROM tbProduto

--Maria Eduarda Lima
--c)Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão ser feitas duas validações:-Verificar pelo CPF se o cliente já existe. 
--Caso já existaemitir a mensagem: “Cliente cpf XXXXX já cadastrado”-Verificar  se  o  cliente  é  morador  de  Itaquera  ou  Guaianases, pois  a  confeitaria  não  realiza entregas para clientes que residam fora desses bairros. Caso o cliente não seja morador desses bairros enviar a
--mensagem “Não foi possível cadastrar o cliente XXXX pois o bairro XXXX não é atendido pela confeitaria”.
CREATE PROCEDURE spCadastrarClientes

	 @nomeCliente VARCHAR(50) 
	,@dataNascimento DATE 
	,@cpfCliente VARCHAR(15) 
	,@sexoCliente VARCHAR(2) 
	,@rua VARCHAR(70) 
	,@numCasa VARCHAR(5) 
	,@cep VARCHAR(13)
	,@bairro VARCHAR(50) 
	,@cidade VARCHAR(50) 
	,@estado VARCHAR(50) 
AS
	-- Verificar se o cliente já existe pelo CPF
	DECLARE @codCliente INT
	IF EXISTS(SELECT codCliente FROM tbCliente
		WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		PRINT('Impossível cadastrar o cliente com cpf '+
		@cpfCliente+' já cadastrado!')
	END
	-- Verificar se o cliente é morador de Itaquera ou Guaianases
    IF @bairro NOT IN ('Itaquera', 'Guaianases')
    BEGIN
        PRINT ('Não foi possível cadastrar o cliente: ' + @nomeCliente + ' pois o bairro: ' + @bairro + ' não é atendido pela confeitaria!')
    END
	ELSE
	BEGIN
		INSERT INTO tbCliente(nomeCliente,dataNascimento,cpfCliente,sexoCliente,rua,numCasa,cep,bairro,cidade,estado)
		VALUES(@nomeCliente,@dataNascimento,@cpfCliente,@sexoCliente,@rua,@numCasa,@cep,@bairro,@cidade,@estado)
		PRINT ('Cliente: ' + @nomeCliente + ' cadastrado(a) com sucesso!')
	END

EXEC spCadastrarClientes 'Samira Fatah','05/05/1996','73558849213','F','Rua Aguapeí','100','08.090-00','Guaianases','São Paulo','São Paulo'
EXEC spCadastrarClientes 'Celia Nogueira','06/06/1992','55504743109','F','Rua Andes','234','08.456-09','Guaianases','São Paulo','São Paulo'
EXEC spCadastrarClientes 'Paulo Cesar Siqueira','04/04/1984','73558849456','M','Rua Castelo do Piauí','232','08.109-000','Itaquera','São Paulo','São Paulo'
EXEC spCadastrarClientes 'Rodrigo Favaroni','09/04/1991','75958849456','M','Rua Sansão Castelo Branco','10','08.431-090','Guaianases','São Paulo','São Paulo'
EXEC spCadastrarClientes 'Flávia Regina Brito','22/04/1992','82478659204','F','Rua Mariano Moro','300','08.200-123','Itaquera','São Paulo','São Paulo'
EXEC spCadastrarClientes  'Cristiana Terra Mendonça', '15/01/1974','81154228200','F', 'Avenida Vinte e Um de Julho','90','68904-680','Pimentas','São Paulo','São Paulo'

SELECT * FROM tbCliente

--Maria Eduarda
--d)Criar via stored procedure as encomendas abaixo relacionadas, fazendo as verificações abaixo:
--No momento da encomenda o cliente irá fornecer o seu cpf. Caso ele não tenha sido 
--cadastrado enviar a mensagem “não foi possível efetivar a encomenda pois o cliente xxxx não está cadastrado”
-- Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: “Encomenda XXX para 
--o cliente YYY efetuada com sucesso” sendo que no lugar de XXX deverá aparecer o número da 
--encomenda e no YYY deverá aparecer o nome do cliente;
CREATE PROCEDURE spInsereEncomenda
    @dataEncomenda DATE,
    @codCliente INT,
    @valorTotal MONEY,
	@dataEntrega DATE
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tbCliente WHERE codCliente = @codCliente)
    BEGIN
        PRINT 'Não foi possível efetivar a encomenda, pois o cliente não está cadastrado.'
        RETURN
    END
    
    DECLARE @encomendaMsg VARCHAR(100)
    INSERT INTO tbEncomenda (dataEncomenda, codCliente, valorTotal, dataEntrega)
    VALUES (@dataEncomenda, @codCliente, @valorTotal, @dataEntrega)
    
    SET @encomendaMsg = 'Encomenda ' + CAST(SCOPE_IDENTITY() AS VARCHAR) + ' para o cliente ' + (SELECT nomeCliente FROM tbCliente WHERE codCliente = @codCliente) + ' efetuada com sucesso.'
    PRINT @encomendaMsg
END

EXEC spInsereEncomenda '2015-08-08', 1, 450.00, '2015-08-15'
EXEC spInsereEncomenda '2015-10-10', 2, 200.00, '2015-10-15'
EXEC spInsereEncomenda '2015-10-10', 3, 150.00, '2015-12-10'
EXEC spInsereEncomenda '2015-06-10', 1,  250.00, '2015-12-10'
EXEC spInsereEncomenda '2015-10-05', 45, 150.00, '2015-10-12'

SELECT * FROM tbEncomenda


--Maria Eduarda
----e)   Ao adicionar a encomenda, criar uma Stored procedure, para que sejam inseridos os itens da encomenda 
--conforme tabela a seguir. 
CREATE PROCEDURE spInserirProdutosnaEncomenda
	@codEncomenda INT
	,@codProduto INT
	,@qtdeKilos DECIMAL
	,@subTotal MONEY
AS
	BEGIN
		INSERT INTO tbItensEncomenda (codEncomenda, codProduto, qtdeKilos, subTotal)
		VALUES (@codEncomenda, @codProduto, @qtdeKilos, @subTotal)
	END

EXEC spInserirProdutosnaEncomenda 1,1,2.5,105.00
EXEC spInserirProdutosnaEncomenda 1, 10, 2.6, 70.00
EXEC spInserirProdutosnaEncomenda 1, 9, 6, 150.00
EXEC spInserirProdutosnaEncomenda 1, 12, 4.3, 125.00
EXEC spInserirProdutosnaEncomenda 2, 9, 8, 200.00
EXEC spInserirProdutosnaEncomenda 3, 11, 3.2, 100.00
EXEC spInserirProdutosnaEncomenda 3, 9, 2, 50.00
EXEC spInserirProdutosnaEncomenda 4, 2, 3.5, 150.00
EXEC spInserirProdutosnaEncomenda 4, 3, 2.2, 100.00
EXEC spInserirProdutosnaEncomenda 5, 6, 3.4, 150.00

SELECT * FROM tbItensEncomenda


--Marcus
--F)Após todos os cadastros, criar Storedprocedurespara alterar o que se pede:
--1-O preço dos produtos da categoria “Bolo festa” sofreram um aumento de 10%
--2-O preço dos produtos categoria “Bolo simples” estão em promoção e terão um desconto de 20%;
--3-O preço dos produtos categoria “Torta” aumentaram 25%
--4-O preço dos produtos categoria “Salgado”, com exceção da esfihade carne, sofreram um aumento de 20%

CREATE PROCEDURE spAlterarValor
AS
	BEGIN
		UPDATE tbProduto
		SET precoKilo = precoKilo+(precoKilo*10/100)
		WHERE codCategoria LIKE 1

		UPDATE tbProduto
		SET precoKilo = precoKilo - (precoKilo*20/100)
		WHERE codCategoria LIKE 2

		UPDATE tbProduto
		SET precoKilo = precoKilo + (precoKilo*25/100)
		WHERE codCategoria LIKE 3

		UPDATE tbProduto
		SET precoKilo = precoKilo + (precoKilo*20/100)
		WHERE codCategoria LIKE 4 AND codProduto <> 10
	END

	SELECT * FROM tbProduto


--Marcus
--G)Criar uma procedure para excluir clientes pelo CPF sendo que:
--1-Caso  o  cliente  possua  encomendas emitir a mensagem “Impossível  remover  esse  cliente  pois  o cliente XXXXX possui encomendas; onde XXXXX é o nome do cliente.
--2-Caso o cliente não possua encomendas realizar a remoção e emitir a mensagem “Cliente XXXX removido com sucesso”, onde XXXX é o nome do cliente;

CREATE PROCEDURE spExcluirCPF
	@cpfCliente CHAR(15)
AS
	BEGIN
		DECLARE @codCliente INT
		DECLARE @NomeCliente VARCHAR(50)
		DECLARE @encomendasConta INT

    SELECT @codCliente= codCliente, @nomeCliente = nomeCliente FROM tbCliente
		WHERE cpfCliente = @cpfCliente

    SELECT @encomendasConta = COUNT(*) FROM tbEncomenda
		WHERE codCliente = @codCliente

	IF @encomendasConta > 0
    BEGIN
        PRINT 'Impossivel remover ' + @nomeCliente + ' porque possui encomendas'
    END
    ELSE
    BEGIN

        DELETE FROM tbCliente WHERE cpfCliente = @cpfCliente
        PRINT 'Cliente ' + @nomeCliente + ' foi excluído(a) com sucesso'
    END
END

EXEC spExcluirCPF @cpfCliente = '82478659204'
SELECT * FROM tbCliente



--Marcus
--H)Criar uma procedure que permita excluir qualquer item de uma encomenda que exista. Para tal o cliente devera fornecer o codigo da encomenda e o codigo do produto que sera excluido da encomenda. A procedure devera remover o item e atualizar o valor total da encomenda, do qual devera ser subtraido o valor do item a ser removido. A procedure podera remover apenas um item da encomenda de cada vez.
CREATE PROCEDURE sp_RemoverItemEncomenda
    @codEncomenda INT,
    @codProduto INT
AS
	BEGIN
		DECLARE @subTotal MONEY
		DECLARE @valorTotal MONEY
    
		SELECT @subTotal = subTotal FROM tbItensEncomenda
		 WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto
    
		SELECT @valorTotal = valorTotal FROM tbEncomenda
		 WHERE codEncomenda = @codEncomenda

		SET @valorTotal = @valorTotal - @subTotal

		DELETE FROM tbItensEncomenda
		 WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto

		UPDATE tbEncomenda
		SET valorTotal = @valorTotal
		WHERE codEncomenda = @codEncomenda

		PRINT 'Item:' + CAST(@codEncomenda AS VARCHAR) + 'foi removido'
		PRINT 'Valor atualizado para ' + CAST(@valorTotal AS VARCHAR)
	END

SELECT * FROM tbEncomenda



--MARCUS
--I)Criar  uma  stored  procedure  que  receba  o  cpf  de  um  cliente  e  a  data  de  entrega  de  uma encomenda e exclua essa encomenda feita para esse cliente. Para tal a stored procedure ter� que:
CREATE PROCEDURE spExcluirEncomenda
    @cpfCliente CHAR(14),
    @dataEntrega DATE
AS
BEGIN
    DECLARE @codCliente INT
    DECLARE @codEncomenda INT

    SELECT @codCliente = codCliente
    FROM tbCliente
    WHERE cpfCliente = @cpfCliente

     SELECT @codCliente = codCliente
    FROM tbCliente
    WHERE cpfCliente = @cpfCliente

    IF @codCliente IS NULL
    BEGIN
        PRINT 'Cliente com CPF ' + @cpfCliente + ' não foi encontrado,Tente novamente'
        RETURN
    END
   
    SELECT @codEncomenda = codEncomenda
    FROM tbEncomenda
    WHERE codCliente = @codCliente AND dataEntrega = @dataEntrega
   
    BEGIN
        PRINT 'Cliente com CPF ' + @cpfCliente + ' não foi encontrado,Tente novamente'
        RETURN
    END
   
   DELETE FROM tbItensEncomenda WHERE codEncomenda = @codEncomenda
   DELETE FROM tbEncomenda WHERE codEncomenda = @codEncomenda

    PRINT 'Encomenda do(a)' + @cpfCliente + 'na data: ' + CAST(@dataEntrega AS VARCHAR) + ' foi excluída com sucesso.'
	END
		DECLARE @mensagem VARCHAR(MAX)


EXEC spExcluirEncomenda @cpfCliente = '73558849213', @dataEntrega = '2023-08-21'

SELECT * FROM tbCliente


--MARCUS
--J)Criar uma stored procedure que receba uma data de entrega e que liste todas as encomendas e itens que dever�o ser entregues na referida data
CREATE PROCEDURE spListaDeEncomenda
    @dataEntrega DATE
AS
	BEGIN
		SELECT
		 E.codEncomenda,E.dataEncomenda,C.nomeCliente,P.nomeProduto,IE.qtdeKilos,IE.subTotal FROM tbEncomenda AS E
			INNER JOIN tbCliente AS C ON E.codCliente = C.codCliente
				INNER JOIN tbItensEncomenda AS IE ON E.codEncomenda = IE.codEncomenda
					INNER JOIN tbProduto AS P ON IE.codProduto = P.codProduto
						WHERE E.dataEntrega = @dataEntrega
	END

	SELECT * FROM tbEncomenda
