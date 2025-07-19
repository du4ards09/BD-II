USE bdFiliacao

SELECT * FROM tbPai WHERE idadePai = (Select Max(idadePai) FROM tbPai)

SELECT * FROM tbPai WHERE idadePai IN (Select Max(idadePai) FROM tbPai)

SELECT * FROM tbPai WHERE idadePai <> (Select Max(idadePai) FROM tbPai)

SELECT * FROM tbPai WHERE idadePai  < (Select Max(idadePai) FROM tbPai)