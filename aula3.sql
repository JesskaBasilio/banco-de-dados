CREATE DATABASE chave
USE chave

--criando tabela setor--
CREATE TABLE setor (
	cod INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50)
)


--criando a tabela cargo--
CREATE TABLE cargo (
	cod INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(50),
	id_setor INT
)

--criando a tabela funcionario--
CREATE TABLE funcionario (
	cod INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	id_cargo INT
)

drop table funcionario

--inserindo dados dentros das tablelas setor, cargo e funcionário--

INSERT INTO setor (nome) VALUES ('Recursos Humanos')


INSERT INTO cargo (titulo, id_setor) VALUES ('Secretaria', 1)


INSERT INTO funcionario (nome, id_cargo) VALUES ('Maria Andrade', 1)
SELECT * FROM funcionario

SELECT * FROM setor
SELECT * FROM cargo
SELECT * FROM funcionario

/*Foi acrescentado a chave estrangeira dentro das tabelas, modificado dentro do programa e ela
existe para que o usuário não cometa erros, até o exato momento
temos apenas uma inserção em cada tabela, veja a tentativa abaixo:*/

INSERT INTO funcionario (nome, id_cargo) VALUES ('João Andrade', 2) /*não dá certo, pois ainda não foi criado o cargo 2,
se trocar para cargo 1, que existe, o funcionarios será criado na tabela. Essa é a vantagem da criação da chave estrangeira*/

INSERT INTO funcionario (nome, id_cargo) VALUES ('João Andrade', 1) /*funcionario criado com sucesso*/

