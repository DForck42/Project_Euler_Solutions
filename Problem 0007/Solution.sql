SET NOCOUNT ON;
DROP TABLE IF EXISTS #Primes
GO

/*seed the table with the first 6 primes*/
CREATE TABLE #Primes
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Num int
)

INSERT INTO #Primes
(
    Num
)
VALUES
(2), (3), (5), (7), (11), (13)
GO

DECLARE @i INT,
	@Num int

SELECT @i = MAX(id) + 1,
	@Num = MAX(Num) + 2 FROM #Primes

WHILE (@i <= 10001)
BEGIN
	DECLARE @SQRT INT,
		@Cnt int
	SELECT @SQRT = SQRT(@Num)

	SELECT @Cnt = COUNT(*)
	FROM
    (
		SELECT 
			@Num % Num AS Md
		FROM #Primes
		WHERE Num <= @SQRT
	) a
	where md = 0

	if (@cnt = 0)
	BEGIN
		INSERT INTO #Primes
		(
		    Num
		)
		VALUES
		(@Num)
		SET @i = @i + 1
    end


	SET @Num = @Num + 2
END

SELECT TOP 1 *
FROM #Primes
ORDER BY ID DESC
