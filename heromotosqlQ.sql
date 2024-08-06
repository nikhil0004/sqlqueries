CREATE TABLE cards (card_number BIGINT)
INSERT INTO cards VALUES (1234567812345678),(2345678923456789),(3456789034567890)

CREATE TABLE Employee (employee_id INT,ename VARCHAR(50),salary INT)
INSERT INTO Employee VALUES (3, 'Bob', 60000),(4, 'Diana', 70000),(5, 'Eve', 60000),(6, 'Frank', 80000),(7, 'Grace', 70000),(8, 'Henry', 90000)

--1. We need to mask first 12 digits of card number.
--2. Need to select employee names with same salary.
select * from cards;
--Q1
select concat(replicate('*',12),right(card_number,4)) as right1 from cards;
--Q2
select e.ename from Employee e join Employee e1 on e.salary=e1.salary where e.ename!=e1.ename