CREATE TABLE emp(
name varchar(50),
dept varchar(50),
salary varchar(50))
INSERT INTO emp VALUES
('Virat','IT',8000),
('Rohit','IT',7500),
('Pant','Finance',7000),
('Rahul','Finance',6000),
('Rinku','HR',4000),
('Rinku','HR',4000),
('Bumrah','Admin',7000),
('Shami','Admin',6000)
select * from emp

--Q1
--get the highest salary employee details from each department
select name, dept ,salary from emp where salary in 
(select max(salary )as salary from emp group by dept)
--Q2
--delete the duplicate data from a table which doesn't have any primary key
select * from emp;


with cte as(
select * ,dense_rank() over(partition by dept order by salary) as dense_salary
from emp ),CTE2 as(
select * ,lead(dense_salary)over (partition by dept order by salary ) as lead from cte)
delete from CTE2 where dense_salary = lead