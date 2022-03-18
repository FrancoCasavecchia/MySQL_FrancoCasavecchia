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























