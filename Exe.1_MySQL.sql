create database Vendas;

create table produtos (
codigo_produto int,
descricao_produto varchar(30),
preco_produto float,
primary key (codigo_produto) 
);

create table nota_fiscal (
numero_nf integer,
data_nf date,
valor_nf float,
primary key (numero_nf)
);

create table itens (
produto_codigo_produto integer,
nota_fical_numero_nf integer,
num_item integer,
qtde_item integer,
primary key (produto_codigo_produto)
);

alter table produtos modify descricao_produto varchar(50);

alter table itens change nota_fical_numero_nf nota_fiscal_numero_nf integer;

alter table nota_fiscal add column peso float after numero_nf;

alter table itens drop primary key;
alter table itens add primary key (num_item);

select * from produtos;
select * from itens;
select * from nota_fiscal;

alter table nota_fiscal change valor_nf valortotal_nf float;

alter table nota_fiscal drop data_nf;

drop table itens;

rename table nota_fiscal to vendas;
