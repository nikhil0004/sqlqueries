CREATE TABLE friends (
    user_id INT,
    friend_id INT
);

-- Insert data into friends table
INSERT INTO friends VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(3, 4),
(4, 1),
(4, 3);

-- Create likes table
CREATE TABLE likes (
    user_id INT,
    page_id CHAR(1)
);

-- Insert data into likes table
INSERT INTO likes VALUES
(1, 'A'),
(1, 'B'),
(1, 'C'),
(2, 'A'),
(3, 'B'),
(3, 'C'),
(4, 'B');
select * from friends
select * from likes;
--determine the user_ids and corresponding page_ids of the pages liked by their friend but not by user itself
--sol1
with cte as(
select distinct f.user_id, l.page_id 
from friends f inner join likes l on f.user_id=l.user_id),cte2 as(
select distinct f.user_id,f.friend_id ,l.page_id 
from friends f inner join likes l on f.friend_id=l.user_id)
select distinct c2.user_id,c2.page_id from cte2 c2 left join cte c1 on c2.user_id=c1.user_id and c2.page_id=c1.page_id where c1.user_id is Null


--sol2
select distinct f.user_id,l.page_id from friends f inner join likes l on f.friend_id=l.user_id left join likes l1 on f.user_id=l1.user_id
and l.page_id=l1.page_id where l1.user_id is Null