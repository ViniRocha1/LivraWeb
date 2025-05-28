-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE aquatech;

USE aquatech;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);

-- criar banco de dados livraweb
create database livraweb;

-- selecionar o banco de dados
use livraweb;

-- criar tabela de usuarios
create table usuario (

    id int auto_increment,
    nome varchar(100),
    email varchar(100),
    senha varchar(100),
    data_cadastro date,
    primary key (id)
);

-- criar tabela de manhwas
create table manhwa (
    id int auto_increment,
    titulo varchar(150),
    autor varchar(100),
    genero varchar(100),
    sinopse text,
    data_publicacao date,
    primary key (id)
);


-- criar tabela de quiz
create table quiz (
    id int auto_increment,
    titulo varchar(150),
    id_manhwa int,
    total_perguntas int,
    foreign key (id_manhwa) references manhwa(id),
    primary key (id)
);

-- criar tabela de pergunta
create table pergunta (
    id int auto_increment,
    enunciado text,
    id_quiz int,
    foreign key (id_quiz) references quiz(id),
    primary key (id)
);

-- criar tabela de alternativa
create table alternativa (
    id int auto_increment,
    texto varchar(255),
    correta boolean,
    id_pergunta int,
    foreign key (id_pergunta) references pergunta(id),
    primary key (id)
);

-- criar tabela de resposta_usuario
create table resposta_usuario (
    id_usuario int,
    id_pergunta int,
    id_alternativa int,
    data_resposta datetime,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_pergunta) references pergunta(id),
    foreign key (id_alternativa) references alternativa(id),
    primary key (id_usuario, id_pergunta)
);