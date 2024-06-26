﻿USE consultorio

CREATE TABLE paciente (
      cod int identity(1,1) primary key,
      nome varchar(50),
      cpf varchar(50),
      idade int
)

CREATE TABLE medico (
      cod int identity(1,1) primary key,
      nome varchar(50),
      especialidade varchar(20),
      crm varchar(20)
)

CREATE TABLE consulta (
      cod int identity(1,1) primary key,
      cod_paciente int foreign key references paciente(cod),
      cod_medico int foreign key references medico(cod),
      horario varchar(20),
      data varchar(20)
)

CREATE TABLE medicamento (
      cod int identity(1,1) primary key,
      nome varchar(50),
      bula varchar(20),
      miligramas varchar(20)
)

CREATE TABLE prescricao (
      cod int identity(1,1) primary key,
      cod_paciente int foreign key references paciente(cod),
      cod_medico int foreign key references medico(cod),
      cod_medicamento int foreign key references medicamento(cod),
      nome varchar(50),
      posologia varchar(20),
      dosagem varchar(20)
)

INSERT INTO medico (nome, especialidade, crm) VALUES('Marcos Aurelio', 'Otorrino', 'CRM-222333')
INSERT INTO medico (nome, especialidade, crm) VALUES('Vinicius Abreu', 'Ortopedista', 'CRM-292333')
INSERT INTO medico (nome, especialidade, crm) VALUES('Alessandra Cunha', 'Ginecologista', 'CRM-222733')
INSERT INTO medico (nome, especialidade, crm) VALUES('Katia Assis', 'Endocrinologista', 'CRM-122333')
INSERT INTO medico (nome, especialidade, crm) VALUES('Juliana Silva', 'Pediatra', 'CRM-229833')