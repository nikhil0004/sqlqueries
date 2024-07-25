DROP TABLE IF EXISTS amazon_sales;
-- Create the amazon_sales table
CREATE TABLE amazon_sales (
    customer_id INT,
    purchase_date DATE,
    amount FLOAT
);

-- Insert sample data into the amazon_sales table
INSERT INTO amazon_sales (customer_id, purchase_date, amount) VALUES
(1, '2024-01-15', 150.0),
(1, '2024-02-10', 200.0),
(1, '2024-03-05', 300.0),
(1, '2024-04-01', 400.0),
(1, '2024-03-05', 350.0),
(1, '2024-04-04', 650.0),
(1, '2024-05-11', 500.0),
(1, '2024-06-01', 600.0),
(1, '2024-07-01', 700.0),
(2, '2023-01-20', 250.0),
(2, '2022-02-15', 350.0),
(2, '2024-03-10', 450.0),
(2, '2024-04-05', 550.0),
(2, '2024-04-08', 650.0),
(2, '2024-04-03', 350.0),
(2, '2024-05-12', 650.0),
(2, '2024-06-15', 750.0),
(2, '2024-07-10', 850.0),
(3, '2024-03-12', 500.0),
(3, '2024-04-25', 600.0),
(3, '2024-05-18', 700.0),
(3, '2024-06-22', 800.0),
(3, '2024-07-15', 900.0),
(4, '2024-01-30', 800.0),
(4, '2024-02-28', 900.0),
(4, '2024-03-20', 1000.0),
(4, '2024-04-15', 1100.0),
(4, '2024-05-10', 1200.0),
(4, '2024-06-05', 1300.0),
(4, '2024-07-01', 1400.0),
(5, '2024-01-15', 2200.0),
(5, '2024-02-10', 2300.0),
(5, '2024-03-05', 2400.0),
(5, '2024-04-01', 2500.0),
(5, '2024-05-15', 2600.0),
(5, '2024-06-10', 2700.0),
(5, '2024-07-10', 2200.0);


SELECT * FROM amazon_sales; 
with cte as(
select customer_id,coalesce(datediff(month,purchase_date ,lead(purchase_date)over(partition by customer_id order by purchase_date)),1) as monthdiff ,year(purchase_date)  as year from amazon_sales )
select customer_id from cte  where year='2024'and monthdiff != 0 group by customer_id having count(monthdiff)= 7 order by customer_id 