USE viagens

--Ordenação (COLOCAR EM ORDEM - CRESCENTE OU DECRESCENTE)--

SELECT * FROM usuarios ORDER BY nome ASC
SELECT * FROM usuarios ORDER BY nome DESC

SELECT * FROM usuarios ORDER BY data_nascimento ASC
SELECT * FROM usuarios ORDER BY data_nascimento DESC

SELECT * FROM usuarios ORDER BY id ASC
SELECT * FROM usuarios ORDER BY id DESC

CREATE TABLE venda(
	cod INT IDENTITY (1,1),
	data DATE DEFAULT GETDATE(),
	id_usuario INT,
	valor DECIMAL (9,2)
)