create database if not exists livraweb;
use livraweb;

-- Tabela de usuário
create table if not exists usuario (
    id int primary key not null auto_increment,
    nome varchar(100) not null,
    email varchar(255) not null,
    senha varchar(255) not null,
    data_cadastro datetime default current_timestamp
);

-- Tabela de manhwas
create table if not exists manhwa (
    id int primary key not null auto_increment,
    titulo varchar(150) not null,
    autor varchar(100),
    genero varchar(100),
    sinopse text,
    data_publicacao date
);


-- Tabela de quiz
create table if not exists quiz (
    id int primary key not null auto_increment,
    id_usuario int not null, 
    resultado int,
	foreign key (id_usuario) references usuario(id)
);

create table if not exists manhwa_quiz (
    id_manhwa int not null,
    id_quiz int not null,
    id_usuario int not null, 
    PRIMARY KEY (id_manhwa, id_quiz),
    FOREIGN KEY (id_manhwa) REFERENCES manhwa(id),
    FOREIGN KEY (id_quiz) REFERENCES quiz(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
    
);

CREATE TABLE IF NOT EXISTS manhwa_favorito (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_manhwa INT NOT NULL,
    data_voto DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_manhwa) REFERENCES manhwa(id),
    UNIQUE (id_usuario) -- para garantir que cada usuário vote uma única vez
);

-- Inserts de manhwas principais
insert into manhwa (titulo, autor, genero, sinopse, data_publicacao) values
('TBATE', 'TurtleMe', 'Fantasia', 'The Beginning After The End conta a história de King Grey, que renasce em um novo mundo.', '2018-01-01'),
('Solo Leveling', 'Chugong', 'Ação', 'Um caçador de rank baixo se torna incrivelmente poderoso.', '2016-07-01'),
('Second Life Ranker', 'Sadoyeon', 'Aventura', 'Yeon-woo entra em uma torre para vingar seu irmão.', '2019-01-01'),
('Heavenly Inquisition Sword', 'Hajun Im', 'Ação', 'Um jovem busca se vingar de traidores.', '2020-05-01'),
('Revenge Iron-Blooded Sword Hound', 'Unknown', 'Fantasia', 'Uma história de vingança e honra em um mundo brutal.', '2021-03-01');



-- votos por manhwa
SELECT m.titulo, COUNT(mf.id) AS total_votos
FROM manhwa_favorito mf
JOIN manhwa m ON mf.id_manhwa = m.id
GROUP BY m.titulo
ORDER BY total_votos DESC;

-- votos por genero
SELECT m.genero, COUNT(mf.id) AS total_votos
FROM manhwa_favorito mf
JOIN manhwa m ON mf.id_manhwa = m.id
GROUP BY m.genero
ORDER BY total_votos DESC;

-- 5️ Mostra todos os manhwas cadastrados no sistema
SELECT * FROM manhwa;


select* from usuario;