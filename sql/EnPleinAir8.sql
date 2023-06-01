CREATE DATABASE EnPleinAir;
USE EnPleinAir;

CREATE TABLE usuario (
  id INT PRIMARY KEY,
  nomeCompleto VARCHAR(80),
  email VARCHAR(100), 
  senha CHAR(8), 
  dtNasc DATE,
  genero CHAR(1),
  artistaPrefer CHAR(8),
  newsletter CHAR(1)
); 

CREATE TABLE aviso (
  id INT PRIMARY KEY IDENTITY(1,1),
  titulo VARCHAR(100),
  descricao VARCHAR(150),
  fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);

DELIMITER //

CREATE FUNCTION verificarCredenciais(email VARCHAR(100), senha CHAR(8)) RETURNS BOOLEAN
BEGIN
    DECLARE existeUsuario BOOLEAN;

    SELECT EXISTS(SELECT 1 FROM usuario WHERE email = email AND senha = senha) INTO existeUsuario;

    RETURN existeUsuario;
END //

DELIMITER ;

SELECT verificarCredenciais('email@exemplo.com', 'senha123');

SELECT DISTINCT 1 AS resultado
FROM usuario
WHERE email = 'email@exemplo.com' AND senha = 'senha123';


-- ver se o email e senha batem no banco de dados 