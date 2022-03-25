USE sakila;

#EJERCICIO 1 List all the actors that share the last name. Show them in order
SELECT a1.actor_id,a1.last_name
FROM actor a1 , actor a2
WHERE a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id
ORDER BY a1.last_name;

