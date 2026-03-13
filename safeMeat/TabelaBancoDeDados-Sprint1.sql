-- TABELA SPRINT 1, GRUPO 02

/* NOMES E RA:
ERYKA LIMA DA SILVA, RA: 03261003
JOSÉ DANIEL ALICRIM BRAGA, RA:03261071
MARILYN GABRIELA AQUISE ANTINAPA, RA: 03261046
MICKAELA CASSIANE RODRIGUES, RA:03261000
MELISSA FREITAS RIBEIRO, RA:03261043
SOPHIA VIEIRA MENEZES, RA:03261020
RAÍSSA MARIA DO NASCIMENTO, RA:03261027
YURI GARCIA PARDINHO, RA: 03261009
*/

CREATE DATABASE sprint1;

USE sprint1;

-- TABELAS ATUALIZADAS

-- TABELA 01 - EMPRESA 
CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
cnpj CHAR(18) UNIQUE NOT NULL,
razaoSocial VARCHAR (50) NOT NULL,
senha VARCHAR (50) NOT NULL
) AUTO_INCREMENT = 1;


INSERT INTO empresa (cnpj,razaoSocial,senha) VALUES 
('39.456.700/0001-20','Swift','sptech123'),
('98.567.876/1100-09','CarneTop','sptech456'),
('56.678.234/8990-89','Boi Vigilante','sptech678'),
('34.456.567/7788-34','Carne sem choro','sptech567'),
('12.345.677/1456-76','Friboi','sptech718');

SELECT * FROM empresa;

SELECT * FROM empresa 
WHERE razaoSocial LIKE '%a%';

-- TABELA 02 - USUARIO
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeCompleto VARCHAR(150) NOT NULL,
email VARCHAR (150) UNIQUE NOT NULL,
senha VARCHAR (50) NOT NULL,
CONSTRAINT chkEmail CHECK ( email LIKE '%@%')
) AUTO_INCREMENT = 1;

INSERT INTO usuario (nomeCompleto,email,senha) VALUES 
('Eryka Lima','Eryka.Lima@sptech','123sptech'),
('Mickaela Cassiane','Mickaela.Cassiane@sptech','345sptech'),
('Melissa Freitas','Melissa.Freitas@sptech','567sptech'),
('Daniel José','José.Daniel@sptech','678sptech'),
('Raissa Maria','Raissa.maria@sptech','789sptech');

SELECT * FROM usuario;

SELECT nomeCompleto FROM usuario;

SELECT senha FROM usuario;

SELECT email FROM usuario;

SELECT nomeCompleto,email FROM usuario;

-- TABELA 03 - CARNE
CREATE TABLE carne (
idCarne INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(10),
qntKg DECIMAL (10,2),
dtCompra DATETIME DEFAULT CURRENT_TIMESTAMP,
dtValidade DATE,
fornecedor VARCHAR (100),
CONSTRAINT chkCategoria CHECK (categoria IN('bovino','suíno','pescado','aves'))
);

INSERT INTO carne (categoria,qntKg,dtCompra,dtValidade,fornecedor) VALUES
('suíno','10.00','2025-01-01','2026-01-01','CarneLegal'),
('bovino','15.05','2025-05-06','2026-03-06','MeatFreezing'),
('pescado','6.00','2025-01-01','2026-06-06','FreezerNice'),
('aves','16.00','2025-12-24','2026-12-12','SteakTech');

SELECT * FROM carne;

SELECT * FROM carne WHERE fornecedor LIKE 'SteakTech';

SELECT * FROM carne WHERE categoria = 'bovino';

SELECT localArmazenamento FROM carne;

SELECT CONCAT('Você comprou carne do tipo: ', categoria, ' do fornecedor ', fornecedor,' a Data de compra é:', dtCompra,' e a data de validade é:',dtValidade)
AS dtValidade_categoria_dtCompra_Fornecedor FROM carne;

-- TABELA 04 - REGISTROS
CREATE TABLE registros (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
temperatura VARCHAR(5) NOT NULL,
umidade VARCHAR(5) NOT NULL,
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
