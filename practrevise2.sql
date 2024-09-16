create table Alphabetwords(letter_word varchar(10))

insert into Alphabetwords values ('D'),('A'), ('B'), ('C'), ('E'),  ('Elephant'),('Apple'),('Cat'), ('Donkey'), ('Ball')
--Align alphabet into words 
--Approach 1
with cte as(
select letter_word as alphabet,rank() over(order by letter_word) as rank from Alphabetwords where len(letter_word)=1),cte2 as(
select letter_word as word ,rank() over(order by letter_word) as rank from Alphabetwords where len (letter_word)>1)
select c.alphabet ,c2.word from cte c join cte2 c2 on c.rank =c2.rank
--Approach 2
SELECT a.letter_word AS Alphabet, b.letter_word AS Word
FROM Alphabetwords a
JOIN Alphabetwords b
ON a.letter_word = SUBSTRING(b.letter_word,1,1) AND LEN(a.letter_word) < LEN(b.letter_word)-- condition on 'on'statement 
ORDER BY a.letter_word