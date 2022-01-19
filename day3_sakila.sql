use sakila;

#1 List all actors.
select * from actor;

#2 Find the surname of the actor with the forename 'John'.
select first_name, last_name from actor where first_name = 'John';

#3 Find all actors with surname 'Neeson'.
select * from actor where last_name = 'Neeson';

#4 Find all actors with ID numbers divisible by 10.
select * from actor where actor_id like '%0';

#5 What is the description of the movie with an ID of 100?
select description from film where film_id = 100;

#6 Find every R-rated movie.
select title,rating from film where rating = 'R';

#7 Find every non-R-rated movie.
select title,rating from film where rating != 'R';

#8 Find the ten shortest movies.
select title, length from film order by length asc limit 10;

#9 Find the movies with the longest runtime, without using LIMIT.
select title, length from film 
where length = (
select max(length) from film
);

#10 Find all movies that have deleted scenes.
select title from film
where special_features like 'Deleted Scenes';

#11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
select distinct last_name from actor
group by last_name
having count(last_name) = 1
order by last_name desc;

#12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
select count(actor_id), last_name from actor
group by last_name
having count(actor_id) > 1
order by count(actor_id) desc;

#13 Which actor has appeared in the most films?
select fa.actor_id, a.first_name, a.last_name, count(fa.film_id) 
from film_actor fa
join actor a
on fa.actor_id = a.actor_id
group by fa.actor_id
order by count(fa.film_id) desc;

#14 When is 'Academy Dinosaur' due?
select f.title, f.rental_duration, r.rental_date, r.return_date, r.rental_date + interval f.rental_duration day as 'due date'
from rental r
join inventory i
on r.inventory_id = i.inventory_id
join film f
on i.film_id=f.film_id
where r.return_date is null and f.title like 'Academy Dinosaur';

#15 What is the average runtime of all films?
select avg(length) from film;

#16 List the average runtime for every film category.
select fc.category_id, c.name, avg(f.length)
from film_category fc
join category c
on fc.category_id = c.category_id
join film f
on fc.film_id = f.film_id
group by fc.category_id;

#17 List all movies featuring a robot.
select title, description from film
where description like '%Robot%';

#18 How many movies were released in 2010?
select count(film_id) from film where release_year = 2010;

#19 Find the titles of all the horror movies.
select c.name, f.title
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
where c.name = 'horror'
order by f.title asc;

#20 List the full name of the staff member with the ID of 2.
select first_name, last_name from staff
where staff_id =2;

#21 List all the movies that Fred Costner has appeared in.
select concat(a.first_name, ' ', a.last_name) as 'Full Name', f.title
from film f
join film_actor fa
on f.film_id = fa.film_id
join actor a
on a.actor_id = fa.actor_id
where a.first_name = 'Fred' and a.last_name = 'Costner';

#22 How many distinct countries are there?
select distinct count(country) from country;

#23 List the name of every language in reverse-alphabetical order.
select name from language
order by name desc;

#24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
select first_name,last_name from actor
where last_name like '%son'
order by first_name asc;

#25 Which category contains the most films?
select c.name, count(fc.film_id) 
from film_category fc
join category c
on fc.category_id = c.category_id
group by fc.category_id
order by count(fc.film_id) desc;


#-----------------------------------------------
select* from actor;
select* from address;
select*from category;
select * from city;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from film_text;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;