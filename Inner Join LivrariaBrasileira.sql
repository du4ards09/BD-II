USE bdLivrariaBrasileira

--MARCUS
--a) O total de livros que come�am com a letra P--
SELECT COUNT(nomeLivro)'O Total de Livros que Come�am com a letra P:' FROM tbLivro 
	WHERE nomeLivro LIKE('P%')

--MARIA EDUARDA
--b) O maior n�mero de p�ginas entre todos os livros--
SELECT MAX(numPaginas)'O maior numero de paginas entre todos os livros �:' FROM tbLivro

--MARCUS
--c) O menor n�mero de p�ginas entre todos os livros--
SELECT MIN(numPaginas)'O menor numero de paginas entre todos os livros �:' FROM tbLivro

--MARIA EDUARDA
--d) A m�dia de p�ginas entre todos os livros--
SELECT AVG(numPaginas)'O menor numero de paginas entre todos os livros �:' FROM tbLivro

--MARCUS
--e) A soma do n�mero de p�ginas dos livros de editora c�digo 01--
SELECT SUM(numPaginas)'A soma de paginas dos livros da editora Melhoramentos:' FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE (tbEditora.idEditora) = 01

--MARCUS 
--f) A soma dos n�meros de p�ginas dos livros que come�am com a letra A
SELECT SUM(numPaginas) 'A soma de paginas dos livros que come�am com a Letra A:' FROM tbLivro
	WHERE nomeLivro LIKE('A%')

--MARCUS 
--G)A m�dia dos n�meros de p�ginas dos livros que sejam do autor c�digo 03
SELECT AVG(numPaginas)'A m�dia de paginas dos livros do J.K. Rowling:' FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE (tbAutor.idAutor) = 03

--MARCUS
--H) quantidade de livros da editora de c�digo 04
SELECT SUM(numPaginas)'A quantidade de paginas da editora Companhia das Letras :' FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE (tbEditora.idEditora) = 04

--MARCUS
--I) m�dia do n�mero de p�ginas dos livros que tenham a palavra �estrela� em seu nome
SELECT AVG(numPaginas)'Livros que tenham "Estrela" em seu nome:' FROM tbLivro
	WHERE nomeLivro LIKE('%estrela%')

--MARCUS
--J) quantidade de livros que tenham a palavra �poema� em seu nome
SELECT COUNT(numPaginas)'Livros que tenham "poema" em seu nome:' FROM tbLivro
	WHERE nomeLivro LIKE('%poema%')

--MARCUS
--K)A quantidade de livros agrupado pelo nome do g�nero
SELECT COUNT(idLivro)'Livros do g�nero', nomeGenero FROM tbLivro
	FULL JOIN tbGenero ON tbGenero.idGenero = tbLivro.idGenero
		GROUP BY nomeGenero

--MARCUS 
--L)A soma das p�ginas agrupada pelo nome do autor
SELECT SUM(numPaginas)'A soma de paginas pelos Autores:', nomeAutor FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor		

--MARCUS 
--M)A m�dia de p�ginas agrupada pelo nome do autor em ordem alfab�tica (de A a Z)
SELECT AVG(numPaginas)'A soma de paginas pelos Autores:', nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor	
			ORDER BY [nomeAutor] ASC

--MARCUS
--N) A quantidade de livros agrupada pelo nome da editora em ordem alfab�tica inversa (de Z a A)
SELECT COUNT(idLivro)'A quantidade de livros por nome da Editora:', nomeEditora FROM tbLivro
	FULL JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		GROUP BY nomeEditora
			ORDER BY [nomeEditora] DESC

--MARCUS
--O)A soma de p�ginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra �C�
SELECT SUM(numPaginas)'A soma de paginas por nome do Autor que comece com a letra "C":', nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor LIKE('C%')
			GROUP BY nomeAutor

--MARCUS 
--P)A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja �Machado de Assis� ou �Cora Coralina�ou �Graciliano Ramos� ou �Clarice Lispector�
SELECT COUNT(idLivro)'Livros pelos Autores "Machado de Assis, Cora Coralina, Graciliano Ramos e Clarice Lispector" :', nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor= 'Machado de Assis'
			OR nomeAutor = 'Cora Coralina'
				OR nomeAutor ='Graciliano Ramos'
					OR nomeAutor ='Clarice Lispector'
						GROUP BY nomeAutor

--MARIA EDUARDA 
--Q)A soma das p�ginas dos livros agrupadas pelo nome da editora cujo n�mero de p�ginas esteja entre 200 e 500
SELECT nomeEditora AS 'Editora:', SUM(numPaginas)'Total de P�ginas:'  FROM tbLivro	
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
--S)O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for �Cia das Letras�
SELECT nomeLivro AS 'Livro:' , nomeEditora AS 'Editora:' FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
			WHERE nomeEditora LIKE 'Companhia da Letras%'
				GROUP BY nomeLivro, nomeEditora


--MARIA EDUARDA
--T)O nome dos livros ao lado dos nomes dos autores, somente dos livros que n�o forem do autor ��rico Ver�ssimo�
SELECT nomeLivro AS 'Livro' , nomeAutor AS 'Autor' FROM tbLivro
		INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
			GROUP BY nomeLivro,nomeAutor
					ORDER BY  [nomeAutor] ASC
					
--MARCUS
--U)Os  nomes dos  autores  ao  lado  dos  nomes  dos  livros,  inclusive  daqueles autores que  n�o tem livros cadastrados
SELECT nomeLivro AS 'Nome do Livro:', nomeAutor AS 'Nome do Autor:' FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor, nomeLivro

--MARCUS
--V) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles livros que n�o tem autores cadastrados
SELECT nomeLivro, nomeAutor FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor, nomeLivro					
	
--MARIA EDUARDA
--W) O  nome dos  autores  ao  lado  dos nomes  dos  livros,  indiferente  do  autor  ter  ou  n�o  livro publicado, e indiferente do livro pertencer a algum autor
SELECT nomeAutor AS 'Autor:' , nomeLivro  AS 'Nome do Livro:' FROM tbLivro 
	FULL OUTER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeLivro , nomeAutor

--MARCUS
--X) A editora �tica ir� publicar todos os t�tulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora �tica.
SELECT nomeLivro AS 'Livro:', nomeEditora AS 'Editora:' FROM tbLivro
	CROSS JOIN tbEditora 
		WHERE (tbEditora.idEditora) = 03
			GROUP BY nomeLivro, nomeEditora
				ORDER BY [nomeLivro] ASC

--MARIA EDUARDA
--Y)Somente os nomes dos autores que n�o tem livros cadastrados
SELECT nomeLivro AS 'Livro:', nomeAutor AS 'Autor(a)' FROM tbLivro
	RIGHT JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE tbLivro.idAutor IS NULL
				GROUP BY nomeAutor, nomeLivro	
		
--MARIA EDUARDA
--Z)Os nomes dos g�neros que n�o possuem nenhum livro cadastrado
SELECT nomeGenero AS 'G�nero:' , nomeLivro AS 'Livro:' FROM tbLivro
	RIGHT JOIN tbGenero ON tbGenero.idGenero = tbLivro.idGenero
		WHERE tbLivro.idGenero IS NULL
			GROUP BY nomeGenero, nomeLivro	
