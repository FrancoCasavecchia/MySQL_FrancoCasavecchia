USE sakila;

#Find all the film titles that are not in the inventory.

SELECT *
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.film_id IS NULL;


#Find all the films that are in the inventory but were never rented.
	#Show title and inventory_id.
	#This exercise is complicated.
	#hint: use sub-queries in FROM and in WHERE or use left join and ask if one of the fields is null
    
SELECT f.title , i.inventory_id
from film f
join inventory i using(film_id)
left join rental r using(inventory_id)
where  r.inventory_id IS NULL;

#Generate a report with:
	#customer (first, last) name, store id, film title,
	#when the film was rented and returned for each of these customers
	#order by store_id, customer last_name

#Show sales per store (money of rented films)
	#show store's city, country, manager info and total sales (money)
	#(optional) Use concat to show city and country and manager first and last name



#Which actor has appeared in the most films?
	


