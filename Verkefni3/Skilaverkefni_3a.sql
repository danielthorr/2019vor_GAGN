-- 1:
-- Notiðselect skipun til að skila fjölda undirskóla Tækniskólans.
select count(*) from undirskolar;


-- 2:
-- hver er meðaleinkunn allra nemenda sem fengið hafa einkunn

select avg(einkunn) from nemendaskraning
where einkunn is not null;

-- 3:
-- veljið fjölda einkunna sem eru á bilinu 5 - 8

select count(*) from nemendaskraning
where einkunn >= 5 and einkunn <= 8;

-- 4:
-- veljið alla nemendur(nemandiID) sem eru í námi(hafa ekki fengið einkunn)
-- birtið hvert nemenda ID aðeins einu sinni +i niðurstöðunum

select distinct 
nemandi as "Númer nemanda", concat(fornafn, " ", eftirnafn) as "Nafn nemanda" 
    from nemendur n1
inner join nemendaskraning n2 
    on n1.nemandi = n2.nemandiID
        where n2.einkunn is null;

-- 5:
-- sækið númer og heiti allra áfanga sem byrja á bókstafnum E
-- hér má nota annað hvort áfanga númerið eða áfanga heitið!

select afangaNumer, afangaHeiti from afangar
where afangaNumer like "E%";

-- 6:
-- Gefnir eru eftirfarandi áfangar sem kenndir eru í rafiðnaðarskólanum
-- SKYN2SE01AT - Skyndihjálp  		önn 1
-- RAFL1GA03AR - Raflagnir 1  		önn 1
-- RAFL1GA03BR - Raflagnir 2		önn 2
-- RAFM1GA05AR - Rafmagnsfræði 1	önn 2
-- Áfangarnir eru 5 einingar nema Skyndihjálp sem gefur eina einingu.


-- 6a:
-- skráið þessa áfanga í gagnagrunninn.

insert into afangar(afangaNumer, afangaHeiti, einingar)values("SKYN2SE01AT", "Skyndihjálp", 1);

insert into afangar(afangaNumer, fangaHeiti)
values 
("RAFL1GA03AR", "Raflagnir 1"), 
("RAFL1GA03BR", "Raflagnir 2"), 
("RAFM1GA05AR", "Rafmagnsfræði 1");

-- 6b:
-- Þessir áfagnar eru kenndir í grunnnámi rafiðna sem er braut innan Raftækniskólans.
-- Skráðið þessa braut í grunninn.

insert into brautir(heitiBrautar, tilheyrir)values("Grunnám rafiðna", 6);

-- 6c:
-- Setjið þessa áfanga í framboð á nýju brautinni(Gunnnám rafiðna) með því að skrá 
-- viðeigandi upplýsingar í töfluna Afangaframboð.

insert into afangaframbod(brautarNumer, afangaNumer, onnAfanga, skylda)
values
(10, "SKYN2SE01AT", 1, true),
(10, "RAFL1GA03AR", 1, true),
(10, "RAFL1GA03BR", 2, true),
(10, "RAFM1GA05AR", 2, true);


-- 7:
-- veljið allar upplýsingar um alla áfanga úr Afangatöflunni NEMA eftirfarandi:
-- DANS2BM05AT
-- ÍÞRÓ1GH02AT
-- MENL1AL05AT
-- STÆR4HT05FT

select * from afangar
where afangaNumer not in ("DANS2BM05AT", "ÍÞRÓ1GH02AT", "MENL1AL05AT", "STÆR4HT05FT");

-- 8:
-- veljið meðaleinkunn á hvern áfanga. Birtið áfanganúmerið ásamt meðaleinkunn:

select a.afangaNumer, afangaHeiti, avg(einkunn) from afangar a, nemendaskraning n
where a.afangaNumer = n.afangaNumer and einkunn is not null
group by a.afangaNumer

-- 9:
-- Veljð nú meðaleinkunn hvers nemanda(nemandiID) og rúnnið einkunnina af uppá einn aukastaf( td: 8.5000 verður 9.0 en 8.4000 verður 8.0)
-- Takið aðeins einkunnir +afanga sem er lokið(ekki null)
-- https://www.w3schools.com/sql/func_mysql_round.asp

select nemandi, fornafn, avg(einkunn) from nemendur, nemendaskraning
where nemandi = nemandiID and einkunn is not null
group by nemandi

-- 10:
-- Hvað eru margir skylduáfangar áætlaðir á hverja önn á tölvubraut(brautarnúmer 7). 
-- Birtið bæði númer viðkomandi annar og fjölda skylduáfanga:

select 
    onnAfanga as "Önn áfanganna", 
    count(afangaNumer) as "Fjöldi skylduáfanga" 
    from afangaframbod
    
where brautarNumer = 7 and skylda
group by onnAfanga;