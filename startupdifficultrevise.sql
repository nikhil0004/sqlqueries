create table events
(userid int , 
event_type varchar(20),
event_time datetime);

insert into events VALUES (1, 'click', '2023-09-10 09:00:00');
insert into events VALUES (1, 'click', '2023-09-10 10:00:00');
insert into events VALUES (1, 'scroll', '2023-09-10 10:20:00');
insert into events VALUES (1, 'click', '2023-09-10 10:50:00');
insert into events VALUES (1, 'scroll', '2023-09-10 11:40:00');
insert into events VALUES (1, 'click', '2023-09-10 12:40:00');
insert into events VALUES (1, 'scroll', '2023-09-10 12:50:00');
insert into events VALUES (2, 'click', '2023-09-10 09:00:00');
insert into events VALUES (2, 'scroll', '2023-09-10 09:20:00');
insert into events VALUES (2, 'click', '2023-09-10 10:30:00');

select * from events
--wrong
with cte as(
select * ,(((datepart(hour,event_time)*60)+datepart(minute,event_time))) as time_ref from events),cte1 as(
select* ,coalesce((case when (lead(time_ref) over (partition by userid order by event_time) -time_ref )>30 then event_time 
else lead(event_time)over( partition by userid order by userid) end ),event_time)as finished_time from cte),cte2 as(
select * ,(((datepart(hour,finished_time)*60)+datepart(minute ,finished_time))-time_ref) as time from cte1)
slect *,sum(time) as toral_duration,count(time) from cte2 group by 

--ans
with cte as (
select * ,lag(event_time,1,event_time) over(partition by userid order by event_time) as prev_event_time,
datediff(minute,lag(event_time,1,event_time) over(partition by userid order by event_time),event_time ) as time_diff from events ),cte1 as(
select* ,case when time_diff <=30 then 0 else 1 end as session_flag,sum(case when time_diff<=30 then 0 else 1 end)over(partition by userid order by event_time) as session_group  from cte)
select userid ,session_group ,min(event_time) as session_start_time ,max(event_time) as session_end_time ,count(*) as number_of_events 
,datediff(minute,min(event_time),max(event_time)) as session_duration from cte1 group by userid,session_group
order by userid,session_group