DROP TABLE IF EXISTS sales;
CREATE TABLE sales (id Int,
    sale_date DATE,
    sale_amount DECIMAL(10, 2)
);

DELETE FROM sales;  -- Clear the table to avoid duplicates

INSERT INTO sales (id ,sale_date, sale_amount) VALUES
(1,'2024-06-01', 100.00),
(2,'2024-06-02', 150.00),
(3,'2024-07-03', 200.00),
(4,'2024-07-04', 180.00),
(5,'2024-07-05', 120.00),
(6,'2024-07-08', 130.00),
(7,'2024-07-09', 170.00),
(8,'2024-07-10', 210.00),
(9,'2024-07-11', 190.00),
(10,'2024-07-12', 200.00),
(11,'2024-07-13', 150.00),--saturday
(12,'2024-07-14', 180.00), -- Sunday
(13,'2024-07-15', 220.00),
(14,'2024-07-16', 250.00),
(15,'2024-07-17', 230.00),
(16,'2024-07-18', 210.00),
(17,'2024-07-19', 200.00),
(18,'2024-07-20', 240.00), -- Saturday
(19,'2024-07-21', 260.00), -- Sunday
(20,'2024-07-22', 230.00),
(21,'2024-07-23', 210.00),
(22,'2024-07-24', 180.00),
(23,'2024-07-25', 220.00),
(24,'2024-07-26', 250.00),
(25,'2024-07-27', 270.00), -- Saturday
(26,'2024-07-28', 280.00), -- Sunday
(27,'2024-07-29', 230.00),
(28,'2024-07-30', 210.00),
(29,'2024-07-31', 180.00);



SELECT * FROM sales;


-- -- Question:
-- You have a table of daily sales data of Amazon. Write a query to:
-- Find the total sales for each weekend day (Saturday and Sunday) in July 2024.
with cte as(
select  *,datename(weekday,sale_date) as weekday, month(sale_date) as month from sales ) 
select weekday,sum(sale_amount) as total_sales from cte where month =7  and weekday in ('saturday','sunday') group by weekday
