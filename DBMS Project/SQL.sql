create database Resturant_Management
Use Resturant_Management

------ RESTURANT-------

create table RESTURANT(Rest_Id int primary key ,Rest_Name nvarchar(30),Rest_Address nvarchar(50),Rest_Contact nvarchar(50))
insert into RESTURANT
values (1,'Chop Chop','Lahore Punjab Pakistan', '042-0000000')
select * from RESTURANT

------ CUSTOMERS------------

Create table CUSTOMERS(Cust_Id int primary key,Cust_Name nvarchar(50),Cust_Email nvarchar(50),Cust_Address nvarchar(40),Cust_Table_No int, Cust_Dinning_date date)
insert into CUSTOMERS
values(1,'Ahmed Imran','Ahmed99@gmail.com','Lahore Pakistan',2,'2022-02-02'),
(2,'Ali Akbar','AliAk@gmail.com','Karachi Pakistan',5,'2022-04-03'),
(3,'Hamza Shahid','Hamza34@gmail.com','Multan Pakistan',4,'2020-06-01'),
(4,'Ayesha','Ayeshaa@gmail.com','Lahore Pakistan',2,'2019-02-01'),
(5,'Aslam Khan','aslam444@gmail.com','Peshawar Pakistan',6,'2022-02-09')

------------MANAGERS---------------
Create table MANAGERS(Manager_Id int primary key,Rest_Id int foreign key references RESTURANT,Manager_Name nvarchar(50),Manager_address nvarchar(50),Manager_Join_Date date,Manager_Contact nvarchar(50))
insert into MANAGERS
values(1,1,'Afzal Ali','Bahawalpur Pakistan','2016-03-02','0300-0302048'),
(2,1,'Hamza Khan','Peshawar Pakistan','2019-04-02','0323-2345623'),
(3,1,'Ayeza Akbar','Lahore Pakistan','2016-06-03','0300-4455662'),
(4,1,'Abu Bakar','TobaTak Sigh Pakistan','2018-09-02','0344-2299874'),
(5,1,'Nawaz Ali','Karachi Pakistan','2017-03-02','0300-2345698')

-------- WAITERS-------------
Create table WAITERS(Waiter_Id int primary key,Manager_Id int foreign key references MANAGERS,Waiter_Name nvarchar(30),Waiter_Address nvarchar(40),Waiter_Join_Date date,Waiter_Contact nvarchar(50))
insert into WAITERS
values(1,3,'Omar Shehzad','Lahore Pakistan','2015-05-08','0323-2345624'),
(2,2,'Tufail Muhammad','Multan Pakistan','2016-11-22','0323-2345444'),
(3,2,'Muhammad Rizwan','Quetta Pakistan','2018-07-07','0323-2347777'),
(4,1,'Akeel Khan','Islamabad Pakistan','2017-12-05','0323-2346655'),
(5,4,'Ahmed Nadeem','Lahore Pakistan','2016-05-06','0323-23454421'),
(6,5,'Umar Gull','Peshawar Pakistan','2017-07-07','0323-23453125')

select * from WAITERS

------------ CHEFS-----------------------

Create table CHEFS(Chef_Id int primary key,Manager_Id int foreign key references MANAGERS,Chef_name nvarchar(30),Chef_Address nvarchar(40),Chef_Join_Date date,Chef_Contact nvarchar(50))
insert into CHEFS
values(1,3,'Ahsan ALi','Lahore Pakistan','2015-05-08','0323-2342238'),
(2,2,'Akram Muhammad','Multan Pakistan','2018-11-22','0323-2349999'),
(3,2,'Muhammad Ahmed','Lahore Pakistan','2018-07-07','0323-2349988'),
(4,1,'Akeel Ali','Islamabad Pakistan','2015-12-06','0323-2346161'),
(5,4,'Ahmed Nadeem Butt','Nankana Sahib Pakistan','2016-07-06','0323-2345544'),
(6,5,'Umar Rizwan','Peshawar Pakistan','2015-07-07','0323-2333821')

-----CHEF CREATING ORDERS---- (MANY TO MANY)
---Jab order 1 ya 1 se zayada chef banae to ye table use ho ga !
Create table Chefpreparedorder( Order_Id int foreign key references ORDERS,Chef_Id int foreign key references CHEFS, primary key(Chef_Id,Order_Id))
insert into Chefpreparedorder
values(1,2),(1,3),(2,4),(3,5),(4,1),(5,6),(6,6)


--------- ORDERS--------------
Create table ORDERS(Order_Id int primary key,Cust_Id int foreign key references CUSTOMERS,Waiter_Id int foreign key references WAITERS,No_of_items int,Order_type nvarchar(30))
insert into ORDERS 
values(1,2,3,3,'Dining'),
(2,2,2,5,'Take Away'),
(3,4,1,3,'Dining'),
(4,3,4,7,'Take Away'),
(5,1,5,4,'Dining'),
(6,5,6,5,'Dining')




-----ITEMSINORDER---- (MANY TO MANY)
Create table ITEMINORDER(Order_Id int foreign key references ORDERS, Item_Id  int foreign key references ITEMS )
insert into ITEMINORDER
values (1,1),(1,2),(2,2),(3,4),(4,2),(5,6)




------------ITEMS--------------------
Create table ITEMS(Item_Id int primary key,Item_Name nvarchar(30),Item_Price int)
insert into ITEMS
values(1,'Pasta',1200),
(2,'Chicken Quorma',1000),
(3,'Biryani Chicken',600),
(4,'Pizza',1100),
(5,'Ice Cream',250),
(6,'Milk Shake',300)

-----Rawinitems---- (MANY TO MANY)

create table RAWINITEM(Item_Id int foreign key references ITEMS, Raw_Id int foreign key references RAW_MATERIALS)
insert into RAWINITEM
values(1,3),(1,6),(1,4),(2,3),(2,6),(3,3),(3,6),(4,3),(4,6),(4,4),(5,7),(5,9),(6,7),(6,9)
select * from RAWINITEM

-------------- Raw_Matrials-------------------
Create table RAW_MATERIALS(Raw_Id int primary key,Supplier_Id int foreign key references SUPPLIERS,Raw_Name nvarchar(30),Raw_Expiery date,Raw_Quantity int)
insert into RAW_MATERIALS
values(1,1,'Ground beef','2022-08-02',2),
(2,1,'Mutton','2022-07-04',12),
(3,1,'Chicken','2022-06-09',20),
(4,2,'Vegetables','2022-08-22',50),
(6,3,'spicies','2022-11-06',55),
(7,4,'Whole Milk','2022-06-03',77),
(8,5,'Cold Drinks','2022-06-06',150),
(9,6,'Fruits','2022-08-02',120)
 

--------------SUPPLIERS------------------
Create table SUPPLIERS(Supplier_Id int primary key,Supplier_Name nvarchar(50))
insert into SUPPLIERS
values(1,'Heat Meat & Chicken'),
(2,'Fresh vegetables Point'),
(3,'Pak Spicies'),
(4,'Milky Dairy'),
(5,'Cold Drinks Point'),
(6,'Fruit World')

Select * from SUPPLIERS


----------- BILL--------------
Create table BILL(Bill_Id int primary key,Order_Id int foreign key references ORDERS,Bill_Method nvarchar(30),Bill_Date date,Bill_Time time)
insert into BILL
values(1,1,'Cash','2022-02-02','08:59:30'),
(2,2,'Cash','2022-02-02','08:50:30'),
(3,3,'Card','2022-04-03','06:55:30'),
(4,4,'Cash','2019-02-01','12:34:30'),
(5,5,'Card','2022-02-09','04:30:30')


---------- FEEDBACK-------------
Create table FEEDBACK(FeedBack_Id int primary key,Cust_Id int foreign key references CUSTOMERS,Food_Quality nvarchar(30),Suggestion nvarchar(150),Res_Services nvarchar(40))
insert into FEEDBACK
values(1,1,'Good',NULL, 'Great'),
(2,2,'Ok','Lighting could be better', 'Great'),
(3,3,'Poor',NULL, 'Not Satisfactory'),
(4,4,'Good','Services can be improved', 'Great'),
(5,5,'Awesome',NULL, 'Good')


--------- SALARIES----------------
Create table SALARIES(Date_Month date, Manager_Id int foreign key references MANAGERS,Chef_Id int foreign key references CHEFS,Waiter_Id int foreign key references WAITERS,Manager_salary int ,Chef_salary int,Waiter_salary int)
insert into SALARIES

values('2022-01-01',1,1,1,60000,40000,25000),
('2022-01-01',2,2,2,50000,42000,25000),
('2022-01-01',3,3,3,70000,35000,25000),
('2022-01-01',4,4,4,75000,44000,25000),
('2022-01-01',5,5,5,65000,46000,25000),
('2022-01-01',null,6,6,null,39000,25000),
('2022-02-01',1,1,1,60000,40000,25000),
('2022-02-01',2,2,2,50000,42000,25000),
('2022-02-01',3,3,3,70000,35000,25000),
('2022-02-01',4,4,4,75000,44000,25000),
('2022-02-01',5,5,5,65000,46000,25000),
('2022-02-01',null,6,6,null,39000,25000)

create table Salariess(Date_Month date primary key, dayy nvarchar(20))
create table Managersalary( Date_Month date foreign key references Salariess, Manager_Id int foreign key references MANAGERS, Salary int, primary key(Date_Month,Manager_Id))
create table Chefsalary( Date_Month date foreign key references Salariess, Chef_Id int foreign key references CHEFS, Salary int, primary key(Date_Month,Chef_Id))
create table Waitersalary( Date_Month date foreign key references Salariess, Waiter_Id int foreign key references WAITERS, Salary int, primary key(Date_Month,Waiter_Id))



--------Utilities----------
create table UTILITIES(Utl_Month date primary key,Rest_Id int foreign key references RESTURANT,Electricity_Bill int , Water_Bill int , Gas_Bill int)
insert into UTILITIES
values(1,1,'2022-01-01',50000,25000,5000),
(2,1,'2022-02-01',55000,22000,7000)
Create table Monthylbill( Utl_Month date primary key,Rest_Id int foreign key references RESTURANT, Electricity_Bill int, Water_Bill int ,Gas_Bill int)




-----RESERVATION-----
Create table RESERVATIONS(Res_Id int primary key,Res_date date, Cust_Id int foreign key references CUSTOMERS, rest_time time, personcount int )
insert into RESERVATIONS
values(1,'2022-02-02',1,'08:59:31',4),
(2,'2022-04-03',2,'08:59:31',4),
(3,'2020-06-01',3,'09:59:20',8),
(4,'2019-02-01',4,'04:55:32',6),
(5,'2022-02-09',5,'02:58:30',4),
(6,'2022-06-02',3,'01:56:29',3)


----EMPLOYEE ATTENDANCE----
Create table ATTENDANCE(Manager_Id int foreign key references MANAGERS, Chef_Id int foreign key references CHEFS, Waiter_Id int foreign key references WAITERS,
At_Date date, At_Day nvarchar (20), Att_Manager  nvarchar (20), Att_Chef  nvarchar (20), Att_Waiter  nvarchar (20))


insert into ATTENDANCE 

values(1,1,1,'2022-01-01','Monday','Present','Present','Present'),
(2,2,2,'2022-01-01','Monday','Present','Present','Present'),
(3,3,3,'2022-01-01','Monday','Present','Absent','Absent'),
(4,4,4,'2022-01-01','Monday','Absent','Present','Present'),
(5,5,5,'2022-01-01','Monday','Present','Absent','Present'),
(null,6,6,'2022-01-01','Monday',null,'Absent','Absent')

Create table ATTENDANCEE (datee date primary key, dayy nvarchar(20))
insert into ATTENDANCEE values('2022-01-01','Monday'),('2022-01-02','Monday'),('2022-01-03','Monday'),('2022-01-04','Monday')

Create table  ChefAttendance( datee date foreign key references ATTENDANCEE, Chef_Id int foreign key references CHEFS, status nvarchar (20), primary key (datee,Chef_Id ))
insert into ChefAttendance values ('2022-01-01', 1,'present'),('2022-01-02', 1,'absent')

Create table  ManagerAttendance( datee date foreign key references ATTENDANCEE, Manager_Id int foreign key references MANAGERS, status nvarchar (20),primary key(datee,Manager_Id ))
Create table  WaiterAttendance( datee date foreign key references ATTENDANCEE, Waiter_Id int foreign key references WAITERS, status nvarchar (20),primary key(datee, Waiter_Id))



