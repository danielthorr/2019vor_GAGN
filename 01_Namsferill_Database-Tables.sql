-- -----------------------------------------------------
-- 					  Námsgögn
-- -----------------------------------------------------
drop database if exists Namsgogn;
create database Namsgogn default character set utf8;
use Namsgogn ;


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
  ID int(11) not null auto_increment,
  skolaheiti varchar(75) null default null,
  constraint skoli_PK primary key(ID)
);


-- -----------------------------------------------------
-- 					  Undirskolar
-- -----------------------------------------------------
create table Undirskolar
(
  ID int(11) not null auto_increment,
  heiti varchar(75) not null,
  skolaID int(11) not null,
  constraint deild_PK primary key(ID),
  constraint deild_skoli_FK foreign key(skolaID) references Skolar(ID)
);


-- -----------------------------------------------------
-- 						Brautir
-- -----------------------------------------------------
create table Brautir 
(
  ID int(11) not null auto_increment,
  heitiBrautar varchar(75) null default null,
  tilheyrir int(11) not null,
  constraint braut_PK primary key(ID),
  constraint braut_undirskoli_FK foreign key(tilheyrir) references Undirskolar(ID)
);


-- -----------------------------------------------------
-- 						AfangarBrauta
-- -----------------------------------------------------
create table AfangaFrambod
(
  ID int(11) not null,
  afangaNumer char(15) not null,
  onnAfanga tinyint null default null,
  skylda boolean default True,
  constraint afangar_brauta_PK primary key(ID, afangaNumer),
  constraint frambod_afangi_FK foreign key (afangaNumer) references Afangar (afangaNumer),
  constraint frambod_namsleid_FK foreign key (ID) references Brautir(ID)
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
-- 						Nemendur
-- -----------------------------------------------------
create table Nemendur
(
	ID int not null auto_increment,
	fornafn varchar(55) not null,
	eftirnafn varchar(55) not null,
	faedingarDagur date not null,
	constraint nemandi_PK primary key(ID)
);

-- -----------------------------------------------------
-- 						Námsferill
-- -----------------------------------------------------
create table Namsferill
(
	ID int not null auto_increment,
	dagsetning datetime,
	einkunn tinyint,
	nemandiID int not null,
	afangaID char(15) not null,
	constraint namsferill_PK primary key(ID),
	constraint skraning_nemandi_FK foreign key(nemandiID) references Nemendur(ID),
	constraint skraning_afangi_FK foreign key(afangaID) references AfangaFrambod(ID)
);
