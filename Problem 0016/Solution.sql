DECLARE @num VARCHAR(MAX) = '1',
	@NewNum VARCHAR(MAX) = ''


DECLARE @j INT = 1

WHILE (@j <= 1000)
begin

	DECLARE @Len INT,
		@i INT = 1,
		@Remainder INT = 0

	SELECT @Len = LEN(@num)

	WHILE (@i <= @Len)
	BEGIN
		DECLARE @CurrentNum INT,
			@NewDigit int
		--PRINT '------'

		SELECT @CurrentNum = SUBSTRING(@num, @i, 1)
		--print CONCAT('CurrentNum: ', @CurrentNum)

		SET @NewDigit = (@CurrentNum * 2) + @Remainder
	

		IF (@NewDigit >= 10)
		BEGIN
			SELECT @Remainder = (@NewDigit - ( @NewDigit % 10)) / 10
			SELECT @NewDigit = @NewDigit % 10		
		END
		ELSE
		BEGIN
			SET @Remainder = 0
		end
	
		--PRINT CONCAT('NewDigit: ', @NewDigit)
		--PRINT CONCAT('Remainder: ', @Remainder)
    


		SELECT @NewNum = CONCAT(@NewNum, @NewDigit)
		--PRINT concat('NewNum: ', @NewNum)

		SET @i = @i + 1
	END

	IF (@Remainder > 0)
	BEGIN
		SELECT @NewNum = CONCAT(@NewNum, @Remainder)
	end

	SELECT @num = @NewNum
	SET @NewNum = ''
	SET @j = @j + 1
END

SELECT REVERSE(@num)

DECLARE @sum BIGINT = 0,
	@BigLen INT,
	@Iterator INT = 1

SELECT @BigLen = LEN(@num)

WHILE (@Iterator <= @BigLen)
BEGIN
	SELECT @sum = @sum + CAST(SUBSTRING(@num, @Iterator, 1) AS BIGINT)

	SET @Iterator = @Iterator + 1
END

SELECT @sum
