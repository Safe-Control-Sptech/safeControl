CREATE DATABASE safeControl;
USE safeControl;
-- DHT11

CREATE TABLE representante(
idRepresentante INT PRIMARY KEY auto_increment,
nome VARCHAR(60) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(40) NOT NULL UNIQUE,
senha VARCHAR(30) NOT NULL,
telefone CHAR(11) NOT NULL,
dataRegistro DATETIME DEFAULT current_timestamp
);
SELECT * FROM representante;

CREATE TABLE empresa( 
idEmpresa INT PRIMARY KEY auto_increment,
nome VARCHAR(60) NOT NULL,
cnpj CHAR(14) NOT NULL UNIQUE,
cep CHAR(8) NOT NULL,
endereco VARCHAR(100) NOT NULL,
numero INT NOT NULL,
complemento VARCHAR(20), 
cidade VARCHAR (30) NOT NULL, 
UF CHAR (2) NOT NULL,
dataRegistro DATETIME DEFAULT current_timestamp,
fkRepresentante INT,
CONSTRAINT fkEmpresaRepresentante
    FOREIGN KEY (fkRepresentante)
    REFERENCES representante(idRepresentante)
);

SELECT * FROM empresa;


CREATE TABLE sensor(
idSensor INT PRIMARY KEY auto_increment,
codigoRastreio VARCHAR(20) NOT NULL UNIQUE,
statusSensor VARCHAR(10) NOT NULL,
CONSTRAINT chkStatusSensor 
	CHECK (statusSensor IN ('Operando','Inoperando')),
fkEmpresa INT,
CONSTRAINT fkSensorEmpresa
	FOREIGN KEY (fkEmpresa)
    REFERENCES empresa(idEmpresa)
);

SELECT * FROM sensor;



CREATE TABLE transporte(
idTransporte INT PRIMARY KEY auto_increment,
placa VARCHAR(10),
motorista VARCHAR(60),
origem VARCHAR(60),
destino VARCHAR(60),
dtSaida DATETIME,
dtChegada DATETIME
);


SELECT * FROM transporte;

CREATE TABLE registroSensor(
idRegistro INT PRIMARY KEY auto_increment,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2),
dataRegistro DATETIME DEFAULT current_timestamp,
fkSensor INT,
CONSTRAINT fkRegistroSensorSensor
    FOREIGN KEY (fkSensor)
    REFERENCES sensor(idSensor),
fkTransporte INT,
CONSTRAINT fkRegistroSensorTransporte
	FOREIGN KEY (fkTransporte)
	REFERENCES transporte(idTransporte)
);


SELECT * FROM registroSensor;

INSERT INTO representante (nome, cpf, email, senha, telefone) VALUES
('Arthur Balduino', '66666666666', 'arthur@gmail.com', 'er$&EED856', '11943210987'),
('Bruna Marcelino', '22222222222', 'bruna@gmail.com', 'SVhder458**', '11987654321'),
('Gabryel Moura', '33333333333', 'gabryel@gmail.com', 'fg&00#465', '11976543210'),
('Leonardo Galfaro', '77777777777', 'leonardo@gmail.com', '3Khe*975fg', '11932109876'),
('Luiz Joaquim Neto', '55555555555', 'luiz@gmail.com', 'twe3p5585%&', '11954321098'),
('Marcela Fachim', '11111111111', 'marcela27@gmail.com', 'Klw2548fr62*%$', '11857567420'),
('Pedro Henrique dos Santos', '44444444444', 'pedro@gmail.com', 'Pedro@789', '11965432109');

INSERT INTO empresa (nome, cnpj, cep, endereco, numero, complemento, cidade, UF, fkRepresentante) VALUES
('Frigorifico BoiBom', '12345678000101', '01001000', 'Rua das Carnes', 100, 'Galpão A', 'São Paulo', 'SP', 1),
('Carnes Premium Ltda', '12345678000102', '02002000', 'Av. Paulista', 200, NULL, 'São Paulo', 'SP', 2),
('FrigoSul', '12345678000103', '90010000', 'Rua Sul', 300, 'Sala 2', 'Porto Alegre', 'RS', 3),
('Bovino Forte', '12345678000104', '80010000', 'Rua Paraná', 400, NULL, 'Curitiba', 'PR', 4),
('Carne Nobre', '12345678000105', '70010000', 'Av. Central', 500, 'Bloco B', 'Brasília', 'DF', 5),
('Frigorifico Norte', '12345678000106', '69010000', 'Rua Amazônia', 600, NULL, 'Manaus', 'AM', 6),
('MegaCarnes', '12345678000107', '40010000', 'Rua Bahia', 700, 'Fundos', 'Salvador', 'BA', 7);

INSERT INTO sensor (codigoRastreio, statusSensor, fkEmpresa) VALUES
('SEN001', 'Operando', 1),
('SEN002', 'Operando', 2),
('SEN003', 'Inoperando', 3),
('SEN004', 'Operando', 4),
('SEN005', 'Operando', 5),
('SEN006', 'Inoperando', 6),
('SEN007', 'Operando', 7);

INSERT INTO transporte (placa, motorista, origem, destino, dtSaida, dtChegada) VALUES
('ABC1A23', 'João Silva', 'São Paulo', 'Rio de Janeiro', '2026-04-01 08:00:00', '2026-04-01 18:00:00'),
('DEF2B34', 'Carlos Souza', 'Curitiba', 'São Paulo', '2026-04-01 09:00:00', '2026-04-01 17:00:00'),
('GHI3C45', 'Marcos Lima', 'Porto Alegre', 'Florianópolis', '2026-04-01 07:30:00', '2026-04-01 12:00:00'),
('JKL4D56', 'Pedro Santos', 'Brasília', 'Goiânia', '2026-04-01 10:00:00', '2026-04-01 14:00:00'),
('MNO5E67', 'Lucas Alves', 'Salvador', 'Recife', '2026-04-01 06:00:00', '2026-04-01 16:00:00'),
('PQR6F78', 'Rafael Costa', 'Manaus', 'Belém', '2026-04-01 05:00:00', '2026-04-01 20:00:00'),
('STU7G89', 'Bruno Rocha', 'São Paulo', 'Campinas', '2026-04-01 11:00:00', '2026-04-01 13:00:00');








    


    
