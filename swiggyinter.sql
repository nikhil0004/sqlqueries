DROP TABLE IF EXISTS cinemas;
CREATE TABLE cinemas
    (id INT, seat_id INT);

INSERT INTO cinemas(id,seat_id)
VALUES
    (1,1),
    (2,0),
    (3,0),
    (4,1),
    (5,1),
    (6,1),
    (7,0);

-- Write a SQL query to find the id where the seat is empty
-- and both the seat immediately before and immediately after it are also empty


-- 1 ---> empty
-- 0 ---> full
with ctea as(
select * ,lag( seat_id ) over (order by id) as lagseat ,lead (seat_id) over (order by id) as leadseat from cinemas )
select * from ctea where lagseat=1 and leadseat=1
