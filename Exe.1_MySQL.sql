-- EXERCICIO 1
create database Vendas;

-- EXERCICIO 2
create table produtos (
codigo_produto int,
descricao_produto varchar(30),
preco_produto float,
primary key (codigo_produto) 
);

-- EXERCICIO 3
create table nota_fiscal (
numero_nf integer,
data_nf date,
valor_nf float,
primary key (numero_nf)
);

-- EXERCICIO 4
create table itens (
produto_codigo_produto integer,
nota_fical_numero_nf integer,
num_item integer,
qtde_item integer,
primary key (produto_codigo_produto)
);

-- EXERCICIO 5
alter table produtos modify descricao_produto varchar(50);

-- EXERCICIO 6
alter table itens change nota_fical_numero_nf nota_fiscal_numero_nf integer;

-- EXERCICIO 7
alter table nota_fiscal add column peso float after numero_nf;


alter table itens drop primary key;

-- EXERCICIO 8
alter table itens add primary key (num_item);

-- EXERCICIO 9
select * from produtos;

-- EXERCIO 10
select * from itens;

select * from nota_fiscal;

-- EXERCICIO 11
alter table nota_fiscal change valor_nf valortotal_nf float;

-- EXERCICIO 12
alter table nota_fiscal drop data_nf;

-- EXERCICIO 13
drop table itens;

-- EXERCICIO 14 
rename table nota_fiscal to vendas;
