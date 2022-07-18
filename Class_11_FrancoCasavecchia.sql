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
    
SELECT CONCAT(c.first_name, ' ',c.last_name) AS 'Nombre Completo', c.store_id, f.title, r.rental_date,r.return_date
from rental r 
inner join customer c using(customer_id)
inner join inventory i ON r.inventory_id = i.inventory_id
inner join film f ON i.film_id = f.film_id
ORDER BY c.store_id,c.last_name;


#Show sales per store (money of rented films)
	#show store's city, country, manager info and total sales (money)
	#(optional) Use concat to show city and country and manager first and last name

SELECT st.store_id, 
	sum(p.amount), 
	concat(s.first_name,' ',s.last_name) as 'NOMBRE STAFF', 
	concat(co.country,', ',ci.city) as 'PAIS Y CIUDAD'
FROM store st
INNER JOIN staff s ON st.manager_staff_id = s.staff_id
INNER JOIN payment p ON s.staff_id = p.staff_id
INNER JOIN address a ON st.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY st.store_id;
    

SELECT
    sto.store_id,
    CONCAT(
        sta.first_name,
        ' ',
        sta.last_name
    ) AS 'Nombre',
    COUNT(pay.payment_id) AS 'cantidad ventas',
    SUM(pay.amount) AS 'dinero ventas',
    CONCAT(co.country, ', ', ci.city) AS 'pais y ciudad'
FROM store sto
    INNER JOIN staff sta ON sto.manager_staff_id = sta.staff_id
    INNER JOIN payment pay ON sta.staff_id = pay.staff_id
    INNER JOIN address adr ON sto.address_id = adr.address_id
    INNER JOIN city ci ON adr.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY sto.store_id;
    



#Which actor has appeared in the most films?
	


