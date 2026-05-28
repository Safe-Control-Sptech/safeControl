create database desenvolvimento;

use desenvolvimento;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY auto_increment, -- ADD pk OK
nome VARCHAR(60) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(40) NOT NULL,
senha VARCHAR(30) NOT NULL,
telefone CHAR(11) NOT NULL,
fkEmpresa INT,
CONSTRAINT fkUsuarioEmpresa 
	FOREIGN KEY (fkEmpresa) 	
		REFERENCES empresa(id)
);

drop table usuario;


select * from usuario;

desc usuario;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');