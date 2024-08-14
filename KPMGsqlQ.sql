--Create table syntax
CREATE TABLE transactions_1308 
(transaction_id BIGINT, type VARCHAR(50),
amount INT,transaction_date DATE)

-- Insert data into the table
INSERT INTO transactions_1308 VALUES
(53151, 'deposit', 178, '2022-07-08'), 
(29776, 'withdrawal', 25, '2022-07-08'),
(16461, 'withdrawal', 45, '2022-07-08'),
(19153, 'deposit', 65, '2022-07-10'),
(77134, 'deposit', 32, '2022-07-10')
select * from transactions_1308;
--find running total on the transactions table. 
--A1
select *,sum(case when type='deposit' then amount else -amount end )over(order by (select null) rows between unbounded preceding and current row)
 as total_sum from transactions_1308 
--A2
