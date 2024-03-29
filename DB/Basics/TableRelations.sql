CREATE DATABASE CRUD
--PROBLEM 1
CREATE TABLE Passports
(
PassportID INT IDENTITY(101,1) PRIMARY KEY,
PassportNumber NVARCHAR(100) NOT NULL
)
INSERT INTO Passports VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

CREATE TABLE Persons
(
PersonID INT IDENTITY(1,1) PRIMARY KEY,
[FirstName] NVARCHAR(100) NOT NULL,
Salary DECIMAL(7,2) NOT NULL,
PassportID INT FOREIGN KEY REFERENCES Passports(PassportID)
)
INSERT INTO Persons VALUES
('Roberto',43300.00,102),
('Tom',56100.00,103),
('Yana',60200.00,101)

--PROBLEM 2
CREATE TABLE Manufacturers
(
ManufacturerID INT IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(100) NOT NULL,
EstablishedOn DATE NOT NULL
)
INSERT INTO Manufacturers VALUES
('BMV','07-03-1916'),
('Tesla','01-01-2003'),
('Lada','01-05-1966')

CREATE TABLE Models
(
ModelID INT IDENTITY(101,1) PRIMARY KEY,
[Name] NVARCHAR(100) NOT NULL,
ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Models VALUES
('X1',1),
('i6',1),
('Model S',2),
('Model X',2),
('Model 3',2),
('Nova',3)

--PROBLEM 3
CREATE TABLE Students
(
StudentID INT IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(100) NOT NULL
)
INSERT INTO Students 
VALUES
('Mila'),
('Toni'),
('Roni')

CREATE TABLE Exams
(
ExamID INT IDENTITY(101,1) PRIMARY KEY,
[Name] NVARCHAR(100) NOT NULL
)
INSERT INTO Exams 
VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

CREATE TABLE StudentsExams
(
StudentsID INT NOT NULL,
ExamID INT NOT NULL,
CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentsID ,ExamID), 
CONSTRAINT FK_StudentsID FOREIGN KEY(StudentsID) REFERENCES Students(StudentID),
CONSTRAINT FK_ExamID FOREIGN KEY(ExamID) REFERENCES Exams(ExamID),
)
INSERT INTO StudentsExams
VALUES
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103)
SELECT*FROM Students
SELECT*FROM Exams
SELECT*FROM StudentsExams

--PROBLEM 4
CREATE TABLE Teachers 
(
	TeacherID INT PRIMARY KEY, 
	[Name] NVARCHAR(50) NOT NULL,
	ManagerID INT FOREIGN KEY REFERENCES Teachers (TeacherID)
)

--PROBLEM 5
CREATE DATABASE OnlineStore 
Use OnlineStore

CREATE TABLE Cities
(
CityID INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(50) NOT NULL,
Birthday DATE,
CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)
CREATE TABLE ItemTypes
(
ItemTypeID INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(50) NOT NULL
)
CREATE TABLE Items
(
ItemID INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(50) NOT NULL,
ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE Orders
(
OrderID INT PRIMARY KEY NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT FK_Order FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems
(
OrderID INT NOT NULL,
ItemID INT NOT NULL,
CONSTRAINT PK_OrderItem PRIMARY KEY(OrderID,ItemID) ,
CONSTRAINT FK_Orders FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
CONSTRAINT FK_Items FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
)

--Problem 6

CREATE DATABASE	University 

CREATE TABLE Majors
(
MajorID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Students
(
StudentID INT PRIMARY KEY IDENTITY,
StudentNumber INT,
StudentName NVARCHAR(100) NOT NULL,
MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments 
(
	PaymentID INT PRIMARY KEY IDENTITY,
	PaymentDate DATE NOT NULL,
	PaymentAccount DECIMAL (15, 2) NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students (StudentID)
	)
CREATE TABLE Subjects
(
SubjectID INT PRIMARY KEY IDENTITY,
SubjectName NVARCHAR(50) NOT NULL
)

CREATE TABLE Agenda 
(
	StudentID INT FOREIGN KEY REFERENCES Students (StudentID),
	SubjectID INT FOREIGN KEY REFERENCES Subjects (SubjectID),

	PRIMARY KEY (StudentID, SubjectID)
)
--Problem 9
SELECT m.MountainRange, p.PeakName, p.Elevation 
FROM Mountains AS m
JOIN Peaks AS p ON p.MountainId = m.Id
WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC

