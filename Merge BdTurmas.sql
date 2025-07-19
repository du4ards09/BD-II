
--Marcus e Maria Eduarda
--�Em uma ETEC qualquer haviam 2 turmas do 2� Mtecantes da pandemia, com 40 alunos cada.
--�Por�m, ap�s a suspens�o das aulas presenciais, ser� montada uma �nica turma de 3� com todos os alunos que tiverem o status APROVADO.
--�Fazer um MERGE entre a tabela tb2A e tb2B criando uma �nica turma de 3�.�As 3 tabelas possuem um RM (PK), nome do Aluno e status. Somente ser�o matriculados no 3� os alunos com status APROVADO. 
--�Para fazer o teste, matricule ao menos 10 alunos em cada turma e aprove 70% dos alunos de cada turma
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
				

