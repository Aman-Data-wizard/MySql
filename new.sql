CREATE TABLE student(
	student_id int primary key,
    student_name varchar(20),
    major varchar(20)
);

DESCRIBE student;
ALTER TABLE student ADD gpa decimal(3, 2);   #Three digits with 2 digts occuring after decimal

ALTER TABLE student DROP column gpa


