--SELECT DE DADOS
USE BdEscolaIdioma

--Marcus
--1)Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
SELECT nomeAluno,nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
				ORDER BY [nomeAluno] ASC

--Marcus
--2)Apresentar a quantidade de alunos matriculados por nome do curso;
	SELECT COUNT(codAluno)AS 'Quantidade de alunos matriculados',nomeCurso FROM tbCurso
		INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
			INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
				GROUP BY nomeCurso

--Marcus
--3)Apresentar a quantidade de alunos matriculados por nome da turma;
    SELECT COUNT(codAluno)AS 'Quantidade de matricula por turma',nomeTurma FROM tbMatricula
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			GROUP BY tbTurma.nomeTurma

--Maria Eduarda
--4)Apresentar a quantidade de alunos que fizeram matricula em maio de 2016;
SELECT nomeAluno, COUNT (codMatricula) FROM tbAluno
	INNER JOIN tbMatricula 
		ON tbAluno.codAluno = tbMatricula.codAluno
			WHERE MONTH (dataMatricula)= 05
				GROUP BY tbAluno.nomeAluno

--Marcus
--5)Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
SELECT nomeAluno,  nomeTurma, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
				ORDER BY [nomeAluno] ASC


--Marcus
--6)Apresentar o nome dos cursos e os horários em que eles são oferecidos;
SELECT nomeCurso , 
	CONVERT(VARCHAR(8),horarioTurma,108)AS 'Horario do curso' FROM tbCurso
		INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso


--Marcus
--7)Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(naturalidadeAluno)'Quantidade de alunos por estados matriculados',naturalidadeAluno FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
				WHERE nomeCurso LIKE '%Inglês%'
					GROUP BY naturalidadeAluno, nomeCurso

--Maria Eduarda
--8)Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa;
SELECT nomeAluno,
	CONVERT(VARCHAR(10),dataMatricula, 101) AS [Data Da Matricula do Aluno] FROM tbMatricula
		INNER JOIN tbAluno ON tbMatricula.codMatricula = tbAluno.codAluno

--Maria Eduarda
--10)Apresentar a quantidade de matriculas feitas no ano de 2016;
SELECT COUNT (DISTINCT dataMatricula) AS 'Matriculas realizadas em 2016' FROM tbMatricula
	WHERE YEAR(dataMatricula)=2016


--Marcus
--11)Apresentar a quantidadede matriculas por nome do curso
SELECT COUNT(codAluno)AS 'Quantidade de alunos matriculados',nomeCurso FROM tbCurso
		INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
			INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
				GROUP BY nomeCurso 

--Maria Eduarda
--12)Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00;
SELECT COUNT(codCurso) AS 'Alunos que fazem o curso mais caro:' FROM tbMatricula
	INNER JOIN tbCurso ON tbMatricula.codMatricula = tbCurso.codCurso

--Marcus
--13)Apresentar os nomes dos alunos que fazem o curso de alemão
SELECT nomeAluno,nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
				WHERE nomeCurso LIKE '%Alemão%'
					ORDER BY [nomeAluno] ASC