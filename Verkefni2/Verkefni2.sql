-- -----------------------------------------------------
-- 					  Liður 1
-- -----------------------------------------------------

create table nemendur
(
    nemandi int(11) not null auto_increment,
    fornafn varchar(20) not null,
    eftirnafn varchar(20) not null,
    faedingardagur date not null,
    constraint nemandi_PK primary key(nemandi)
);

alter table afangaframbod
    add nemandi int(11) null,
    add constraint nemandi_FK foreign key(nemandi) references nemendur(nemandi);

-- -----------------------------------------------------
-- 					  Liður 2
-- -----------------------------------------------------

insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Berit','Olsen','1998-09-01');
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Snorri','Birgisson','2001-06-25');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Vilborg','Benediktsdóttir','2001-12-24');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Jasmine','Larsson','1996-09-21');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Steinn','Halldórsson','2001-09-12');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Kristian','Berg','1998-04-03');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Edda','Elísdóttir','1998-04-12');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Helgi','Sigurðsson','2000-09-11');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('Ásgeir','Friðriksson','1999-06-15');	
insert into nemendur(fornafn,eftirnafn,faedingardagur)values('María','Grétarsdóttir','1999-05-05');	

create table Nemendaskraning
(
	nemendaskraningID int not null auto_increment,
	dagsetning date,
	afangaNumer char(15),
	nemandiID int,
	einkunn int,
    constraint nemendaskraningPK primary key(nemendaskraningID),
	constraint afangaNumerPK foreign key(afangaNumer) references afangar(afangaNumer),
	constraint nemandPK foreign key(nemandiID) references nemendur(nemandi)
);

insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2013-08-01','ENSK2AE05AT',4,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2013-08-01','STÆR2BR05AT',4,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2013-08-01','FORR1FG05AU',4,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2013-08-01','LÍFS1GR05AT',4,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2013-08-01','KEST1TR05AU',4,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2014-01-01','VEFÞ1VG05AU',4,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2014-01-01','ÍSLE2AA05AT',4,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2014-01-01','VEFÞ2VF05CU',4,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2014-01-01','STÆR2AH05BT',4,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2014-08-01','GAGN1NG05AU',4,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2014-08-01','ÍSLE2GO05BT',4,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2014-08-01','FORR2FA05BU',4,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-01-01','STÆR3FM05DT',4,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-01-01','FORK2FE02AU',4,10);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','VEFÞ3VL05EU',6,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','GAGN2VG05CU',6,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','FORR2HF05CU',6,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','FORR3JS05DU',6,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','STÆR4HT05FT',6,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-08-01','KEST3WS05FU',6,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','KEST3LN05EU',6,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','GAGN3GS05DU',6,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-08-01','ENSK2AE05AT',1,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-08-01','VEFÞ1VG05AU',1,4);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-08-01','STÆR2BR05AT',1,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-08-01','FORR1FG05AU',1,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-08-01','LÍFS1GR05AT',1,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-08-01','KEST1TR05AU',1,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-01-01','VEFÞ1VG05AU',1,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-01-01','ÍÞRÓ1LA01AT',1,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-01-01','STÆR2AH05BT',1,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-01-01','MENL1AL05AT',1,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-01-01','KEST2VJ05BU',1,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','STÆR3RV05CT',1,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','EÐLI2GR05BT',1,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','VEFÞ2VH05BU',1,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','ÍSLE3BF05CT',1,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','STÆR3FM05DT',1,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','KEST2WG05DU',1,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','ENSK2AE05AT',7,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','VEFÞ1VG05AU',7,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','STÆR2BR05AT',7,10);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','FORR1FG05AU',7,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2015-08-01','LÍFS1GR05AT',7,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','ÍÞRÓ1LB01BT',7,10);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','VEFÞ2VF05CU',7,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','STÆR2AH05BT',7,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','MENL1AL05AT',7,10);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','STÆR3RV05CT',9,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','EÐLI2GR05BT',9,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2016-01-01','VEFÞ2VH05BU',9,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','VEFÞ2VÞ05DU',9,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','GAGN2HS05BU',9,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','FORR3RR05DU',9,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','ENSK2AE05AT',10,10);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','VEFÞ1VG05AU',10,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','ÍSLE2AA05AT',10,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','KEST1TR05AU',10,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','FORR1FG05AU',10,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','ÍÞRÓ1LB01BT',10,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','VEFÞ2VF05CU',10,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','STÆR2AH05BT',10,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','MENL1AL05AT',10,10);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','KEST2VJ05BU',10,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','ÍSLE2GO05BT',10,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','GAGN1NG05AU',10,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','KEST2LG05DU',8,3);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','STÆR3FM05DT',8,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','FORK2FE02AU',8,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2017-08-01','FORR3RR05DU',8,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','KEST2WG05DU',8,5);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','KEST2CG05DU',8,4);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','KEST3LS05FU',8,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-01-01','STÆR3FV05ET',8,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','ENSK2AE05AT',5,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','VEFÞ1VG05AU',5,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','STÆR2BR05AT',5,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','FORR1FG05AU',5,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','LÍFS1GR05AT',5,9);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','KEST1TR05AU',5,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','ÍÞRÓ1LA01AT',5,6);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','ÍÞRÓ1GH02AT',5,8);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2018-08-01','ÍSLE2AA05AT',5,7);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','ÍÞRÓ1LB01BT',5,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','VEFÞ2VF05CU',5,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','STÆR2AH05BT',5,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','MENL1AL05AT',5,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','KEST2VJ05BU',5,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','ENSK2AE05AT',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','VEFÞ1VG05AU',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','STÆR2BR05AT',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','FORR1FG05AU',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','LÍFS1GR05AT',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','KEST1TR05AU',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','ENSK2AE05AT',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','VEFÞ1VG05AU',3,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','STÆR2BR05AT',2,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','FORR1FG05AU',2,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','LÍFS1GR05AT',2,null);
insert into Nemendaskraning(dagsetning,afangaNumer,nemandiID,einkunn)values('2019-01-01','KEST1TR05AU',2,null);


-- -----------------------------------------------------
-- 					  Liður 3
-- -----------------------------------------------------



/*
    3:
    Gefið er skript af gagnagrunni fyrirtækis(Firm_Database) ásamt ERD mynd(Firm_ERD). Framkvæmið eftirfarandi:
    
		3a:
        Kannið hvort töflurnar eru á 3NF og sé svo ekki þá lagið þið það svk. reglum um normalíseringu.
        
        3b:
        Samræmið stafsetningu á töflu og dálkaheitum.  Notið annaðhvort camelCase, PascalCase eða snake-case
        og hafið gott samræmi í nöfnum.
        
        3c:
        Setjið viðeigandi vensl á grunnin.  ATH:  þegar þið hafið normalíserað grunninn eru komnar fleiri töflur sem
        að sjálfsögðu venslast líka.
        
        3d:
        Setjið prófunargögn í "uppfærða grunninn", td. eitt fyrirtæki með tvær deildir og fimm starfsmenn sem framleiðir 3 vörur.
*/

Sjá Firm_Database-normalized.sql og firm_inserts.sql
