USE sakila;

#Add a new customer
	#To store 1
	#For address use an existing address. The one that has the biggest address_id in 'United States'

INSERT INTO customer(store_id,first_name,last_name,email,address_id,active)
SELECT
1,'Franco','Casavecchia','francasavecchia@gmail.com',max(a.address_id),1
from address a
inner join city ci using(city_id)
inner join country co on ci.country_id = co.country_id
where co.country = 'United States';

select * from customer where first_name = 'Franco';

#Add a rental
	#Make easy to select any film title. I.e. I should be able to put 'film tile' in the where, and not the id.
	#Do not check if the film is already rented, just use any from the inventory, e.g. the one with highest id.
	#Select any staff_id from Store 2.
select * from rental;

INSERT INTO rental (rental_date,inventory_id,customer_id,return_date,staff_id)
SELECT CURRENT_TIMESTAMP ,max(i.film_id) as inventory_id , 600,CURRENT_TIMESTAMP,(select manager_staff_id from store where store_id = 2 limit 1)
FROM inventory i;

select * from rental where customer_id = 600;


#Update film year based on the rating
	#For example if rating is 'G' release date will be '2001'
	#You can choose the mapping between rating and year.
	#Write as many statements are needed.


#UPDATE film
#SET release_year = 2001 where rating = 'G';
#UPDATE film
#SET release_year = 2002 where rating = 'PG';
#UPDATE film
#SET release_year = 2003 where rating = 'PG-13';
#UPDATE film
#SET release_year = 2001 where rating = 'R';
#UPDATE film
#SET release_year = 2002 where rating = 'NC-17';

#select * from film where rating = 'R';


#Return a film
	#Write the necessary statements and queries for the following steps.
	#Find a film that was not yet returned. And use that rental id. Pick the latest that was rented for example.
	#Use the id to return the film.

#UPDATE rental SET return_date = CURRENT_TIMESTAMP WHERE rental_id = (select r.rental_id
#														from film f
#															inner join inventory i using(film_id)
#															inner join rental r using(inventory_id)
#														where r.return_date is null
#														order by r.rental_date desc
#														limit 1)
#;

#Try to delete a film
	#Check what happens, describe what to do.
	#Write all the necessary delete statements to entirely remove the film from the DB.
    
select * from film;
#delete from film where title = 'ACADEMY DINOSAUR'; #Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`sakila`.`film_actor`, CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE)	0.016 sec

#Lo que sucedio y el porque no nos deja eliminar la pelicula es debido a que estas forzando a borrar un dato de una tabla hija.
#Para resolver esto lo mas facil pero no recomendado es desactivar el fk_checks de la siguiente manera ' SET FOREIGN_KEY_CHECKS=0; '

SET FOREIGN_KEY_CHECKS=0;
delete from film where title = 'ACADEMY DINOSAUR'

#Rent a film
	#Find an inventory id that is available for rent (available in store) pick any movie. Save this id somewhere.
	#Add a rental entry
	#Add a payment entry
	#Use sub-queries for everything, except for the inventory id that can be used directly in the queries.