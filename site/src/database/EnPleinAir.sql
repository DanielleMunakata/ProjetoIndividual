CREATE DATABASE EnPleinAir;
USE EnPleinAir;

create table artistaPrefer (
idArtista int primary key,
nomeArtista varchar(100),
dtNasc date
);

insert into artistaPrefer values (1,'Claude Monet','1840-11-04');

create table pinturaPrefer (
idPintura int,
nomePintura varchar(100),
anoPintura int,
fk_artista int, 
primary key(idPintura,fk_artista),
foreign key(fk_artista) references artistaPrefer(idArtista)
);

insert into pinturaPrefer values (1,'Mulher com Sombrinha','1975','1');


CREATE TABLE usuario (
  id INT,
  nomeCompleto VARCHAR(80),
  email VARCHAR(100), 
  senha CHAR(8), 
  dtNasc DATE,
  genero CHAR(1),
  fk_artistaPrefer INT,
  primary key(id,fk_artistaPrefer),
  fk_pinturaPrefer INT,
  newsletter CHAR(1),
  fk_login INT
); 
-- colocar check constraint no genero e na newsletter 

insert into usuario (id,email,senha,fk_artistaPrefer,fk_pinturaPrefer) 
values (1,'exemplo@gmail.com','123',1,1); 

alter table usuario add foreign key (fk_artistaPrefer) references artistaPrefer(idArtista);
alter table usuario add foreign key (fk_pinturaPrefer) references pinturaPrefer(idPintura);

create table login (
id INT,
email varchar(100),
senha char(8),
fk_usuario INT,
primary key(id,fk_artistaPrefer),
FOREIGN KEY (fk_usuario)
REFERENCES usuario(id),
fk_artistaPrefer INT
);

insert into login values 
(1,'exemplo@gmail.com','123',1,1);

alter table usuario add foreign key (fk_login) references login(id);

CREATE TABLE comentario(
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100),
  descricao VARCHAR(150),
  fk_usuario INT,
  FOREIGN KEY (fk_usuario) 
  REFERENCES usuario(id)
);

insert into comentario values (1,'Pintura do Monet','Gostei',1);


SELECT DISTINCT 1 AS resultado
FROM login
WHERE email = 'exemplo@gmail.com' AND senha = '123';