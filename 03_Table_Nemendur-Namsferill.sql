create table table Nemendur
(
	ID primary key auto_increment not null,
	fornafn varchar(55) not null,
	eftirnafn varchar(55) not null,
	faedingarDagur date not null,
	constraint nemandi_PK primary key(ID)
);

create table Namsferill
(
	ID primary key auto_increment not null,
	dagsetning datetime,
	einkunn tinyint,
	nemandiID int not null,
	afangaID char(15) not null,
	constraint skraning_PK primary key(ID),
	constraint skraning_nemandi_FK foreign key(nemandiID) references Nemendur(ID),
	constraint skraning_afangi_FK foreign key(afangaID) references AfangaFrambod(ID)
);