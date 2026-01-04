-- CREATE DATABASE 
DROP DATABASE IF EXISTS CIT230FinalProject;
CREATE DATABASE CIT230FinalProject;
USE CIT230FinalProject;

-- CREATE TABLE COURSE 
CREATE TABLE Course (
	CourseID INT PRIMARY KEY,
    Subject  VARCHAR(50),
    Credits INT 
);

-- INSERT VALUES IN THE TABLE 
INSERT INTO Course (CourseID, Subject, Credits) VALUES 
(1, 'Maths', 20),
(2, 'English', 10),
(3, 'Science', 201),
(4, 'Economics', 50),
(5, 'French', 10);

-- CREATE STUDENT TABLE 
CREATE TABLE Student(
	StudentID VARCHAR(10) PRIMARY KEY,
    Firstname VARCHAR(50),
    Lastname VARCHAR(50)
);

-- INSERT VALUES IN THE STUDENT TABLE 
INSERT INTO Student (StudentID, Firstname, Lastname) VALUES 
('S1', 'Johnny', 'Depp'),
('S2', 'Billy', 'Kidd'),
('S3', 'Tony', 'Soprano'),
('S4', 'John', 'Cusamano'),
('S5', 'Artie', 'Bucco');

-- CREATE STUDENT STATUS TABLE 
CREATE TABLE Student_Status (
    Freshman VARCHAR(50),
    Sophomore VARCHAR(50),
    Junior VARCHAR(50),
    Senior VARCHAR(50)
);

-- INSERT VALUES IN THE STUDENT STATUS TABLE 
INSERT INTO Student_Status (Freshman, Sophomore, Junior, Senior) VALUES 
('Billy Kidd', NULL,NULL, NULL),
(NULL,'Artie Bucco',NULL,NULL),
(NULL,NULL,'Tony Soprano',NULL),
(NULL, NULL, NULL, 'Johnny Depp'),
(NULL, NULL, NULL, 'John Cusamano');

-- CREATE MAYOR TABLE 
CREATE TABLE Major (
    CourseID INT,
    CourseName VARCHAR(50),
    Credits INT,
    Program VARCHAR(50)
);

-- INSERT VALUES IN THE MAYOR TABLE 
INSERT INTO Major (CourseID, CourseName, Credits, Program) VALUES 
(1, 'History', 20, 'UnderGraduate'),
(2, 'English', 10, 'UnderGraduate'),
(3, 'Italian', 20, 'Doctorate'),
(4, 'Pool', 50, 'Doctorate'),
(5, 'French', 10, 'UnderGraduate');

-- CREATE PROGRAM TABLE 
CREATE TABLE Program (
    ProgramID INT,
    CourseName VARCHAR(50),
    CourseID INT
);

-- INSERT VALUES IN PROGRAM TABLE 
INSERT INTO Program (ProgramID, CourseName, CourseID) VALUES 
(1, 'History', 2),
(2, 'Italian', 3);

SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Student_Status;
SELECT * FROM  Major;
SELECT * FROM Program;
USE sakila;

SELECT COUNT(*) FROM rental;
--      
SELECT COUNT(*) FROM rental WHERE return_date IS NULL;
--    
SELECT COUNT(*) FROM rental WHERE return_date IS NOT NULL;
--
SELECT r.customer_id, r.rental_id, f.title 
FROM rental r 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id 
ORDER BY r.customer_id
LIMIT 5;

--        
SELECT r.customer_id, r.rental_id, f.title 
FROM rental r 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id 
WHERE return_date 
IS NULL ORDER BY customer_id
LIMIT 5;
--
SELECT * FROM actor WHERE first_name = 'Scarlett';
--
SELECT * FROM actor WHERE last_name = 'Johansson';
--
SELECT COUNT(DISTINCT last_name ) FROM actor;
--
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*)=1;
--
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) > 1;
--
SELECT a.first_name, a.last_name, COUNT(fa.actor_id) as total_films
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY total_films DESC
LIMIT 1;
--
SELECT inventory.store_id, film.title, inventory.inventory_id
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE title = 'ACADEMY DINOSAUR' AND store_id = 1;

--
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id) 
VALUES (NOW(), 1, 1, 1);
--
SELECT r.rental_date, ADDDATE(r.rental_date, interval f.rental_duration day) AS due_date 
FROM rental r 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id 
WHERE r.customer_id = 1
ORDER BY r.rental_date DESC
LIMIT 1;
--
SELECT AVG(length) FROM film;
--
SELECT c.name, AVG(f.length)
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

USE world;

--
SELECT ID, Name, Population FROM city LIMIT 10;
--

SELECT ID, Name, Population 
FROM city 
ORDER BY ID 
LIMIT 10 OFFSET 30;

--
SELECT Name, Population FROM city WHERE Population > 2000000;
--
SELECT Name FROM city WHERE Name LIKE  'Be%';

--
SELECT Name, Population FROM city WHERE Population BETWEEN 500000 AND 1000000;
--
SELECT Name FROM city ORDER BY Name ASC;
--
SELECT Name, Population FROM city ORDER BY Population ASC LIMIT 1;
--
SELECT country.Name, countrylanguage.Language 
FROM country 
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode 
WHERE Region = 'Caribbean';
--
SELECT country.Name, country.Capital, city.District 
FROM country 
JOIN city ON country.Capital = city.ID 
WHERE country.Name = 'Spain';
--
SELECT Name, LifeExpectancy FROM country ORDER BY LifeExpectancy DESC LIMIT 1;
--
SELECT city.Name, country.Continent 
FROM city 
JOIN country ON city.CountryCode = country.Code 
WHERE country.Continent = 'Europe';
--
UPDATE country SET HeadOfState = 'Joe Bidden' WHERE Code = 'USA';
--
SELECT LifeExpectancy, GNP, GNPOld,LocalName,GovernmentForm,HeadOfState,Capital,Code2 
FROM country WHERE Code = 'USA';
--
SELECT Name, Population FROM city ORDER BY Population DESC LIMIT 1;
--
SELECT Name, Population FROM city ORDER BY Population ASC LIMIT 1;
--
SELECT COUNT(*) FROM city;
--
SELECT COUNT(*) 
FROM city 
JOIN country ON city.CountryCode = country.Code 
WHERE country.Name = 'Ukraine';
