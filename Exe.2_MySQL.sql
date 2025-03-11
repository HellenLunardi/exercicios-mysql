create database duplicata;
use duplicata;

create table contas (
nome char(40),
numero integer not null, 
valor decimal(10,2),
vencimento date,
banco char(10),
primary key (numero)
);

alter table contas modify column banco varchar(40);

insert into contas values 
('abc papelaria', '100100', '5000.00', '2017-01-20', 'itau'),
('livraria fernandes', '100110', '2500.00', '2017-01-22', 'itau'),
('livraria fernandes', '100120', '1500.00', '2016-10-15', 'bradesco'),
('abc papelaria', '100130', '8000.00', '2016-10-15', 'santander'),
('ler e saber', '200120', '10500.00', '2018-04-26', 'banco do brasil'),
('livros e cia', '200125', '2000.00', '2018-04-26', 'banco do brasil'),
('ler e saber', '200130', '1100.00', '2018-09-26', 'itau'),
('papelaria silva', '250350', '1500.00', '2018-01-26', 'bradesco'),
('livros mm', '250360', '500.00', '2018-12-18', 'santander'),
('livros mm', '250370', '3400.00', '2018-04-26', 'santander'),
('papelaria silva', '250380', '3500.00', '2018-04-26', 'banco do brasil'),
('livros e cia', '453360', '1500.00', '2018-06-15', 'itau'),
('livros mm', '453365', '5400.00', '2018-06-15', 'bradesco'),
('papelaria silva', '453370', '2350.00', '2017-12-27', 'itau'),
('livros e cia', '453380', '1550.00', '2017-12-27', 'banco do brasil'),
('abc papelaria', '980130', '4000.00', '2016-12-11', 'itau'),
('livraria fernandes', '770710', '2500.00', '2016-11-15', 'santander'),
('abc papelaria', '985001', '3000.00', '2016-09-11', 'itau'),
('papel e afins', '985002', '2500.00', '2016-03-12', 'santander'),
('ler e saber', '888132', '2500.00', '2017-03-05', 'itau');

select * from contas;
select numero, nome, banco from contas where banco = 'itau';
select count(*) from contas where banco ='itau';

select numero, vencimento, valor, nome from contas 
where vencimento >= '2017-01-01';

select numero, vencimento, valor, nome, banco from contas where banco != 'itau' and banco != 'santander';

select sum(valor) as total_papelaria_silva from contas where nome = 'papelaria silva';
select * from contas where nome = 'papelaria silva';

delete from `duplicata`.`contas` where (`numero` = '770710');
select * from contas;

select * from contas 
order by nome;

select nome, banco, valor , vencimento from contas
order by vencimento;

update contas set banco = 'santander' 
where banco = 'banco do brasil';
select * from contas;

select * from contas where banco = 'bradesco';

select sum(valor) from contas 
where vencimento between '2016-01-01' and '2016-12-31';

select sum(valor) from contas 
where vencimento between '2016-08-01' and '2016-08-30';

select nome, sum(valor) as valor_vencido, datediff(curdate(), vencimento) as qtde_dias_vencido, 
vencimento, sum(valor * 1.5) as valor_com_multa from contas 
where year(vencimento) = '2016' and datediff(curdate(), vencimento) > 0
group by vencimento;

select nome, concat('R$', format(sum(valor),2)) as valor_vencido, date_format(vencimento, '%d-%m-&Y') as vencimento, 
datediff(curdate(), vencimento) as Qtde_dias_vencidos, format((valor * 1.05),2) as Valor_com_multa from contas 
where nome = 'ler e saber' and vencimento between '2017-01-01' and '2017-05-31' and datediff(curdate(), vencimento) > 0
group by date_format(vencimento, '%d-%m-%Y');

select concat('R$', format(avg(valor), 2)) as media_valores from contas where vencimento between '2016-01-01' and '2016-12-31';

select nome, numero, concat('R$', format(valor, 2)) as valor, date_format(vencimento, '%d/%m/%Y') as vencimento, banco
from contas 
where valor > 10000;

select concat('R$', format(sum(valor), 2)) as valor_total from contas where banco = 'santander'
group by banco;

select * from contas where banco = 'bradesco' or banco = 'itau';












