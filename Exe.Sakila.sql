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

--- JOINs

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

--- SBD 02

select concat('R$ ', format(sum(amount), 2)) as soma_pagamentos, 
concat('R$ ', format(count(payment_id), 2)) as qtde_pagamento,
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
on f.film_id = fc.film_id
join category c
on c.category_id = fc.category_id
group by name;















