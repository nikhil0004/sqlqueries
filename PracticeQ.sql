DROP TABLE IF EXISTS Users32;
CREATE TABLE Users32 (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    mail VARCHAR(100)
);


INSERT INTO Users32 (user_id, name, mail) VALUES
(1, 'Winston', 'winston@ymail.com'),
(2, 'Jonathan', 'jonathanisgreat'),
(3, 'Annabelle', 'bella-@ymail.com'),
(4, 'Sally', 'sally.come@ymail.com'),
(5, 'Marwan', 'quarz#2020@ymail.com'),
(6, 'David', 'john@gmail.com'),
(7, 'David', 'sam25@gmail.com'),
(8, 'David', 'david69@gmail.com'),
(9, 'Shapiro', '.shapo@ymail.com');


-- Write SQL Query to find users whose email addresses contain only lowercase letters before the @ symbol
select * from users32;

SELECT *
FROM users32
WHERE mail LIKE '%@[a-z.0-9-]%' 




SELECT * FROM users32
WHERE mail like '%[a-z.0-9._]%@[a-zA-Z]%.%[a-zA-Z]%';
