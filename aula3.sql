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
SELECT * FROM setor

INSERT INTO cargo (titulo, id_setor) VALUES ('Secretaria', 1)
SELECT * FROM cargo

INSERT INTO funcionario (nome, id_cargo) VALUES ('Maria Andrade', 1)
SELECT * FROM funcionario