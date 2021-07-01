CREATE DATABASE DOANTN

-----Tạo bảng JobDetail
Create table Job_Detail(
ID_Details int identity primary key not null,
Name_Job nvarchar(MAX),
Knowledge nvarchar(MAX),
Experiment nvarchar(MAX),
Job_Nature nvarchar(50),
Salary int
)

-----Tạo bảng TheCompany
Create table TheCompany
(
ID_Company int identity primary key not null,
Name_Company nvarchar(100) ,
Email nvarchar(50),
Location nvarchar(50),
ID_Details int,
Foreign key(ID_Details) references Job_Detail(ID_Details)
)

-----Tạo bảng TheJob
Create table TheJob
(
ID_Job int identity primary key not null,
Name_Job nvarchar(MAX),
Knowledge nvarchar(MAX),
Experiment nvarchar(MAX),
Job_Nature nvarchar(50),
Salary int,
Application_Date date,
Picture nvarchar(50),
ID_Company int,
ID_Details int
Foreign key(ID_Company) references TheCompany(ID_Company),
Foreign key(ID_Details) references Job_Detail(ID_Details)
)

-----Tạo bảng Job_Application
Create table Job_Application
(
ID_Application int primary key not null,
Name nvarchar(50),
Age tinyint,
Address nvarchar(50),
Phone  char(10),
Knowledge nvarchar(max),
Experiment nvarchar(max),
Job_Nature nvarchar(50),
ID_Company int,
Foreign key(ID_Company) references TheCompany(ID_Company)
)
-----Tạo bảng TheUser
Create table TheUser
(
ID_User int identity primary key not null,
Name nvarchar(50),
ID_Job int,
ID_Application int,
Foreign key(ID_Job) references TheJob(ID_Job),
Foreign key(ID_Application) references Job_Application (ID_Application)
)

------Tạo quyền người dùng
create table role(
ID_Role int identity primary key,
Role_Name nvarchar(50)
)

create table users(
ID_User int identity primary key,
Name nvarchar(50),
Email nvarchar(50),
Password char(10),
ID_Role int,
foreign key(ID_Role) references role(ID_Role)
)