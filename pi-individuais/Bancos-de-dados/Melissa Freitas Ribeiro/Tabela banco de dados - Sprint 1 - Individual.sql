USE praticar;

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

SELECT razaoSocial FROM empresa;

SELECT cnpj FROM empresa;
 
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

SELECT nomeCompleto,email FROM usuario;

CREATE TABLE carne (
idCarne INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(10),
qntKg DECIMAL (10,2),
dtCompra DATETIME DEFAULT CURRENT_TIMESTAMP,
dtValidade DATE,
fornecedor VARCHAR (100),
CONSTRAINT chkCategoria CHECK (categoria IN('bovino','suíno','pescado','aves'))
);

/* Qual a razão para termos os campos "Data de validade" e "Data de compra"?
- Se o cliente quiser saber quando ele comprou o produto
- Se o cliente quiser compara a data de compra com a data de validade
- Se o cliente quiser saber se a data de validade está próxima para fazer promoção do produto
*/
/* Contras sobre a "Data de validade" e "Data de compra":
- O objetivo da nossa empresa não é monitorar data de validade nem de compra e sim monitorar as condições de armazenamento do produto
- Creio que tirar os campos "qntKg", "dtCompra", "dtValidade" e "fornecedor", além de adicionar "Local de armazenamento", seria a solução ideal para aprimorar essa tabela
*/

INSERT INTO carne (categoria,qntKg,dtCompra,dtValidade,fornecedor) VALUES
('suíno','10.00','2025-01-01','2026-01-01','CarneLegal'),
('bovino','15.05','2025-05-06','2026-03-06','MeatFreezing'),
('pescado','6.00','2025-01-01','2026-06-06','FreezerNice'),
('aves','16.00','2025-12-24','2026-12-12','SteakTech');


SELECT * FROM carne;

SELECT * FROM carne WHERE fornecedor LIKE 'SteakTech';

SELECT * FROM carne WHERE categoria = 'bovino';

SELECT CONCAT('Você comprou carne do tipo: ', categoria, ' do fornecedor ', fornecedor,' a Data de compra é:', dtCompra,' e a data de validade é:',dtValidade)
AS dtValidade_categoria_dtCompra_Fornecedor FROM carne;


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

SELECT temperatura,dtRegistro FROM registros
WHERE temperatura >= 1;

SELECT umidade,dtRegistro FROM registros
WHERE umidade >= '77%';

SELECT temperatura, CASE 
WHEN temperatura > '4°C' THEN 'Verificar armazenamento!'
WHEN temperatura >='0°C' AND temperatura <='4°C' THEN 'Temperatura normal'
END AS temperatura_ideal
FROM registros;