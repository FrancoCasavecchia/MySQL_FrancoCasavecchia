DROP DATABASE IF EXISTS imdb;
CREATE DATABASE IF NOT EXISTS imdb;
USE imdb;

CREATE TABLE IF NOT EXISTS country(
	country_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(30) NOT NULL,
	last_update DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS city(
	city_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(30) NOT NULL,
    fk_country_id INT NOT NULL,
    FOREIGN KEY (fk_country_id) REFERENCES country(country_id),
    last_update DATE NOT NULL
);

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

CREATE TABLE IF NOT EXISTS store(
	store_id INT NOT NULL PRIMARY KEY auto_increment,
    manager_staff_id INT NOT NULL,
    fk_address_id INT NOT NULL,
    last_update DATE NOT NULL,
    FOREIGN KEY (fk_address_id) REFERENCES address(address_id)
);

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
	FOREING_KEY (fk_language_id) REFERENCES languagee(language_id)
);

CREATE TABLE IF NOT EXISTS rental(
	rental_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rental_date DATE NOT NULL,
    
);























