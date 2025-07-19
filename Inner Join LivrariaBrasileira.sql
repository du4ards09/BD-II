USE bdLivrariaBrasileira

--MARCUS
--a) O total de livros que começam com a letra P--
SELECT COUNT(nomeLivro)'O Total de Livros que Começam com a letra P:' FROM tbLivro 
	WHERE nomeLivro LIKE('P%')

--MARIA EDUARDA
--b) O maior número de páginas entre todos os livros--
SELECT MAX(numPaginas)'O maior numero de paginas entre todos os livros é:' FROM tbLivro

--MARCUS
--c) O menor número de páginas entre todos os livros--
SELECT MIN(numPaginas)'O menor numero de paginas entre todos os livros é:' FROM tbLivro

--MARIA EDUARDA
--d) A média de páginas entre todos os livros--
SELECT AVG(numPaginas)'O menor numero de paginas entre todos os livros é:' FROM tbLivro

--MARCUS
--e) A soma do número de páginas dos livros de editora código 01--
SELECT SUM(numPaginas)'A soma de paginas dos livros da editora Melhoramentos:' FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE (tbEditora.idEditora) = 01

--MARCUS 
--f) A soma dos números de páginas dos livros que começam com a letra A
SELECT SUM(numPaginas) 'A soma de paginas dos livros que começam com a Letra A:' FROM tbLivro
	WHERE nomeLivro LIKE('A%')

--MARCUS 
--G)A média dos números de páginas dos livros que sejam do autor código 03
SELECT AVG(numPaginas)'A média de paginas dos livros do J.K. Rowling:' FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE (tbAutor.idAutor) = 03

--MARCUS
--H) quantidade de livros da editora de código 04
SELECT SUM(numPaginas)'A quantidade de paginas da editora Companhia das Letras :' FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE (tbEditora.idEditora) = 04

--MARCUS
--I) média do número de páginas dos livros que tenham a palavra “estrela” em seu nome
SELECT AVG(numPaginas)'Livros que tenham "Estrela" em seu nome:' FROM tbLivro
	WHERE nomeLivro LIKE('%estrela%')

--MARCUS
--J) quantidade de livros que tenham a palavra “poema” em seu nome
SELECT COUNT(numPaginas)'Livros que tenham "poema" em seu nome:' FROM tbLivro
	WHERE nomeLivro LIKE('%poema%')

--MARCUS
--K)A quantidade de livros agrupado pelo nome do gênero
SELECT COUNT(idLivro)'Livros do gênero', nomeGenero FROM tbLivro
	FULL JOIN tbGenero ON tbGenero.idGenero = tbLivro.idGenero
		GROUP BY nomeGenero

--MARCUS 
--L)A soma das páginas agrupada pelo nome do autor
SELECT SUM(numPaginas)'A soma de paginas pelos Autores:', nomeAutor FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor		

--MARCUS 
--M)A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)
SELECT AVG(numPaginas)'A soma de paginas pelos Autores:', nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor	
			ORDER BY [nomeAutor] ASC

--MARCUS
--N) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)
SELECT COUNT(idLivro)'A quantidade de livros por nome da Editora:', nomeEditora FROM tbLivro
	FULL JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		GROUP BY nomeEditora
			ORDER BY [nomeEditora] DESC

--MARCUS
--O)A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C”
SELECT SUM(numPaginas)'A soma de paginas por nome do Autor que comece com a letra "C":', nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor LIKE('C%')
			GROUP BY nomeAutor

--MARCUS 
--P)A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina”ou “Graciliano Ramos” ou “Clarice Lispector”
SELECT COUNT(idLivro)'Livros pelos Autores "Machado de Assis, Cora Coralina, Graciliano Ramos e Clarice Lispector" :', nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor= 'Machado de Assis'
			OR nomeAutor = 'Cora Coralina'
				OR nomeAutor ='Graciliano Ramos'
					OR nomeAutor ='Clarice Lispector'
						GROUP BY nomeAutor

--MARIA EDUARDA 
--Q)A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500
SELECT nomeEditora AS 'Editora:', SUM(numPaginas)'Total de Páginas:'  FROM tbLivro	
	INNER JOIN tbEditora ON tbLivro.idLivro = tbEditora.idEditora
		WHERE numPaginas BETWEEN 200 AND 500
				GROUP BY nomeEditora

--MARCUS
--R)O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT nomeLivro AS 'Livro' , nomeEditora AS 'Editora', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
			GROUP BY nomeLivro,  nomeEditora, nomeAutor
				ORDER BY  [nomeAutor] ASC

--MARIA EDUARDA
--S)O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras”
SELECT nomeLivro AS 'Livro:' , nomeEditora AS 'Editora:' FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
			WHERE nomeEditora LIKE 'Companhia da Letras%'
				GROUP BY nomeLivro, nomeEditora


--MARIA EDUARDA
--T)O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”
SELECT nomeLivro AS 'Livro' , nomeAutor AS 'Autor' FROM tbLivro
		INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
			GROUP BY nomeLivro,nomeAutor
					ORDER BY  [nomeAutor] ASC
					
--MARCUS
--U)Os  nomes dos  autores  ao  lado  dos  nomes  dos  livros,  inclusive  daqueles autores que  não tem livros cadastrados
SELECT nomeLivro AS 'Nome do Livro:', nomeAutor AS 'Nome do Autor:' FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor, nomeLivro

--MARCUS
--V) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles livros que não tem autores cadastrados
SELECT nomeLivro, nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor, nomeLivro					
	
--MARIA EDUARDA
--W) O  nome dos  autores  ao  lado  dos nomes  dos  livros,  indiferente  do  autor  ter  ou  não  livro publicado, e indiferente do livro pertencer a algum autor
SELECT nomeAutor AS 'Autor:' , nomeLivro  AS 'Nome do Livro:' FROM tbLivro 
	FULL OUTER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeLivro , nomeAutor

--MARCUS
--X) A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática.
SELECT nomeLivro AS 'Livro:', nomeEditora AS 'Editora:' FROM tbLivro
	CROSS JOIN tbEditora 
		WHERE (tbEditora.idEditora) = 03
			GROUP BY nomeLivro, nomeEditora
				ORDER BY [nomeLivro] ASC

--MARIA EDUARDA
--Y)Somente os nomes dos autores que não tem livros cadastrados
SELECT nomeLivro AS 'Livro:', nomeAutor AS 'Autor(a)' FROM tbLivro
	RIGHT JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE tbLivro.idAutor IS NULL
				GROUP BY nomeAutor, nomeLivro	
		
--MARIA EDUARDA
--Z)Os nomes dos gêneros que não possuem nenhum livro cadastrado
SELECT nomeGenero AS 'Gênero:' , nomeLivro AS 'Livro:' FROM tbLivro
	RIGHT JOIN tbGenero ON tbGenero.idGenero = tbLivro.idGenero
		WHERE tbLivro.idGenero IS NULL
			GROUP BY nomeGenero, nomeLivro	
