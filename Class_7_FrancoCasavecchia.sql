#Find the films with less duration, show the title and rating.

select title, rating, length
from film
where length = (select min(length) from film);

#Write a query that returns the tiltle of the film which duration is the lowest. If there are more than one film with the lowest durtation, the query returns an empty resultset.
#Generate a report with list of customers showing the lowest payments done by each of them. Show customer information, the address and the lowest amount, provide both solution using ALL and/or ANY and MIN.
#Generate a report that shows the customer's information with the highest payment and the lowest payment in the same row.