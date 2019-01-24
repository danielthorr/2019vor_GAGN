create table table Nemendur
(
	ID primary key auto_increment not null,
	fornafn varchar(30) not null,
	eftirnafn varchar(30) not null,
	faedingarDagur date not null
);

create table Namsferill
(
	ID primary key auto_increment not null,
	dagsetning date not null,
	einkunn tinyint(3)
	nemandiID (FK to nemendur.ID)
	afangaID (FK to afangaframbod.ID)
);