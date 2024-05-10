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

SELECT * FROM usuarios

--adicionando vendas--

INSERT INTO venda (id_usuario,valor) VALUES (1, 500.00)
INSERT INTO venda (id_usuario,valor) VALUES (2, 300.00)
INSERT INTO venda (id_usuario,valor) VALUES (3, 700.00)

SELECT * FROM venda

--adicionando na tabela venda os dados do usuário--

SELECT * FROM venda INNER JOIN usuarios ON venda.id_usuario = usuarios.id

--Trocando o código do usuário pelo nome do usuário e seleionando o que quer mostrar na tabela--

SELECT venda.cod, venda.data, usuarios.nome, venda.valor FROM venda INNER JOIN usuarios ON venda.id_usuario = usuarios.id