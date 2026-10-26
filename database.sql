CREATE DATABASE IF NOT EXISTS student_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE student_db;

CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    course VARCHAR(100) NOT NULL
);

INSERT INTO students (name, email, course)
SELECT 'Rahul Sharma', 'rahul@gmail.com', 'BCA'
WHERE NOT EXISTS (
    SELECT 1 FROM students WHERE email = 'rahul@gmail.com'
);

INSERT INTO students (name, email, course)
SELECT 'Priya Singh', 'priya@gmail.com', 'MCA'
WHERE NOT EXISTS (
    SELECT 1 FROM students WHERE email = 'priya@gmail.com'
);
