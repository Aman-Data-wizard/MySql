CREATE TABLE student (
    student_id INT,
    student_name VARCHAR(20) NOT NULL,
    major VARCHAR(20) default 'undecided'
);
DROP TABLE student;
DESCRIBE student;  

-- Modify table
ALTER TABLE student ADD gpa DECIMAL(3, 2);
ALTER TABLE student DROP COLUMN gpa;

-- Insert statements
INSERT INTO student(student_id, student_name) VALUES (1, 'Jack');
INSERT INTO student(student_id, student_name, major)value(2, 'Drogba', 'Biology');
INSERT INTO student(student_id, student_name, major)VALUES (3, 'Kate', 'Geology'); 
INSERT INTO student(student_id, student_name, major)VALUES (4, 'Jules', 'Biology');
INSERT INTO student(student_id, student_name, major)VALUES (5, 'Mike', 'Computer Science');

-- View data
SELECT * FROM student;