;with
a as 
(
	select 
		ROW_NUMBER() over (order by object_id) as Num
	from sys.all_objects
) 
select 
	sum(NewNum)
from
(
	select 
		Num * 3 as NewNum
	from a
	where (Num * 3) < 1000

	union 

	select
		Num * 5 as NewNum
	from a
	where (Num * 5) < 1000
) b
