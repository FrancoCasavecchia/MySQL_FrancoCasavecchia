USE sakila;

SELECT 
	CONCAT(c.first_name,',',c.last_name) AS 'Nombre y Apellido',
    a.address,
    a.address2,
    ci.city
FROM customer c 
	JOIN address a USING(address_id)
	JOIN city ci USING(city_id)
	JOIN country co USING(country_id)






