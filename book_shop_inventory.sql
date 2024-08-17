CREATE DATABASE book_shop_inventory_management;

USE  book_shop_inventory_management;
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(20),
    cust_city VARCHAR(20),
    cust_street VARCHAR(20),
    email VARCHAR(60),
    cust_mobno BIGINT
);

CREATE TABLE payment (
    pay_id INT PRIMARY KEY,
    mode_of_payment VARCHAR(20)
);

CREATE TABLE receipt (
    r_id INT PRIMARY KEY,
    b_name VARCHAR(30),
    pay_id INT,
    FOREIGN KEY (pay_id) REFERENCES payment(pay_id)
);

CREATE TABLE publisher (
    p_name VARCHAR(20),
    p_id INT PRIMARY KEY,
    p_city VARCHAR(20),
    p_street VARCHAR(20),
    p_email VARCHAR(60), -- Changed to VARCHAR(60) to match the length in the Customer table
    p_mobno BIGINT
);

CREATE TABLE author (
    a_name VARCHAR(20),
    a_id INT PRIMARY KEY,
    a_city VARCHAR(20),
    a_street VARCHAR(20),
    a_mobno BIGINT
);

CREATE TABLE books (
    b_name VARCHAR(200),
    ISBN BIGINT PRIMARY KEY,
    quantity INT,
    price INT,
    type_of_book VARCHAR(20),
    title VARCHAR(20)
);
ALTER TABLE books MODIFY COLUMN title VARCHAR(200);
ALTER TABLE books MODIFY COLUMN b_name VARCHAR(200);




-- Insert data into the customer table
INSERT INTO customer VALUES (1, 'Geeta', 'Pune', 'FCroad', 'geeta@gmail.com', 8986755879);
INSERT INTO customer VALUES (2, 'Ankita', 'Solapur', 'Bale', 'ankita11@gmail.com', 9878700921);
INSERT INTO customer VALUES (3, 'Riya', 'Mumbai', 'Vasai', 'riya@gmail.com', 934463789);
INSERT INTO customer VALUES (4, 'Sita', 'Pune', 'Katraj', 'sita@gmail.com', 7676654132);
INSERT INTO customer VALUES (5, 'Priti', 'Pune', 'MGroad', 'priti@gmail.com', 8945465543);
INSERT INTO customer VALUES (6, 'John', 'New York', 'Broadway', 'john@gmail.com', 1234567890);
INSERT INTO customer VALUES (7, 'Amit', 'Delhi', 'Connaught Place', 'amit@gmail.com', 9876543210);
INSERT INTO customer VALUES (8, 'Katie', 'Los Angeles', 'Hollywood Blvd', 'katie@gmail.com', 5551234567);
INSERT INTO customer VALUES (9, 'David', 'San Francisco', 'Market Street', 'david@gmail.com', 3337779999);
INSERT INTO customer VALUES (10, 'Sophia', 'London', 'Oxford Street', 'sophia@gmail.com', 447701234567);

-- Insert data into the payment table
INSERT INTO payment VALUES (101, 'credit');
INSERT INTO payment VALUES (102, 'debit');
INSERT INTO payment VALUES (103, 'debit');
INSERT INTO payment VALUES (104, 'credit');
INSERT INTO payment VALUES (105, 'credit');
INSERT INTO payment VALUES (106, 'debit');
INSERT INTO payment VALUES (107, 'credit');
INSERT INTO payment VALUES (108, 'debit');
INSERT INTO payment VALUES (109, 'credit');
INSERT INTO payment VALUES (110, 'debit');

-- Insert data into the receipt table
INSERT INTO receipt VALUES (114, 'Java Programming', 101);
INSERT INTO receipt VALUES (224, 'Let Us C', 102);
INSERT INTO receipt VALUES (233, 'Let Us C++', 104);
INSERT INTO receipt VALUES (431, 'Thinking in Java', 103);
INSERT INTO receipt VALUES (455, 'Java: The Complete Reference', 103);
INSERT INTO receipt VALUES (112, 'Python for Data Science', 105);
INSERT INTO receipt VALUES (222, 'SQL Fundamentals', 101);
INSERT INTO receipt VALUES (325, 'JavaScript:Definitive Guide', 102);
INSERT INTO receipt VALUES (432, 'Machine Learning with Python', 104);
INSERT INTO receipt VALUES (545, 'HTML and CSS: Design and Build Websites', 101);

-- Insert data into the publisher table
INSERT INTO publisher VALUES ('Mark Lasoff', 222, 'Delhi', 'Rafi Marg', 'mark@gmail.com', 8112345654);
INSERT INTO publisher VALUES ('BPB Publication', 323, 'Kolkata', 'Park Street', 'bpb@gmail.com', 9454567112);
INSERT INTO publisher VALUES ('Addison Wesley', 333, 'UK', 'Deansgate', 'addison@gmail.com', 7321908112);
INSERT INTO publisher VALUES ('Prentice Hall', 3789, 'Moscow', 'Arbat Street', 'prentice@gmail.com', 208976565);
INSERT INTO publisher VALUES ('BPB Publication', 4444, 'Singapore', 'Adam Road', 'bpb111@gmail.com', 9871123173);

-- Insert data into the author table
INSERT INTO author VALUES ('Yashwant K', 3030, 'Nagpur', 'Kuhi', 8667834898);
INSERT INTO author VALUES ('McGraw Hill', 5656, 'Boston', 'Beacon Street', 7778389899);
INSERT INTO author VALUES ('Katty Sierra', 8080, 'Glenwood', 'Scott St', 9234534524);
INSERT INTO author VALUES ('Bruce Eckel', 9090, 'Abington', 'Mount Carvel Awe', 7667838903);


-- Insert data into the books table
INSERT INTO books VALUES ('Java Programming', 6767543433, 3, 790, 'Programming', 'Programming in Java');
INSERT INTO books VALUES ('Thinking in Java', 786540098, 7, 410, 'Programming', 'Introduction to Java Programming');
INSERT INTO books VALUES ('Java', 7877878998, 90, 700, 'Programming', 'The Complete Reference');
INSERT INTO books VALUES ('Let Us C', 9897787634, 2, 315, 'Programming', 'Introduction to C');
INSERT INTO books VALUES ('Java:The Complete Reference', 9998887771, 5, 600, 'Programming', 'Java Mastery');
INSERT INTO books VALUES ('Python for Data Science', 8887776662, 8, 500, 'Programming', 'Python Essentials');
INSERT INTO books VALUES ('HTML and CSS: Design and Build Websites', 7776665553, 10, 400, 'Web Development', 'Web Design Basics');
INSERT INTO books VALUES ('SQL Fundamentals', 5554443334, 6, 350, 'Databases', 'SQL for Beginners');
INSERT INTO books VALUES ('Machine Learning with Python', 4443332225, 4, 700, 'Programming', 'Introduction to Machine Learning');

SELECT cust_id, cust_name, cust_city FROM customer;

SELECT b.b_name, b.price
FROM books b
WHERE b.price = (SELECT MAX(price) FROM books);

SELECT * FROM customer WHERE cust_city = 'Pune' AND cust_mobno LIKE '8%';

SELECT * FROM books WHERE b_name IN (SELECT b_name FROM publisher WHERE p_name = 'BPB Publication');

SELECT DISTINCT c.cust_id, c.cust_name FROM customer c
JOIN receipt r ON c.cust_id = r.pay_id;

-- Create a stored procedure with an IF statement
DELIMITER //
CREATE PROCEDURE ExampleProcedure()
BEGIN
    DECLARE total_books INT;
    
    -- Get the total quantity of books in stock
    SELECT SUM(quantity) INTO total_books FROM books;
    
    -- Check if the total quantity is greater than a threshold
    IF total_books > 20 THEN
        SELECT 'There are many books in stock';
    ELSE
        SELECT 'Stock is low';
    END IF;
    
END //
DELIMITER ;

CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    quantity INT
);


-- Call the stored procedure
CALL ExampleProcedure();

CREATE VIEW CreditCardCustomers AS
SELECT c.cust_name, c.email
FROM customer c
JOIN receipt r ON c.cust_id = r.pay_id
JOIN payment p ON r.pay_id = p.pay_id
WHERE p.mode_of_payment = 'credit'; -- Removed any hidden characters or spaces

SELECT * FROM CreditCardCustomers;

CREATE VIEW ReceiptInfo AS
SELECT r_id, b_name, pay_id
FROM receipt;

SELECT * FROM ReceiptInfo 


DELIMITER //
CREATE TRIGGER books_after_insert
AFTER INSERT ON books
FOR EACH ROW
BEGIN
    INSERT INTO some_other_table (column1, column2)
    VALUES (NEW.b_name, NEW.ISBN); 
END;
//
DELIMITER ;

SELECT * FROM books
LIMIT 0, 400;







