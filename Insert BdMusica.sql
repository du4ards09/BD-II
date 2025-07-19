USE bdGravadora

INSERT INTO tbAutor(nomeAutor)
VALUES ('Kendrick Lamar')
	,('Kanye West')
SELECT * FROM tbAutor

INSERT INTO tbMusica(nomeMusica,dataComposicaoMusica ,duracaoMusica ,valorDireitoAutoralMusica )
VALUES ('Savior','12/04/2022', '00:03:44', 150000)
	, ('I Wonder','12/08/2007', '00:04:04', 200000)
	, ('Count me out', '12/04/2021', '00:04:43', 30000)
SELECT*FROM tbMusica

INSERT INTO tbAutoria(codAutor,codMusica)
VALUES (1,4)
	, (2,5)
	, (1,6)
SELECT*FROM tbAutoria