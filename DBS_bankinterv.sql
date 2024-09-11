create table sls_tbl1(
pid Int ,
sls_dt date,
sls_amt Int);


INSERT INTO sls_tbl1 (pid, sls_dt, sls_amt)
VALUES (201, '2024-07-11', 140), (201, '2024-07-18', 160), (201, '2024-07-25', 150), (201, '2024-08-01', 180), (201, '2024-08-15', 170), (201, '2024-08-29', 130)

select * from sls_tbl1;
-- Find the missing weeks in a table
--ans1
with cte as(
select sls_dt,DATEPART(WEEK,sls_dt) as week,lead(DATEPART(WEEK,sls_dt))over(order by (select null)) as leadflag from sls_tbl1)
select dateadd(week,1,sls_dt) as sls_dt from cte where (leadflag-week)>1;
--ans2
with cte as(
select sls_dt from sls_tbl1), 
recursive_cte as(
select min(sls_dt) as sls_dt from sls_tbl1
union all
select dateadd(week,1,sls_dt) as sls_dt  from recursive_cte where sls_dt<'2024-08-29')
select rc.sls_dt from recursive_cte rc left join cte c  on rc.sls_dt=c.sls_dt where c.sls_dt is null;