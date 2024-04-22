;WITH a AS
(
	SELECT 
		ROW_NUMBER() OVER (ORDER BY object_id) AS Num
	FROM sys.all_objects
),
b AS
(
	SELECT 
		Num,
		Num * Num AS SqNum
	FROM a
	WHERE Num <= 100
)

SELECT 
	(SUM(b.Num) * SUM(b.Num)) - SUM(b.SqNum)
FROM b
