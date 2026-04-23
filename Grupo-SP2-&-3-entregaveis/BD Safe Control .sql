CREATE DATABASE safeControl;
USE safeControl;

CREATE TABLE empresa( 
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(100),
nomeFantasia VARCHAR(100),
apelido VARCHAR(60),
cnpj CHAR(14) NOT NULL UNIQUE
);

CREATE TABLE cargo(
idCargo INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(45)
);

CREATE TABLE usuario(
idUsuario INT,
nome VARCHAR(60) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(40) NOT NULL UNIQUE,
senha VARCHAR(30) NOT NULL,
telefone CHAR(11) NOT NULL,
fkCargo INT , 
CONSTRAINT fkUsuarioCargo 	
	FOREIGN KEY (fkCargo) 
		REFERENCES cargo(idCargo),
PRIMARY KEY (idUsuario,fkCargo), 
fkEmpresa INT,
CONSTRAINT fkUsuarioEmpresa 
	FOREIGN KEY (fkEmpresa) 	
		REFERENCES empresa(idEmpresa)
);

CREATE TABLE statusSensor(
idStatus INT PRIMARY KEY AUTO_INCREMENT,
numeroStatus CHAR(1)
);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
codigoRastreio VARCHAR(20) NOT NULL UNIQUE,
fkStatus INT, 
CONSTRAINT fkSensorStatus
	FOREIGN KEY  (fkStatus) 
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
fkSensor INT NOT NULL,
fkUnidadeTemp INT,
fkUnidadeUmi INT,
PRIMARY KEY  (idCaptura, fkSensor),
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
fkEmpresa INT,
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

INSERT INTO empresa (razaoSocial, nomeFantasia, apelido, cnpj) VALUES
('JBS S.A.', 'JBS', 'JBS', '12345678000101'),
('Seara Alimentos Ltda', 'Seara', 'Seara', '12345678000102'),
('Marfrig Global Foods S.A.', 'Marfrig', 'Marfrig', '12345678000103'),
('Minerva S.A.', 'Minerva Foods', 'Minerva', '12345678000104'),
('BRF S.A.', 'BRF', 'BRF', '12345678000105'),
('Frigol S.A.', 'Frigol', 'Frigol', '12345678000106'),
('Frisa Frigorífico Rio Doce S.A.', 'Frisa', 'Frisa', '12345678000107');

INSERT INTO cargo (nome) VALUES
('Administrador'),
('Analista'),
('Motorista'),
('Supervisor'),
('Gerente'),
('Técnico'),
('Operador');

INSERT INTO usuario (idUsuario, nome, cpf, email, senha, telefone, fkCargo, fkEmpresa) VALUES
(1, 'Arthur Balduino', '11111111101', 'arthur@email.com', '123', '11911111111', 1, 1),
(2, 'Bruna Martins', '11111111102', 'bruna@email.com', '123', '11922222222', 2, 2),
(3, 'Gabryel Moura', '11111111103', 'gabryel@email.com', '123', '11933333333', 3, 3),
(4, 'Leonardo Galfaro', '11111111104', 'leonardo@email.com', '123', '11944444444', 4, 4),
(5, 'Luiz Neto', '11111111105', 'luiz@email.com', '123', '11955555555', 5, 5),
(6, 'Marcela Fachim', '11111111106', 'marcela@email.com', '123', '11966666666', 6, 6),
(7, 'Pedro Henrique', '11111111107', 'pedro@email.com', '123', '11977777777', 7, 7);

INSERT INTO statusSensor (numeroStatus) VALUES
('0'),
('1'),
('1'),
('1'),
('2'),
('1'),
('1');

INSERT INTO sensor (codigoRastreio, fkStatus) VALUES
('SEN001', 1),
('SEN002', 2),
('SEN003', 3),
('SEN004', 4),
('SEN005', 5),
('SEN006', 6),
('SEN007', 7);

INSERT INTO unidadeMedida (idUnidade, simbolo) VALUES
(1, '°C'),
(2, '%');

INSERT INTO captura (idCaptura, temperatura, fkUnidadeTemp, umidade, fkUnidadeUmi, fkSensor) VALUES
(1, null, 1, null, 2, 1),
(2, -16.50, 1, 55.00, 2, 2),
(3, 0.00, 1, 65.00, 2, 3),
(4, 4.50, 1, 70.00, 2, 4),
(5, null, 1, null, 2, 5),
(6, -18.00, 1, 50.00, 2, 6),
(7, 2.00, 1, 45.00, 2, 7);


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
(2, 'BBB2B22', 'Motorista 2', 'SP', 'Campinas', '2026-04-17 09:00:00', '2026-04-17 11:00:00', 2, 2),
(3, 'CCC3C33', 'Motorista 3', 'Campinas', 'Santos', '2026-04-17 10:00:00', '2026-04-17 12:00:00', 3, 3),
(4, 'DDD4D44', 'Motorista 4', 'RJ', 'SP', '2026-04-17 11:00:00', '2026-04-17 15:00:00', 4, 4),
(5, 'EEE5E55', 'Motorista 5', 'MG', 'SP', '2026-04-17 12:00:00', '2026-04-17 16:00:00', 5, 5),
(6, 'FFF6F66', 'Motorista 6', 'PR', 'SP', '2026-04-17 13:00:00', '2026-04-17 17:00:00', 6, 6),
(7, 'GGG7G77', 'Motorista 7', 'SC', 'SP', '2026-04-17 14:00:00', '2026-04-17 18:00:00', 7, 7);


SELECT t.fkEmpresa , t.placa, t.origem,
 t.destino, e.nomeFantasia as empresa
 FROM transporte as t JOIN empresa as e
	ON t.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1;

SELECT e.nomeFantasia as empresa ,
 u.nome as funcionario, c.nome as cargo
	FROM usuario as u JOIN empresa as e ON u.fkEmpresa = e.idEmpresa
		JOIN cargo as c ON u.fkCargo = c.idCargo;
        
SELECT t.idTransporte AS caminhao, 
	t.placa,
    e.nomeFantasia AS empresa,
    IFNULL(c.temperatura, 'Sem registro') AS temperatura,
    ut.simbolo AS unidade_temperatura, 
    IFNULL(c.umidade, 'Sem registro') AS umidade,
    uu.simbolo AS unidade_umidade,
    CASE ss.numeroStatus
        WHEN '0' THEN 'Inoperante'
        WHEN '1' THEN 'Operando'
        ELSE 'Manutenção'
    END AS status
FROM transporte t 
JOIN empresa e ON t.fkEmpresa = e.idEmpresa
JOIN sensor s ON t.fkSensor = s.idSensor
JOIN statusSensor ss ON s.fkStatus = ss.idStatus
JOIN captura c ON c.fkSensor = s.idSensor
JOIN unidadeMedida ut ON c.fkUnidadeTemp = ut.idUnidade
JOIN unidadeMedida uu ON c.fkUnidadeUmi = uu.idUnidade;

	
    