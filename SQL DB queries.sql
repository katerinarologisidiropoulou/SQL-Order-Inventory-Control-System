use db68

1.
SELECT �������, ���, ��������, ����, �������, ����, ��, �������� 
FROM �������

2.
SELECT �������, ����������, ���, ����
FROM ������_�������, �������
WHERE �������=������� AND ���������� > '2022-05-12' AND ����������<'2022-05-22'

3.
SELECT �������, ����������_���, ������
FROM �����������, �����������_����������� AS ���
WHERE ���.����������=�����������.�������
GROUP BY ������,����������_���, �������

4.
UPDATE ������
SET ����=����*1.03

5.
SELECT SUM(����)AS ������_��������, AVG(����) AS ��_��������, MONTH(����������) AS �����
FROM ������� 
WHERE ����������>='2022-01-01' AND ����������<='2022-12-31'
GROUP BY DATEPART(MONTH, ����������)

6.
SELECT �������.���, �������.��������
FROM �������, �����������, ������, �����������_�����������
WHERE �������.������� = �����������.�������
 AND �����������_�����������.����������=�����������.�������
  AND �����������_�����������.������ = ������.�������
  AND �����������.����������_��� BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY �������.���, �������.��������
HAVING SUM(�����������_�����������.�������� * ������.����) > 2500;

7.
SELECT �������.�������, ���������.������, SUM(������.���� * �����������_�����������.��������) AS ������_�����
FROM �������, �����������, ������, ���������, �����������_�����������
WHERE �������.������� = �����������.�������
AND �����������.������� = �����������_�����������.����������
AND �����������_�����������.������ = ������.�������
AND ������.��������� = ���������.�������
GROUP BY �������.�������, ���������.������;

8. 
SELECT 
    �������.�������� AS ����������_�������,
    ���������.������ AS ���������,
    AVG(�����������_�����������.��������*������.�������) AS �����_����_��������
FROM 
    �����������, �����������_�����������, ������, ���������, �������, �������
WHERE �����������_�����������.������ = ������.������� AND
�����������_�����������.����������=�����������.������� AND
������.��������� = ���������.������� AND
 �������.������� = �������.�������
GROUP BY 
    �������.��������,
    ���������.������;


9.

CREATE VIEW V1 AS (
SELECT SUM(�����������_�����������.��������*������.����) AS SUM_V1
FROM �����������_�����������, �����������, ������
WHERE DATEPART(YEAR,����������_���)='2022' AND �����������_�����������.������=������.������� AND �����������.�������=�����������_�����������.����������)

SELECT DATEPART(MONTH,����������_���) AS �����, cast(SUM(�����������_�����������.��������*������.����) as float)/cast(SUM_V1 as float)  AS ��������_����_��_�������_��������_���_2022
FROM �����������_�����������, �����������, V1, ������
WHERE DATEPART(YEAR,����������_���)='2022' AND �����������_�����������.������=������.������� AND �����������.�������=�����������_�����������.����������
GROUP BY DATEPART(MONTH,����������_���), SUM_V1

10. 
CREATE VIEW V2 AS
SELECT DATEPART(MONTH, ����������_���) AS �����, DATEPART(YEAR, ����������_���) AS ������, AVG(�����������_�����������.��������*������.����) AS ��
FROM �����������_�����������, �����������, ������
WHERE �����������_�����������.����������=�����������.������� AND �����������_�����������.������=������.�������
GROUP BY DATEPART(MONTH, ����������_���), DATEPART(YEAR, ����������_���)

CREATE VIEW V3 AS
SELECT DATEPART(MONTH, ����������_���) AS �����, DATEPART(YEAR, ����������_���) AS ������, AVG(�����������_�����������.��������*������.����) AS ��_������, �����������. �������
FROM  �����������_�����������, �����������, ������
WHERE �����������_�����������.����������=�����������.������� AND �����������_�����������.������=������.�������
GROUP BY DATEPART(MONTH, ����������_���), DATEPART(YEAR, ����������_���), �����������.�������

SELECT V2.�����, V2.������, COUNT(�������) AS ������_�������
FROM V2,V3
WHERE V2.�����=V3.����� AND V2.������=V3.������ AND ��<��_������
GROUP BY V2.�����, V2.������

11. 
CREATE VIEW V4 AS
SELECT DATEPART(MONTH, ����������_���) AS �����22, SUM(�����������_�����������.��������*������.����) AS ���22
FROM �����������_�����������, �����������, ������
WHERE DATEPART(YEAR,����������_���)='2022' AND �����������_�����������.����������=�����������.������� AND �����������_�����������.������=������.�������
GROUP BY DATEPART(MONTH, ����������_���)

CREATE VIEW V5 AS
SELECT DATEPART(MONTH, ����������_���) AS �����21, SUM(�����������_�����������.��������*������.����) AS ���21
FROM �����������_�����������, �����������, ������
WHERE DATEPART(YEAR,����������_���)='2021' AND �����������_�����������.����������=�����������.������� AND �����������_�����������.������=������.�������
GROUP BY DATEPART(MONTH, ����������_���)

SELECT V4.�����22 AS �����, FORMAT((CAST(���22 AS FLOAT)/CAST(���21 AS FLOAT)) *100, '0.##') + '%'  AS ��������_22_��_�������_��������_21
FROM V4,V5
WHERE �����22=�����21
ORDER BY �����22

12.
CREATE VIEW ���12 AS
SELECT DATEPART(MONTH,����������_���) AS �����, CAST(AVG(�����������_�����������.��������*������.����)AS DECIMAL(10,2)) AS ��
FROM ������, �����������_�����������, �����������
WHERE DATEPART(YEAR,����������_���)='2022' AND ������.�������=�����������_�����������.������ AND �����������.�������=�����������_�����������.����������
GROUP BY DATEPART(MONTH,����������_���)

SELECT �.�����, �.�� AS ��_����, �.�� AS ��_������������_�����
FROM ���12 AS �, ���12 AS �
WHERE �.�����>=�.����� AND (�.��<>�.�� OR �.�����='1')
ORDER BY �.����� ASC

13. 
SELECT DISTINCT ������.�������, �������.��������
FROM ������, �������, �����������, �����
WHERE ������.�������=�����.������ AND �����.�����������=�����������.������� AND �����������.�������=�������.�������
GROUP BY ������.�������, �������.��������


14) 
CREATE TABLE �����������_�������� (
����������� VARCHAR(20) FOREIGN KEY REFERENCES �����������,
��������_���� VARCHAR(30),
������ VARCHAR(20) FOREIGN KEY REFERENCES ������ ,
��������_��������� VARCHAR(30))

SELECT �����������.�������
FROM �����������, �����������_��������, �����������_�����������, ������
WHERE �����������.������� = �����������_�����������.���������� AND �����������_�����������.������=�����������_��������.������
AND �����������_�����������.������ = ������.�������
GROUP BY �����������.�������
HAVING COUNT(DISTINCT �����������_��������.�����������) >= 5;
