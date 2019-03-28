-- 1:
-- Sækja nemendur sem fæddir eru á milli 1998 og 2000, bæði árin meðtalin.
-- Setjið fornafn og eftirnafn saman með concat() fallinu.
-- Birtið allar upplýsingar um nemendurna og raðið niðurstöðum eftir fæðingardegi, þeir yngstu fyrst.

select concat(fornafn, eftirnafn) as "Fullt nafn", faedingardagur from nemendur
where faedingardagur between cast("1997-12-31" as date) and cast("2001-01-01" as date)
order by faedingardagur asc;

-- 2:
-- í töflunni Undanfarar er dálkurinn tegund sem er af taginu char(1).
-- Þessi dálkur er notaður til að geyma hverskonar undanfari er á ferðinni:
-- Ef skoðuð er create table skipðunin fyrir töfluna Undanfarar þá er þar eftirfarandi komment:
-- 1 = undanfari, 2 = má taka með, 3 = verður að taka með.
-- veljið undanfaraNumer og afangaNumer og notið case skipunina til að breyta tegund í viðeigandi heiti þannig að:
-- '1' verði að "Undanfari", 
-- '2' verði að "Má taka með"
-- '3' verði Bundin "Verður að taka með"

select undanfaraNumer, afangaNumer,
case
	when tegund = 1 then "Undanfari"
    when tegund = 2 then "Má taka með"
    when tegund = 3 then "Verður að taka með"
    else "No idea"
END as tegund
from undanfarar;

-- 3:
-- þegar select skipunin úr lið 2 er keyrð fást eftirfarandi niðurstöður
-- ef verið er að nota upphaflegu gögnin í námsferils grunninum:
-- 
-- undanfaraNumer	afangaNumer		tegund   
-- GAGN2HS05BU  	GAGN1NG05AU  	Undanfari
-- GAGN2VG05CU  	GAGN2HS05BU  	Undanfari
-- GAGN3GS05DU  	GAGN2VG05CU  	Má taka með

-- Þar er ljóst að gerð hafa verið mistök þegar þessi gögn voru sett í grunninn 
-- vegna þess að þau gögn sem eru í dálknum afangaNumer eiga að vara í dálknum
-- undanfaraNumer og öfugt.
-- Lagfærið þetta með update skipunum

update undanfarar
set undanfaraNumer = "GAGN1NG05AU", afangaNumer = "GAGN2HS05BU"
where undanfaraNumer = "GAGN2HS05BU";

update undanfarar
set undanfaraNumer = "GAGN2HS05BU", afangaNumer = "GAGN2VG05CU"
where undanfaraNumer = "GAGN2VG05CU";

update undanfarar
set undanfaraNumer = "GAGN2VG05CU", afangaNumer = "GAGN3GS05DU"
where undanfaraNumer = "GAGN3GS05DU";

-- 4:
-- Þegar nemandi skráir sig í áfanga úthlutar kerfið svokölluðu skráningarnúmeri. 
-- Í þessari fyrirspurn þarf að skoða heiti þeirra áfanga sem hafa slíkt númer.
-- Ekki er þörf á að birta áfanganúmer heldur aðeins áfangaheiti og skráninganúmerið.

select nemendaskraningID, afangaHeiti from nemendaskraning, afangar
where nemendaskraningID is not null;

-- 5:
-- Notið select skipun með case - when útfærslu til að finna út hvort einhver nemandi skráðir sig í áfanga á afmælsidaginn sinn. 
-- Hér verið þið að nota fæðingardaginn og mánuðinn ekki árið!

select concat(fornafn, eftirnafn) as name, faedingardagur, dagsetning,
CASE
	WHEN concat(month(faedingardagur), day(faedingardagur)) = concat(month(dagsetning), day(dagsetning))
    	then "Vei"
end as "Afmæli"
from nemendur, nemendaskraning

-- 6:
-- Eins og þið hafið komist að þá er enginn nemandi sem hefur skráð sig í áfanga á afmælisdaginn(miðað við original gögnin).
-- Til að geta prófað þetta þarf að breyta a.m.k. einni færslu í töflunni Nemendaskraning, þannig 
-- að viðkomandi hafi skráð sig á afmælisdeginum. Það er nóg að breyta einni skráningu!



-- 7:
-- Notið staðgengla til að birta upplýsingar um áfanga og undanfara þeirra.
-- Birtið áfagnanúmerið, áfangaheitið, undanfaranúmerið, undanfarheitið' og tegund undanfara(það nægir að nota 1, 2 eða 3)



-- 8:
-- Útfærið fyrirspurnina úr lið 7 þannig að birtar séu upplýsingar um alla áfanga óháð því 
-- hvort þeir eru með undanfara eða ekki.



-- 9:
-- Bætið nú fyrirspurn 7 þannig að í stað 1, 2 og 3 fyrir tegund komi sami texti og í lið 2.



-- 10:
-- Veljið upplýsingar um nemendur sem hafa valið áfanga sem er undanfari.
-- Birtið nemanda ID, fornafn og eftirnafn samsett með concat() fallinu og undanfaranúmerið!
