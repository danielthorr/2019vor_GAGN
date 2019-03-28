-- -----------------------------------------------------
-- 					  Namsferill
-- -----------------------------------------------------
drop database if exists Namsferill;
create database Namsferill default character set utf8;
use Namsferill ;


-- -----------------------------------------------------
-- 						Afangar
-- -----------------------------------------------------
create table Afangar 
(
  afangaNumer char(15) not null,
  afangaHeiti varchar(75) not null,
  einingar tinyint(4) null default '5',
  constraint afangi_PK primary key(afangaNumer),
  constraint name_NQ unique(afangaHeiti asc)
);


-- -----------------------------------------------------
-- 						Skolar
-- -----------------------------------------------------
create table Skolar 
(
  skolaNumer int(11) not null auto_increment,
  skolaheiti varchar(75) null default null,
  constraint skoli_PK primary key(skolaNumer)
);


-- -----------------------------------------------------
-- 					  Undirskolar
-- -----------------------------------------------------
create table Undirskolar
(
  undirskolaNumer int(11) not null auto_increment,
  heiti varchar(75) not null,
  skolaNumer int(11) not null,
  constraint deild_PK primary key(undirskolaNumer),
  constraint deild_skoli_FK foreign key(skolaNumer) references Skolar(skolaNumer)
);


-- -----------------------------------------------------
-- 						Brautir
-- -----------------------------------------------------
create table Brautir 
(
  brautarNumer int(11) not null auto_increment,
  heitiBrautar varchar(75) null default null,
  tilheyrir int(11) not null,
  constraint braut_PK primary key(brautarNumer),
  constraint braut_undirskoli_FK foreign key(tilheyrir) references Undirskolar(undirskolaNumer)
);


-- -----------------------------------------------------
-- 						AfangarBrauta
-- -----------------------------------------------------
create table AfangaFrambod
(
  brautarNumer int(11) not null,
  afangaNumer char(15) not null,
  onnAfanga tinyint null default null,
  skylda boolean default True,
  constraint afangar_brauta_PK primary key(brautarNumer, afangaNumer),
  constraint frambod_afangi_FK foreign key (afangaNumer) references Afangar (afangaNumer),
  constraint frambod_namsleid_FK foreign key (brautarNumer) references Brautir(brautarNumer)
);


-- -----------------------------------------------------
-- 						Undanfarar
-- -----------------------------------------------------
create table Undanfarar 
(
  undanfaraNumer char(15) not null,
  afangaNumer char(15) not null,
  tegund char(1) null default '1',	-- 1 = undanfari, 2 = má taka með, 3 = verður að taka með.
  primary key (afangaNumer, undanfaraNumer),
  constraint afangi_afangi_FK foreign key (afangaNumer) references Afangar(afangaNumer),
  constraint undanfari_afangi_FK foreign key (undanfaraNumer) references Afangar(afangaNumer)
);

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


insert into Skolar(skolaheiti)values('Tækniskólinn');

insert into Undirskolar(heiti,skolaNumer)values('Byggingatækniskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Endurmenntunarskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Handverksskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Margmiðlunarskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Meistaraskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Raftækniskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Skipstjórnarskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Tækniakademían',1);
insert into Undirskolar(heiti,skolaNumer)values('Tæknimenntaskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Upplýsingatækniskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Vefskólinn',1);
insert into Undirskolar(heiti,skolaNumer)values('Véltækniskólinn',1);

insert into Brautir(heitiBrautar,tilheyrir)values('Bókband',10);
insert into Brautir(heitiBrautar,tilheyrir)values('Grafísk miðlun',10);
insert into Brautir(heitiBrautar,tilheyrir)values('Grunnnám upplýsinga- og fjölmiðlagreina',10);
insert into Brautir(heitiBrautar,tilheyrir)values('K2 - Stúdentsleið',10);
insert into Brautir(heitiBrautar,tilheyrir)values('Ljósmyndun',10);
insert into Brautir(heitiBrautar,tilheyrir)values('Prentiðn',10);
insert into Brautir(heitiBrautar,tilheyrir)values('Tölvubraut - stúdentspróf',10);
insert into Brautir(heitiBrautar,tilheyrir)values('Grunnnám tölvubraut - dreifnám',10);
insert into Brautir(heitiBrautar,tilheyrir)values('Grunnnám upplýsinga- og fjölmiðlagreina - dreifnám',10);

insert into Afangar(afangaNumer,afangaHeiti)values('DANS2BM05AT','Danska');
insert into Afangar(afangaNumer,afangaHeiti)values('ENSK2AE05AT','Enska 1');
insert into Afangar(afangaNumer,afangaHeiti)values('ENSK2OF05BT','Enska 2');
insert into Afangar(afangaNumer,afangaHeiti)values('EÐLI2GR05BT','Eðlisfræði');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR1FG05AU','Forritun Grunnur 1');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR2FA05BU','Forritun Grunnur 2');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR2HF05CU','Forritun Grunnur 3');
insert into Afangar(afangaNumer,afangaHeiti)values('GAGN1NG05AU','Gagnanotkun');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST1TR05AU','Kerfisstjórnun 1');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST2UN05CU','Kerfisstjórnun 2 Linux');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST2VJ05BU','Kerfisstjórnun 3 Windows');
insert into Afangar(afangaNumer,afangaHeiti)values('LÍFS1GR05AT','Lífsleikni');
insert into Afangar(afangaNumer,afangaHeiti)values('MENL1AL05AT','Menningarlæsi');
insert into Afangar(afangaNumer,afangaHeiti)values('STÆR2AH05BT','Stærðfræði 1');
insert into Afangar(afangaNumer,afangaHeiti)values('STÆR2BR05AT','Stærðfræði 2');
insert into Afangar(afangaNumer,afangaHeiti)values('STÆR3FM05DT','Stærðfræði 3');
insert into Afangar(afangaNumer,afangaHeiti)values('STÆR3FV05ET','Stærðfræði 4');
insert into Afangar(afangaNumer,afangaHeiti)values('STÆR3RV05CT','Stærðfræði 5');
insert into Afangar(afangaNumer,afangaHeiti)values('STÆR4HT05FT','Stærðfræði 6');
insert into Afangar(afangaNumer,afangaHeiti)values('VEFÞ1VG05AU','Vefþróun 1 HTML5');
insert into Afangar(afangaNumer,afangaHeiti)values('VEFÞ2VF05CU','Vefþróun 2 CSS');
insert into Afangar(afangaNumer,afangaHeiti)values('VEFÞ2VH05BU','Vefþróun 3 JavaScript');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍSLE2AA05AT','Íslenska 1');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍSLE2GO05BT','Íslenska 2');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍÞRÓ1GH02AT','Íþróttir 1');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍÞRÓ1LA01AT','Íþróttir 2');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍÞRÓ1LB01BT','Íþróttir 3');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍÞRÓ1LC01CT','Íþróttir 4');
insert into Afangar(afangaNumer,afangaHeiti)values('FORK2FE02AU','Forritun 1');
insert into Afangar(afangaNumer,afangaHeiti)values('FORK2FT02BU','Forritun 2');
insert into Afangar(afangaNumer,afangaHeiti)values('FORK2FÞ02CU','Forritun 3');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR2GL05DU','Leikjaforritun 1');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR3CG05DU','Forritun 4');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR3FL05EU','Leikjaforritun 2');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR3FV05EU','Forritun 5');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR3JS05DU','Forritun 6');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR3NÞ05DU','Forritun 7');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR3RR05DU','Forritun 8');
insert into Afangar(afangaNumer,afangaHeiti)values('FORR4CF05EU','Forritun 9');
insert into Afangar(afangaNumer,afangaHeiti)values('GAGN2HS05BU','Gagnasafnsfræði 1');
insert into Afangar(afangaNumer,afangaHeiti)values('GAGN2VG05CU','Gagnasafnsfræði 2');
insert into Afangar(afangaNumer,afangaHeiti)values('GAGN3GS05DU','Gagnasafnsfræði 3');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST2CG05DU','Kerfisstjórnun CNA 1');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST2LG05DU','Kerfisstjórnun CNA 2');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST2WG05DU','Kerfisstjórnun CNA 3');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST3CN05GU','Kerfisstjórnun CNA 4');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST3CR05EU','Kerfisstjórnun Routing');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST3CS05FU','Kerfisstjórnun 4');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST3LN05EU','Kerfisstjórnun 5');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST3LS05FU','Kerfisstjórnun 6');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST3WN05EU','Kerfisstjórnun 7');
insert into Afangar(afangaNumer,afangaHeiti)values('KEST3WS05FU','Kerfisstjórnun  8');
insert into Afangar(afangaNumer,afangaHeiti)values('ROBO2RG05AU','Þjarkar 1');
insert into Afangar(afangaNumer,afangaHeiti)values('ROBO3RF05BU','Þjarkar 2');
insert into Afangar(afangaNumer,afangaHeiti)values('VEFÞ2VÞ05DU','Vefforritun 1');
insert into Afangar(afangaNumer,afangaHeiti)values('VEFÞ3VL05EU','Vefforritun 2');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍSLE3BF05CT','Íslenska 3');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍSLE3LF05CT','Íslenska 4');
insert into Afangar(afangaNumer,afangaHeiti)values('ÍSLE3NB05CT','Íslenska 5');

insert into AfangaFrambod(brautarNumer,afangaNumer,onnAfanga,skylda)
values(7,'DANS2BM05AT',5,true),
	  (7,'ENSK2AE05AT',1,true),
      (7,'ENSK2OF05BT',2,true),
      (7,'EÐLI2GR05BT',3,true),
      (7,'FORR1FG05AU',1,true),
      (7,'FORR2FA05BU',2,true),
      (7,'FORR2HF05CU',3,true),
      (7,'GAGN1NG05AU',2,true),
      (7,'KEST1TR05AU',1,true),
      (7,'KEST2UN05CU',3,true),
      (7,'KEST2VJ05BU',2,true),
      (7,'LÍFS1GR05AT',1,true),
      (7,'MENL1AL05AT',2,true),
      (7,'STÆR2AH05BT',2,true),
      (7,'STÆR2BR05AT',1,true),
      (7,'STÆR3FM05DT',4,true),
      (7,'STÆR3FV05ET',5,true),
      (7,'STÆR3RV05CT',3,true),
      (7,'STÆR4HT05FT',6,true),
      (7,'VEFÞ1VG05AU',1,true),
      (7,'VEFÞ2VF05CU',2,true),
      (7,'VEFÞ2VH05BU',3,true),
      (7,'ÍSLE2AA05AT',1,true),
      (7,'ÍSLE2GO05BT',2,true),
      (7,'ÍÞRÓ1GH02AT',1,true),
      (7,'ÍÞRÓ1LA01AT',1,true),
      (7,'ÍÞRÓ1LB01BT',2,true),
      (7,'ÍÞRÓ1LC01CT',3,true),
      (7,'FORK2FE02AU',4,false),
      (7,'FORK2FT02BU',5,false),
      (7,'FORK2FÞ02CU',6,false),
      (7,'FORR2GL05DU',5,false),
      (7,'FORR3CG05DU',5,false),
      (7,'FORR3FL05EU',6,false),
      (7,'FORR3FV05EU',6,false),
      (7,'FORR3JS05DU',5,false),
      (7,'FORR3NÞ05DU',4,false),
      (7,'FORR3RR05DU',4,false),
      (7,'FORR4CF05EU',6,false),
      (7,'GAGN2HS05BU',4,false),
      (7,'GAGN2VG05CU',5,false),
      (7,'GAGN3GS05DU',6,false),
      (7,'KEST2CG05DU',4,false),
      (7,'KEST2LG05DU',4,false),
      (7,'KEST2WG05DU',4,false),
      (7,'KEST3CN05GU',6,false),
      (7,'KEST3CR05EU',5,false),
      (7,'KEST3CS05FU',5,false),
      (7,'KEST3LN05EU',6,false),
      (7,'KEST3LS05FU',5,false),
      (7,'KEST3WN05EU',5,false),
      (7,'KEST3WS05FU',6,false),
      (7,'ROBO2RG05AU',5,false),
      (7,'ROBO3RF05BU',6,false),
      (7,'VEFÞ2VÞ05DU',4,false),
      (7,'VEFÞ3VL05EU',5,false),
      (7,'ÍSLE3BF05CT',3,false),
      (7,'ÍSLE3LF05CT',3,false),
      (7,'ÍSLE3NB05CT',3,false);
      
insert into Undanfarar(undanfaraNumer,afangaNumer,tegund)values('GAGN2HS05BU','GAGN1NG05AU',1);
insert into Undanfarar(undanfaraNumer,afangaNumer,tegund)values('GAGN2VG05CU','GAGN2HS05BU',1);
insert into Undanfarar(undanfaraNumer,afangaNumer,tegund)values('GAGN3GS05DU','GAGN2VG05CU',2);

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
	constraint afangaNumerFK foreign key(afangaNumer) references Afangar(afangaNumer),
	constraint nemandiFK foreign key(nemandiID) references nemendur(nemandi)
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