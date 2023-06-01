CREATE DATABASE EnPleinAir;
USE EnPleinAir;

CREATE TABLE usuario (
  id INT PRIMARY KEY auto_increment,
  nomeCompleto VARCHAR(80),
  email VARCHAR(100), 
  senha CHAR(8), 
  dtNasc DATE,
  genero CHAR(1),
  artistaPrefer INT,
  pinturaPrefer INT,
  newsletter CHAR(1),
  fk_login INT
); 

insert into usuario (email,senha) 
values ('',''); 

create table login (
id int primary key auto_increment,
email varchar(100),
senha char(8),
fk_usuario INT,
FOREIGN KEY (fk_usuario)
REFERENCES usuario(id)
);

alter table usuario add foreign key (fk_login) references login(id);

insert into login (email,senha,fk_usuario) values 
('exemplo@gmail.com','123',1);

CREATE TABLE comentario(
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100),
  descricao VARCHAR(150),
  fk_usuario INT,
  FOREIGN KEY (fk_usuario) 
  REFERENCES usuario(id)
);


SELECT DISTINCT 1 AS resultado
FROM login
WHERE email = 'exemplo@gmail.com' AND senha = '123';
