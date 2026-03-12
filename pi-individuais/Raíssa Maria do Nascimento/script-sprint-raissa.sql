create database safeControl;
use safeControl;

create table cadastroEmpresa (
idEmpresa int primary key auto_increment,
cnpj char(18) not null unique,
razaoSocial varchar(100) not null,
apelido varchar (80),
emailEmpresarial varchar(80) not null unique,
endereco varchar(200) default 'Não informado',
cep char(9) not null
);

create table cadastroUsuario (
idUsuario int primary key auto_increment,
cpf char(11) not null unique,
nomeResponsavel varchar(100) not null,
emailUsuario varchar(80) not null,
telefone varchar(18) default 'Não informado'
);

create table carnes (
idMercadoria int primary key auto_increment,
nomeCarne varchar(50) not null,
categoriaCarne varchar(50) not null,
constraint chkCategoriaCarne check(CategoriaCarne in('pescado', 'bovina', 'suína', 'aves', 'congelados')),
tipoCarne varchar(100) default 'Não informado',
kgComprado decimal(8,2) not null,
tempMaxima int,
tempMinima int,
umidadeIdeal int,
dtCompra date not null,
dtValidade date default null
);

desc cadastroEmpresa;

insert into cadastroEmpresa (cnpj, razaoSocial, emailEmpresarial, endereco, cep) values
('02.548.784/0001-52', 'Max Boi Carnes Ltda', 'maxboicomercial@maxboi.com', default, '06901-100'),
('21.078.455/0001-01', 'Boi Nobre Carnes Ltda', 'contato@boinobre.com', 'Estrada Jardim Madalena, 395 - Centro', '06715-001'),
('12.210.667/0002-57', 'Casa do Boi Premium Ltda', 'comercial@casadoboi.com', 'Rua Avelino Gomes de Moraes, 5102 - Santa Efigênia', '06418-300'),
('51.637.883/0001-02', 'Rei do Corte Carnes Ltda', 'vendas@reidocorte.com.br', default, '09102-001'),
('67.351.224/0002-40', 'Frigorífico Sul Ltda', 'atendimento@frigoríficosul,com', 'Avenida Carlos Simões Louro Junior, 107', '06500-017'),
('11.639.127/0001-68', 'Casa do Boi Premium Ltda', 'atendimento@casadoboi.com', 'Avenida Deflim Verde, 618 - Itapecerica da Serra', '09141-003');

desc cadastroUsuario;

insert into cadastroUsuario (cpf, nomeResponsavel, emailUsuario, telefone) values
('15425454788', 'Carlos Eduardo Martins', 'carlos.martins_08@gmail.com', '(11) 97154-5411'),
('00154754789', 'Rodrigue Alves da Silva', 'rodrigo_silvaa@outlook.com', '(11) 91522-4158'),
('32548768874', 'Juliana Nunes Pereira', 'nunes.juliana@casadoboi.com', '(11) 94174-2527'),
('42315899578', 'Vinicius Borba da Rocha', 'viniciusborbarocha2501@gmail.com', '(11) 94331-7456'),
('15869945122', 'Patrícia Gomes de Moraes', 'pati.gomes@frigorificosul.com', '(11) 91657-5532'),
('25844659878', 'Camila Freire Rodrigues', 'camila_rodrigues@boinobre.com', '(11) 95321-7894');

desc carne;

insert into carnes (nomeCarne, categoriaCarne, tipoCarne, kgComprado, tempMaxima, tempMinima, umidadeIdeal, dtCompra, dtValidade) values
('Picanha', 'bovina', 'Corte premium', 25.50, 4, 0, 85, '2026-01-30', null),
('Alcatra', 'bovina', 'Corte traseiro', 32.75, 4, 0, 85, '2026-02-27', null),
('Miolo de Acém', 'bovina', default, 45.89, 4, 0, 83, '2025-10-31', '2025-11-26'),
('Peito de frango', 'aves', 'Sem osso', 39.77, 4, 0, 85, '2025-12-18', '2026-02-01'),
('Filé de tilápia', 'pescado', 'Filé', 20.00, 2, -2, 90, '2026-03-07', null),
('Hamburguer Congelado', 'congelados', 'Industrializado', 60.09, -2, -1, 75, '2026-03-07', null),
('Coxa e sobrecoxa', 'aves', 'Com osso', 47.50, 4, 0, 85, '2025-12-10', '2026-01-16'),
('Linguiça calabresa', 'suína', default, 67.80, 4, 0, 80, '2026-03-01', null);

select * from cadastroEmpresa;
update cadastroEmpresa set apelido = 'Matriz' where idEmpresa = 6;
update cadastroEmpresa set apelido = 'Filial' where idEmpresa = 3;
select cnpj, razaoSocial, ifnull(apelido, 'Não foi informado nenhum apelido') from cadastroEmpresa;

select concat('A empresa ', razaoSocial, ' possui o CNPJ ', cnpj) from cadastroEmpresa;
select * from cadastroEmpresa order by razaoSocial desc;
select * from cadastroEmpresa where apelido like '%';

select * from cadastroUsuario;
select * from cadastroUsuario where nomeResponsavel like '%a%';
select * from cadastroUsuario where telefone is null;
select concat(nomeResponsavel, ' é o responsável legal da empresa.') from cadastroUsuario;

select * from carnes;
select concat('A carne selecionada é ', nomeCarne, ' do tipo ', categoriaCarne, '.') as 'Informações sobre as mercadorias', ifnull(tipoCarne, 'Não foi informado') as 'Tipo de carne' from carnes;
select nomeCarne as 'Nome da carne', case
when categoriaCarne = 'bovina' then 'A carne selecionada é bovina.'
when categoriaCarne = 'pescado' then 'A carne selecionada é um peixes.'
when categoriaCarne = 'aves' then 'A carne selecionada é uma ave.'
else 'As carnes selecionadas são industrializados.'
end as 'Categoria das carnes' from carnes;
select * from carnes where dtCompra >= '2026-03-01';




