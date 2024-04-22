/*
  solved this by hand, basically for each number, reduce it to it's prime factors.  if the combo doesn't exist add it to the final product
*/
select *
from dbo.Primes
where num < 20
/*
	7
	8 = 2 * 2 * 2
	9 = 3 * 3
	10 = 2 * 5
		2 * 2 * 2 * 3 * 3 * 5 * 7 = 2520

	11
	13
	16 = 2 * 2 * 2 * 2
	17
	19

	2 * 2 * 2 * 2 * 3 * 3 * 5 * 7 * 11 * 13 * 17 * 19 = 232792560
*/
select 2 * 2 * 2 * 2 * 3 * 3 * 5 * 7 * 11 * 13 * 17 * 19
