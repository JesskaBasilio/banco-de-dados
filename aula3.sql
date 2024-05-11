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

--inserindo dados dentros das tablelas setor, cargo e funcion�rio--

INSERT INTO setor (nome) VALUES ('Recursos Humanos')


INSERT INTO cargo (titulo, id_setor) VALUES ('Secretaria', 1)


INSERT INTO funcionario (nome, id_cargo) VALUES ('Maria Andrade', 1)
SELECT * FROM funcionario

SELECT * FROM setor
SELECT * FROM cargo
SELECT * FROM funcionario

/*Foi acrescentado a chave estrangeira dentro das tabelas, modificado dentro do programa e ela
existe para que o usu�rio n�o cometa erros, at� o exato momento
temos apenas uma inser��o em cada tabela, veja a tentativa abaixo:*/

INSERT INTO funcionario (nome, id_cargo) VALUES ('Jo�o Andrade', 2) /*n�o d� certo, pois ainda n�o foi criado o cargo 2,
se trocar para cargo 1, que existe, o funcionarios ser� criado na tabela. Essa � a vantagem da cria��o da chave estrangeira*/

INSERT INTO funcionario (nome, id_cargo) VALUES ('Jo�o Andrade', 1) /*funcionario criado com sucesso*/

