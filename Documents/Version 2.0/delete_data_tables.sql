USE SAMPLE_FRED_OFFICE
GO
select top 18 * from Sales order by SaleID desc

use AG_METADATA
go
select * from Tables where TableName like '%LOTS_Sales%'
go
select * from DataFlow where SourceTableID=1152


SET NOCOUNT ON;

DECLARE 
  @rc INT = 1, 
  @cutoff DATETIME, 
  @batchsize INT = 10000;

;WITH x(dt) AS 
(
 SELECT TOP (10) PERCENT datetime_column
  FROM dbo.mytable 
  ORDER BY datetime_column DESC
)
SELECT TOP (1) @cutoff = dt -- earliest row we want to keep
 FROM x
 ORDER BY dt;

WHILE @rc > 0
BEGIN
  DELETE TOP (@batchsize) dbo.mytable
    WHERE datetime_column < @cutoff
  SET @rc = @@ROWCOUNT;
END


