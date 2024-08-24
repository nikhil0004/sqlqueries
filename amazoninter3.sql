-- You are working with a table called orders that tracks customer orders with their order dates and amounts. 

-- Write a query to find each customer’s latest order amount
-- along with the amount of the second latest order. 

-- Your output should be like 
-- customer_id, lastest_order_amount, second_lastest_order_amount    


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1, 101, '2024-01-10', 150.00),
(2, 101, '2024-02-15', 200.00),
(3, 101, '2024-03-20', 180.00),
(4, 102, '2024-01-12', 200.00),
(5, 102, '2024-02-25', 250.00),
(6, 102, '2024-03-10', 320.00),
(7, 103, '2024-01-25', 400.00),
(8, 103, '2024-02-15', 420.00);


select * from orders
with cte as(
select *,DENSE_RANK()over(partition by customer_id order by order_date desc) as rank from orders)
select customer_id ,max(case when rank=1 then order_amount end )as latest_order ,max(case when rank=2 then order_amount end )as secont_latest_order
from cte  group by customer_id