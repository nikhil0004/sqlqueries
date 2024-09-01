CREATE TABLE job_listings (
    company_id INT,
    job_id INT,
    title VARCHAR(255),
    description TEXT
);
INSERT INTO job_listings (company_id, job_id, title, description) VALUES
(827, 248, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organisations.'),
(845, 149, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organisations.'),
(345, 945, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business customers and ways the data can be used to solve problems.'),
(345, 164, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business customers and ways the data can be used to solve problems.'),
(244, 172, 'Data Engineer', 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.');
select * from job_listings
--write a SQL query that identifies and counts the number of companies that have posted duplicate job listings.
-- Duplicate job Listings are those job postings that are from the same company (company_id) that have identical title . 
--ANS1
with cte as(
select *,lead(company_id) over(order by (select null)) as lead_company_id,
lead(title) over(order by (select null)) as lead_title,
lead(description) over(order by (select null)) as lead_description from job_listings)
select company_id,count(company_id) as duplicatejoblisting  from cte where company_id=lead_company_id and title=lead_title  group by company_id;

--ANS2
select company_id,(count(company_id)-1) as duplicate_job_listing from job_listings group by company_id,title having (count(company_id)-1) >0;