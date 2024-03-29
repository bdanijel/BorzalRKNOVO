USE [bdanijel_BORZALRKNOVO]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnSrediDatumPrikaz]    Script Date: 06/12/2019 13:44:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DECLARE @datum datetime;

--SET @datum = '2018-12-19 13:44:24.447'

 

--SELECT dbo.ufnSrediDatumPrikaz(@datum) AS Datum

 

CREATE FUNCTION [dbo].[ufnSrediDatumPrikaz]

       (@datum datetime) -- ili datetime

       RETURNS NVARCHAR(11)

       AS

       BEGIN

       DECLARE @ret NVARCHAR(11);

 

       IF @datum <> ''

         BEGIN      

              SELECT @ret= RIGHT(CONVERT(NVARCHAR(14), @datum, 112), 2) + '.' + SUBSTRING(CONVERT(NVARCHAR(14), @datum, 112), 5, 2) + '.' + LEFT(CONVERT(NVARCHAR(14), @datum, 112), 4) + '.'

         END

         ELSE

         BEGIN

              SELECT @ret = ''

         END

       RETURN @ret;

END
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 06/12/2019 13:44:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitString]
(
    @String  NVARCHAR(MAX), @Separator CHAR(1)
)
RETURNS @RESULT TABLE(Value NVARCHAR(MAX))
AS
BEGIN     
 DECLARE @SeparatorPosition INT = CHARINDEX(@Separator, @String ),
        @Value NVARCHAR(MAX), @StartPosition INT = 1

 IF @SeparatorPosition = 0  
  BEGIN
   INSERT INTO @RESULT VALUES(@String)
   RETURN
  END
     
 SET @String = @String + @Separator
WHILE @SeparatorPosition > 0
  BEGIN
   SET @Value = SUBSTRING(@String , @StartPosition, @SeparatorPosition- @StartPosition)

   IF( @Value <> ''  ) 
    INSERT INTO @RESULT VALUES(@Value)
   
   SET @StartPosition = @SeparatorPosition + 1
   SET @SeparatorPosition = CHARINDEX(@Separator, @String , @StartPosition)
  END    
     
 RETURN
END
GO
