USE bdConfeitariaSonho

--Maria Eduarda
--A)Criar uma StoredProcedure para inserir as categorias de produto conforme abaixo:
--Ao inserir uma categoria de produto, confirmar pelo seu nome se o mesmo já existe no banco de dados. 
--Nesse caso, enviar uma mensagem com essa situação ao usuário.

CREATE PROCEDURE spInserirCategoria
	@nomeCategoriaProduto VARCHAR(50) 
AS
	DECLARE @codCategoriaProduto INT
	IF EXISTS(SELECT codCategoriaProduto FROM tbCategoriaProduto
		WHERE nomeCategoriaProduto LIKE @nomeCategoriaProduto)
	BEGIN
		PRINT('Impossível cadastrar! Categoria com o nome: '+@nomeCategoriaProduto+ ' já cadastrado')
	END
	ELSE
	BEGIN
		INSERT INTO tbCategoriaProduto(nomeCategoriaProduto)
		VALUES (@nomeCategoriaProduto)
		SET @codCategoriaProduto= (SELECT MAX(codCategoriaProduto) FROM tbCategoriaProduto)
		PRINT('Categoria '+@nomeCategoriaProduto+' cadastrado com sucesso')
	END

	SELECT * FROM tbCategoriaProduto

EXEC spInserirCategoria
	'Torta'


--Marcus
--B)Criar  uma  Stored Procedure  para  inserir os  produtos abaixo,  sendo  que,  a  procedure  deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado:
CREATE PROCEDURE spInserirProduto
	@nomeProduto VARCHAR(50)
	,@precoKiloProduto SMALLMONEY
	,@codCategoriaProduto INT

AS
	DECLARE @codProduto INT
	IF EXISTS(SELECT codProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
BEGIN
	PRINT ('Não foi possivel realizar! Produto: ' + @nomeProduto + ', Já cadastrado')
END
ELSE
BEGIN
	INSERT INTO tbProduto(nomeProduto,precoKiloProduto,codCategoriaProduto)
		VALUES(@nomeProduto,@precoKiloProduto,@codCategoriaProduto)
		 SET @codProduto= (SELECT MAX(codProduto) FROM tbProduto)
		 PRINT('Produto: ' +@nomeProduto+ ' cadastrado com sucesso!')

END

	SELECT * FROM tbProduto

EXEC spInserirProduto
	--'Bolo Floresta Negra',42.00,1
	--'Bolo Prestígio',43.00,1
	--'Bolo Nutella',44.00,1
	--'Bolo Formigueiro',17.00,2
	--'Bolo de cenoura',19.00,2
	--'Torta de palmito',45.00,3
	--'Torta de frango e catupiry',47.00,3
	--'Torta de escarola',44.00,3
	--'Coxinha de frango',25.00,4
	--'Esfiha carne',27.00,4
	--'Folhado queijo',31.00,4
	--'Risoles misto',29.00,4

	
--Maria Eduarda
--c)Criar uma stored procedure para cadastrar os clientes abaixo relacionados, 
--sendo que deverão ser feitas duas validações:-Verificar pelo CPF se o cliente já existe. 
--Caso já existaemitir a mensagem: “Cliente cpf XXXXX já cadastrado”-Verificar  se  o  cliente  é  morador  de  Itaquera  ou  Guaianases,
--pois  a  confeitaria  não  realiza entregas para clientes que residam fora desses bairros. Caso o cliente não seja morador desses bairros enviar a
--mensagem “Não foi possível cadastrar o cliente XXXX pois o bairro XXXX não é atendido pela confeitaria”
CREATE PROCEDURE spCadastrarClientes
	 @nomeCliente VARCHAR(60)
	,@dataNascimentoCliente SMALLDATETIME
	,@ruaCliente VARCHAR(50)
	,@numCasaCliente VARCHAR(10)
	,@cepCliente VARCHAR(10)
	,@bairroCliente VARCHAR (30)
	,@cidadeCliente VARCHAR(60)
	,@estadoCliente VARCHAR(2)
	,@cpfCliente VARCHAR(11)
	,@sexoCliente VARCHAR(2)
AS
	-- Verificar se o cliente já existe pelo CPF
	DECLARE @codCliente INT
	IF EXISTS(SELECT codCliente FROM tbCliente
		WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		PRINT('Impossível cadastrar! Cliente com cpf '+
		@cpfCliente+' já cadastrado')
	END
	-- Verificar se o cliente é morador de Itaquera ou Guaianases
    IF @bairroCliente NOT IN ('Itaquera', 'Guaianases')
    BEGIN
        PRINT 'Não foi possível cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' não é atendido pela confeitaria'
    END
	ELSE
	BEGIN
		INSERT INTO tbCliente(nomeCliente,dataNascimentoCliente,ruaCliente,numCasaCliente,cepCliente
			,bairroCliente,cidadeCliente,estadoCliente,cpfCliente,sexoCliente)
		VALUES(@nomeCliente,@dataNascimentoCliente,@ruaCliente,@numCasaCliente
			,@cepCliente,@bairroCliente,@cidadeCliente,@estadoCliente,@cpfCliente,@sexoCliente)
		PRINT 'Cliente ' + @nomeCliente + ' cadastrado(a) com sucesso'
	END

	SELECT * FROM tbCliente

	EXEC spCadastrarClientes
		--'Samira Fatah','05/05/1996','73558849213','F','Rua Aguapeí','100','08.090-00','Guaianases','São Paulo','São Paulo'
		 --'Celia Nogueira','06/06/1992','55504743109','F','Rua Andes','234','08.456-09','Guaianases','São Paulo','São Paulo'
		 --'Paulo Cesar Siqueira','04/04/1984','73558849456','M','Rua Castelo do Piauí','232','08.109-000','Itaquera','São Paulo','São Paulo'
		 --'Rodrigo Favaroni','09/04/1991','75958849456','M','Rua Sansão Castelo Branco','10','08.431-090','Guaianases','São Paulo','São Paulo'
		 --'Flávia Regina Brito','22/04/1992','82478659204','F','Rua Mariano Moro','300','08.200-123','Itaquera','São Paulo','São Paulo'
		 --'Cristiana Terra Mendonça', '15/01/1974','81154228274','F', 'Avenida Vinte e Um de Julho','90','68904-680','Guarulhos','São Paulo','São Paulo'
