USE BdHabilitacao

--Maria Eduarda
--Exercício 1 Criar um trigger que ao veículo tomar uma multa os pontos da multa sejam  atualizados na tabela do motorista no campo pontuacaoAcumulada. 
CREATE TRIGGER tgAtualizarPontos ON tbMulta AFTER INSERT
AS
	DECLARE @codMotorista INT, @codVeiculo INT, @numPontos INT
	SET @codVeiculo = (SELECT codVeiculo FROM INSERTED)

	SELECT @numPontos = numPontos FROM INSERTED 
	SET @codMotorista = (SELECT codMotorista FROM tbVeiculo 
		WHERE codVeiculo = @codVeiculo)
	UPDATE tbMotorista
		SET pontuacaoAcumulada = pontuacaoAcumulada + @numPontos
		WHERE codMotorista = @codMotorista

SELECT * FROM tbMulta
SELECT * FROM tbMotorista
SELECT * FROM tbVeiculo

INSERT INTO tbMulta (dataMulta, numPontos, codVeiculo)
VALUES
	(GETDATE(), 5, 1)


--Marcus
--Criar um trigger que todas as vezes que o motorista atinja 20 pontos ou mais no campo pontuacaoAcumulada, sua situação seja alterada para SUSPENSO e o mesmo seja informado via mensagem.
CREATE TRIGGER tgVaiPerderAcarteira ON tbMotorista AFTER INSERT, UPDATE
AS
	BEGIN
		IF EXISTS (SELECT 1 FROM inserted WHERE PontuacaoAcumulada >= 20)
    BEGIN
        UPDATE tbMotorista
        SET situacao = 'SUSPENSO' FROM tbMotorista
			INNER JOIN inserted ON tbMotorista.codMotorista = inserted.codMotorista
				WHERE tbMotorista.PontuacaoAcumulada >= 20;
					print ('Você atingiu o limite de pontos tomado!Você será suspenso bisteco')
		END
	END

	UPDATE tbMotorista
	SET pontuacaoAcumulada= pontuacaoAcumulada+5
		WHERE codMotorista= 06