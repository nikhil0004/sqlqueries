create table numbers (n int);
insert into numbers values (1),(2),(3),(4),(5)
insert into numbers values (9)
Select * from numbers;

with recursive_cte as(
  select n,1 as num_counter from numbers--
union all
select n,num_counter+1 as num_counter from recursive_cte where num_counter+1<=n
  
)
select * from recursive_cte order by n;