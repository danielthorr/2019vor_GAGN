drop database if exists SaleCo;

create database SaleCo;
use SaleCo;

create table Customer
(
	CUS_CODE int auto_increment,
	CUS_LNAME varchar(30),
	CUS_FNAME varchar(30),
	CUS_INITIAL varchar(10),
	CUS_AREACODE char(3),
	CUS_PHONE char(7),
	CUS_BALANCE int,
	constraint customer_pk primary key(CUS_CODE)
);

create table Invoice
(
	INV_NUMBER int auto_increment,
	CUS_CODE int,
	LINE_CODE int,
	INV_DATE datetime,
	constraint invoice_PK primary key(INV_NUMBER),
	constraint invoice_customer_FK foreign key (CUS_CODE) references Customer(CUS_CODE),
	constraint invoice_line_FK foreign key (LINE_CODE) references Line(LINE_NUMBER)
);

create table Line
(
	LIN_NUMBER int auto_increment,
	PROD_CODE int,
	LINE_UNITS smallint,
	LINE_PRICE mediumint,
	constraint line_PK primary key (LIN_NUMBER),
	constraint line_prod_FK foreign key (PROD_CODE) references Product(PROD_CODE)
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
	VEND_CONTACT varchar(100),
	VEND_AREACODE char(3),
	VEND_PHONE char(7),
	constraint vendor_PK primary key(VEND_CODE)
);
