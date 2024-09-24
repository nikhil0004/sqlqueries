CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    user_id INT,
    submit_date DATE,
    restaurant_id INT,
    rating INT
);
INSERT INTO reviews (review_id, user_id, submit_date, restaurant_id, rating) VALUES
(1001, 501, '2022-01-15', 101, 4),
(1002, 502, '2022-01-20', 101, 5),
(1003, 503, '2022-01-25', 102, 3),
(1004, 504, '2022-01-15', 102, 4),
(1005, 505, '2022-02-20', 101, 5),
(1006, 506, '2022-02-26', 101, 4),
(1007, 507, '2022-03-01', 101, 4),
(1008, 508, '2022-03-05', 102, 2);
select * from reviews
--Q )we will calculate the average rating for each restaurant for each month. 
--We'll be using Zomato's review data to calculate the average rating for each restaurant on a monthly basis. 
with cte as(
select user_id,submit_date,month(submit_date) as month,restaurant_id,rating from reviews),cte2 as(
select * ,count(month)over(partition by month,restaurant_id order by month) as no from cte)
select month ,restaurant_id,round(avg(1.0*rating),1) as avg_rating from cte2 where no >=2 group by month,restaurant_id

