CREATE TABLE emps_tbl (emp_name VARCHAR(50), dept_id INT, salary INT);

INSERT INTO emps_tbl VALUES ('Siva', 1, 30000), ('Ravi', 2, 40000), ('Prasad', 1, 50000), ('Sai', 2, 20000), ('Anna', 2, 10000);


 select  distinct dept_id,first_value(emp_name) over (partition by dept_id order by salary) min_salary,
first_value(emp_name) over (partition by dept_id order by salary desc) max_salary
from emps_tbl 