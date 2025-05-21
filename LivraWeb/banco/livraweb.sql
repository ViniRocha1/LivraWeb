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

-- criar tabela de leitura (associativa entre usuario e manhwa)
create table leitura (
    id_usuario int,
    id_manhwa int,
    data_inicio date,
    data_fim date,
    status varchar(50),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_manhwa) references manhwa(id),
    primary key (id_usuario, id_manhwa)
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
