
-- Week 7 Assignment: Database Design and Normalization
-- Student Name: Jackson Lemuya Lodung
-- Date: 13/11/2026

-- ==========================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- ==========================================

CREATE DATABASE IF NOT EXISTS week7_assignment;
USE week7_assignment;

-- Create normalized Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

-- Create Courses table
CREATE TABLE StudentCourses (
    student_id INT,
    course_name VARCHAR(100),
    PRIMARY KEY (student_id, course_name),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert student records
INSERT INTO Students (student_id, student_name)
VALUES
(1, 'Jackson'),
(2, 'Mary'),
(3, 'John');

-- Insert course records
INSERT INTO StudentCourses (student_id, course_name)
VALUES
(1, 'Database Design'),
(1, 'Web Development'),
(2, 'Database Design'),
(2, 'Python Programming'),
(3, 'Web Development');

-- ==========================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- ==========================================

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    order_id INT,
    product_id INT,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert Orders records
INSERT INTO Orders (order_id, customer_name, order_date)
VALUES
(101, 'Jackson', '2026-11-10'),
(102, 'Mary', '2026-11-11'),
(103, 'John', '2026-11-12');

-- Insert OrderItems records
INSERT INTO OrderItems
(order_id, product_id, product_name, quantity, unit_price)
VALUES
(101, 1, 'Laptop', 2, 50000.00),
(101, 2, 'Mouse', 1, 1500.00),
(102, 1, 'Laptop', 1, 50000.00),
(102, 3, 'Keyboard', 2, 2500.00),
(103, 2, 'Mouse', 3, 1500.00);

-- ==========================================
-- CHECK YOUR RESULTS
-- ==========================================

SELECT * FROM Students;
SELECT * FROM StudentCourses;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
