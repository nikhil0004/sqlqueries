DROP TABLE IF EXISTS user_activity;
CREATE TABLE user_activity (
    user_id INT,
    login_date DATE
);



INSERT INTO user_activity (user_id, login_date) VALUES
(1, '2024-08-01'),
(1, '2024-08-02'),
(1, '2024-08-05'),
(1, '2024-08-07'),
(2, '2024-08-01'),
(2, '2024-08-02'),
(2, '2024-08-03'),
(2, '2024-08-04'),
(2, '2024-08-06'),
(3, '2024-08-01'),
(3, '2024-08-02'),
(3, '2024-08-03'),
(3, '2024-08-07'),
(4, '2024-08-02'),
(4, '2024-08-05'),
(4, '2024-08-07');

-- Given a user_activity table, write a SQL query to find all users who have logged in on at least 3 consecutive days.
with cte as(
select * ,day(lead(login_date)over(partition by user_id order by user_id) )-day(login_date)as tommdiffdate,
day(login_date)-day(lag(login_date)over(partition by user_id order by user_id) )as yesdiffdate from user_activity )
select user_id from cte where tommdiffdate in(1,Null) or yesdiffdate in(1,Null) group by user_id having count(user_id)>2

