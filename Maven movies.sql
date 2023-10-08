/*
1.Write a SQL query to count the number of characters except for the spaces for each actor.
Return the first 10 actors' name lengths along with their names.*/

use mavenmovies;
select concat(first_name,last_name) as actor_fullname,
char_length(concat(first_name,last_name)) as length from actor limit 10;

/*2.List all Oscar awardees(Actors who received the Oscar award)
with their full names and the length of their names.*/

select concat(first_name,last_name) as actorn_fullname,
char_length(concat(first_name,last_name)) as length,awards from actor_award
where awards='oscar';

/*3.Find the actors who have acted in the film ‘Frost Head.’*/

select * from film_text;
select * FROM film_actor;
select * from actor;

select concat(a.first_name,a.last_name) as actorname,ft.title from film_text ft
inner join film_actor fa on ft.film_id=fa.film_id
inner join actor a on a.actor_id=fa.actor_id
where ft.title='frost head';

/*4.Pull all the films acted by the actor ‘Will Wilson.’*/

select concat(a.first_name,a.last_name) as actorname,ft.title from film_text ft
inner join film_actor fa on ft.film_id=fa.film_id
inner join actor a on a.actor_id=fa.actor_id
where a.first_name='will' and a.last_name='wilson';

/*5.Pull all the films which were rented and return them in the month of May.*/

select r.rental_date,r.return_date,f.title from rental r
inner join inventory i on i.inventory_id=r.inventory_id
inner join film f on f.film_id=i.film_id 
where month(return_date)="5" and month(rental_date)="5";


/*6.Pull all the films with ‘Comedy’ category.*/

select f.title,c.name,length(f.replacement_cost) from film_category fc
inner join category c on fc.category_id=c.category_id
inner join film f on fc.film_id=f.film_id
where c.name in('comedy','action','animation') and f.rental_duration>3 and f.rating='nc-17';