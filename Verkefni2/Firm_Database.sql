drop database if exists TheFirm;
create database TheFirm;
use TheFirm;


create table ZipCode
(
    zipID int primary key auto_increment,
    zipCode int
);

create table City
(
    cityID int primary key auto_increment,
    city varchar(55)
);

create table FirmInfo
(
	firmID int primary key auto_increment,
    companyName char(75),
    zipCode int,
    city int,
    telephone1 char(10),
    telephone2 char(10),
    email varchar(125),
    ceo varchar(55),
    companySlogan char(25),
    constraint zipCodeFK foreign key(zipCode) references ZipCode(zipID),
    constraint cityFK foreign key(city) references City(cityID)
);

create table Products
(
	productID int primary key auto_increment,
    productName varchar(55),
    timeOfProduction date,
    recommendedSalesPrice int
);

create table Jobs
(
    jobID int primary key auto_increment,
    jobTitle varchar(55)
);

create table Staff
(
	staffID int primary key auto_increment,
    staffName varchar(75),
    jobTitle int,
    jobPhone char(10),
    homePhone char(10),
    mobilePhone char(10),
    division int,
    constraint jobTitleFK foreign key(jobTitle) references Jobs(jobID),
    constraint divisionFK foreign key(division) references Divisions(divisionID)
);

create table DivisionManagers
(
    managerID int primary key auto_increment,
    staff int
    constraint staffFK foreign key(staff) references Staff(staffID)
);

create table Divisions
(
	divisionID int primary key auto_increment,
    divisionName varchar(75),
    productNumber int,
    divisionManager int,
    firm int,
    constraint productNumberFK foreign key(productNumber) references Products(productID),
    constraint divisionManagerFK foreign key(divisionManager) references Staff(staffID),
    constraint firmFK foreign key(firm) references FirmInfo(firmID)
);