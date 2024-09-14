CREATE TABLE UserVisits (
    user_id INT,
    visit_date DATE
);

-- Insert the provided data into the UserVisits table
INSERT INTO UserVisits (user_id, visit_date)
VALUES 
(1, '2020-11-28'),
(1, '2020-10-20'),
(1, '2020-12-03'),
(2, '2020-10-05'),
(2, '2020-12-09'),
(3, '2020-11-11');
select * from UserVisits
--Q
--Assume today date is '2021-1-1'
--WRITE AN SQL QUERY THAT WILL ,FOR EACH USER_ID,FIND OUT LARGEST WINDOW OF DAYS BETWEEN EACH VISIT AND RIGHT AFTER IT (OR TODAY YOU ARE CONSIDERING THE LAST VISIT)
--RETURN THE TABLE ORDERED BY USER_ID 
--approach
with cte as(
select * ,coalesce(lead(visit_date)over(partition by user_id order by user_id,visit_date),'2021-01-01')as leadrefflag from UserVisits),cte2 as(
select *, datediff(day,visit_date,leadrefflag)  as day_diff from cte )
select user_id ,max(day_diff)as largestgap from cte2 group by user_id

