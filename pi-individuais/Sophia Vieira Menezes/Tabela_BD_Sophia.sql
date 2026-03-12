CREATE DATABASE safe;
USE safe;

CREATE TABLE empresa (
idEmpresa INT primary KEY auto_increment,
nome VARCHAR(50),
cnpj CHAR(18) UNIQUE
);

CREATE TABLE cliente(
idCliente INT primary KEY auto_increment,
usuario VARCHAR(50),
empresa varchar(50)
);

CREATE TABLE input(
idInput INT primary KEY auto_increment,
tipo_carne VARCHAR(50),
temperatura DECIMAL (5,2),
umidade DECIMAL (5,2)
);

INSERT INTO empresa (nome, cnpj) VALUE 
('DeBetti', '12740141000120');

SELECT * FROM empresa;

INSERT INTO cliente (usuario, empresa) VALUE
('Pedro', 'DeBetti');

SELECT * FROM cliente;

INSERT INTO input (tipo_carne, temperatura) VALUE
('costela', 2.0);

SELECT * FROM input;

ALTER TABLE empresa ADD COLUMN contato VARCHAR(80);

SELECT 
CASE
	WHEN temperatura < 0 THEN 'Temperatura abaixo do normal!'
    WHEN temperatura > 5 THEN 'Temperatura acima do normal!'
		ELSE 'Temperatura normal'
	END FROM input;

