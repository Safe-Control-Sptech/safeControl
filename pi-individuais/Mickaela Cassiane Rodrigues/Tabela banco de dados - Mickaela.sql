-- TABELA SPRINT 1, GRUPO 02

CREATE DATABASE sprint1;

USE sprint1;

-- PRIMEIRA TABELA 
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeCompleto VARCHAR (100) NOT NULL,
cnpj CHAR(18) UNIQUE NOT NULL,
senha VARCHAR (50) NOT NULL,
email VARCHAR (150) UNIQUE NOT NULL,
razaoSocial VARCHAR (50) NOT NULL,
CONSTRAINT chkEmail CHECK (email LIKE '%@%')
) AUTO_INCREMENT =1;

INSERT INTO usuario (nomeCompleto,cnpj,senha,email,razaoSocial) VALUES
('Eryka Lima','55.676.990/0001-7','123sptech','Eryka.Lima@sptech','Vivo'),
('Mickaela Cassiane','23.124.880/1000-8','345sptech','Mickaela.Cassiane@sptech','Claro'),
('Melissa Freitas','56.789.770/0001-9','567sptech','Melissa.Freitas@sptech','Accenture'),
('Sophia Menezes', '12.456.440/1000-6','789sptech','Sophia.menezes@sptech','Sptech'),
('Raissa Maria','45.678.220/0001-5','890sptech','Raissa.maria@sptech','Safra');

SELECT * FROM usuario;

SELECT nomeCompleto FROM usuario;

SELECT cnpj FROM usuario;

SELECT senha FROM usuario;

SELECT email FROM usuario;

SELECT razaoSocial FROM usuario;

SELECT nomeCompleto,cnpj,email,razaoSocial FROM usuario;


-- SEGUNDA TABELA 
CREATE TABLE carne (
idCarne INT PRIMARY KEY AUTO_INCREMENT,
categoriaCarne VARCHAR (50),
precoKg DECIMAL (10,2),
minTemperatura VARCHAR(5),
maxTemperatura VARCHAR(5),
localArmazenamento VARCHAR(20) NOT NULL,
CONSTRAINT chklocal CHECK(localArmazenamento IN ('balcão','camara fria','freezer')
));

INSERT INTO carne (categoriaCarne,precoKg,minTemperatura,maxTemperatura,localArmazenamento) VALUES 
('carne Bovina',80.00,'0°C','4°C','balcão'),
('carne Suína',60.00,'0°C','4°C','balcão'),
('aves',50.00,'0°C','4°C','balcão'),
('carnes congeladas',80.00,'-22°C','-18°C','camara fria'),
('peixes frescos',70.00,'2°C','4°C','freezer');


SELECT * FROM carne;

SELECT minTemperatura
AS  temperatura_mínima
FROM carne;

SELECT maxTemperatura 
AS temperatura_máxima
FROM carne;

SELECT * FROM carne WHERE localArmazenamento LIKE '%freezer%';

SELECT localArmazenamento FROM carne;

SELECT CONCAT('A temperatura ideal para ', categoriaCarne,' é entre ', minTemperatura, ' e ',maxTemperatura) AS temepratura_ideal FROM carne;

-- TERCEIRA TABELA 

CREATE TABLE registros (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
temperatura VARCHAR(5) NOT NULL,
umidade VARCHAR (5) NOT NULL,
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
) AUTO_INCREMENT = 1;

INSERT INTO registros (temperatura,umidade,dtRegistro) VALUES
('4°C','80%',CURRENT_TIMESTAMP),
('3°C','75%',CURRENT_TIMESTAMP),
('0°C','70%',CURRENT_TIMESTAMP),
('-1°C','76%',CURRENT_TIMESTAMP),
('-2°C','78%', CURRENT_TIMESTAMP);

SELECT * FROM registros;

SELECT temperatura FROM registros WHERE idRegistro = 3;

SELECT umidade FROM registros WHERE idRegistro = 2;

SELECT * FROM registros WHERE temperatura > '1°C';

SELECT * FROM registros WHERE umidade < '80%';

