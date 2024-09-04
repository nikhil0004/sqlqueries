
DROP TABLE IF EXISTS Employees1;
CREATE TABLE Employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);



INSERT INTO Employees1 (id, name, manager_id)
VALUES
    (1, 'Alice', NULL),
    (2, 'Bob', 1),
    (3, 'Charlie', 2),
    (4, 'David', 2),
    (5, 'Eve', 3),
    (6, 'Frank', 3),
    (7, 'Grace', 4);


SELECT * FROM Employees1

/*
Question:
You have a table called Employees with the following columns:
id: A unique number for each employee.
name: The name of the employee.
manager_id: The id of the employee’s manager (this can be NULL if the employee has no manager).

Write a SQL query to show each employee's name along with their level in the company hierarchy. 
The level should start at 1 for employees who don’t have a manager (they are at the top of the hierarchy).*/
with cte as(
select name,id,1 as level from Employees1 where manager_id is null--base memeber
union all
select e.name ,e.id,c.level+1 as level from Employees1 e inner join cte c on e.manager_id =c.id )
select * from cte 
