select * from Books,students,issuedbooks;
select * from students;
select * from issuedbooks;

select * from Books where title = 'The Hidden Dimensions';
select genre, sum(available_copies) as totalavailable from books group by genre;

select students.student_name, Books.title, issuedbooks.issue_date from issuedbooks 
join students on issuedbooks.student_id = students.student_id 
join books on issuedbooks.issue_id = books.book_id
where issuedbooks.return_date is null;