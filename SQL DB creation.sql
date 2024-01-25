CREATE TABLE пеяиовг (
йыдийос VARCHAR(20) PRIMARY KEY,
омоласиа VARCHAR(30),
пкгхуслос INT)

CREATE TABLE йатгцояиа (
йыдийос VARCHAR(20) PRIMARY KEY,
титкос VARCHAR(30),
пеяицяажг VARCHAR(100))

CREATE TABLE пяолгхеутгс(
йыдийос VARCHAR(20) PRIMARY KEY,
тгкежымо CHAR(10),
ажл CHAR(10),
епымулиа VARCHAR(30),
одос VARCHAR(30),
аяихлос VARCHAR(4),
покг VARCHAR(20),
тй CHAR(5),
пеяиовг VARCHAR(20) FOREIGN KEY REFERENCES пеяиовг)

CREATE TABLE пяозом (
йыдийос VARCHAR(20) PRIMARY KEY,
омоласиа VARCHAR(30),
пеяицяажг VARCHAR(100),
тилг DECIMAL(10,2) CHECK (тилг>0),
апохела INT,
йатгцояиа VARCHAR(20) FOREIGN KEY REFERENCES йатгцояиа)

CREATE TABLE ацояа (
йыдийос VARCHAR(20) PRIMARY KEY,
пяозом VARCHAR(20) FOREIGN KEY REFERENCES пяозом,
пяолгхеутгс VARCHAR(20) FOREIGN KEY REFERENCES пяолгхеутгс,
глеяолгмиа DATE,
посотгта INT )

CREATE TABLE пекатес (
йыдийос VARCHAR(20) PRIMARY KEY,
епымулиа VARCHAR(30),
ажл CHAR(10),
тгкежымо CHAR(10),
одос VARCHAR(30),
аяихлос VARCHAR(4),
покг VARCHAR(20),
тй CHAR(5),
пеяиовг VARCHAR(20) FOREIGN KEY REFERENCES пеяиовг ON DELETE CASCADE)

CREATE TABLE сувмои_пекатес (
йыдийос VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES пекатес ON DELETE CASCADE,
ояио DECIMAL(10,2) CHECK (ояио>0),
упокоипо DECIMAL(10,2) CHECK (упокоипо>0)
)
ALTER TABLE сувмои_пекатес
ADD CONSTRAINT C1 PRIMARY KEY (йыдийос)

CREATE TABLE пкгяылг (
глеяолгмиа DATE PRIMARY KEY,
ыяа TIME,
посо DECIMAL(10,2) CHECK (посо>0),
пекатгс VARCHAR(20) FOREIGN KEY REFERENCES сувмои_пекатес ON DELETE CASCADE)

CREATE TABLE паяаццекиес (
йыдийос VARCHAR(20) PRIMARY KEY,
глеяолгмиа_пая DATE,
глеяолгмиа_апост DATE,
пекатгс VARCHAR(20) FOREIGN KEY REFERENCES пекатес ON DELETE CASCADE)

CREATE TABLE пеяиеволемо_паяаццекиас (
пяозом VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES пяозом,
посотгта INT,
паяаццекиа VARCHAR(20) FOREIGN KEY REFERENCES паяаццекиес ON DELETE CASCADE
)
