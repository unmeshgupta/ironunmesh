-- Query 1: Which actor has appeared in the most films?
select  a.actor_id, first_name, count(film_id)
from sakila.actor a join sakila.film_actor f 
on a.actor_id = f.actor_id 
group by 1,2
order by count(film_id) desc
limit 1;

-- Query 2: Most active customer (the customer that has rented the most number of films)
select first_name, last_name, count(rental_id)
from sakila.customer c join sakila.rental r
on c.customer_id = r.customer_id
group by 1,2
order by count(rental_id) desc
limit 1;

-- Query 3: List number of films per category.
select name, count(film_id) 
from sakila.category c join sakila.film_category f
on c.category_id = f.category_id
group by 1;

-- Query 4: Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address
from sakila.address a join sakila.staff s 
on a.address_id = s.address_id;

-- Query 5: get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.

select f.title, l.name
from sakila.film f join sakila.language l
on f.language_id = l.language_id 
where l.name = 'English' or l.name = 'Italian' and f.title like 'M%'

-- Query 6: Display the total amount rung up by each staff member in August of 2005.
select s.first_name, s.last_name, sum(p.amount)
from sakila.staff s join sakila.payment p
on s.staff_id = p.staff_id
where payment_date like '2005-08%'
group by 1,2

-- Query 7: List each film and the number of actors who are listed for that film.
select f.title, count(actor_id)
from sakila.film f join sakila.film_actor fa
on f.film_id = fa.film_id
group by 1
order by count(actor_id) desc;

-- Query 8: Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select last_name, sum(amount)
from sakila.customer c join sakila.payment p
on c.customer_id = p.customer_id
group by 1
order by 1 ;

-- Query 9: Write sql statement to check if you can find any actor who never particiapted in any film.
select first_name
from sakila.actor a left join sakila.film_actor fa
on a.actor_id = fa.actor_id
where film_id is null;

-- Query 10: get the addresses that have NO customers, and ends with the letter "e"
select address
from sakila.address a left join sakila.customer c
on a.address_id = c.address_id 
where a.address like '%e' and c.customer_id is null ;

-- Query 11: what is the most rented film?
select f.title
from sakila.film f join sakila.inventory i
on f.film_id = i.film_id
right join sakila.rental r
on i.inventory_id = r.inventory_id
group by 1
order by count(r.rental_id) desc
limit 1;
