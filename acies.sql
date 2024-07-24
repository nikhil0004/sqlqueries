CREATE TABLE swipe (
    employee_id INT,
    activity_type VARCHAR(10),
    activity_time datetime
);

-- Insert sample data
INSERT INTO swipe (employee_id, activity_type, activity_time) VALUES
(1, 'login', '2024-07-23 08:00:00'),
(1, 'logout', '2024-07-23 12:00:00'),
(1, 'login', '2024-07-23 13:00:00'),
(1, 'logout', '2024-07-23 17:00:00'),
(2, 'login', '2024-07-23 09:00:00'),
(2, 'logout', '2024-07-23 11:00:00'),
(2, 'login', '2024-07-23 12:00:00'),
(2, 'logout', '2024-07-23 15:00:00'),
(1, 'login', '2024-07-24 08:30:00'),
(1, 'logout', '2024-07-24 12:30:00'),
(2, 'login', '2024-07-24 09:30:00'),
(2, 'logout', '2024-07-24 10:30:00');
select * from swipe
--to find hours the employee in office and how musch they work
with cte as(
select * ,cast(activity_time as date) as activitydate,lead(activity_time)over(partition by employee_id,cast(activity_time as date)  order by activity_time) as leaddate
from swipe)
select employee_id,activitydate,
datediff(hour,min(activity_time),max(leaddate)) as totalhours
,sum(datediff(hour,activity_time,leaddate)) as insidehours
from cte where activity_type='login'
group by employee_id,activitydate

 