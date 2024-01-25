use db68
#АСЙГСГ 1
CREATE PROCEDURE numCustomersInArea
   @areaCode varchar(20)
AS
   DECLARE @numCustomers int;
   DECLARE areaCursor CURSOR
   FOR SELECT COUNT(*)
       FROM пеяиовг, пекатес
	   WHERE пеяиовг.йыдийос = пекатес.пеяиовг
	   AND пеяиовг.йыдийос = @areaCode;
   OPEN areaCursor;
   FETCH NEXT FROM areaCursor INTO @numCustomers;
   PRINT 'Number of customers in area ' + @areaCode + ': ' + STR(@numCustomers);
   CLOSE areaCursor;
   DEALLOCATE areaCursor;



#АСЙГСГ 2

CREATE PROCEDURE prod_desc_orders
	@prodcode varchar(20),
	@ГЛЕЯОЛГМИА_1 DATE,
	@ГЛЕЯОЛГМИА_2 DATE
AS
BEGIN
 DECLARE @prod_desc varchar(100),@йыдийос VARCHAR(20), @глеяолгмиа DATE, @посотгта INT;
DECLARE @cursor1 CURSOR
SET @cursor1=CURSOR FOR
	SELECT пеяицяажг, ацояа.йыдийос, ацояа.глеяолгмиа, ацояа.посотгта 
	FROM пяозом, ацояа
	WHERE @prodcode = пяозом.йыдийос AND ацояа.пяозом= @prodcode AND глеяолгмиа BETWEEN @ГЛЕЯОЛГМИА_1 AND @ГЛЕЯОЛГМИА_2
OPEN @cursor1 
FETCH NEXT FROM @cursor1 INTO @prod_desc, @йыдийос, @глеяолгмиа, @посотгта;
WHILE @@FETCH_STATUS = 0
PRINT 'пеяицяажг пяозомтос:'+ @prod_desc + 'йЫДИЙЭР:' + @йыдийос + ',гЛЕЯОЛГМъА: ' + CONVERT(VARCHAR, @глеяолгмиа) + ', пОСЭТГТА: ' + @посотгта;
FETCH NEXT FROM @cursor1 INTO @prod_desc, @йыдийос, @глеяолгмиа, @посотгта;
END;
CLOSE @cursor1;
DEALLOCATE @cursor1;

