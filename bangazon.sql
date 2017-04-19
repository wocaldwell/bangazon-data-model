delete from OrderProduct;
delete from OrderTable;
delete from Product;
delete from PaymentType;
delete from Customer;
delete from Catagory;
delete from Computer;
delete from EmployeeTraining;
delete from Training;
delete from Employee;
delete from Department;

drop table if exists Employee;
drop table if exists EmployeeTraining;
drop table if exists Training;
drop table if exists Department;
drop table if exists Computer;
drop table if exists OrderProduct;
drop table if exists Product;
drop table if exists Catagory;
drop table if exists PaymentType;
drop table if exists OrderTable;
drop table if exists Customer;

create table Department (
	DepartmentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name text not null,
	Budget integer not null
);

insert into department values (null, 'Human Resources', 200000);
insert into department values (null, 'Sales', 600000);
insert into department values (null, 'Research and Development', 1000000);

CREATE TABLE Employee (
    EmployeeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    DepartmentId INTEGER NOT NULL,
    FirstName text NOT NULL,
    LastName text NOT NULL,
	Title text not null,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

insert into Employee values (null, 1, 'Ted', 'McGilicutty', 'Stooge');
insert into Employee values (null, 1, 'Kev', 'Kool', 'Supervisor');
insert into Employee values (null, 1, 'Bill', 'Bixby', 'Dog');

create table Training (
	TrainingId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Title text not null,
	StartDate integer not null,
	EndDate integer not null,
	MaxAttendance integer not null
);

insert into Training values (null, 'How To Train Your Dragon', 05012017, 05052017, 20);
insert into Training values (null, 'How To Be Cool', 042417, 04252017, 3);
insert into Training values (null, 'How To Win w/o Trying', 05132017, 05182017, 10);

create table EmployeeTraining (
	EmployeeTrainingId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	EmployeeId integer not null,
	TrainingId integer not null,
	foreign key (EmployeeId) references Employee(EmployeeId),
	foreign key (TrainingId) references Training(TrainingId)
);

insert into EmployeeTraining values (null, 1, 2);
insert into EmployeeTraining values (null, 2, 2);
insert into EmployeeTraining values (null, 3, 2);


create table Computer (
    ComputerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    EmployeeId integer not null,
    PurchaseDate integer not null,
    DestroyDate integer not null,
    foreign key (EmployeeId) references Employee(EmployeeId)
);

insert into Computer values (null, 1, 01011986, 99999999);
insert into Computer values (null, 2, 01011986, 99999999);
insert into Computer values (null, 3, 01011986, 99999999);

create table Catagory (
    CatagoryId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name text not null
);

insert into Catagory values (null, 'Electronics');
insert into Catagory values (null, 'Sports');
insert into Catagory values (null, 'Food');

create table Customer (
    CustomerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FisrtName text not null,
    LastName text not null
);

insert into Customer values (null, 'Scott', 'Aukerman');
insert into Customer values (null, 'Paul', 'Tompkins');
insert into Customer values (null, 'Jesse', 'Thorn');

create table PaymentType (
    PaymentTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name text not null,
    CustomerId integer not null,
    AccountNumber integer not null,
    foreign key (CustomerId) references Customer(CustomerId)
);

insert into PaymentType values (null, 'Cash', 1, 123456);
insert into PaymentType values (null, 'Visa', 2, 789101);
insert into PaymentType values (null, 'BitCoin', 3, 121314);

create table Product (
    ProductId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    CatagoryId integer not null,
    CustomerId integer not null,
    Title text not null,
    Price integer not null,
    Description text not null,
    foreign key (CatagoryId) references Catagory(CatagoryId),
    foreign key (CustomerId) references Customer(CustomerId)
);

insert into Product values (null, 1, 1, 'Tube Amp', 2000, 'The Atlas Magnum was designed to box outside of its weight class and in that spirit it is truly a world champion. Handily outperforming amplifiers costing many times its price, the Rogue Atlas sets a new standard in affordable tube amplification. With circuitry borrowed from our most advanced amplifier designs, the Atlas effortlessly conveys the detail and nuance of even the most complex musical passages. And with 100 WPC of pure tube power on tap, the Atlas is capable of realistic volume levels that will rival the clarity and presence of the original performance.');
insert into Product values (null, 2, 2, 'Baseball', 100, "For 23 years Bud Selig ran Major League Baseball, but in January of 2015, Robert Manfred took over as the new commissioner. Now you can get a piece of the new era of baseball when you get this New MLB Official baseball from Rawlings. It also features the new commissioner's signature as well as the official MLB Batterman logo.");
insert into Product values (null, 3, 3, 'Tempeh', 10, 'Fermented soybeans.');

create table OrderTable (
    OrderTableId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductId integer not null,
    CustomerId integer not null,
    PaymentTypeId integer not null,
    foreign key (ProductId) references Product(ProductId)
    foreign key (CustomerId) references Customer(CustomerId)
    foreign key (PaymentTypeId) references PaymentType(PaymentTypeId)
);

insert into OrderTable values (null, 3, 1, 1);
insert into OrderTable values (null, 3, 2, 2);
insert into OrderTable values (null, 3, 3, 3);


create table OrderProduct (
    OrderProductId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductId integer not null,
    OrderTableId integer not null,
    foreign key (ProductId) references Product(ProductId),
    foreign key (OrderTableId) references OrderTable(OrderTableId)
);

insert into OrderProduct values (null, 3, 1);
insert into OrderProduct values (null, 3, 1);
insert into OrderProduct values (null, 3, 1);
insert into OrderProduct values (null, 3, 1);
insert into OrderProduct values (null, 3, 1);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 2);
insert into OrderProduct values (null, 3, 3);
insert into OrderProduct values (null, 3, 3);
insert into OrderProduct values (null, 3, 3);

SELECT e.FirstName, e.Title, d.Name
FROM Employee e
LEFT JOIN Department d 
ON e.DepartmentId = d.DepartmentId;


