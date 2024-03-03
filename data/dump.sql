CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

TRUNCATE TABLE students;

INSERT INTO students (first_name, last_name) VALUES
('Moncef', 'Hassani'),
('Rudy', 'Bouiller');