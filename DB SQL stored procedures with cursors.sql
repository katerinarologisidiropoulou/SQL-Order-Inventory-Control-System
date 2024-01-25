use db68
#������ 1
CREATE PROCEDURE numCustomersInArea
   @areaCode varchar(20)
AS
   DECLARE @numCustomers int;
   DECLARE areaCursor CURSOR
   FOR SELECT COUNT(*)
       FROM �������, �������
	   WHERE �������.������� = �������.�������
	   AND �������.������� = @areaCode;
   OPEN areaCursor;
   FETCH NEXT FROM areaCursor INTO @numCustomers;
   PRINT 'Number of customers in area ' + @areaCode + ': ' + STR(@numCustomers);
   CLOSE areaCursor;
   DEALLOCATE areaCursor;



#������ 2

CREATE PROCEDURE prod_desc_orders
	@prodcode varchar(20),
	@����������_1 DATE,
	@����������_2 DATE
AS
BEGIN
 DECLARE @prod_desc varchar(100),@������� VARCHAR(20), @���������� DATE, @�������� INT;
DECLARE @cursor1 CURSOR
SET @cursor1=CURSOR FOR
	SELECT ���������, �����.�������, �����.����������, �����.�������� 
	FROM ������, �����
	WHERE @prodcode = ������.������� AND �����.������= @prodcode AND ���������� BETWEEN @����������_1 AND @����������_2
OPEN @cursor1 
FETCH NEXT FROM @cursor1 INTO @prod_desc, @�������, @����������, @��������;
WHILE @@FETCH_STATUS = 0
PRINT '��������� ���������:'+ @prod_desc + '�������:' + @������� + ',����������: ' + CONVERT(VARCHAR, @����������) + ', ��������: ' + @��������;
FETCH NEXT FROM @cursor1 INTO @prod_desc, @�������, @����������, @��������;
END;
CLOSE @cursor1;
DEALLOCATE @cursor1;

