drop database if exists SaleCo;

create database SaleCo;
use SaleCo;

create table Customer
(
	CUS_CODE int,
	CUS_LNAME varchar(30),
	CUS_FNAME varchar(30),
	CUS_INITIAL varchar(10),
	CUS_AREACODE char(3) default '181',
	CUS_PHONE char(7),
	CUS_BALANCE int default 0,
	constraint customer_pk primary key(CUS_CODE)
);

create table Employee
(
	EMP_NUM int auto_increment,
	EMP_TITLE char(10),
	EMP_LNAME varchar(15),
	EMP_FNAME varchar(15),
	EMP_INITIAL char(1),
	EMP_DOB datetime,
	EMP_HIR_DATE datetime,
	EMP_AREACODE char(5),
	EMP_PHONE char(8),
	EMP_MGR tinyint,
	constraint employee_number_PK primary key (EMP_NUM)
);

create table Product
(
	PROD_CODE varchar(30),
	PROD_DESCRIPT varchar(255),
	PROD_PRICE mediumint,
	PROD_ON_HAND smallint,
	constraint product_PK primary key(PROD_CODE)
);


create table Line
(
	LIN_NUMBER int,
	PROD_CODE varchar(30),
	LINE_UNITS smallint default 0,
	LINE_PRICE mediumint default 0,
	constraint line_PK primary key (LIN_NUMBER),
	constraint line_prod_FK foreign key (PROD_CODE) 
		references Product(PROD_CODE) on update cascade on delete cascade
);

create table Invoice
(
	INV_NUMBER int,
	CUS_CODE int,
	LINE_CODE int,
	INV_DATE datetime,
	SERVICED_BY int,
	constraint invoice_PK primary key(INV_NUMBER),
	constraint invoice_customer_FK foreign key (CUS_CODE)
		references Customer(CUS_CODE) on update cascade on delete cascade,
	constraint invoice_line_FK foreign key (LINE_CODE)
		references Line(LIN_NUMBER) on update cascade on delete cascade,
	constraint serviced_by_FK foreign key (SERVICED_BY)
		references Employee (EMP_NUM) on update cascade on delete cascade
);
create table Vendor
(
	VEND_CODE int,
	VEND_CONTACT varchar(100),
	VEND_AREACODE char(3),
	VEND_PHONE char(7),
	constraint vendor_PK primary key(VEND_CODE)
);