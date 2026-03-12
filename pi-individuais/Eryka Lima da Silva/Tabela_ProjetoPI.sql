CREATE DATABASE piprojeto;
USE piprojeto;

-- TABELA ADMINISTRADORES
CREATE TABLE administrador (
idadm INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50),
CPF CHAR (11),
contato CHAR (11),
email VARCHAR(30),
cargo VARCHAR(15)
);

INSERT INTO administrador (nome, CPF, contato, email, cargo) VALUES
	('Jorge Brunett Matos', '45978963398', '11987452547', 'jorge.m@swift.com.br', 'Gerente'),
	('Regiane Mendes', '478822568', '11974623587', 'regiane.mendes@friboy.br', 'CEO');

SELECT * FROM administrador;


-- TABELA CLIENTES
CREATE TABLE cadastro (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50),
CPFCNPJ VARCHAR (20),
contato CHAR (11),
genero VARCHAR (10),
datanas DATETIME,
endereco VARCHAR (150),
CEP CHAR (8)
);

INSERT INTO cadastro (nome, CPFCNPJ, contato, genero, datanas, endereco, CEP) VALUES
	('Jaqueline Lima', '45978963398', '11987452547', 'Feminino', '1990-10-05', 'Rua José Moniz, 444, Jd Lorenço', '04425-879'),
	('Leandro Borges', '14788963398', '11981852547', 'Masculino', '1981-07-05', 'Av Senador Junqueira, 774 Vila bovina', '01475-879');

SELECT * FROM cadastro;

ALTER TABLE cadastro ADD COLUMN selecao VARCHAR(50);
ALTER TABLE cadastro ADD CONSTRAINT chkSelecao
	check(selecao='Cliente' OR selecao='Estabelecimento');
    
DESCRIBE cadastro;
SELECT nome FROM cadastro;
    
-- TABELA MEDIÇÃO
CREATE TABLE medicao (
idlocal INT PRIMARY KEY AUTO_INCREMENT,
id INT AUTO_INCREMENT,
nome VARCHAR(30),
temp CHAR(10),
umid CHAR(10)
);

INSERT INTO medicao (nome, temp, umid) VALUES
	('CarnesTop', '22.5', '10.7'),
    ('JR Carnes', '23.2', '12.3'),
    ('CarnesTop', '21', '10.7'),
    ('CarnesTop', '22.5', '11'),
    ('CarnesTop', '23', '08'),
    ('CarnesTop', '22.5', '10.7'),
    ('CarnesTop', '21', '10.7'),
    ('CarnesTop', '22.5', '12');    
    
SELECT * FROM medicao;
SELECT temp FROM medicao;
SELECT umid FROM medicao;
DROP TABLE medicao;

