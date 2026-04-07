CREATE DATABASE safeControlYGP;
USE safeControlYGP;

CREATE TABLE empresa (
    idEmpresa INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL
);



CREATE TABLE usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cnpjEmpresa VARCHAR(18)
);

CREATE TABLE leituraSensor (
    idSensor INT AUTO_INCREMENT PRIMARY KEY,
    temperatura DECIMAL(5,2),
    umidade DECIMAL(5,2),
    momentoRegistro DATETIME DEFAULT CURRENT_TIMESTAMP()
    );



-- ADICIONAR COLUNA TELEFONE NA TABELA EMPRESA
ALTER TABLE empresa ADD COLUMN telefone VARCHAR(15);


-- INSERINDO EMPRESA
INSERT INTO empresa (razaoSocial, cnpj, telefone) 
VALUES ('Adamantina', '23.143.300/0001-25', '(11) 9999-9999');

-- INSERINDO USUARIO
INSERT INTO usuario (nome, cnpjEmpresa) 
VALUES ('Yuri Garcia', '23.143.300/0001-25');

-- INSERTS DE DADOS 
INSERT INTO leituraSensor (temperatura, umidade) VALUES
(20.5, 60.0),
(25.5, 62.0),
(45.5, 55.0);

SELECT * FROM leituraSensor;