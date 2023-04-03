SHOW TABLES; -- show all tables 

select distinct title from sakila.film; -- show all distinct fil titles

select distinct name from sakila.language; -- show all distinct film names 
 
select distinct store_id, count(*) from sakila.store group by 1; -- value counts of all stores per store id
 
select count(staff_id) from sakila.staff ; -- returns count of staff the company has
  
select first_name from sakila.staff; -- return a list of first name of all employees 


