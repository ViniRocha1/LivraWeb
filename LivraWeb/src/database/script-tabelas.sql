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
    titulo varchar(150) not null,
    id_manhwa int not null,
    total_perguntas int not null,
    foreign key (id_manhwa) references manhwa(id)
);

-- Tabela de pergunta
create table if not exists pergunta (
    id int primary key not null auto_increment,
    enunciado text not null,
    id_quiz int not null,
    foreign key (id_quiz) references quiz(id)
);

-- Tabela de alternativa
create table if not exists alternativa (
    id int primary key not null auto_increment,
    texto varchar(255) not null,
    correta boolean not null,
    id_pergunta int not null,
    foreign key (id_pergunta) references pergunta(id)
);

-- Tabela de resposta do usuário
create table if not exists resposta_usuario (
    id_usuario int not null,
    id_pergunta int not null,
    id_alternativa int not null,
    data_resposta datetime default current_timestamp,
    primary key (id_usuario, id_pergunta),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_pergunta) references pergunta(id),
    foreign key (id_alternativa) references alternativa(id)
);

-- Nova tabela pontuacao para controlar tentativas e pontuações
create table if not exists pontuacao (
    id int primary key auto_increment,
    tentativa int not null,
    fkQuiz int not null,
    fkUsuario int not null,
    pontuacao int not null,
    data_registro datetime default current_timestamp,
    foreign key (fkQuiz) references quiz(id),
    foreign key (fkUsuario) references usuario(id)
);

-- Inserts de manhwas principais
insert into manhwa (titulo, autor, genero, sinopse, data_publicacao) values
('TBATE', 'TurtleMe', 'Fantasia', 'The Beginning After The End conta a história de King Grey, que renasce em um novo mundo.', '2018-01-01'),
('Solo Leveling', 'Chugong', 'Ação', 'Um caçador de rank baixo se torna incrivelmente poderoso.', '2016-07-01'),
('Second Life Ranker', 'Sadoyeon', 'Aventura', 'Yeon-woo entra em uma torre para vingar seu irmão.', '2019-01-01'),
('Heavenly Inquisition Sword', 'Hajun Im', 'Ação', 'Um jovem busca se vingar de traidores.', '2020-05-01'),
('Revenge Iron-Blooded Sword Hound', 'Unknown', 'Fantasia', 'Uma história de vingança e honra em um mundo brutal.', '2021-03-01');

-- Calcula a porcentagem de usuários que responderam quizzes de cada manhwa
SELECT 
    m.titulo AS manhwa,
    ROUND((COUNT(DISTINCT r.id_usuario) * 100.0) / (SELECT COUNT(*) FROM usuario), 2) AS porcentagemUsuarios
FROM resposta_usuario r
INNER JOIN pergunta p ON r.id_pergunta = p.id
INNER JOIN quiz q ON p.id_quiz = q.id
INNER JOIN manhwa m ON q.id_manhwa = m.id
GROUP BY m.titulo;

-- 2️ Mostra para um usuário específico o total de respostas e data da última resposta por manhwa
SELECT 
    u.nome,
    m.titulo AS manhwa,
    COUNT(*) AS totalRespostas,
    MAX(r.data_resposta) AS ultimaResposta
FROM resposta_usuario r
INNER JOIN usuario u ON r.id_usuario = u.id
INNER JOIN pergunta p ON r.id_pergunta = p.id
INNER JOIN quiz q ON p.id_quiz = q.id
INNER JOIN manhwa m ON q.id_manhwa = m.id
WHERE u.id = 1 -- Troque pelo ID do usuário logado
GROUP BY u.nome, m.titulo;

-- 3️ Lista todas as respostas de um usuário em um quiz específico, mostrando detalhes
SELECT 
    r.id_usuario,
    u.nome,
    q.titulo AS quiz,
    m.titulo AS manhwa,
    r.id_pergunta,
    r.id_alternativa,
    r.data_resposta
FROM resposta_usuario r
INNER JOIN usuario u ON r.id_usuario = u.id
INNER JOIN pergunta p ON r.id_pergunta = p.id
INNER JOIN quiz q ON p.id_quiz = q.id
INNER JOIN manhwa m ON q.id_manhwa = m.id
WHERE r.id_usuario = 1 AND q.id = 2 -- Troque pelo usuário e quiz atual
ORDER BY r.data_resposta;

-- 4️ Conta quantos quizzes diferentes cada usuário já respondeu
SELECT 
    u.nome,
    COUNT(DISTINCT q.id) AS totalQuizzesRespondidos
FROM resposta_usuario r
INNER JOIN usuario u ON r.id_usuario = u.id
INNER JOIN pergunta p ON r.id_pergunta = p.id
INNER JOIN quiz q ON p.id_quiz = q.id
GROUP BY u.nome
ORDER BY totalQuizzesRespondidos DESC;

-- 5️ Mostra todos os manhwas cadastrados no sistema
SELECT * FROM manhwa;


select* from usuario;