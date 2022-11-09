USE sakila;

SELECT 
	CONCAT(c.first_name,',',c.last_name) AS 'Nombre y Apellido',
    a.address as 'Address',
    ci.city as 'City',
    REVERSE(a.address) as 'Address en Reversa',
    HEX(a.address) as 'Address en Hexadecimal',
    bin(hex(a.address)) as 'Memoria ocupada en Binario'
FROM customer c 
	JOIN address a USING(address_id)
	JOIN city ci USING(city_id)
	JOIN country co USING(country_id)
;


DELIMITER //

CREATE FUNCTION amount_copies(fi_id INT, st_id INT) RETURNS
INT deterministic
BEGIN
	DECLARE copies INT DEFAULT 0;
    
    SELECT count(i.inventory_id) INTO copies
    FROM film fi
		JOIN inventory i USING(film_id)
        JOIN store s USING(store_id)
	WHERE f.film_id = fi_id AND s.store_id = st_id;
    RETURN copies;
END //

DELIMITER ;

select amount_copies(44,1);


