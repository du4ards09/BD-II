USE bdGravadora

CREATE VIEW vwMusica AS 
	SELECT COUNT (codMusica) 'Quantidade de M�sicas:', nomeAutor AS 'Autores:' FROM tbAutor
		INNER JOIN tbAutoria ON tbAutoria.codAutor = tbAutor.codAutor
			GROUP BY nomeAutor
				--Apresentar a view--
							SELECT * FROM vwMusica

SELECT [Autores:], [Quantidade de M�sicas:] FROM vwMusica
	WHERE [Quantidade de M�sicas:] = (SELECT MAX([Quantidade de M�sicas:]) FROM vwMusica)


CREATE VIEW vwAutoria AS
	SELECT	nomeMusica 'Nome M�sica', nomeAutor 'Autores' FROM tbMusica
		INNER JOIN tbAutor ON tbAutor.codAutor = tbAutoria.codAutor
			INNER JOIN tbAutoria ON tbAutoria.codMusica = tbMusica.codMusica
			WHERE MONTH (dataComposicaoMusica)= 04
				GROUP BY nomeMusica , nomeAutor

CREATE VIEW vwMusicaLonga AS
	SELECT nomeMusica, MAX(duracaoMusica) FROM tbMusica
		GROUP BY nomeMusica, duracaoMusica