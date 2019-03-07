insert into ZipCodes(zipCode)values(1003);
insert into Cities(city)values("Manhattan");
insert into Firms(companyName, zipCode, city, telephone1, telephone2, email, ceo, companySlogan)
    values("The good company", 1, 1, "3332341222", "3558493827", "gcompany@gcompany.com", "Man Goodman", "We are good, give us money");
insert into Divisions(divisionName, firm)
    values("Repair", 1), ("Sales", 1);
insert into Products(productName, timeOfProduction, recommendedSalesPrice, division)
    values("Good stuff", curdate(), 232500, 1), ("Better stuff", curdate(), 2500, 2);
insert into Jobs(jobTitle)values("Salesperson"),("Division manager"), ("Repair technician");
insert into Staff(staffName, jobTitle, jobPhone, homePhone, mobilePhone, division)
    values
        ("Daníel Þór", 2, "5462345679", "", "2227738447", 1), 
        ("Magnús Eskabar", 1, "5462345679", "", "2227738447", 1), 
        ("Jón J.J. Jónsson", 3, "5462345679", "", "2227738447", 2), 
        ("Berta Mó", 3, "5462345679", "", "2227738447", 2), 
        ("Litla Baun", 1, "5462345679", "", "2227738447", 2);
insert into DivisionManagers(staff, division)values(1, 1);
