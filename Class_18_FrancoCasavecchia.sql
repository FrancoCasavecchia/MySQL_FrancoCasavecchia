use sakila;


#Write a function that returns the amount of copies of a film in a store in sakila-db. 
#Pass either the film id or the film name and the store id.

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


#Write a stored procedure with an output parameter that contains a list of customer first and last names separated by ";", 
#that live in a certain country. You pass the country it gives you the list of people living there. 
#USE A CURSOR, do not use any aggregation function (ike CONTCAT_WS.

DELIMITER //

CREATE PROCEDURE people_country(IN cou VARCHAR(200),OUT list VARCHAR(200))
BEGIN
	DECLARE fin INT DEFAULT 0;
    DECLARE f_name VARCHAR(200);
    DECLARE l_name VARCHAR(200);
    DECLARE c_name VARCHAR(200);
    DECLARE cursList CURSOR FOR
    
    SELECT co.country, cu.first_name, cu.last_name
    FROM customer cu
		JOIN address ad USING(address_id)
        JOIN city ci USING(city_id)
        Join country co USING(country_id);
	
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
OPEN cursList;

looplabel: LOOP
		FETCH cursList INTO c_name, f_name, l_name;
		IF fin = 1 THEN
			LEAVE looplabel;
		END IF;
		IF coun = co_name THEN
			SET list = CONCAT(f_name,';',l_name);
		END IF;
END LOOP looplabel;
CLOSE cursList;
    
END //
DELIMITER ;

set @list = "";
call people_country('United States',@list);
SELECT @list;




