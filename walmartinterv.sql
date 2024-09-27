CREATE TABLE transactions (
    product_id INT,
    user_id INT,
    spend DECIMAL(10, 2),
    transaction_date DATETIME
);

INSERT INTO transactions (product_id, user_id, spend, transaction_date)
VALUES
(3673, 123, 68.90, '2022-07-08 10:00:00'),
(9623, 123, 274.10, '2022-07-08 10:00:00'),
(1467, 115, 19.90, '2022-07-08 10:00:00'),
(2513, 159, 25.00, '2022-07-08 10:00:00'),
(1452, 159, 74.50, '2022-07-10 10:00:00'),
(1452, 123, 74.50, '2022-07-10 10:00:00'),
(9765, 123, 100.15, '2022-07-11 10:00:00'),
(6536, 115, 57.00, '2022-07-12 10:00:00'),
(7384, 159, 15.50, '2022-07-12 10:00:00'),
(1247, 159, 23.40, '2022-07-12 10:00:00');  
-- Walmart users' most recent transaction date, user ID, and the total number of products they purchased.
-- how to efficiently sort data in chronological order and calculate product counts based on user transactions.
with cte as(
select user_id ,transaction_date,dense_rank()over(partition by user_id order by transaction_date desc) as rank from transactions)
select user_id ,transaction_date,count(user_id) as productcount from cte where rank=1 group by user_id,transaction_date
