CREATE DATABASE viagens
USE viagens

CREATE TABLE usuarios (
	id INT,
	nome VARCHAR(255) NOT NULL /*'Nome do usu�rio'*/,
	email VARCHAR(255) NOT NULL UNIQUE /*'E-mail do usuario'*/,
	data_nascimento DATE NOT NULL /*'Data de nascimento do usuario'*/,
	endereco VARCHAR(50) NOT NULL /*'Endereco do usuario'*/
);

CREATE TABLE destinos (
	id int,
	nome VARCHAR(255) NOT NULL /*Nome do destino*/,
	descricao VARCHAR(255) NOT NULL /*Descricao do destino*/
);

CREATE TABLE reservas (
	id INT /*identificador unico de reservas*/,
	id_usuario int /*referencia ao id do usuario que fez a reserva*/,
	id_destino int  /*referencia ao id do destino da reserva*/,
	data DATE /*data da reserva*/,
	status VARCHAR(255) DEFAULT 'pendente' /*status da reserva (confirmada, pendente, cancelada etc)*/
);


--Inserts--

INSERT INTO usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(1, 'Jo�o Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');

INSERT INTO destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Hist�rica de Pedra Alta', 'Uma cidade rica em hist�ria e arquitetura');

INSERT INTO reservas (id, id_usuario, id_destino, data, status) VALUES 
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');

-- Selects --

-- Selecionar todos os registros da tabela "usuarios"
SELECT * FROM usuarios;

-- Selecionar apenas o nome e o email dos usu�rios
SELECT nome, email FROM usuarios;

-- Selecionar os usu�rios que possuem o nome "Jo�o Silva"
SELECT * FROM usuarios WHERE nome = 'Jo�o Silva';

-- Selecionar os usu�rios que nasceram antes de uma determinada data
SELECT * FROM usuarios WHERE data_nascimento < '1990-01-01';

-- Like
SELECT * FROM usuarios WHERE nome LIKE '%Silva%';
SELECT * FROM usuarios WHERE nome LIKE 'Jo_o%';

-- Update --
UPDATE usuarios SET endereco = 'Nova Rua, 123' WHERE email = 'joao@example.com';

-- delete --
DELETE FROM reservas WHERE status = 'cancelada';

CREATE TABLE usuarios_nova(
	id INT,
	nome VARCHAR(255) NOT NULL /*Nome do usuario*/,
	email VARCHAR(255) NOT NULL /*UNIQUE COMMENT 'Endere�o de e-mail do usu�rio'*/,
  data_nascimento DATE NOT NULL /*'Data de nascimento do usu�rio'*/,
  endereco VARCHAR(100) NOT NULL /*'Endere�o do Cliente'*/
);

--Migrando os dados --

INSERT INTO usuarios_nova SELECT * FROM usuarios

-- Excluindo tabela anterior --
DROP table usuarios;

-- Renomeando nova tabela --
EXEC SP_RENAME 'usuarios_nova', 'usuarios' 
GO /*Se colocar o GO na linha acima d� um erro ao executar o programa*/

--Alterar tamanho da coluna endere�o -- 
ALTER TABLE usuarios ALTER COLUMN endereco VARCHAR(100);

--deletando colunas na tabela de usuarios--
ALTER TABLE usuarios DROP COLUMN rua
ALTER TABLE usuarios DROP COLUMN numero
ALTER TABLE usuarios DROP COLUMN cidade
ALTER TABLE usuarios DROP COLUMN estado
SELECT * FROM usuarios