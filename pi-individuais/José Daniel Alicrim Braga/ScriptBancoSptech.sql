-- TABELA SPRINT 1, GRUPO 02

CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE cliente (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeCompleto VARCHAR (100),
cnpj CHAR(18) UNIQUE NOT NULL,
senha VARCHAR(50) NOT NULL,
email VARCHAR (150) UNIQUE NOT NULL,
razaoSocial VARCHAR (100) NOT NULL,
CONSTRAINT chkemail CHECK(email like '%@%')
) AUTO_INCREMENT = 1;

desc cliente;

INSERT INTO cliente (nomeCompleto, cnpj, senha,email,razaoSocial) VALUES 
('Mickaela Cassiane', '00.394.460/0058-87','Sptech123','teste@gmail.com','Sptech'),
('Melissa Freitas', '00.123.456/0007-16','Sptch234','teste2@gmail.com','Banco safra'),
('José Daniel','05.678.123/8899-15','Sptech345','teste3@gmail.com','Vivo'),
('Raissa Maria','89.456.789/5671-18','Sptech456','teste4@gmail.com','Claro'),
('Luis Felipe','17.632.978/5562-12','Sptech789','teste5@gmail.com','Tim');


SELECT * FROM  cliente;

select * from cliente where email like '%@%';

SELECT razaoSocial FROM cliente;

SELECT nomeCompleto FROM cliente;

SELECT cnpj FROM cliente;

SELECT email FROM cliente;

SELECT senha FROM cliente;

-- tabela 02 

CREATE TABLE carne (
idCarne INT PRIMARY KEY AUTO_INCREMENT,
nomeCarne VARCHAR(50),
precoKilo DECIMAL(4,2),
temperaturaMaxima varchar(5),
localDeArmazenamento varchar(20),
CONSTRAINT chklocal 
CHECK(localDeArmazenamento IN 
('balcão','camara fria','freezer')
));
desc carne;

INSERT INTO carne (nomeCarne, precoKilo,temperaturamaxima,localdearmazenamento)VALUES
('picanha', 80.00,'4ºC','camara fria'),
('contra filé',60.00,'4ºC','camara fria');

INSERT INTO carne (nomeCarne, precoKilo,temperaturamaxima,localdearmazenamento) VALUES
('Coração', '40.00', '-16ºC','Freezer'),
('Costela / Cupim','75.00','-2ºC','balcão'),
('alcatra','75.00','-2ºC','freezer');

SELECT * FROM carne;

SELECT * FROM carne WHERE localDeArmazenamento = 'Freezer';
SELECT * FROM carne WHERE localDeArmazenamento = 'balcão';
SELECT * FROM carne WHERE localDeArmazenamento like  '%camara%';
SELECT precokilo FROM carne WHERE nomeCarne = 'picanha';
SELECT temperaturaMaxima FROM carne WHERE nomeCarne = 'contra filé';

-- tabela 03
-- valores  implementados através do arduíno 

CREATE TABLE registro (
idRegistro INT PRIMARY KEY
AUTO_INCREMENT,
temperatura VARCHAR(10) NOT NULL,
umidade VARCHAR(10) NOT NULL,
dataRegistro DATETIME
);

INSERT INTO registro (temperatura,umidade,dataregistro) VALUES 
('4ºC','85%',current_timestamp()),
('2ºC','88%',current_timestamp()),
('1ºC','88%',current_timestamp()),
('4ºC','88%',current_timestamp()),
('5ºC', '86%', current_timestamp());


SELECT * FROM registro;
SELECT * FROM registro where temperatura = 1;
SELECT umidade FROM registro WHERE idRegistro = 3;
SELECT dataregistro, temperatura FROM registro WHERE idRegistro
