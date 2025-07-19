USE bdEstoque

--Marcus
--A)Listar as descrições dos produtos ao lado do nome dos fabricantes
SELECT descricaoProduto, nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante
		ON tbProduto.idFabricante = tbFabricante.idFabricante

--Maria Eduarda
--B)Listar as descrições dos produtos ao lado do nome dos fornecedores;
SELECT descricaoProduto, nomeFornecedor FROM tbProduto 
	INNER JOIN tbFornecedor
		ON tbProduto.idFornecedor = tbFornecedor.idFornecedor

--Marcus
--C)Listar a soma das quantidades dos produtos agrupadas pelo nome do fabricante;
SELECT nomeFabricante, SUM(quantidadeProduto)'Soma das quantidades dos produtos'  FROM tbFabricante
	INNER JOIN tbProduto ON tbFabricante.idFabricante = tbProduto.idFabricante
	GROUP BY nomeFabricante

--Maria Eduarda
--D)Listar o total das vendas ao lado do nome do cliente;
SELECT nomeCliente AS 'Cliente', COUNT(tbVendas.idVendas) AS 'Total de Vendas por Cliente' FROM tbCliente
	INNER JOIN tbVendas
		ON tbCliente.idCliente = tbVendas.idCliente
			GROUP BY tbCliente.nomeCliente

--Marcus
--E)Listar a média dos preços dos produtos agrupados pelo nome do fornecedor;
SELECT nomeFornecedor, AVG(valorProduto)'Média de preços dos produtos' FROM tbFornecedor
	INNER JOIN tbProduto ON tbFornecedor.idFornecedor = tbProduto.idFornecedor
	GROUP BY nomeFornecedor

--Maria Eduarda
--F)Listar todas a soma das vendas agrupadas pelo nome do cliente em ordem alfabética;
SELECT nomeCliente AS 'Cliente', SUM (tbVendas.idVendas) AS 'Somas agrupadas de vendas por cliente' FROM tbCliente
	INNER JOIN tbVendas
		ON tbCliente.idCliente = tbVendas.idCliente
			GROUP BY tbCliente.nomeCliente					
				ORDER BY [Cliente] ASC

--Marcus
--G)Listar a soma dos preços dos produtos agrupados pelo nome do fabricante;
SELECT nomeFabricante, SUM(valorProduto) 'Soma dos preços dos produtos' FROM tbFabricante
	INNER JOIN tbProduto ON tbFabricante.idFabricante = tbProduto.idFabricante
	GROUP BY nomeFabricante

--Maria Eduarda
--H)Listar a média dos preços dos produtos agrupados pelo nome do fornecedor;
	--REPETIDA!!!!!!

--Marcus
--I)Listar a soma das vendas agrupadas pelo nome do produto
SELECT descricaoProduto, SUM(subTotalVendas) 'Total de vendas por produto' FROM tbProduto
    INNER JOIN tbItensVendas
		ON tbProduto.idProduto = tbItensVendas.idProduto
			GROUP BY descricaoProduto

--Maria Edauarda
--J)Listar a soma das vendas pelo nome do cliente somente das vendas realizadas em fevereiro de 2014
SELECT nomeCliente AS 'Clientes de Fevereiro', COUNT (tbVendas.idVendas) AS 'Total de vendas por cliente no mês de Fevereiro' FROM tbCliente
	INNER JOIN tbVendas
		ON tbCliente.idCliente = tbVendas.idCliente
			WHERE MONTH (dataVenda)= 02
				GROUP BY tbCliente.nomeCliente
					