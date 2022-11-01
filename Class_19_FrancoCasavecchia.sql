#1 Create a user data_analyst

CREATE USER IF NOT EXISTS data_analyst IDENTIFIED BY 'casa';

#2 Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.

GRANT SELECT, UPDATE, DELETE ON sakila.* TO 'data_analyst'@'%';

#3 Login with this user and try to create a table. Show the result of that operation.
CREATE TABLE tabla_usuario(
    id_t INT NOT NULL AUTO_INCREMENT
);  
#Error Code: 1075. Incorrect table definition; there can be only one auto column and it must be defined as a key	0.000 sec

#4 Try to update a title of a film. Write the update script.

UPDATE film SET title = 'El Casa' WHERE film_id = 23;
SELECT * FROM film WHERE film_id = 23;
#	23	El Casa	A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia	2006	1		3	0.99	92	9.99	R	Trailers,Deleted Scenes	2022-11-01 08:54:31

#5 With root or any admin user revoke the UPDATE permission. Write the command
REVOKE UPDATE ON sakila.* FROM data_analyst;

#6 Login again with data_analyst and try again the update done in step 4. Show the result.

SELECT * FROM film where film_id like '24';

UPDATE film SET title = 'Pelicula' WHERE film_id = 24;
#	24	ANALYZE HOOSIERS	A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert	2006	1		6	2.99	181	19.99	R	Trailers,Behind the Scenes	2006-02-15 05:03:42