use sakila

select amount, amount as min_amount
from payment p
where amount = all (select min(amount) from payment) and amount = all (select max(amount) from payment) ;