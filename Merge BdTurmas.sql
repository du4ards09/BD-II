
--Marcus e Maria Eduarda
--•Em uma ETEC qualquer haviam 2 turmas do 2º Mtecantes da pandemia, com 40 alunos cada.
--•Porém, após a suspensão das aulas presenciais, será montada uma única turma de 3º com todos os alunos que tiverem o status APROVADO.
--•Fazer um MERGE entre a tabela tb2A e tb2B criando uma única turma de 3º.•As 3 tabelas possuem um RM (PK), nome do Aluno e status. Somente serão matriculados no 3º os alunos com status APROVADO. 
--•Para fazer o teste, matricule ao menos 10 alunos em cada turma e aprove 70% dos alunos de cada turma
USE bdTurmas

MERGE tbTerceiro dest 
	USING (SELECT Rm,nome,status FROM tb2A WHERE status = 'APROVADO') ori ON dest.RmTerceiro = ori.Rm WHEN NOT MATCHED THEN
		INSERT (RmTerceiro, nomeTerceiro, statusTerceiro)
			VALUES (ori.Rm, ori.nome, ori.status);		
				
MERGE tbTerceiro dest 
	USING (SELECT Rm,nome,status FROM tb2B WHERE status = 'APROVADO') ori ON dest.RmTerceiro = ori.Rm WHEN NOT MATCHED THEN		
			INSERT (RmTerceiro, nomeTerceiro, statusTerceiro)
				VALUES (ori.Rm, ori.nome, ori.status);			
		
SELECT * FROM tbTerceiro
				

