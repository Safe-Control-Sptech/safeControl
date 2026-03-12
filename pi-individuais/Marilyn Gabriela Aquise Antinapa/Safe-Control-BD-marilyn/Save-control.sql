CREATE DATABASE SafeControl;
USE SafeControl;

CREATE TABLE empresa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(100),
    cnpj VARCHAR(18) UNIQUE
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    id_empresa INT
);

CREATE TABLE leitura_sensor (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY, 
    temperatura DECIMAL(5,2),
    umidade DECIMAL(5,2),
    dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
    );
     
    CREATE TABLE carne(
    idCarne INT PRIMARY KEY AUTO_INCREMENT,
    tipoCarne VARCHAR(10),
    qntKg DECIMAL (10,2),
    dtCompra DATETIME DEFAULT CURRENT_TIMESTAMP,
    dtValidade DATE,
    CONSTRAINT chkCategoria CHECK (tipoCarne IN('bovino', 'suíno', 'pescado', 'aves'))
    );


-- ADICIONANDO UMA COLUNA 
ALTER TABLE empresa ADD COLUMN localizacao VARCHAR(100);


-- INSERINDO EMPRESA
INSERT INTO empresa (razaoSocial, cnpj, localizacao) 
VALUES ('Açougue Boi Gordo', '12.345.678/0001-90', 'Rua Marechal 180 - SP');

-- INSERINDO USUARIO
INSERT INTO usuario (nome, id_empresa) 
VALUES ('João Silva', 1);

-- INSERTS DE DADOS 
INSERT INTO leitura_sensor ( temperatura, umidade, dtRegistro) VALUES
( 2.5, 60.0,'2026-02-20 12:03:02' ),
( 7.5, 62.0, '2026-02-21 15:25:36'),
( 0.5, 55.0, '2026-02-22 06:35:58');

-- SELECIONANDO O LOCAL- TEMPO REGISTRAD- UMIDADE- E AVISO
SELECT 
    CONCAT('Sensor n° ', id_sensor, ' (', tipoCarne, ')') AS local_monitorado,
    temperatura AS temp_registrada,
    umidade AS umid_registrada,
    CASE 
        WHEN temperatura < 0 THEN 'Alerta: Risco de congelamento'
        WHEN temperatura > 5 THEN 'Alerta: Muito Quente (Perigo)'
        ELSE 'Temperatura Ideal'
    END AS aviso_sistema
    
FROM leitura_sensor,carne;

