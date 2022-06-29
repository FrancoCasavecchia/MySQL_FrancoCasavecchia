#Prueba MySql 1

#1 Mostrar todos los clientes que hayan alquilado una pelicula pero que todavia no fueron devueltas

SELECT c.first_name,r.return_date
FROM customer c
JOIN rental r
	ON c.customer_id = r.customer_id
WHERE r.return_date IS NOT NULL
;

#2 Obtener todos los rental cuyo precio de alquiler este entre 2 y 7



SELECT r.rental_id , p.amount
FROM rental r
JOIN payment p 
	ON r.rental_id = p.rental_id
WHERE p.amount BETWEEN 2 AND 7
;

#3 Mostrar el pago mayor y menor de cada cliente, resolver con subqueries. En una columna separada, listar sus pagos separados por comas

#4 Obtener el precio de reemplazo mayor y menor de cada pelicula, si se repite no mostrar el valor Opcional(debera mostrar los nombres de las peliculas que comparten el valor)


#5 Obtener los pares de clientes que comparten el mismo nombre

SELECT a1.customer_id,a1.first_name
FROM customer a1 , customer a2
WHERE a1.first_name = a2.first_name AND a1.customer_id <> a2.customer_id
ORDER BY a1.first_name;

#6 Listar todos los actores que actuaron en 'BETRAYED REAR' y 'CATCH AMISTAD' pero no en 'ACE GOLDFINGER'

SELECT a.first_name, a.last_name,a.actor_id
FROM actor a
WHERE actor_id IN (
  SELECT actor_id 
  FROM film_actor fa 
  WHERE fa.film_id IN (
    SELECT f1.film_id 
    FROM film f1 
    WHERE f1.title 
    LIKE 'BETRAYED REAR' 
    AND f1.film_id IN (
		SELECT f2.film_id 
		FROM film f2 
		WHERE f2.title 
		LIKE 'CATCH AMISTAD'
	AND f1.film_id or f2.film_id NOT IN (
		SELECT f3.film_id 
		FROM film f3 
		WHERE f3.title 
		LIKE 'ACE GOLDFINGER'))));

#7 Mostrar las peliculas que tienen mas de 4 actores



#8 Mostrar los datos del cliente, la cantidad de peliculas que alquilo y en una columna separado por comas el nombre de las peliculas que alguna vez alquilo. 
#Ademas debera mostrar su compra maxima y minima

SELECT 
	c.first_name,
    c.last_name,
    COUNT(r.rental_id),
    GROUP_CONCAT(f.tilte),
    MIN(p.amount),
    MAX(p.amount)   
FROM customer c
JOIN rental r 
	ON c.customer_id = r.customer_id
;
    


#9 Obtener todos los pares de actores que comparten nombre, pero solo aquellos que comienzan con A. Resolver con subqueries

SELECT DISTINCT actor2.actor_id, actor2.first_name 
FROM  actor s1 , (SELECT * FROM actor a WHERE a.first_name LIKE 'A%') as actor2
WHERE s1.first_name = actor2.first_name AND s1.actor_id <> actor2.actor_id
ORDER BY s1.first_name;






