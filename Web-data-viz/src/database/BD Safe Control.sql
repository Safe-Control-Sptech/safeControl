CREATE DATABASE safeControl;
USE safeControl;

CREATE TABLE empresa( 
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(100),
nomeFantasia VARCHAR(100),
apelido VARCHAR(60),
cnpj CHAR(14) NOT NULL UNIQUE,
codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(60) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(40) NOT NULL UNIQUE,
senha VARCHAR(30) NOT NULL,
telefone CHAR(11) NOT NULL,
fkEmpresa INT,
CONSTRAINT fkUsuarioEmpresa 
	FOREIGN KEY (fkEmpresa) 	
		REFERENCES empresa(idEmpresa)
);

CREATE TABLE statusSensor(
idStatus INT PRIMARY KEY AUTO_INCREMENT,
descricao varchar(100)
);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
codigoRastreio VARCHAR(20) NOT NULL UNIQUE,
fkStatus INT, 
CONSTRAINT fkSensorStatus
	FOREIGN KEY (fkStatus) 
		REFERENCES statusSensor(idStatus)
);

CREATE TABLE unidadeMedida(
idUnidade INT PRIMARY KEY,
simbolo CHAR (2) 
);

CREATE TABLE captura(
idCaptura INT AUTO_INCREMENT,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2),
dtCaptura DATETIME DEFAULT CURRENT_TIMESTAMP,
fkSensor INT NOT NULL,
fkUnidadeTemp INT,
fkUnidadeUmi INT,
PRIMARY KEY (idCaptura, fkSensor),
CONSTRAINT fkCapturaSensor
    FOREIGN KEY (fkSensor)
    REFERENCES sensor(idSensor),
CONSTRAINT fkCapturaUnidadeTemp
    FOREIGN KEY (fkUnidadeTemp)
    REFERENCES unidadeMedida(idUnidade),
CONSTRAINT fkCapturaUnidadeUmi
    FOREIGN KEY (fkUnidadeUmi)
    REFERENCES unidadeMedida(idUnidade)
);

CREATE TABLE endereco(
idEndereco INT,
cep CHAR(8) NOT NULL,
endereco VARCHAR(100) NOT NULL,
numero INT NOT NULL,
complemento VARCHAR(20), 
cidade VARCHAR (30) NOT NULL, 
UF CHAR (2) NOT NULL,
fkEmpresa INT UNIQUE,
CONSTRAINT fkEnderecoEmpresa
	FOREIGN KEY (fkEmpresa) 
		REFERENCES empresa(idEmpresa),
PRIMARY KEY (fkEmpresa,idEndereco)
);

CREATE TABLE transporte(
idTransporte INT,
placa VARCHAR(10),
motorista VARCHAR(60),
origem VARCHAR(60),
destino VARCHAR(60),
dtSaida DATETIME,
dtChegada DATETIME,
fkEmpresa INT,
CONSTRAINT fkTransporteEmpresa
	FOREIGN KEY (fkEmpresa)
		REFERENCES empresa(idEmpresa),
PRIMARY KEY (idTransporte, fkEmpresa),
fkSensor INT, 
CONSTRAINT fkTransporteSensor
	FOREIGN KEY (fkSensor)
		REFERENCES sensor(idSensor)
);

INSERT INTO empresa (razaoSocial, nomeFantasia, apelido, cnpj, codigo_ativacao) VALUES
('JBS S.A.', 'JBS', 'JBS', '12345678000101', 'KW52Q'),
('Seara Alimentos Ltda', 'Seara', 'Seara', '12345678000102', 'ACY22'),
('Marfrig Global Foods S.A.', 'Marfrig', 'Marfrig', '12345678000103', 'QW269B'),
('Minerva S.A.', 'Minerva Foods', 'Minerva', '12345678000104', 'T36NS'),
('BRF S.A.', 'BRF', 'BRF', '12345678000105', 'R5T3Z'),
('Frigol S.A.', 'Frigol', 'Frigol', '12345678000106', '4WG63'),
('Frisa Frigorífico Rio Doce S.A.', 'Frisa', 'Frisa', '12345678000107', 'SE8WE');

INSERT INTO usuario (idUsuario, nome, cpf, email, senha, telefone, fkEmpresa) VALUES
(1, 'Arthur Balduino', '11111111101', 'arthur@email.com', '123', '11911111111', 1),
(2, 'Bruna Martins', '11111111102', 'bruna@email.com', '123', '11922222222', 2),
(3, 'Gabryel Moura', '11111111103', 'gabryel@email.com', '123', '11933333333',  3),
(4, 'Leonardo Galfaro', '11111111104', 'leonardo@email.com', '123', '11944444444', 4),
(5, 'Luiz Neto', '11111111105', 'luiz@email.com', '123', '11955555555', 5),
(6, 'Marcela Fachim', '11111111106', 'marcela@email.com', '123', '11966666666',6),
(7, 'Pedro Henrique', '11111111107', 'pedro@email.com', '123', '11977777777', 7);

INSERT INTO statusSensor (descricao) VALUES
('Inoperante'),
('Operante'),
('Manutenção');

INSERT INTO sensor (codigoRastreio, fkStatus) VALUES
('SEN001', 1),
('SEN002', 2);

INSERT INTO unidadeMedida (idUnidade, simbolo) VALUES
(1, '°C'),
(2, '%');

INSERT INTO captura (temperatura,umidade,dtCaptura,fkSensor,fkUnidadeTemp,fkUnidadeUmi) VALUES
(2.1,88.5,'2026-06-08 18:00:00',1,1,2),
(1.8,90.2,'2026-06-08 18:05:00',1,1,2),
(2.5,87.9,'2026-06-08 18:10:00',1,1,2),
(3.0,91.4,'2026-06-08 18:15:00',1,1,2),
(1.6,89.1,'2026-06-08 18:20:00',1,1,2),
(2.8,92.0,'2026-06-08 18:25:00',1,1,2),
(3.3,86.7,'2026-06-08 18:30:00',1,1,2),
(2.0,90.8,'2026-06-08 18:35:00',1,1,2),
(1.4,93.2,'2026-06-08 18:40:00',1,1,2),
(2.7,88.9,'2026-06-08 18:45:00',1,1,2),
(3.1,91.6,'2026-06-08 18:50:00',1,1,2),
(2.3,89.7,'2026-06-08 18:55:00',1,1,2),
(1.9,92.4,'2026-06-08 19:00:00',1,1,2),
(2.6,87.3,'2026-06-08 19:05:00',1,1,2),
(3.4,90.5,'2026-06-08 19:10:00',1,1,2),
(2.2,88.1,'2026-06-08 19:15:00',1,1,2),
(1.7,93.0,'2026-06-08 19:20:00',1,1,2),
(2.9,89.4,'2026-06-08 19:25:00',1,1,2),
(3.2,91.1,'2026-06-08 19:30:00',1,1,2),
(2.4,87.8,'2026-06-08 19:35:00',1,1,2),
(null, null, '2026-06-08 19:35:00', 2, 1, 2);


INSERT INTO endereco (idEndereco, cep, endereco, numero, complemento, cidade, UF, fkEmpresa) VALUES
(1, '11000000', 'Rua A', 100, NULL, 'Santos', 'SP', 1),
(1, '12000000', 'Rua B', 200, 'Sala 2', 'São Paulo', 'SP', 2),
(1, '13000000', 'Rua C', 300, NULL, 'Campinas', 'SP', 3),
(1, '14000000', 'Rua D', 400, 'Bloco A', 'Sorocaba', 'SP', 4),
(1, '15000000', 'Rua E', 500, NULL, 'Ribeirão Preto', 'SP', 5),
(1, '16000000', 'Rua F', 600, NULL, 'Bauru', 'SP', 6),
(1, '17000000', 'Rua G', 700, 'Casa', 'São José', 'SP', 7);

INSERT INTO transporte (idTransporte, placa, motorista, origem, destino, dtSaida, dtChegada, fkEmpresa, fkSensor) VALUES
(1, 'AAA1A11', 'Motorista 1', 'Santos', 'SP', '2026-04-17 08:00:00', '2026-04-17 10:00:00', 1, 1),
(2, 'BBB2B22', 'Motorista 2', 'SP', 'Campinas', '2026-04-17 09:00:00', '2026-04-17 11:00:00', 2, 2);


CREATE VIEW vw_dados_sensor AS
SELECT
    e.idEmpresa,
    e.razaoSocial,

    t.idTransporte,
    t.placa,
    t.origem,
    t.destino,

    s.idSensor,
    s.codigoRastreio,

    st.idStatus,
    st.descricao AS statusSensor,

    c.idCaptura,
    c.temperatura,
    c.umidade,
    c.dtCaptura

FROM empresa e
JOIN transporte t
    ON t.fkEmpresa = e.idEmpresa
JOIN sensor s
    ON s.idSensor = t.fkSensor
JOIN statusSensor st
    ON st.idStatus = s.fkStatus
JOIN captura c
    ON c.fkSensor = s.idSensor;



CREATE VIEW vw_medias_sensor AS
SELECT
    s.idSensor,
    AVG(c.temperatura) AS mediaTemperatura,
    AVG(c.umidade) AS mediaUmidade
FROM sensor s
JOIN captura c
    ON c.fkSensor = s.idSensor
GROUP BY s.idSensor;
    