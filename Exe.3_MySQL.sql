create database Longa_vida;
use longa_vida;

create table plano(
Numero char(2) not null,
Descrição char(30),
Valor decimal(10, 2), 
primary key(Numero)
);

insert into plano values 
('B1', 'Básico 1', '200.00'),
('B2', 'Básico 2', '150.00'),
('B3', 'Básico 3', '100.00'),
('E1', 'Executivo 1', '350.00'),
('E2', 'Executivo 2', '300.00'),
('E3', 'Executivo 3', '250.00'),
('M1', 'Master 1', '500.00'),
('M2', 'Master 2', '450.00'),
('M3', 'Master 3', '400.00');

select * from plano;

create table associado (
Plano char(2) not null,
Nome char(40) not null,
Endereço char(35),
Cidade char(20),
Estado char(2),
CEP char(9),
primary key (Nome)
);

ALTER TABLE ASSOCIADO MODIFY COLUMN NOME VARCHAR(50); 

desc associado;

insert into associado (Plano, Nome, Endereço, Cidade, Estado, CEP) values 
('B1', 'JOSE ANTONIO DA SILVA', 'R. FELIPE DO AMARAL, 3450', 'COTIA', 'SP', '06700-000'),
('B1', 'MARIA SA SILVA SOBRINHO', 'R. FELIPE DE JESUS, 1245', 'DIADEMA', 'SP', '09960-170'),
('B1', 'PEDRO JOSE DE OLIVEIRA', 'R. AGRIPINO DIAS, 155', 'COTIA', 'SP', '06700-011'),
('B2', 'ANTONIA DE FERNANDES', 'R. PE EZEQUIEL, 567', 'DIADEMA', 'SP', '09960-175'),
('B2', 'ANTONIO DO PRADO', 'R. INDIO TABAJARA, 55', 'GUARULHOS', 'SP', '07132-999'),
('B3', 'WILSON DE SENA', 'R. ARAPIRACA, 1234', 'OSASCO', 'SP', '06293-001');

insert into associado values
('B3', 'SILVIA DE ABREU', 'R. DR JOAO DA SILVA, 5', 'SANTO ANDRE', 'SP', '09172-112'),
('E1', 'ODETE DA CONCEICAO', 'R. VOLUNTARIOS DA PATRIA, 10', 'SAO PAULO', 'SP', '02010-550'),
('E2', 'JOAO CARLOS MACEDO', 'R. VISTA ALEGRE, 500', 'SAO PAULO', 'SP', '04343-990'),
('E3', 'CONCEICAO DA SILVA', 'AV. VITORIO DO AMPARO, 11', 'MAUA', 'SP', '09312-988'),
('E3', 'PAULO BRUNO AMARAL', 'R. ARGENZIO BRILHANTE, 88', 'BARUERI', 'SP', '06460-999'),
('E3', 'WALDENICE DE OLIVEIRA', 'R. OURO VELHO, 12', 'BARUERI', 'SP', '06460-998'),
('E3', 'MARCOS DO AMARAL', 'R. DO OUVIDOR, 67', 'GUARULHOS', 'SP', '07031-555'),
('M1', 'MURILO DE SANTANA', 'R. PRATA DA CASA', 'BARUERI', 'SP', '06455-111'),
('M1', 'LUIZA ONOFRE FREITAS', 'R. VICENTE DE ABREU, 55', 'SANTO ANDRE', 'SP', '09060-667'),
('M2', 'MELISSA DE ALMEIDA', 'R. FERNANDO ANTONIO, 2345', 'SAO PAULO', 'SP', '04842-987'),
('M2', 'JOAO INACIO DA CONCEICAO', 'R. PENELOPE CHARMOSA, 34', 'SUZANO', 'SP', '08670-888'),
('B3', 'AUGUSTA DE ABREU', 'AV. RIO DA SERRA, 909', 'SANTO ANDRE', 'SP', '09061-333'),
('M3', 'ILDA DE MELO DA CUNHA', 'AV. POR DO SOL, 546', 'SANTO ANDRE', 'SP', '09199-444'),
('M3', 'MARCOS DA CUNHA', 'AV. PEDROSO DE MORAES', 'SAO PAULO', 'SP', '04040-444');

SELECT * FROM associado;

select * from plano inner join associado 
on associado.Plano = plano.Numero;

select count(*) from associado where Plano = 'B1';

select associado.Nome, associado.Plano, concat('R$', format(plano.Valor, 2)) as valor from associado 
left join plano on associado.Plano = plano.Numero; 

use longa_vida;

select * from associado 
where cidade = 'COTIA' 
or cidade = 'DIADEMA';

select a.nome, a.plano, concat('R$', format(p.valor, 2)) 
from associado a
left join plano p 
on a.Plano = p.Numero
where a.cidade = 'sao paulo';

select *
from associado a
left join plano p 
on a.plano = p.numero
where nome like '%SILVA%';

use longa_vida;

Update plano 
set valor = (valor * 1.10) 
where Numero like 'B%';

update plano
set valor = (valor * 1.05)
where Numero like 'E%';

update plano
set valor = (valor * 1.03)
where Numero like 'M%';

update associado
set Plano = 'E3'
where NOME = 'PEDRO JOSE DE OLIVEIRA';

SELECT * FROM associado a
JOIN plano p
on a.Plano = p.Numero;

SELECT COUNT(Nome) as qtde_e3
from associado
where Plano = 'E3';

select a.nome, p.valor 
from associado a
join plano p 
on a.Plano = p.Numero 
where (a.Plano = 'B1' or a.Plano = 'E1' or a.Plano = 'M1'); 

select * from associado
where plano like 'E%';

select * from associado
where not plano like 'E%'; 

delete from associado 
where cidade = 'SANTO ANDRE';

SELECT * 
FROM associado a
join plano p
on a.Plano = p.Numero
order by a.nome;

select a.nome, a.plano, p.valor
from associado a
join plano p
on a.Plano = p.Numero
where (a.cidade = 'SAO PAULO' and  a.Plano = 'M2' or a.Plano = 'M3')
order by a.nome;

select * from associado a
join plano p 
on a.Plano = p.Numero 
order by a.plano;

select *
from associado a 
join plano p
on a.Plano = p.Numero
order by a.Plano asc, a.nome desc;

select * 
from associado a 
join plano p 
on a.Plano = p.Numero
where not plano like 'M%';

select a.nome, p.descrição 
from associado a
join plano p
on a.Plano = p.Numero
order by a.nome asc;

select a.plano, a.nome, concat('R$', format(p.valor, 2)) as valor
from associado a
join plano p
on a.Plano = p.Numero 
where valor between '300' and '500';

select a.nome, a.plano, p.descrição, p.valor
from associado a
join plano p
on a.Plano = p.Numero
where nome like '%AMARAL%';

select * from associado
where cidade = 'DIADEMA';

update plano
set valor = valor * 1.06
where Numero like 'M%';

select * from associado
where CEP like '09%';






