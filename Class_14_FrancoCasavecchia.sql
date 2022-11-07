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
