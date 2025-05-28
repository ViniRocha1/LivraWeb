-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

-- criar banco de dados livraweb
create database livraweb;
drop database livraweb;

-- selecionar o banco de dados
use livraweb;

-- criar tabela de usuarios
create table usuario (

    id int auto_increment,
    nome varchar(100),
    email varchar(100),
    senha varchar(100),
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



insert into manhwa (titulo, autor, genero, sinopse, data_publicacao) values ('The Beggening After The End', 'Brandon Lee', 'Ação', 'O rei Grey, apesar de um reinado próspero, 
sente um vazio interior e, após morrer, reencarna como Arthur Leywin, um bebê em um mundo mágico. 
Arthur, com a consciência da sua vida anterior, busca dominar a magia e se tornar um poderoso guerreiro.', '2018-07-07' );


-- criar tabela de quiz
create table quiz (
    id int auto_increment,
    titulo varchar(150),
    id_manhwa int,
    foreign key (id_manhwa) references manhwa(id),
    primary key (id)
);

insert into quiz (titulo, id_manhwa) values('Quiz TBATE', 1 );

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


