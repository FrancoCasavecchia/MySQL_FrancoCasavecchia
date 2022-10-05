USE sakila;

#TABLE EMPLOYEES


CREATE TABLE IF NOT EXISTS `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);

insert  into`employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 

(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),

(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),

(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

CREATE TABLE IF NOT EXISTS employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

#1 Insert a new employee to , but with an null email. Explain what happens.

INSERT INTO employees(
		employeeNumber,
        lastName,
        firstName,
        extension,
        email,
        officecode,
        reportsTo,
        jobTitle
)
VALUES (
	1,
    'Casavecchia',
    'Franco',
    'x1',
    NULL,
    1234,
    1111,
    'test'
);

#Lo que sucede al ejecutar esto es que en la tabla se puede ver que tiene el CONTRAINT 'NOT NULL', por ende al querer agregar un mail NULL sale el siguiente error:
#Column 'email' cannot be null

#2 Run the first the query

UPDATE employees SET employeeNumber = employeeNumber - 20;

#Simplemente resta el employeeNumber

#What did happen? Explain. Then run this other

UPDATE employees SET employeeNumber = employeeNumber + 20;

#en este caso sale un error porque la primary key se duplicaria y habira 2.alter

#3 Add a age column to the table employee where and it can only accept values from 16 up to 70 years old.
 
ALTER TABLE employees ADD age int CHECK(age >= 18 and age <= 70);

ALTER TABLE employees DROP age;


#4

#Referential Integrity is a set of constraints applied to foreign keys which prevents entering a row in the child table (where you have the 
#foreign key) for which you don't have any corresponding row in the parent table i.e. entering NULL or invalid foreign keys. 
#Referential Integrity prevents your table from having incorrect or incomplete relationships
#Para el caso de la DB Sakila y las tablas film, actor and film_actor lo que hace el referential integrity es prevenir y bloquear la entrada 
# de una FK o un dato que no cumpla con los requisitos necesarios en una tabla hija, lo que hay que ahcer es ir agregando el dato correspondiente
#en cada una de las tablas yendo de padre a hija.Por ejemplo desde la tabla film_actor no podrias agregar una pelicula la cual el id o algun dato
#no exista, lo mismo pasa con actor.


#5 Create a new column called lastUpdate to table employee and use trigger(s) to keep the date-time updated on inserts and updates operations. 
#Bonus: add a column lastUpdateUser and the respective trigger(s) to specify who was the last MySQL user that changed the row 
#(assume multiple users, other than root, can connect to MySQL and change this table).

ALTER TABLE employees ADD lastUpdate TIMESTAMP;

DELIMITER $$

CREATE TRIGGER before_employees_update
	BEFORE UPDATE ON employees
    FOR EACH ROW
BEGIN
	SET new.lastUpdate = current_timestamp();
END$$
DELIMITER ;


ALTER TABLE employees ADD lastUpdateUser VARCHAR(255);

DELIMITER $$

CREATE TRIGGER before_employees_update
	BEFORE UPDATE ON employees
    FOR EACH ROW
BEGIN
	SET new.lastUpdateUser = current_user();
END$$
DELIMITER ;

#6 Find all the triggers in sakila db related to loading film_text table. 
#What do they do? Explain each of them using its source code for the explanation.

SHOW TRIGGERS;

#ins_film trigger for the insert into the FILM TABLE
BEGIN
     INSERT INTO film_text (film_id, title, description)
         VALUES (new.film_id, new.title, new.description)
   END$$
 
  
#upd_film trigger for update the film table

BEGIN
     IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
     THEN
         UPDATE film_text
             SET title=new.title,
                 description=new.description,
                 film_id=new.film_id
         WHERE film_id=old.film_id;
     END$$
     
#del_film trigger to delete dates in the film table

BEGIN
     DELETE FROM film_text WHERE film_id = old.film_id;
   END$$
   
#payment_date trigger for know when the payment was made

SET NEW.payment_date = NOW();

#rental_date trigger for know ehn the retal was

SET NEW.rental_date = NOW();
  
  
  
  
  
  
  
  
  
  
