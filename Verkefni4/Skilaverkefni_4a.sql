-- 1:
-- Sækja nemendur sem fæddir eru á milli 1998 og 2000, bæði árin meðtalin.
-- Setjið fornafn og eftirnafn saman með concat() fallinu.
-- Birtið allar upplýsingar um nemendurna og raðið niðurstöðum eftir fæðingardegi, þeir yngstu fyrst.
select concat(fornafn, " ", eftirnafn) as nafn, faedingardagur from nemendur
where year(faedingardagur) between 1998 and 2000
order by faedingardagur asc

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
    when tegund = "1" then "Undanfari"
    when tegund = "2" then "Má taka með"
    when tegund = "3" then "Verður að taka með"
  end as tegund
from undanfarar

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
UPDATE undanfarar u1, undanfarar u2 
SET u1.undanfaraNumer = u1.afangaNumer, 
    u1.afangaNumer    = u2.undanfaraNumer 
WHERE u1.afangaNumer = u2.afangaNumer;

-- 4:
-- Þegar nemandi skráir sig í áfanga úthlutar kerfið svokölluðu skráningarnúmeri. 
-- Í þessari fyrirspurn þarf að skoða heiti þeirra áfanga sem hafa slíkt númer.
-- Ekki er þörf á að birta áfanganúmer heldur aðeins áfangaheiti og skráninganúmerið.
select afangaNumer, nemandiID from nemendaskraning
where nemandiID is not null
group by afangaNumer 
order by nemandiID

-- 5:
-- Notið select skipun með case - when útfærslu til að finna út hvort einhver nemandi skráðir sig í áfanga á afmælsidaginn sinn. 
-- Hér verið þið að nota fæðingardaginn og mánuðinn ekki árið!
select ns.afangaNumer, ns.dagsetning, n.faedingardagur,
CASE
	when date_format(ns.dagsetning, "%d%m") = date_format(n.faedingardagur, "%d%m")
    then "Þessi skráði sig á afmælinu sínu"
end as afmaeli
from nemendaskraning ns, nemendur n
where ns.nemandiID = n.nemandi

-- 6:
-- Eins og þið hafið komist að þá er enginn nemandi sem hefur skráð sig í áfanga á afmælisdaginn(miðað við original gögnin).
-- Til að geta prófað þetta þarf að breyta a.m.k. einni færslu í töflunni Nemendaskraning, þannig 
-- að viðkomandi hafi skráð sig á afmælisdeginum. Það er nóg að breyta einni skráningu!
update nemendur 
set faedingardagur = "1996-08-01"
where nemandi = 4

-- 7: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#####################################!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Notið staðgengla til að birta upplýsingar um áfanga og undanfara þeirra.
-- Birtið áfagnanúmerið, áfangaheitið, undanfaranúmerið, undanfarheitið' og tegund undanfara(það nægir að nota 1, 2 eða 3)
select a.afangaNumer, a.afangaHeiti, u.undanfaraNumer, a2.afangaHeiti as undanfaraHeiti, u.tegund 
from afangar a
left join undanfarar u on u.afangaNumer = a.afangaNumer
left join afangar a2 on u.undanfaraNumer = a2.afangaNumer

-- 8:
-- Útfærið fyrirspurnina úr lið 7 þannig að birtar séu upplýsingar um alla áfanga óháð því 
-- hvort þeir eru með undanfara eða ekki.

-- sama og að ofan
select a.afangaNumer, a.afangaHeiti, u.undanfaraNumer, a2.afangaHeiti as undanfaraHeiti, u.tegund 
from afangar a
left join undanfarar u on u.afangaNumer = a.afangaNumer
left join afangar a2 on u.undanfaraNumer = a2.afangaNumer

-- 9:
-- Bætið nú fyrirspurn 7 þannig að í stað 1, 2 og 3 fyrir tegund komi sami texti og í lið 2.
select a.afangaNumer, a.afangaHeiti, u.undanfaraNumer, a2.afangaHeiti as undanfaraHeiti, 
  case 
    when u.tegund = "1" then "Undanfari"
    when u.tegund = "2" then "Má taka með"
    when u.tegund = "3" then "Verður að taka með"
  end as tegund
from afangar a
left join undanfarar u on u.afangaNumer = a.afangaNumer
left join afangar a2 on u.undanfaraNumer = a2.afangaNumer


-- 10:
-- Veljið upplýsingar um nemendur sem hafa valið áfanga sem er undanfari.
-- Birtið nemanda ID, fornafn og eftirnafn samsett með concat() fallinu og undanfaranúmerið!
select n.nemandi, concat(n.fornafn, " ", n.eftirnafn) as nafn from nemendur n
inner join nemendaskraning ns on n.nemandi = ns.nemandiID
left join undanfarar u on ns.afangaNumer = u.afangaNumer
where ns.afangaNumer = u.afangaNumer