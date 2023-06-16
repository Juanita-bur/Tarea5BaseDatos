-- INSERT INTO customer
ALTER TABLE customer ALTER COLUMN store_id DROP NOT NULL;
INSERT INTO Customer (customer_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (601, 'Luisa', 'Martinez', 'Luisa@example.com', 301, true, '2008-06-12', '2023-06-16 14:29:20', 1);

-- UPDATE customer
UPDATE customer
SET first_name = 'Jane', last_name = 'Holland', email = 'janehd@example.com'
WHERE customer_id = 601;

-- DELETE FROM customer
DELETE FROM customer
WHERE customer_id = 601;

-- ALTER TABLE payment
ALTER TABLE payment
DROP CONSTRAINT IF EXISTS payment_customer_id_fkey;

ALTER TABLE payment
ADD CONSTRAINT payment_customer_id_fkey
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
ON DELETE CASCADE;

-- INSERT INTO staff
INSERT INTO Staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
VALUES (3, 'Kaveh', 'Sumeru', 6, 'kaveh@example.com', 3, true, 'Kaveh', 'gsf56d4sf4gg4s6d5f', '2023-06-16 14:45:15', NULL);

-- UPDATE staff
UPDATE Staff
SET first_name = 'Bennet', last_name = 'Liyue', email = 'bennetld@example.com'
WHERE staff_id = 3;

-- DELETE FROM staff
DELETE FROM Staff
WHERE staff_id = 3;

-- INSERT INTO actor
INSERT INTO Actor (actor_id, first_name, last_name, last_update)
VALUES (201, 'Keith', 'Miller', '2023-06-16 14:50:15');

-- UPDATE actor
UPDATE Actor
SET first_name = 'Chase', last_name = 'Pittman'
WHERE actor_id = 201;

-- DELETE FROM actor
DELETE FROM Actor
WHERE actor_id = 201;

-- SELECT rental
SELECT rental.rental_id, rental.rental_date, customer.customer_id, customer.first_name, customer.last_name
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005
  AND EXTRACT(MONTH FROM rental.rental_date) = 6;

-- SELECT payment
SELECT payment_id, payment_date, amount
FROM payment;

-- SELECT film
SELECT *
FROM film
WHERE to_char(release_year, 'YYYY') = '2006'
  AND rental_rate > 4.0;

-- Tabla: Customer
CREATE TABLE Customer_1 (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    address_id INT,
    activebool BOOLEAN,
    create_date DATE,
    last_update TIMESTAMP,
    active INT
);

-- Tabla: Staff
CREATE TABLE Staff_1 (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address_id INT,
    email VARCHAR(255),
    store_id INT,
    active BOOLEAN,
    username VARCHAR(255),
    password VARCHAR(255),
    last_update TIMESTAMP,
    picture VARCHAR(255)
);

-- Tabla: Actor
CREATE TABLE Actor_1 (
    actor_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    last_update TIMESTAMP,
    actor_birthdate DATE
);

-- Tabla: Rental
CREATE TABLE Rental_1 (
    rental_id INT PRIMARY KEY,
    rental_date TIMESTAMP NOT NULL,
    customer_id INT NOT NULL
);

-- Tabla: Payment
CREATE TABLE Payment_1 (
    payment_id INT PRIMARY KEY,
    payment_date TIMESTAMP NOT NULL,
    amount DECIMAL NOT NULL,
    customer_id INT
);

-- Tabla: Film
CREATE TABLE Film_1 (
    film_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    rental_rate DECIMAL NOT NULL
);