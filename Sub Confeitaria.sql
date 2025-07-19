USE bdConfeitariaSonho

--Maria Eduarda
--A)Criar uma StoredProcedure para inserir as categorias de produto conforme abaixo:
--Ao inserir uma categoria de produto, confirmar pelo seu nome se o mesmo j� existe no banco de dados. 
--Nesse caso, enviar uma mensagem com essa situa��o ao usu�rio.

CREATE PROCEDURE spInserirCategoria
	@nomeCategoriaProduto VARCHAR(50) 
AS
	DECLARE @codCategoriaProduto INT
	IF EXISTS(SELECT codCategoriaProduto FROM tbCategoriaProduto
		WHERE nomeCategoriaProduto LIKE @nomeCategoriaProduto)
	BEGIN
		PRINT('Imposs�vel cadastrar! Categoria com o nome: '+@nomeCategoriaProduto+ ' j� cadastrado')
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
--B)Criar  uma  Stored Procedure  para  inserir os  produtos abaixo,  sendo  que,  a  procedure  dever� antes de inserir verificar se o nome do produto j� existe, evitando assim que um produto seja duplicado:
CREATE PROCEDURE spInserirProduto
	@nomeProduto VARCHAR(50)
	,@precoKiloProduto SMALLMONEY
	,@codCategoriaProduto INT

AS
	DECLARE @codProduto INT
	IF EXISTS(SELECT codProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
BEGIN
	PRINT ('N�o foi possivel realizar! Produto: ' + @nomeProduto + ', J� cadastrado')
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
	--'Bolo Prest�gio',43.00,1
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
--sendo que dever�o ser feitas duas valida��es:-Verificar pelo CPF se o cliente j� existe. 
--Caso j� existaemitir a mensagem: �Cliente cpf XXXXX j� cadastrado�-Verificar  se  o  cliente  �  morador  de  Itaquera  ou  Guaianases,
--pois  a  confeitaria  n�o  realiza entregas para clientes que residam fora desses bairros. Caso o cliente n�o seja morador desses bairros enviar a
--mensagem �N�o foi poss�vel cadastrar o cliente XXXX pois o bairro XXXX n�o � atendido pela confeitaria�
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
	-- Verificar se o cliente j� existe pelo CPF
	DECLARE @codCliente INT
	IF EXISTS(SELECT codCliente FROM tbCliente
		WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		PRINT('Imposs�vel cadastrar! Cliente com cpf '+
		@cpfCliente+' j� cadastrado')
	END
	-- Verificar se o cliente � morador de Itaquera ou Guaianases
    IF @bairroCliente NOT IN ('Itaquera', 'Guaianases')
    BEGIN
        PRINT 'N�o foi poss�vel cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' n�o � atendido pela confeitaria'
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
		--'Samira Fatah','05/05/1996','73558849213','F','Rua Aguape�','100','08.090-00','Guaianases','S�o Paulo','S�o Paulo'
		 --'Celia Nogueira','06/06/1992','55504743109','F','Rua Andes','234','08.456-09','Guaianases','S�o Paulo','S�o Paulo'
		 --'Paulo Cesar Siqueira','04/04/1984','73558849456','M','Rua Castelo do Piau�','232','08.109-000','Itaquera','S�o Paulo','S�o Paulo'
		 --'Rodrigo Favaroni','09/04/1991','75958849456','M','Rua Sans�o Castelo Branco','10','08.431-090','Guaianases','S�o Paulo','S�o Paulo'
		 --'Fl�via Regina Brito','22/04/1992','82478659204','F','Rua Mariano Moro','300','08.200-123','Itaquera','S�o Paulo','S�o Paulo'
		 --'Cristiana Terra Mendon�a', '15/01/1974','81154228274','F', 'Avenida Vinte e Um de Julho','90','68904-680','Guarulhos','S�o Paulo','S�o Paulo'
