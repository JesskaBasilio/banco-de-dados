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
INSERT INTO venda (id_usuario,valor) VALUES (1, 500.00)
INSERT INTO venda (id_usuario,valor) VALUES (2, 300.00)
INSERT INTO venda (id_usuario,valor) VALUES (3, 700.00)

SELECT * FROM venda

--adicionando na tabela venda os dados do usuário--

SELECT * FROM venda INNER JOIN usuarios ON venda.id_usuario = usuarios.id

--Trocando o código do usuário pelo nome do usuário e seleionando o que quer mostrar na tabela--

SELECT venda.cod, venda.data, usuarios.nome, venda.valor FROM venda INNER JOIN usuarios ON venda.id_usuario = usuarios.id

--Selecionando por data de nascimento. Uma forma de agrupar informações repetidas e deixar o banco mais simplificado--

SELECT data_nascimento FROM usuarios GROUP BY data_nascimento

INSERT INTO usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(4, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(5, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(6, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');


--somar tudo o que o usuario já gastou, nesse exemplo foi pelo nome e outro pelo id--

SELECT usuarios.nome, SUM(venda.valor) AS total FROM venda INNER JOIN usuarios ON usuarios.id = venda.id_usuario GROUP BY nome
SELECT usuarios.id, SUM(venda.valor) AS total FROM venda INNER JOIN usuarios ON usuarios.id = venda.id_usuario GROUP BY id

--somar todos os valores da tabela vendas--

SELECT SUM(valor) FROM venda

--pesquisar o maior valor dentro da tabela - max --

SELECT MAX(valor) FROM venda

--pesquisar o menor valor dentro da tabela - min --

SELECT MIN(valor) FROM venda

--fazendo a média --

SELECT AVG(valor) FROM venda

--fazendo a contagem de quantos usuarios existem na tabela--

SELECT COUNT(*) AS quantidadeUsuarios FROM usuarios
SELECT COUNT(*) AS quantidadeVendas FROM venda

--fazendo uma seleção/busca/pesquisa bem específica--

SELECT * FROM usuarios WHERE nome = 'Maria Santos'
SELECT * FROM usuarios WHERE nome = 'Maria Santos' AND id = 2








