-- Database: Practice

-- DROP DATABASE IF EXISTS "Practice";

create table student
(
user_id integer,
user_name character varying(30),
email character varying(50));

insert into student values('1','Sumit','sumit@gmail.com'),
('2','Reshma','reshma@gmail.com'),
('3','Farhana','farhana@gmail.com'),
('4','Robin','robin@gmail.com'),
('5','Robin','robin@gmail.com');
select * from student;

select min(ctid) from student group by user_name;