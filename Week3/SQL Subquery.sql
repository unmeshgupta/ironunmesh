-- Lab (Subqueries)
use sakila;
-- Query 1: List all films whose length is longer than the average of all the films.
 
select title from sakila.film where length(title) > (select avg(length(title)) from sakila.film); 

-- Query 2: How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) from sakila.inventory 
where film_id = (select film_id from sakila.film where title = 'Hunchback Impossible')

-- Query 3: Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from sakila.actor 
where actor_id in (select actor_id from sakila.film_actor where film_id = (select film_id from sakila.film where title = 'Alone Trip'))

-- Query 4: Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from sakila.film  
where film_id in (select film_id from sakila.film_category where category_id in (select category_id from sakila.category where name = 'Family'));
 
 
-- Query 5: Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select first_name, last_name, email from sakila.customer where address_id in (select address_id from sakila.address where city_id in
                                                                                        (select city_id from sakila.city where country_id = (select country_id from sakila.country where  country = 'Canada')));

                                                                                        (select city_id from sakila.city where country_id = (select country_id from sakila.country where  country = 'Canada')));
-- With JOIN solution 																		
select first_name, last_name, email 
from sakila.customer c join sakila.address a
on c.address_id = a.address_id	
join sakila.city ci 
on a.city_id = ci.city_id 
join sakila.country cy 
on ci.country_id = cy.country_id and country = 'Canada'														
                                                                                

-- Query 6: Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select title from sakila.film 
where film_id in 
       (select film_id from sakila.film_actor 
                   where actor_id = 
                                   (select actor_id from (select actor_id, count(film_id) as films_done from sakila.film_actor group by 1 order by films_done desc limit 1) as tab));

-- Query 7: Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments.
select title from sakila.film where film_id in (select film_id




