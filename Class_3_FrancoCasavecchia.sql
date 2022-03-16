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
    last_update DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS store(

);























