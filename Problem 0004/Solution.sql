drop table if exists dbo.Palindromes
go

/*
	create the table of results we need to look through
*/
create table dbo.Palindromes
(
	ID int identity(1, 1),
	Num varchar(10)
)

;with a as
(
	select 
		ROW_NUMBER() over (order by object_id) + 99 as Num
	from sys.all_objects
),
b as 
(
	select 
		num
	from a
	where num < 1000
)
insert into dbo.Palindromes
(
	Num
)

select distinct
	b1.num * b2.num
from b as b1, b as b2
go

/*
	longest value is 6 characters long, let's look in those first
*/
select top 1
	Num
from
(
	select 
		Num,
		SUBSTRING(Num, 1, 1) as a,
		SUBSTRING(Num, 2, 1) as b,
		SUBSTRING(Num, 3, 1) as c,
		SUBSTRING(Num, 4, 1) as d,
		SUBSTRING(Num, 5, 1) as e,
		SUBSTRING(Num, 6, 1) as f
	from dbo.palindromes
	where len(num) = 6
) split
where a = f	
	and b = e
	and c = d
order by Num desc
