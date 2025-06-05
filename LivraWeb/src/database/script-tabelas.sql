create database if not exists livraweb;
use livraweb;

-- tabela de usuário
create table if not exists usuario (
    id int primary key not null auto_increment,
    nome varchar(100) not null,
    email varchar(255) not null,
    senha varchar(255) not null,
    data_cadastro datetime default current_timestamp
);

-- tabela de manhwas
create table if not exists manhwa (
    id int primary key not null auto_increment,
    titulo varchar(150) not null,
    autor varchar(100),
    genero varchar(100),
    sinopse text,
    data_publicacao date
);

-- tabela de quiz
create table if not exists quiz (
    id int primary key not null auto_increment,
    id_usuario int not null, 
    resultado int,
    foreign key (id_usuario) references usuario(id)
);

-- tabela de ligação entre manhwa e quiz
create table if not exists manhwa_quiz (
    id_manhwa int not null,
    id_quiz int not null,
    id_usuario int not null, 
    primary key (id_manhwa, id_quiz),
    foreign key (id_manhwa) references manhwa(id),
    foreign key (id_quiz) references quiz(id),
    foreign key (id_usuario) references usuario(id)
);

-- tabela de manhwas favoritos
create table if not exists manhwa_favorito (
    id int primary key auto_increment,
    id_usuario int not null,
    id_manhwa int not null,
    data_voto datetime default current_timestamp,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_manhwa) references manhwa(id),
    unique (id_usuario)
);

-- inserts de manhwas principais
insert into manhwa (titulo, autor, genero, sinopse, data_publicacao) values
('tbate', 'turtleme', 'fantasia', 'the beginning after the end conta a história de king grey, que renasce em um novo mundo.', '2018-01-01'),
('solo leveling', 'chugong', 'ação', 'um caçador de rank baixo se torna incrivelmente poderoso.', '2016-07-01'),
('second life ranker', 'sadoyeon', 'aventura', 'yeon-woo entra em uma torre para vingar seu irmão.', '2019-01-01'),
('heavenly inquisition sword', 'hajun im', 'ação', 'um jovem busca se vingar de traidores.', '2020-05-01'),
('revenge iron-blooded sword hound', 'unknown', 'fantasia', 'uma história de vingança e honra em um mundo brutal.', '2021-03-01');

-- votos por manhwa
select m.titulo, count(mf.id) as total_votos
from manhwa_favorito mf
join manhwa m on mf.id_manhwa = m.id
group by m.titulo
order by total_votos desc;

-- votos por gênero
select m.genero, count(mf.id) as total_votos
from manhwa_favorito mf
join manhwa m on mf.id_manhwa = m.id
group by m.genero
order by total_votos desc;

-- mostra todos os manhwas cadastrados no sistema
select * from manhwa;

-- mostra todos os usuários cadastrados
select * from usuario;
