DROP TABLE IF EXISTS #Squares
GO

;WITH n AS
(
	SELECT 
		ROW_NUMBER() OVER (ORDER BY object_id) AS NUM
	FROM sys.all_objects
)

SELECT 
	a.NUM,
	NumSquare
INTO #Squares
FROM
(
	SELECT 
		n.NUM,
		n.NUM * n.Num AS NumSquare
	FROM n
	WHERE NUM <= 1000
) a


SELECT 
	ss.NUM_A * ss.NUM_B * c.NUM
FROM
(
	SELECT 
		a.NUM AS NUM_A,
		b.NUM as NUM_B,
		a.NumSquare + b.NumSquare AS SquareSum
	FROM #Squares a, #Squares b
	WHERE a.NUM < b.NUM
		AND a.NUM + b.NUM <= 1000
) ss
	INNER JOIN #Squares c
		ON ss.SquareSum = c.NumSquare
WHERE ss.NUM_B < c.NUM
	AND ss.NUM_A + ss.NUM_B + c.NUM = 1000
