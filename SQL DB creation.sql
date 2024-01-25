CREATE TABLE ������� (
������� VARCHAR(20) PRIMARY KEY,
�������� VARCHAR(30),
��������� INT)

CREATE TABLE ��������� (
������� VARCHAR(20) PRIMARY KEY,
������ VARCHAR(30),
��������� VARCHAR(100))

CREATE TABLE �����������(
������� VARCHAR(20) PRIMARY KEY,
�������� CHAR(10),
��� CHAR(10),
�������� VARCHAR(30),
���� VARCHAR(30),
������� VARCHAR(4),
���� VARCHAR(20),
�� CHAR(5),
������� VARCHAR(20) FOREIGN KEY REFERENCES �������)

CREATE TABLE ������ (
������� VARCHAR(20) PRIMARY KEY,
�������� VARCHAR(30),
��������� VARCHAR(100),
���� DECIMAL(10,2) CHECK (����>0),
������� INT,
��������� VARCHAR(20) FOREIGN KEY REFERENCES ���������)

CREATE TABLE ����� (
������� VARCHAR(20) PRIMARY KEY,
������ VARCHAR(20) FOREIGN KEY REFERENCES ������,
����������� VARCHAR(20) FOREIGN KEY REFERENCES �����������,
���������� DATE,
�������� INT )

CREATE TABLE ������� (
������� VARCHAR(20) PRIMARY KEY,
�������� VARCHAR(30),
��� CHAR(10),
�������� CHAR(10),
���� VARCHAR(30),
������� VARCHAR(4),
���� VARCHAR(20),
�� CHAR(5),
������� VARCHAR(20) FOREIGN KEY REFERENCES ������� ON DELETE CASCADE)

CREATE TABLE ������_������� (
������� VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES ������� ON DELETE CASCADE,
���� DECIMAL(10,2) CHECK (����>0),
�������� DECIMAL(10,2) CHECK (��������>0)
)
ALTER TABLE ������_�������
ADD CONSTRAINT C1 PRIMARY KEY (�������)

CREATE TABLE ������� (
���������� DATE PRIMARY KEY,
��� TIME,
���� DECIMAL(10,2) CHECK (����>0),
������� VARCHAR(20) FOREIGN KEY REFERENCES ������_������� ON DELETE CASCADE)

CREATE TABLE ����������� (
������� VARCHAR(20) PRIMARY KEY,
����������_��� DATE,
����������_����� DATE,
������� VARCHAR(20) FOREIGN KEY REFERENCES ������� ON DELETE CASCADE)

CREATE TABLE �����������_����������� (
������ VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES ������,
�������� INT,
���������� VARCHAR(20) FOREIGN KEY REFERENCES ����������� ON DELETE CASCADE
)
