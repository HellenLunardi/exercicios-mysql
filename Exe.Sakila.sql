select title, length from film 
where length = 126 
order by title desc;

select rental_duration, rental_duration + 5 as promocao_cinco_dias 
from film;

select title as "título do filme", description as descrição from film;

select distinct country_id from city
order by country_id;

select customer_id, first_name as cliente_inativo 
from customer 
where active = 0;

select title, description from film 
where description like('%drama%')
order by title desc;

select * from customer 
where last_name regexp("son$");

select * from film
order by length desc 
limit 5;

select * from film 
order by rental_duration asc
limit 3;

-- JOINs

select c.first_name, c.last_name, a.address, a.district 
from customer as c
join address as a
on c.address_id = a.address_id;

select a.address, c.city from address as a
join city as c
on c.city_id = a.city_id;

select f.film_id, f.title, c.category_id, c.name
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.film_id = c.category_id;

select f.title, a.first_name, a.last_name 
from film f
join film_actor fa
using(film_id)
join actor a
using(actor_id);

-- SBD 02

select concat('R$ ', format(sum(amount), 2)) as soma_pagamentos, 
format(count(payment_id), 2) as qtde_pagamento,
concat('R$ ', format(avg(amount), 2)) as media_pagamento
from payment;

select count(city_id) as qtde_cidades, c.country as paises 
from city
join country c
using(country_id)
group by country; 

select count(f.film_id), c.name
from film f
join film_category fc
using(film_id)
join category c
using(category_id)
group by (c.name);

-- subquery

use sakila;

select title, length 
from film 
where 
	length = (select max(length) from film);


select title, rental_duration 
from film
where 
	rental_duration > (select avg(rental_duration) from film); 

-- stored procedure sem argumento

delimiter //
create procedure select_all_active_users ()
begin
	select * from customer
    where active = 1;
end//
delimiter ;

call select_all_active_users()

-- procedure com argumento

delimiter //
create procedure get_movies_from_category (category_name varchar(100))
begin
	select f.title, c.name  
    from film f
    join film_category fc
    using(film_id)
    join category c
    using(category_id)
    where c.name = category_name;
end//
delimiter ;

call get_movies_from_category("action");

drop procedure if exists get_movies_from_category;

DELIMITER //
CREATE PROCEDURE get_films_rental_duration (rental_maior INT)
BEGIN 
	select title, rental_duration
    from film
    where rental_duration >= rental_maior;
END//
DELIMITER ;

call get_films_rental_duration("6");

drop procedure if exists get_films_rental_duration;

-- Triggers

use sakila;

create trigger before_update_customer
	before update on customer
    for each row
    set new.last_update = NOW();
    
update customer
set first_name = "JOAQUIM"
where customer_id = 2;

select * from customer;

-- VIEWS

create view film_and_category
as
select f.film_id, f.title, c.name
from film f
join film_category fc
using(film_id)
join category c
using(category_id);

select * from film_and_category;
-- where name = 'Action';

create view customer_information as
select c.first_name, c.last_name, a.address, a.district
from customer c 
join address a
using(address_id);

select * from customer_information;

create view customer_info as
select c.first_name, c.last_name, a.address, ct.city
from customer c
join address a
using(address_id)
join city ct
using(city_id);

select * from customer_info;

-- Indices   
use sakila;

show index from film;

explain select * from film
where title = 'CAUSE DATE';

create index idx_title 
on film(title);

drop index idx_title on film;










