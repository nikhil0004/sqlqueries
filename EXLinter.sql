CREATE TABLE city_population (
    state VARCHAR(50),
    city VARCHAR(50),
    population INT
);

-- Insert the data
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'ambala', 100);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'panipat', 200);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'gurgaon', 300);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'amritsar', 150);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'ludhiana', 400);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'jalandhar', 250);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'mumbai', 1000);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'pune', 600);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'nagpur', 300);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'bangalore', 900);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mysore', 400);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mangalore', 200);
select * from city_population;
with cte as(
select state,min(population) as mincitypopulation ,max (population) as maxcitypopulation from city_population group by state)
select p.state ,min((case when c.mincitypopulation =p.population then city end ))as city_min_population ,max((case when c.maxcitypopulation =p.population then city end )) as city_max_population 
from cte c join city_population p on c.state=p.state group by p.state;