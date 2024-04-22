set nocount on;
drop table if exists dbo.Fibonacci
go

/*
	create the table and add the initial seed values
*/
create table dbo.Fibonacci
(
	ID int not null identity(1, 1) primary key,
	Num int not null,
)


insert into dbo.Fibonacci
(
	Num
)
values (1), (2)
go


/*
	loop to generate all of the terms <= 4M
*/
declare @i int,
	@num int

select top 1 
	@i = ID,
	@num = Num
from dbo.Fibonacci
order by id desc


while (@num < 4000000)
begin
	
	select 
		@Num = sum(Num)
	from dbo.Fibonacci
	where ID in (@i, @i - 1)

	insert into dbo.Fibonacci
	(
		Num
	)
	values (@Num)

	set @i = @i + 1
end


/*
	sum all of the terms that are even and <4M
*/
select sum(num)
from dbo.Fibonacci
where Num <= 4000000
	and num % 2 = 0
