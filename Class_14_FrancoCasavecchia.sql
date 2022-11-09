USE sakila;
/*
1-Write a query that gets all the customers that live in Argentina. Show the first and last name in one column, the address and the city.

2-Write a query that shows the film title, language and rating. Rating shall be shown as the full text described here: https://en.wikipedia.org/wiki/Motion_picture_content_rating_system#United_States. Hint: use case.

3-Write a search query that shows all the films (title and release year) an actor was part of. Assume the actor comes from a text box introduced by hand from a web page. Make sure to "adjust" the input text to try to find the films as effectively as you think is possible.

4-Find all the rentals done in the months of May and June. Show the film title, customer name and if it was returned or not. There should be returned column with two possible values 'Yes' and 'No'.

5-Investigate CAST and CONVERT functions. Explain the differences if any, write examples based on sakila DB.

6-Investigate NVL, ISNULL, IFNULL, COALESCE, etc type of function. Explain what they do. Which ones are not in MySql and write usage examples.
*/

#1 Write a query that gets all the customers that live in Argentina. Show the first and last name in one column, the address and the city.
select * from actor;

SELECT 
	CONCAT(c.first_name,',',c.last_name),
    a.address,
    a.address2,
    ci.city
FROM customer c 
	JOIN address a USING(address_id)
	JOIN city ci USING(city_id)
	JOIN country co USING(country_id)
WHERE co.country LIKE 'Argentina';

#2 Write a query that shows the film title, language and rating. Rating shall be shown as the full text described here: https://en.wikipedia.org/wiki/Motion_picture_content_rating_system#United_States. Hint: use case.

SELECT 
	f.title,
    lan.name,
    f.rating,
CASE
	WHEN f.rating = 'G' THEN 'All ages admitted.'
    WHEN f.rating = 'PG'  THEN 'Some material may not be suitable for children.'
    WHEN f.rating = 'PG-13'  THEN 'Some material may be inappropriate for children under 13.'
    WHEN f.rating = 'R'  THEN 'Under 17 requires accompanying parent or adult guardian.'
    WHEN f.rating = 'NC-17'  THEN 'No one 17 and under admitted'
END 'Film Rating'
FROM film f
    JOIN language lan USING(language_id);
    
#3 Write a search query that shows all the films (title and release year) an actor was part of. Assume the actor comes from a text box introduced by hand from a web page. Make sure to "adjust" the input text to try to find the films as effectively as you think is possible.

SELECT
	f.title,
    f.release_year,
    CONCAT(a.first_name,' ',a.last_name) AS 'Nombre y Apellido'
FROM film f
	JOIN film_actor USING(film_id)
    JOIN actor a USING(actor_id)
WHERE
	CONCAT(a.first_name,' ',a.last_name) LIKE TRIM(UPPER('ED CHASE'));

#4 Find all the rentals done in the months of May and June. Show the film title, customer name and if it was returned or not. There should be returned column with two possible values 'Yes' and 'No'.

SELECT 
    f.title,
    CONCAT(c.first_name, ' ', c.last_name) AS 'Customers Name',
    r.rental_date,
    CASE
        WHEN r.return_date IS NOT NULL THEN 'Yes'
        WHEN r.return_date IS NULL THEN 'No'
    END 'Return'
FROM
    film f
        JOIN
    inventory USING (film_id)
        JOIN
    rental r USING (inventory_id)
        JOIN
    customer c USING (customer_id)
WHERE
    MONTH(r.rental_date) = 05
        OR MONTH(r.rental_date) = 06
ORDER BY r.rental_date;


#5 Investigate CAST and CONVERT functions. Explain the differences if any, write examples based on sakila DB.

/*
	The CAST() function converts a value (of any type) into a specified datatype.This can be use for convert a datatime to a varchar 
	Syntax CAST(expression AS datatype(length))
    
    The CONVERT() function converts an expression from one datatype to another datatype just like the CAST()function.
    Syntax CONVERT(data_type(length), expression, style)
    
    The differences apart from the syntax are:
		The convert function is more flexible in that you can format dates etc.
        And the cast function is part of the ANSI-SQL so runs in all modern vendor databases
        
*/
    
#6 Investigate NVL, ISNULL, IFNULL, COALESCE, etc type of function. Explain what they do. Which ones are not in MySql and write usage examples.

/*
	ISNULL():
		The ISNULL() function returns a specified value if the expression is NULL.
		If the expression is NOT NULL, this function returns the expression.
        Syntax ISNULL(expression, value)
        This function works on SQL Server, Azure SQL Database, Azure SQL Data Warehouse, Parallel Data Warehouse
        EXAMPLE
			SELECT ISNULL(NULL);
            return 1;
        
	IFNULL():
		The IFNULL() function returns a specified value if the expression is NULL.
		If the expression is NOT NULL, this function returns the expression.
        Syntax IFNULL(expression, alt_value)
        The difference between the ISNULL() and the IFNULL() is that IFNULL works on MySql 4.0 ahead 
        EXAMPLE
			SELECT IFNULL(NULL, 'We have a NULL value');
            return 'We have a NULL value'
        
	NVL():
		NVL() converts a null value to an actual value. Data types that can be used are date, character and number. Data type must match with each other i.e. expr1 and expr2 must of same data type.
        Syntax NVL(expr1, expr2)
        EXAMPLE
			SELECT  salary, NVL(commission_pct, 0),
			(salary*12) + (salary*12*NVL(commission_pct, 0))
			annual_salary FROM employees;
		 (supported by oracle)
	
    COALESCE()
		The COALESCE() function examines the first expression, if the first expression is not null, it returns that expression; Otherwise, it does a COALESCE of the remaining expressions.
		The advantage of the COALESCE() function over the NVL() function is that the COALESCE function can take multiple alternate values. 
        In simple words COALESCE() function returns the first non-null expression in the list.
		Syntax COALESCE (expr_1, expr_2, ... expr_n)
        It is more like the NVL2().
        EXAMPLE
			SELECT last_name, 
			COALESCE(commission_pct, salary, 10) comm
			FROM employees ORDER BY commission_pct;
		(supported by mysql)
    
*/
    
    
