create database libManagement;
use libManagement;

CREATE table Books (
    book_id int primary key,
    title varchar(70),
    author varchar(70),
    publication_year int,
    genre varchar(30),
    available_copies int
);

CREATE table Students (
    student_id int primary key,
    student_name varchar(30),
    email_id varchar(50) UNIQUE,
    course varchar(30)
);

CREATE table IssuedBooks (
    issue_id int primary key,
    student_id int,
    book_id int,
    issue_date date,
    return_date date,
    foreign key (student_id) references Students(student_id),
    foreign key (book_id) references Books(book_id)
);


insert into Books (book_id, title, author, publication_year, genre, available_copies) values
(1, 'The Hidden Dimensions', 'Edward T. Hall', 1966, 'Psychology', 5),
(2, 'The Power of Habit', 'Charles Duhigg', 2012, 'psychology', 4),
(3, 'Influence: The Psychology of Persuasion', 'Robert Cialdini', 1984, 'psychology', 6),
(4, 'The Psychology of Money', 'Morgan Housel', 2020, 'psychology', 3),
(5, 'Predictably Irrational', 'Dan Ariely', 2008, 'psychology', 2);


insert into students (student_id, student_name, email_id, course) values
(101, 'A', 'a@example.com', 'Psychology'),
(102, 'B', 'b@example.com', 'Psycholog'),
(103, 'C', 'c@example.com', 'Psycholog'),
(104, 'D', 'd@example.com', 'Psycholog'),
(105, 'E', 'e@example.com', 'Psycholog');


insert into issuedbooks (issue_id, student_id, book_id, issue_date, return_date) values
(1, 101, 2, '2025-02-01', '2025-02-15'),
(2, 102, 4, '2025-02-02', '2025-02-16'),
(3, 103, 1, '2025-02-03', '2025-02-17'),
(4, 104, 3, '2025-02-04', '2025-02-18'),
(5, 105, 5, '2025-02-05', '2025-02-19');

select * from Books,students,issuedbooks;
select * from students;
