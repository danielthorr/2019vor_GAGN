drop __ if exists __;

create __ __;
use __;

the cat food problem

-----------
ex:

drop database if exists SaleCo;

create database SaleCo;
use SaleCo;

create table Customer
(
	CUS_CODE int auto_increment,
	CUS_LNAME varchar(75),
	CUS_FNAME varchar(75),
	CUS_INITIAL varchar(15),
	CUS_AREACODE char(3),
	CUS_PHONE char(7),
	CUS_BALANCE int,
	constraint customer_pk primary key(CUS_CODE)
);

create table Invoice
(
	INV_NUMBER int auto_increment,
	CUS_CODE int,
	INV_DATE datetime,
	constraint invoice_PK primary key(INV_NUMBER),
	constraint invoice_customer_FK foreign key (CUS_CODE) references Customer(customer_PK)
);

create table Line
(
	LIN_NUMBER int auto_increment,
	LINE_UNITS smallint,
	LINE_PRICE mediumint,
	constraint line_PK primary key (LIN_NUMBER)
	
);

create table Product
(
	PROD_CODE int auto_increment,
	PROD_DESCRIPT varchar(255),
	PROD_PRICE mediumint,
	PROD_ON_HAND smallint,
	constraint product_PK primary key(PROD_CODE)
);

create table Vendor
(
	VEND_CODE int auto_increment,
	VEND_CONTACT varchar(150),
	VEND_AREACODE char(3),
	VEND_PHONE char(7),
	constraint vendor_PK primary key(VEND_CODE)
);
