USE aula2

CREATE TABLE produto (

	cod INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	valor DECIMAL(9,2)
);

INSERT INTO produto(nome, valor) VALUES ('BATOM', 20.00)

SELECT * FROM produto