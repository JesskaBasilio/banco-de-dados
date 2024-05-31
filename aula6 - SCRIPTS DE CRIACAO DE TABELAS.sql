CREATE TABLE Alunos 
(
	id_aluno INT PRIMARY KEY NOT NULL,
	nome VARCHAR(200) NOT NULL,
	data_nascimento DATE,
	sexo VARCHAR(1) NULL, --M para masculino ou F para feminino
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

--DROP TABLE Alunos

CREATE TABLE Situacao 
(
	id_situacao INT PRIMARY KEY NOT NULL,
	situacao VARCHAR(15) NOT NULL,
	data_cadastro DATETIME,
	login_cadastro VARCHAR(15)
);

CREATE TABLE Cursos
(
	id_curso INT PRIMARY KEY NOT NULL,
	nome_curso VARCHAR(200) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15)
);

CREATE TABLE Turmas
(
	id_turma INT PRIMARY KEY NOT NULL,
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	valor_turma NUMERIC(15,2) NOT NULL,
	desconto NUMERIC(3,2) NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15)
);

CREATE TABLE Registro_Presenca
(
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	id_situacao INT NOT NULL,
	data_presenca DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

/*
DROP TABLE Alunos;
DROP TABLE Cursos;
DROP TABLE Registro_Presenca;
DROP TABLE Situacao;
DROP TABLE Turmas;
*/

-- TURMAS X ALUNOS --

ALTER TABLE Turmas 
ADD CONSTRAINT fk_turmasAlunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);