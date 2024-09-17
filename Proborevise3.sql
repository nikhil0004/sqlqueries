create table polls
(
user_id varchar(4),
poll_id varchar(3),
poll_option_id varchar(3),
amount int,
created_date date
)
-- Insert sample data into the investments table
INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date) VALUES
('id1', 'p1', 'A', 200, '2021-12-01'),
('id2', 'p1', 'C', 250, '2021-12-01'),
('id3', 'p1', 'A', 200, '2021-12-01'),
('id4', 'p1', 'B', 500, '2021-12-01'),
('id5', 'p1', 'C', 50, '2021-12-01'),
('id6', 'p1', 'D', 500, '2021-12-01'),
('id7', 'p1', 'C', 200, '2021-12-01'),
('id8', 'p1', 'A', 100, '2021-12-01'),
('id9', 'p2', 'A', 300, '2023-01-10'),
('id10', 'p2', 'C', 400, '2023-01-11'),
('id11', 'p2', 'B', 250, '2023-01-12'),
('id12', 'p2', 'D', 600, '2023-01-13'),
('id13', 'p2', 'C', 150, '2023-01-14'),
('id14', 'p2', 'A', 100, '2023-01-15'),
('id15', 'p2', 'C', 200, '2023-01-16');

create table poll_answers
(
poll_id varchar(3),
correct_option_id varchar(3)
)

-- Insert sample data into the poll_answers table
INSERT INTO poll_answers (poll_id, correct_option_id) VALUES
('p1', 'C'),('p2', 'A');
select * from polls
select * from poll_answers

with cte as(select p.*,case when pa.poll_id is not null then amount end as correct_user_id_amount,
         sum(case when pa.poll_id is not null then amount end)over(partition by p.poll_id) as correct_users_total_amount,
		 sum(case when pa.poll_id is null then amount end)over(partition by p.poll_id) as incorrect_users_total_amount
from polls p
left join poll_answers pa
on p.poll_id=pa.poll_id and p.poll_option_id=pa.correct_option_id)
select poll_id,user_id,(correct_user_id_amount*1.0/correct_users_total_amount)*incorrect_users_total_amount as amount_win
from cte
where correct_user_id_amount is not null;