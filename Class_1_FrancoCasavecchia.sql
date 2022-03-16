DROP DATABASE IF EXISTS imdb;
CREATE DATABASE IF NOT EXISTS imdb;
USE imdb;

CREATE TABLE IF NOT EXISTS film(
	film_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30)NOT NULL,
	descripcion VARCHAR(90)NOT NULL,
    relese_year YEAR NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS actor(
	actor_id INT NOT NULL PRIMARY KEY auto_increment,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30)NOT NULL
);

CREATE TABLE IF NOT EXISTS film_actor(
	film_actor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	film_id_fk int not null,
    actor_id_fk int not null    
);

ALTER TABLE film
	ADD last_update DATE NOT NULL
    AFTER relese_year;
    
ALTER TABLE actor
	ADD last_update DATE NOT NULL
    AFTER last_name;
    
ALTER TABLE film_actor
ADD FOREIGN KEY (film_id_fk) REFERENCES film(film_id);

ALTER TABLE film_actor
ADD FOREIGN KEY (actor_id_fk) REFERENCES actor(actor_id);

INSERT INTO film VALUES("1","Pelao","El pelado","2003");
INSERT INTO film VALUES("2","Casita","El casita","2021");

INSERT INTO actor VALUES("1","Pelao","El pelado");
INSERT INTO actor VALUES("1","Pelao","El pelado");

INSERT INTO film_actor VALUES("1","2");
INSERT INTO film_actor VALUES("2","1");
