CREATE TABLE data_raw (
    Id INT,
    Name VARCHAR(512),
    Email VARCHAR(512)
);
 
INSERT INTO data_raw (Id, Name, Email) VALUES ('1', 'Ravi Krishan', '_ravi_krishan@abc.com"');
INSERT INTO data_raw (Id, Name, Email) VALUES ('2', 'Ranjan', '_ranjan_123@abc.com"');
INSERT INTO data_raw (Id, Name, Email) VALUES ('3', 'Sonali Gupta', '_sonali_gupta_1@abc.com"');
INSERT INTO data_raw (Id, Name, Email) VALUES ('4', 'Dines Gupta', '_Dinesh_gupta_9@xyz.com"');
select * from data_raw

--we need to remove special character from start and end of the email but not between
--Ans
with cte as(
select Email,stuff(Email,charindex('_',Email,0),1,'') as email_new from data_raw)
select * ,replace(email_new,'"','') as new_email from cte 