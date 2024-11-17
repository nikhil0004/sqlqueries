create table assessments
(
id int,
experience int,
sql int,
algo int,
bug_fixing int
)
delete from assessments
insert into assessments values 
(1,3,100,null,50),
(2,5,null,100,100),
(3,1,100,100,100),
(4,5,100,50,null),
(5,5,100,100,100)

delete from assessments
insert into assessments values 
(1,2,null,null,null),
(2,20,null,null,20),
(3,7,100,null,100),
(4,3,100,50,null),
(5,2,40,100,100);

--Ans1
select * from assessments;

with cte as(
select id,experience,case when sql is Null then 100 else sql end as sql1,
         case when algo is Null then 100 else algo end as algo1,
		 case when bug_fixing is Null then 100 else bug_fixing end as bug_fixing1 from assessments),cte2 as(
select experience  ,case when (sql1+algo1+bug_fixing1)=300 then 1 else 0 end as totalmarks_flag 
from cte)
select experience,sum(totalmarks_flag) as max_total,count(experience) as total_students from cte2 group by experience

--Ans2 by using pivot 