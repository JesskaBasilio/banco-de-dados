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

--uso do inner join--

SELECT * FROM usuarios
INNER JOIN reservas ON usuarios.id = reservas.id_usuario
INNER JOIN destinos ON reservas.id_destino = destinos.id

--alterando e adicionando elementos à tabela--

ALTER TABLE usuarios
 /*esses comandos inseri um por um para funcionar, ou seja alter table usuarios + add ... um por um*/
ADD rua VARCHAR(255),
ADD numero VARCHAR(50),
ADD cidade VARCHAR(255),
ADD estado VARCHAR(50)
select * from usuarios

--cadastrando novo usuário--

INSERT INTO usuarios (nome, email, data_nascimento, endereco) VALUES ('sem reservas', 'dio@teste.com', '1992-05-05', 'rua 12 cidade estado')

--UPDATE--
UPDATE usuarios
SET rua = SUBSTRING(SUBSTRING(endereco, ',',1), ',',-1),
    numero = SUBSTRING(SUBSTRING(endereco, ',',2), ',',-1),
	cidade = SUBSTRING(SUBSTRING(endereco, ',',3), ',',-1),
	estado = SUBSTRING(endereco, ',',-1);


-- Atualizar a tabela 'usuarios' com a separação do endereço-- 
UPDATE usuarios
SET rua = LTRIM(RTRIM(SUBSTRING(endereco, 1, CHARINDEX(',', endereco) - 1))),
    numero = LTRIM(RTRIM(SUBSTRING(endereco, CHARINDEX(',', endereco) + 1, 
                CHARINDEX(',', endereco, CHARINDEX(',', endereco) + 1) - CHARINDEX(',', endereco) - 1))),
    cidade = LTRIM(RTRIM(SUBSTRING(endereco, CHARINDEX(',', endereco, CHARINDEX(',', endereco) + 1) + 1, 
                CHARINDEX(',', endereco, CHARINDEX(',', endereco, CHARINDEX(',', endereco) + 1) + 1) - CHARINDEX(',', endereco, CHARINDEX(',', endereco) + 1) - 1))),
    estado = LTRIM(RTRIM(SUBSTRING(endereco, CHARINDEX(',', endereco, CHARINDEX(',', endereco, CHARINDEX(',', endereco) + 1) + 1) + 1, LEN(endereco) - CHARINDEX(',', endereco, CHARINDEX(',', endereco, CHARINDEX(',', endereco) + 1) + 1))));

-- Verificar os dados após a atualização
SELECT id, nome, rua, numero, cidade, estado FROM usuarios;
