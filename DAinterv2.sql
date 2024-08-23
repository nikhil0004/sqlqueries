DROP TABLE IF EXISTS activity;
CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type VARCHAR(10),
    timestamp FLOAT
);


INSERT INTO Activity (machine_id, process_id, activity_type, timestamp)
VALUES
(1, 1, 'start', 10.5),
(1, 1, 'end', 15.0),
(1, 2, 'start', 20.0),
(1, 2, 'end', 25.5),
(2, 1, 'start', 5.0),
(2, 1, 'end', 12.5),
(2, 2, 'start', 15.0),
(2, 2, 'end', 20.0);
select * from Activity
--write sql query to fing average processing time by each machine
with cte as(
select * ,lead(timestamp)over (partition by machine_id ,process_id order by machine_id,process_id) as leadtimestamp from Activity )
select machine_id,avg(leadtimestamp) as average_machinetime from cte where activity_type='start' group by machine_id,process_id