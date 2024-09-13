
CREATE TABLE tweet_data (
    user_id INT,
    tweet_date DATETIME,
    tweet_count INT
);

INSERT INTO tweet_data (user_id, tweet_date, tweet_count)
VALUES
(111, '2022-06-01 00:00:00', 2),
(111, '2022-06-02 00:00:00', 1),
(111, '2022-06-03 00:00:00', 3),
(111, '2022-06-04 00:00:00', 4),
(111, '2022-06-05 00:00:00', 5),
(111, '2022-06-06 00:00:00', 4),
(111, '2022-06-07 00:00:00', 6),
(199, '2022-06-01 00:00:00', 7),
(199, '2022-06-02 00:00:00', 5),
(199, '2022-06-03 00:00:00', 9),
(199, '2022-06-04 00:00:00', 1),
(199, '2022-06-05 00:00:00', 8),
(199, '2022-06-06 00:00:00', 2),
(199, '2022-06-07 00:00:00', 2),
(254, '2022-06-01 00:00:00', 1),
(254, '2022-06-02 00:00:00', 1),
(254, '2022-06-03 00:00:00', 2),
(254, '2022-06-04 00:00:00', 1),
(254, '2022-06-05 00:00:00', 3),
(254, '2022-06-06 00:00:00', 1),
(254, '2022-06-07 00:00:00', 3);


select * from tweet_data
--Three Days Rolling Average

with cte as(
select * ,sum(tweet_count)over(partition by user_id order by tweet_date rows BETWEEN 2 preceding and current row) as average,
count(tweet_count)over(partition by user_id order by tweet_date rows BETWEEN 2 preceding and current row) as count from tweet_data)
select user_id,tweet_date,round((average*1.0/count),2) as rollaverage from cte;
