/*
  use the primes table to short cut processing
*/
declare @Target bigint = 600851475143,
	@Sqrt bigint


select @Sqrt = sqrt(@Target) /*largest factor has to be this or lower*/

select top 1 *
from
(
	/*
		get all of the modulus results of the primes <= @SQRT
	*/
	select 
		id,
		num,
		@Target % num as Md
	from dbo.Primes
	where Num <= @Sqrt
) a
where Md = 0
order by num desc
