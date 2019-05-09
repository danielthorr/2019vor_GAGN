-- 1:
-- Skrifið function, FjoldiSkylduafanga sem skilar fjölda skylduáfanga á ákveðinni braut.
-- brautarnúmerið er sent inn sem færibreyta
drop function if exists FjoldiSkylduafanga //
create function FjoldiSkylduafanga (brautarNumer int)
RETURNS int
begin
	declare fjoldi int;
    return 
    	(select count(*) from afangaframbod a
        join brautir b on a.brautarNumer = b.brautarNumer
        where a.skylda = 1 and b.brautarNumer = brautarNumer);
end; //

select FjoldiSkylduafanga(brautarNumer) from brautir //

-- 2:
-- Skrifið function, Meðaleinkunn sem reiknar meðaleinkunn úr áföngum sem ákv. nemandi hefur lokið.
-- Notið færibreytuna nemandi_id. 
-- Til að forma kommutöluna þannig að hún hafi einn aukastaf og mest tvo tölustafi, t.d: 10.0 er
-- sniðugt að nota float(3,1) sem return-gagnatag og rúnna svo meðaltalið með round() fallinu!
drop function if exists Medaleinkunn //
create function Medaleinkunn(nemandi_id int)
returns float(3,1)
BEGIN
	return 
    	(select round(avg(einkunn), 1) from nemendaskraning
        where nemendaskraning.nemandiID = nemandi_id);
END; //

select Medaleinkunn(nemandiID) from nemendaskraning //

-- 3:
-- Skrifið function, FjoldiUndanfara sem telur hve marga undanfara einhver ákveðinn áfangi hefur.
-- Hafi áfangi engan undanfara þá er skilað 0
drop function if exists FjoldiUndanfara//
create function FjoldiUndanfara(afangi char(15))
RETURNS int
BEGIN
	  declare fjoldi int;
    declare tmpAfangi char(15);
    set fjoldi = 0;
    set tmpAfangi = afangi;

    loopLabel: loop
    	if (select count(*) from undanfarar where afangaNumer = tmpAfangi) <= 0
        	then leave loopLabel;
        end if;
        
        set tmpAfangi = (select undanfaraNumer from undanfarar where afangaNumer = tmpAfangi);
        set fjoldi = fjoldi + 1;
        
  	end loop loopLabel;
    return fjoldi;
end; //
select afangaNumer, afangaHeiti, FjoldiUndanfara(afangaNumer) as FjoldiUndanfara from afangar//

-- 4:
-- Skrifið function, HlutfallLokinnaAfanga sem reiknar út hve stórt hlutfall af áföngum
-- á ákveðinni braut, nemandinn hefur lokið.
-- gefa þarf upp bæði nemanda ID og brautarnúmer.
drop function if exists HlutfallLokinnaAfanga //
create function HlutfallLokinnaAfanga(nemID int, brautID int)
RETURNS float(3,1)
begin
	declare fjoldiAfanga int;
    declare afongumLokid int;
    set fjoldiAfanga = (select count(*) from afangaframbod where brautarNumer = brautID);
    set afongumLokid = (select count(*) from afangaFrambod af inner join nemendaskraning ns on af.afangaNumer = ns.afangaNumer where ns.nemandiID = nemID and af.brautarNumer = brautID);
    return (afongumLokid / fjoldiAfanga) * 100;
end; //

select distinct nemandi, fornafn, HlutfallLokinnaAfanga(nemandi, brautarNumer) as hlutfall from nemendur, afangaFrambod//

-- 5:
-- skrifið function, EndurteknirAfangar sem kannar hvort nemandi hefur tekið einhvern áfanga 
-- eða einhverja áfanga oftar en einu sinni. 
-- Ef nemandinn hefur t.d. tekið tvo áfanga oftar en einu sinni þá er skilað 2 en ef nemandinn
-- ATH:  Þið teljið áfangana, ekki fjölda þeirra skipta sem einhver áfangi hefur verið endurtekin.
drop function if exists EndurteknirAfangar //
create function EndurteknirAfangar(nemID int)
RETURNS int
begin
    return (
        select count(*) 
        from 
        	(select afangaNumer, count(*) as ct 
         	from nemendaskraning 
             where nemandiID = nemID 
             group by afangaNumer) as grp 
        where ct > 1);
end; //
select distinct nemandiID, EndurteknirAfangar(nemandiID) from nemendaskraning //


-- 6:
-- skrifið Stored Procedure nyBraut sem skráir nýja námsbraut í gagnagrunninn.
-- gefa þarf upp heiti nýju brautarinnar og hvaða skóla hún tilheyrir.
-- Notið row_count() til að "skila" fjölda raða sem verða til við að keyra þennan SP.
-- 
-- Prófið með eftirfarandi kalli í NyBraut:  call NyBraut('Tölvuleikjaskolinn',10);
-- 6:
-- skrifið Stored Procedure nyBraut sem skráir nýja námsbraut í gagnagrunninn.
-- gefa þarf upp heiti nýju brautarinnar og hvaða skóla hún tilheyrir.
-- Notið row_count() til að "skila" fjölda raða sem verða til við að keyra þennan SP.
-- 
-- Prófið með eftirfarandi kalli í NyBraut:  call NyBraut('Tölvuleikjaskolinn',10);
drop procedure if exists NyBraut //
create procedure NyBraut(in nafnBrautar varchar(75), in undirskolaNumer int, out radir int)
begin
    insert into brautir (heitiBrautar, tilheyrir) values (nafnBrautar, undirskolaNumer);
    set radir = (select row_count());
end; //
call NyBraut("Ný braut", 2, @out_number) //
select @out_number //

-- 7:
-- skrifið Stored Procedure SkraAfangaNemanda sem skráir ákv. nemanda í ákv. áfanga.
-- Byrjað er á að kanna hvort nemandinn er skráður í áfangann og sé svo ekki þá heldur skráningin
-- áfram.  Sé nemandinn hins vegar skráður(einkunn is null) þá er ekki aðhafst neitt.
-- Hér má nota row_count() eins og gert var í lið 5.
drop procedure if exists SkraAfangaNemanda //
create procedure SkraAfangaNemanda(in nemID int, in afangi char(15), out radir int)
begin
    declare einkunn int default 0;
    set einkunn = (select distinct einkunn from nemendaskraning where nemandiID = nemID and afangaNumer = afangi);
    if einkunn = ""
    	then insert into nemendaskraning (dagsetning, afangaNumer, nemandiID) values (curdate(), afangi, nemID);
    end if;
    set radir = (select row_count());
end; //
call SkraAfangaNemanda(4, "ENSK2AE05AT", @out_number) //
select @out_number //

-- 8:
-- Skrifið Stored Procedure NemendaYfirlit sem birtir upplýsingar um nemendur og nám þeirra.
-- Sýnið eftirfarandi upplýsingar: auðkenni(ID) nemanda, nafn nemanda, áfanganúmer, afangaheiti, einkunn og einingafjölda
drop procedure if exists NemendaYfirlit //
create procedure NemendaYfirlit()
begin
	select n.nemandi, n.fornafn, n.eftirnafn, ns.afangaNumer, a.afangaHeiti, ns.einkunn, a.einingar
    	from nemendur n
        join nemendaskraning ns on n.nemandi = ns.nemandiID
        join afangar a on ns.afangaNumer = a.afangaNumer;
end; //
call NemendaYfirlit() //

-- 9:
-- NemendaYfirlit úr lið 8 skilar þeim upplýsingum sem beðið er um en það er smá ónákvæmni sem vert er að skoða.
-- Hafi nemandinn fengi undir 5 í einkunn á hann ekki rétt á einingum, alla vega ekki í þessu kerfi :-)
-- Einkunnafjöldi fyrir hvern áfanga er hins vegar skráður í töfluna Afangar svo að það þarf að "reikna" út hvort
-- viðkomandi nemandi á að fá einingar fyrir áfangann eða ekki. Reglan hér er: einkunn < 5 => einingar = 0.
-- Reynið að bæta fyrirspurninaúr lið 8 þannig að þetta birtist í yfirlitinu(með t.d. case when) 
-- Kallið endurgerðan SP, NemendaYfirlit_II
drop procedure if exists NemendaYfirlit_II //
create procedure NemendaYfirlit_II()
begin
	select n.nemandi, n.fornafn, n.eftirnafn, ns.afangaNumer, a.afangaHeiti, ns.einkunn, 
    	case 
        	when ns.einkunn >= 5 then a.einingar
            else 0
        end as einingar
    	from nemendur n
        join nemendaskraning ns on n.nemandi = ns.nemandiID
        join afangar a on ns.afangaNumer = a.afangaNumer;
end; //
call NemendaYfirlit_II() //


-- 10:
-- Skrifið VIEW, AfangaframbodUndirskola.
-- Birtið heiti skóla, heiti undirskóla, heiti brauta, afanganúmer, áfangaheiti, önn áfangans og hvort áfangin er skylda.
-- raðið eftir skólaheiti, undirskólaheiti, brautarheiti.
create or replace view AfangaframbodUndirskola as
	select 
    	s.skolaheiti as "Skóli", 
    	u.heiti as "Undirskóli", 
        b.heitiBrautar as "Braut", 
        a.afangaHeiti as "Áfangi", 
        afb.onnAfanga as "Önn áfangans", 
    	case 
        	when afb.skylda = 1 then "Skylduáfangi"
            when afb.skylda = 0 then "Ekki skylduáfangi"
        end as "Skylduáfangi"
    from skolar s
    join undirskolar u 
    	on s.skolaNumer = u.skolaNumer
    join brautir b 
    	on u.undirskolaNumer = b.tilheyrir
    join afangaframbod afb 
    	on b.brautarNumer = afb.brautarNumer
    join afangar a 
    	on afb.afangaNumer = a.afangaNumer
    order by s.skolaheiti, u.heiti, b.heitiBrautar;
    
select * from AfangaframbodUndirskola;