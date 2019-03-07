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
