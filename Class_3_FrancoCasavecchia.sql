DROP DATABASE IF EXISTS imdb;
CREATE DATABASE IF NOT EXISTS imdb;
USE imdb;

CREATE TABLE IF NOT EXISTS country(
	country_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(30) NOT NULL,
	last_update DATE NOT NULL
);

INSERT INTO country VALUES(1,"Argentina",'2001-11-17');
INSERT INTO country VALUES(2,"EEUU",'2019-09-11');
INSERT INTO country VALUES(3,"Inglaterra",'1998-12-21');
INSERT INTO country VALUES(4,"España",'2021-03-17');
INSERT INTO country VALUES(5,"Bolivia",'2011-01-09');


CREATE TABLE IF NOT EXISTS city(
	city_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(30) NOT NULL,
    fk_country_id INT NOT NULL,
    FOREIGN KEY (fk_country_id) REFERENCES country(country_id),
    last_update DATE NOT NULL
);

INSERT INTO city VALUES(1,"Cordoba",1,'2021-01-01');
INSERT INTO city VALUES(2,"BsAS",1,'2021-01-01');
INSERT INTO city VALUES(3,"Madrid",4,'2021-01-01');
INSERT INTO city VALUES(4,"Londres",3,'2021-01-01');
INSERT INTO city VALUES(5,"La Paz",5,'2021-01-01');
INSERT INTO city VALUES(6,"Los Angeles",2,'2021-01-01');
INSERT INTO city VALUES(7,"Sucre",5,'2021-01-01');
INSERT INTO city VALUES(8,"Mendoza",1,'2021-01-01');


CREATE TABLE IF NOT EXISTS address(
	address_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    address_1 VARCHAR(30)NOT NULL,
    address_2 VARCHAR(30)NOT NULL,
    district VARCHAR(30)NOT NULL,
    fk_city_id INT NOT NULL,
    postal_code VARCHAR(6),
    phone VARCHAR(12)NOT NULL,
    location VARCHAR(30)NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_city_id) REFERENCES city(city_id)
);

INSERT INTO address VALUES(1,"Av. Rep China","Ramons A Cabrera","Capital",1,5008,"1234938172","Capital",'2021-01-01');
INSERT INTO address VALUES(2,"MZA 1","LTO 203","Capital",5,5128,"9873627182","Capital",'2021-01-01');
INSERT INTO address VALUES(3,"","","",2,6009,"","",'2021-01-01');
INSERT INTO address VALUES(4,"","","",4,1234,"","",'2021-01-01');
INSERT INTO address VALUES(5,"","","",3,4321,"","",'2021-01-01');
INSERT INTO address VALUES(6,"Av Colon","AV sabattini","Capital",8,45223,"","Capital",'2021-01-01');
INSERT INTO address VALUES(7,"","","",7,3452,"","",'2021-01-01');
INSERT INTO address VALUES(8,"","","",2,6752,"","",'2021-01-01');
INSERT INTO address VALUES(9,"","","",6,2346,"","",'2021-01-01');
INSERT INTO address VALUES(10,"","","",1,8734,"","",'2021-01-01');

SELECT * FROM address;

CREATE TABLE IF NOT EXISTS store(
	store_id INT NOT NULL PRIMARY KEY auto_increment,
    manager_staff_id INT NOT NULL,
    fk_address_id INT NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_address_id) REFERENCES address(address_id)
);

INSERT INTO store VALUES(1,2,1,'2021-01-01');
INSERT INTO store VALUES(2,1,9,'2021-01-01');
INSERT INTO store VALUES(3,1,8,'2021-01-01');
INSERT INTO store VALUES(4,3,4,'2021-01-01');
INSERT INTO store VALUES(5,3,7,'2021-01-01');

CREATE TABLE IF NOT EXISTS staff(
	staff_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    fk_address_id INT NOT NULL,
    picture INT NOT NULL,
    fk_store_id INT NOT NULL,
    activo BOOLEAN NOT NULL,
	username VARCHAR(30) NOT NULL,
    passwordd VARCHAR(30) NOT NULL,
    last_update DATE NOT NULL,  
    FOREIGN KEY (fk_store_id) REFERENCES store(store_id),
    FOREIGN KEY (fk_address_id) REFERENCES address(address_id)
);

INSERT INTO staff VALUES(1,"Franco","Casavecchia",7,1,1,TRUE,"","",'2021-01-01');
INSERT INTO staff VALUES(2,"Gonzalo","Briolotti",9,2,1,TRUE,"","",'2021-01-01');
INSERT INTO staff VALUES(3,"Matias","Carbel",8,3,1,TRUE,"","",'2021-01-01');
INSERT INTO staff VALUES(4,"Manuel","Ferreras",3,4,1,TRUE,"","",'2021-01-01');
INSERT INTO staff VALUES(5,"Mariano","Puertas",5,5,1,TRUE,"","",'2021-01-01');
INSERT INTO staff VALUES(6,"Tomas","Caceres",2,6,1,TRUE,"","",'2021-01-01');
INSERT INTO staff VALUES(7,"Maximo","Rivero",1,7,1,TRUE,"","",'2021-01-01');
INSERT INTO staff VALUES(8,"Marcos","Don",10,8,1,TRUE,"","",'2021-01-01');

ALTER TABLE store ADD FOREIGN KEY (manager_staff_id) REFERENCES staff(staff_id);

CREATE TABLE IF NOT EXISTS customer(
	customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_store_id INT NOT NULL,
    first_name VARCHAR(30)NOT NULL,
    last_name VARCHAR(30)NOT NULL,
    email VARCHAR(30)NOT NULL,
    fk_address_id INT NOT NULL,
    activEe INT NOT NULL,
    create_date DATE NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_store_id) REFERENCES store(store_id),
    FOREIGN KEY (fk_address_id) REFERENCES address(address_id)
);

CREATE TABLE IF NOT EXISTS languagee(
	language_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    namee VARCHAR(30) NOT NULL,
	last_update DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS film(
	film_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    descipcion VARCHAR(30)NOT NULL,
    relese_year DATE NOT NULL,
    fk_language_id INT NOT NULL,
    original_language_id INT NOT NULL,
    rental_duration INT NOT NULL,
    rental_rate INT NOT NULL,
    length INT NOT NULL,
    replacement_cost INT NOT NULL,
    rating VARCHAR(2)NOT NULL,
    special_features VARCHAR(55)NOT NULL,
	last_update DATE NOT NULL,
	FOREIGN KEY (fk_language_id) REFERENCES languagee(language_id)
);

CREATE TABLE IF NOT EXISTS category(
	category_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_category VARCHAR(30)NOT NULL,
    last_update DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS actor(
	actor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30)NOT NULL,
    last_name VARCHAR(30)NOT NULL,
    last_update DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS film_category(
	fk_film_id INT NOT NULL,
    fk_category_id INT NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_film_id) REFERENCES film(film_id),
    FOREIGN KEY (fk_category_id) REFERENCES category(category_id)
);

CREATE TABLE IF NOT EXISTS film_actor(
	fk_film_id INT NOT NULL,
    fk_actor_id INT NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_film_id) REFERENCES film(film_id),
    FOREIGN KEY (fk_actor_id) REFERENCES actor(actor_id)
);

CREATE TABLE IF NOT EXISTS inventory(
	inventory_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_film_id INT NOT NULL,
    fk_store_id INT NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_film_id) REFERENCES film(film_id),
    FOREIGN KEY (fk_store_id) REFERENCES store(store_id)
);


CREATE TABLE IF NOT EXISTS rental(
	rental_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rental_date DATE NOT NULL,
    fk_inventory_id INT NOT NULL,
    fk_customer_id INT NOT NULL,
    return_date DATE NOT NULL,
    fk_staff_id INT NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_inventory_id) REFERENCES inventory(inventory_id),
    FOREIGN KEY (fk_customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (fk_staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE IF NOT EXISTS payment(
	payment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_customer_id INT NOT NULL,
    fk_staff_id INT NOT NULL,
    fk_rental_id INT NOT NULL,
    amount INT NOT NULL,
    payment_date DATE NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (fk_customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (fk_rental_id) REFERENCES rental(rental_id)
);























