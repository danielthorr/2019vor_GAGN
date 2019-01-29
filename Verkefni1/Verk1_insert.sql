insert into Customer(CUS_CODE, CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE, CUS_BALANCE)
values
(10010,'Ramas','Alfred','A','181','844-2573',0),
(10011,'Dunne','Leona','K','161','894-1238',0),
(10012,'Smith','Kathy','W','181','894-2285',345.86);

insert into Product (PROD_CODE, PROD_DESCRIPT, PROD_PRICE, PROD_ON_HAND)
values
('11QER/31','Power painter, 15 psi., 3-nozzle, 2007-11-07',85109,000),
('13-Q2/P2','7.25-cm. pwr. saw blade’,2007-12-14', 321514.99,0),
('14-Q1/L3','9.00-cm. pwr. saw blade, 2007-11-13', 181217, 0.00);

insert into Line (PROD_CODE, LINE_UNITS, LINE_PRICE)
values
(1001,1,11499),
(1001,2,1995),
(1002,1,2499);

insert into Invoice (CUS_CODE, LINE_CODE, INV_DATE)
values
(1001,10014,'2008-01-16'),
(1002,10011,'2008-01-16'),
(1003,10012,'2008-01-16');


insert into Vendor (VEND_CONTACT, VEND_AREACODE, VEND_PHONE)
values
(21225,'Bryson, Inc.','Smithson','0181'),
(21226,'SuperLoo, Inc.','Flushing','0113'),
(21231,'D\&E Supply','Singh','0181');