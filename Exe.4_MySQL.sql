CREATE DATABASE exercício_quatro;
USE exercício_quatro;

create table Aluno (
ra varchar(6),
nome varchar(20),
nascimento date,
primary key (RA)
);

create table Curso (
codigo int not null auto_increment,
nome varchar(20),
ch int,
inicio date,
termino date,
primary key (codigo)
);

insert into aluno values 
('123456', 'Ana', '1972-01-10'),
('123457', 'Bianca', '1973-02-11'),
('123458', 'Carla', '1987-12-12'),
('123459', 'Danilo', '1990-10-02'),
('123450', 'Eliana', '1987-01-01');

insert into curso values 
(default, 'java', '360', '2007-12-01', '2008-10-10'),
(default, 'auto cad', '60', '2008-01-10', '2008-05-10'),
(default, 'php', '90', '2008-02-15', '2008-07-10'),
(default, 'redes', '60', '2008-01-20', '2008-03-20');

create table matricula (
curso int,
ra varchar(6),
dm date,
valor decimal(4,2)
);

alter table matricula
modify valor decimal(5,2);

insert into matricula values 
('1', '123456', '2007-09-10', '100.00'),
('3', '123456', '2007-10-01', '60.00'),
('1', '123457', '2007-09-01', '100.00'),
('2', '123458', '2008-01-011', '50.00'),
('2', '123459', '2007-07-20', '50.00'),
('1', '123450', '2007-08-10', '80.00');

update matricula 
set valor = '100.00'
where valor = '99.99'; 

-- EXERCICIO 1 
select a.ra, a.nome as aluno, c.nome as curso
from aluno a
join matricula m
on a.ra = m.ra
join curso c
on c.codigo = m.curso;

select a.ra, a.nome as aluno, c.nome as curso
from aluno a
join matricula m
on a.ra = m.ra
join curso c
on c.codigo = m.curso
order by c.nome;

-- EXERCICIO 2
select c.nome, count(m.ra) 
from curso c 
join matricula m 
on c.codigo = m.curso
group by c.nome;

select c.nome, count(m.curso) 
from curso c
left join matricula m
on c.codigo = m.curso
group by c.nome;

-- EXERCICIO 3
SELECT *
FROM curso c
JOIN matricula m
ON c.codigo = m.curso
JOIN aluno a
ON m.ra = a.ra;

SELECT c.nome AS curso, COUNT(a.nome) AS qtde_alunos
FROM (curso c
JOIN matricula m
ON c.codigo = m.curso
JOIN aluno a
ON m.ra = a.ra)
GROUP BY c.nome;

-- EXERCICIO 4
SELECT c.nome, COUNT(m.dm) 
FROM curso c 
LEFT JOIN matricula m
ON c.codigo = m.curso
GROUP BY c.nome;

-- EXERCICIO 5
SELECT c.nome, m.valor, concat('R$', FORMAT(sum(m.valor), 2)) AS valor_total
FROM curso c 
RIGHT JOIN matricula m
ON m.curso = c.codigo
GROUP BY c.nome;

-- EXERCICIO 6
SELECT c.nome, CONCAT('R$ ', FORMAT(SUM(m.Valor), 2)) AS valor_total_matriculas 
FROM curso c
JOIN matricula m
ON c.codigo = m.curso
GROUP BY c.nome;

SELECT CONCAT('R$ ', FORMAT(SUM(Valor), 2)) AS valor_total_matriculas FROM matricula;

-- EXERCICIO 7
SELECT concat('R$', FORMAT(AVG(valor), 2)) AS valor_medio
FROM matricula;

-- EXERCICIO 8
SELECT c.nome AS curso, CONCAT('R$ ', FORMAT(AVG(m.valor), 2)) AS valor_medio
FROM curso c 
JOIN matricula m 
ON c.codigo = m.curso
GROUP BY c.nome;

-- EXERCICIO 9
SELECT c.nome, COUNT(m.dm) AS qtde_matriculas FROM curso c 
JOIN matricula m
ON c.codigo = m.curso 
GROUP BY c.nome
HAVING COUNT(m.dm) >= 2; 

-- EXERCICIO 10
SELECT ch FROM curso
WHERE nome = 'auto cad';

SELECT nome FROM CURSO 
WHERE ch = (SELECT ch FROM 
curso WHERE nome = 'auto cad')
AND nome <> ' auto cad';

-- EXERCICIO 11
select month(nascimento) from aluno
where nome = 'Ana';

select nome from aluno
where month(nascimento) = (select month(nascimento) from aluno
where nome = 'Ana') and nome <> 'Ana';

-- EXERCICIO 12
SELECT curso.nome as curso, DATE_FORMAT(curso.inicio, '%m/%Y') AS inicio, COUNT(matricula.curso) AS qtde_matricula FROM curso
RIGHT JOIN matricula
ON curso.codigo = matricula.curso
WHERE DATE_FORMAT(curso.inicio, '%m/%Y') = '01/2008'
GROUP BY curso.nome; 

-- EXERCICIO 13
SELECT curso.nome as curso, DATE_FORMAT(curso.inicio, '%m/%Y') AS inicio, COUNT(matricula.curso) AS qtde_matricula FROM curso
LEFT JOIN matricula
ON curso.codigo = matricula.curso
WHERE DATE_FORMAT(curso.inicio, '%m/%Y') = '01/2008'
GROUP BY curso.nome; 

-- EXERCICIO 14
USE escola;
SELECT aluno.nome AS aluno, curso.nome AS curso, matricula.dm AS data_matricula, curso.inicio,
CASE 
	WHEN DATEDIFF(curso.inicio, matricula.dm) > 0 THEN 'sim'
    ELSE 'nao'
    END AS brinde
FROM (aluno
INNER JOIN matricula
ON aluno.ra = matricula.ra
INNER JOIN curso
ON matricula.curso = curso.codigo)
GROUP BY matricula.dm
HAVING DATEDIFF(curso.inicio, matricula.dm) > 0;

-- EXERCICIO 15
SELECT nome, inicio FROM curso
WHERE DATEDIFF(inicio, current_date()) > 0
GROUP BY nome;

-- EXERCICIO 16
SELECT a.nome, DAYOFWEEK(m.dm) AS 'Dia da semana' 
FROM aluno a 
JOIN matricula m
ON a.ra = m.ra
WHERE DAYOFWEEK(m.dm) = 7;

-- EXERCICIO 17
SELECT a.nome, m.dm,  m.valor - FORMAT(m.valor * 0.5, 2) AS valor_a_retribuir 
FROM matricula m 
JOIN aluno a
ON m.ra = a.ra
WHERE DAYOFWEEK(m.dm) = 7;

-- EXERCICIO 18 
SELECT nome, TIMESTAMPDIFF(YEAR, nascimento, CURRENT_DATE) AS idade 
FROM aluno
GROUP BY nome;

-- EXERCICIO 19
SELECT nome, PERIOD_DIFF(DATE_FORMAT(termino, '%Y%m'), DATE_FORMAT(inicio, '%Y%m')) AS duracao_curso 
FROM curso 
GROUP BY nome;





