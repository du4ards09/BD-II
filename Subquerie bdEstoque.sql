USE bdEstoque
--A)Criar uma consulta que retorne o c�digo do produto, o nome do produto e o nome do fabricante somente daqueles produtos que custam igual ao valor mais alto
SELECT  descricaoProduto, nomeFabricante, valorProduto FROM tbProduto 
		INNER JOIN tbFabricante ON tbProduto.idFabricante = tbFabricante.idFabricante
			WHERE valorProduto = (SELECT MAX (valorProduto) FROM tbProduto)

--MARCUS
--B) Criar uma consulta que retorne o nome do produto e o nome do fabricante e o valor somente dos produtos que custem acima do valor m�dio dos produtos em estoque
SELECT descricaoProduto, valorProduto, nomeFabricante FROM tbProduto 
	INNER JOIN tbFabricante ON tbProduto.idFabricante = tbFabricante.idFabricante
		WHERE valorProduto > (SELECT AVG(valorProduto) FROM tbProduto)
		
	
--MARCUS 
--C)Criar uma consulta que retorne o nome dos clientes que tiveram vendas com valor acima do valor m�dio das vendas
SELECT nomeCliente, valorTotalVenda FROM tbCliente
	INNER JOIN tbVendas ON tbVendas.idVendas = tbCliente.idCliente
		WHERE valorTotalVenda > (SELECT AVG(valorTotalVenda) FROM tbVendas)
		
--MARCUS
--D) Criar uma consulta que retorno o nome e o pre�o dos produtos mais caros
SELECT descricaoProduto, valorProduto FROM tbProduto WHERE valorProduto = (SELECT MAX(valorProduto) FROM tbProduto)

--MARCUS
--E)Criar uma consulta que retorne o nome e o pre�o do produto mais barato
SELECT descricaoProduto, valorProduto FROM tbProduto WHERE valorProduto = (SELECT MIN(valorProduto) FROM tbProduto)










































