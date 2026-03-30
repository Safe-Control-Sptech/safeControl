CREATE DATABASE transporte;
USE transporte;

CREATE TABLE usuario( 
idUsuario INT PRIMARY KEY auto_increment,
proprietario VARCHAR(60) NOT NULL,
empresa VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE,
senha VARCHAR(40) NOT NULL,
cpf VARCHAR(20) NOT NULL UNIQUE,
telefone INT NOT NULL UNIQUE,
cidade VARCHAR (100) NOT NULL, 
UF CHAR (2) NOT NULL,
cep CHAR(9) NOT NULL,
endereco VARCHAR(100) NOT NULL,
numero INT NOT NULL,
complemento VARCHAR(100), 
DtRegistro  DATETIME DEFAULT current_timestamp 
);

INSERT INTO usuario(idUsuario, proprietario, empresa , email, senha, cpf, telefone, cidade , uf, cep,  endereco, numero , complemento, DtLogin) VALUES
( DEFAULT, 'Luiz ','Becker Transportes ' , 'luiz9@gmail.com', 'luiz212223', '129-456-954-2', '998279529','São Carlos', 'SP', '05137-200', 'Avenida mofarrej', '345' , '' , DEFAULT ),
(DEFAULT, 'Pedro','Brasfrigo' , 'pedro9@gmail.com', 'pedro9382', '234-154-789-5', '944174356','Cabo Frio', 'RJ', '02315-100', 'Rua elisio', '120' , '' , DEFAULT ),
(DEFAULT, 'Arthur','Arfrio Logística' ,'arthur7@gmail.com', 'arthur9382', '984-321-564-8', '987124825','Indaial', 'SC', '04789-400', 'Avenida Isabel', '745' , 'Casa 02' , DEFAULT ),
(DEFAULT, 'Marcela ',' Arfrio Logística' ,'marcela1@gmail.com', 'marcela8997', '456-678-098-1', '942158421','Salvador', 'BA', '07710-500', 'Rua Liberdade', '115' , 'Casa 01' , DEFAULT ),
(DEFAULT, 'Beatriz','Brasfrigo' ,'beatriz3@gmail.com', 'beatriz4321', '134-921-843-3', '923671258','Campo Grande', 'MS', '06721-900', 'Avenida mato grosso', '450' , 'Casa 05' , DEFAULT ),
(DEFAULT, 'Gabriel','Becker Transportes' ,'gabriel2@gmail.com', 'gabriel4321', '734-921-843-3', '823671258','Campo Grande', 'MS', '06721-900', 'Avenida mato grosso', '450' , 'Casa 05' , DEFAULT );

SELECT * FROM usuario;

ALTER TABLE usuario ADD COLUMN email_secundario VARCHAR(40);
UPDATE usuario SET email_secundario = 'luiz22@gmail.com' WHERE idUsuario = 1;
UPDATE usuario SET email_secundario = 'pedro32@gmail.com' WHERE idUsuario = 2;
UPDATE usuario SET email_secundario = 'arthur56@gmail.com' WHERE idUsuario = 3;
UPDATE usuario SET email_secundario = 'marcela78@gmail.com' WHERE idUsuario = 4;
UPDATE usuario SET email_secundario = 'beatriz90@gmail.com' WHERE idUsuario = 5;
UPDATE usuario SET email_secundario = 'gabriel74@gmail.com' WHERE idUsuario = 6;
DESCRIBE usuario;
SELECT * FROM usuario;
DROP TABLE usuario;


CREATE TABLE login(
idLogin INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(60) NOT NULL UNIQUE,
senha VARCHAR(40) NOT NULL
);







CREATE TABLE sensores(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
empresa VARCHAR (45),
qntd_sensores INT
);







CREATE TABLE sensor(
idsensor INT PRIMARY KEY auto_increment,
codigo_sensor CHAR(6) NOT NULL UNIQUE, 
nome_sensor VARCHAR(40) NOT NULL, 
proprietario VARCHAR(40) NOT NULL,
empresa VARCHAR(40) NOT NULL
);







CREATE TABLE registro_sensor(
idregistro INT PRIMARY KEY auto_increment,
codigo_sensor CHAR(6) NOT NULL UNIQUE,
temperatura DECIMAL(3,1) NOT NULL,
dia_registro DATETIME DEFAULT current_timestamp,
empresa VARCHAR(40) NOT NULL,
stts VARCHAR(30)
);



