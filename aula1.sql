CREATE DATABASE viagens
USE viagens

CREATE TABLE usuarios (
	id INT,
	nome VARCHAR(255) NOT NULL /*'Nome do usuário'*/,
	email VARCHAR(255) NOT NULL UNIQUE /*'E-mail do usuario'*/,
	data_nascimento DATE NOT NULL /*'Data de nascimento do usuario'*/,
	endereco VARCHAR(50) NOT NULL /*'Endereco do usuario'*/
);