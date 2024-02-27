
create database fptaptechdb
use fptaptechdb
drop table account

create table account(
id int primary key,
username varchar(30),
password varchar(30)
)
insert into account values (1,'admin','admin123')
select * from account where username ='admin' and password='admin123'


drop table students
create table students(
id int primary key,
name varchar(30),
address varchar(30)
)


drop table subjects
CREATE TABLE subjects (
    subject_id INT auto_increment PRIMARY KEY,
    subject_name VARCHAR(255)
);
 drop table grades
CREATE TABLE grades (
    grade_id int auto_increment  PRIMARY KEY,
    id INT,
    subject_id INT,
    grade INT,
    FOREIGN KEY (id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

insert into students (id, name, address) values
(1,'hong ngoc', 'ninh binh'),
(2,'dang diep', 'bac ninh'),
(3,'hoa', 'thai binh');

insert into subjects ( subject_name) values
('Toan'),
( 'Ly'),
('Hoa'),
('Van'),
('Su');

insert into grades (id, subject_id, grade) values
(1,1,9.5),
(2,2,8),
(3,3,9.5);


SELECT students.id, students.name, subjects.subject_name, grades.grade
FROM students
JOIN grades ON students.id = grades.id
JOIN subjects ON grades.subject_id = subjects.subject_id;



       
 SELECT students.id, students.name, students.address, COUNT(grades.grade_id) AS grades_count
FROM students
LEFT JOIN grades ON students.id = grades.id

GROUP BY students.id, students.name, students.address;

select * from students 












create database fptaptechdb1
use fptaptechdb1
drop table account

create table account(
id int primary key,
username varchar(30),
password varchar(30)
)
insert into account values (1,'admin','admin123')
select * from account where username ='admin' and password='admin123'


drop table students
create table students(
id int primary key,
name varchar(30),
address varchar(30)
)


drop table subjects
CREATE TABLE subjects (
    id INT auto_increment PRIMARY KEY,
    subjects_name VARCHAR(255) not null
);
 drop table marks 
CREATE TABLE marks (
    id int auto_increment  PRIMARY KEY,
    student_id INT,
    subject_id INT,
    mark float,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

insert into students (id, name, address) values
(1,'hong ngoc', 'ninh binh'),
(2,'dang diep', 'bac ninh'),
(3,'hoa', 'thai binh'),
(4,'thuy', 'ninh binh'),
(5,'giang','ninh binh');

insert into subjects ( subjects_name) values
('Toan'),
( 'Ly'),
('Hoa'),
('Van'),
('Su');

insert into marks  (student_id, subject_id, mark) values
(1,1,9.5),
(2,2,8),
(3,3,9.5),
(4,3,8),
(5,2,8.6);
select * from students  
select *from subjects 
select * from marks

SELECT students.id, students.name, subjects.subjects_name , marks.mark
FROM students
JOIN marks ON students.id = marks.id
JOIN subjects ON marks.subject_id = subjects.id;



       
 SELECT students.id, students.name, students.address, COUNT(marks.id) AS mark_count
FROM students
LEFT JOIN marks ON students.id = marks.student_id

GROUP BY students.id, students.name, students.address;


SELECT marks.id, students.name AS student_name, subjects.subjects_name AS subject_name, mark 
FROM marks  JOIN students ON marks.student_id = students.id 
JOIN subjects ON marks.subject_id = subjects.id;









create database fptaptechdb3;
use fptaptechdb3

create table account(
id int primary key,
username varchar(30),
password varchar(30)
)
insert into account values (1,'admin','admin123')
select * from account where username ='admin' and password='admin123'





CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    Address NVARCHAR(255),
    Phone NVARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID int PRIMARY KEY,
    ProductName NVARCHAR(100),
    Unit NVARCHAR(50),
    Price DECIMAL(15, 2)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID int,
    Quantity INT,
    Amount DECIMAL(15, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Thêm khách hàng
INSERT INTO Customers (CustomerID, CustomerName, Address, Phone) VALUES (1, 'hong ngoc', 'ninh binh', '0769824365');



-- Thêm đơn đặt hàng
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (1, 1, '2024-1-1');

-- Thêm sản phẩm
INSERT INTO Products (ProductID, ProductName, Unit, Price) VALUES 
(1, 'Ao khoac', 'Chiếc', 1000),
(2, 'Ao thun', 'Chiếc', 200),
(3, 'Ao croptop', 'Chiếc', 100);

-- Thêm chi tiết đơn hàng
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Amount) VALUES 
(1, 1, 1, 1, 1000),
(2, 1, 2, 2, 400),
(3, 1, 3, 1, 100);


select * from customers 

SELECT Orders.OrderID, Orders.CustomerID, Orders.OrderDate, OrderDetails.OrderDetailID, OrderDetails.ProductID, OrderDetails.Quantity, OrderDetails.Amount
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID;

SELECT c.CustomerName, p.ProductName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;


SELECT c.CustomerName, p.ProductName, o.OrderDate 
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID 
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID = p.ProductID;










create database fptaptechdb5;
use fptaptechdb5

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
    -- Thêm các thuộc tính khác của nhân viên ở đây
);

CREATE TABLE leave_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    year YEAR,
    days_off_taken INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE work_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    month INT, -- Lưu ý: kiểu MONTH không tồn tại; thay vào đó sử dụng INT để lưu trữ số tháng (1-12)
    year YEAR,
    days_worked INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);





CREATE DATABASE IF NOT EXISTS employee_performance_db;
USE employee_performance_db;

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS leave_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    year YEAR NOT NULL,
    days_off_taken INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE IF NOT EXISTS work_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    month INT NOT NULL,
    year YEAR NOT NULL,
    days_worked INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employees (name) VALUES ('John Doe'), ('Jane Doe');
-- John Doe đã nghỉ 8 ngày trong năm 2021
INSERT INTO leave_days (employee_id, year, days_off_taken) VALUES (1, 2021, 8);
-- Jane Doe đã nghỉ 10 ngày trong năm 2021
INSERT INTO leave_days (employee_id, year, days_off_taken) VALUES (2, 2021, 10);

-- John Doe đã làm việc 220 ngày trong năm 2021
INSERT INTO work_days (employee_id, month, year, days_worked) VALUES (1, 1, 2021, 18), (1, 2, 2021, 20), ..., (1, 12, 2021, 19);
-- Jane Doe đã làm việc 230 ngày trong năm 2021
INSERT INTO work_days (employee_id, month, year, days_worked) VALUES (2, 1, 2021, 19), (2, 2, 2021, 21), ..., (2, 12, 2021, 18);






