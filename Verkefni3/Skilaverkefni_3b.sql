-- 1:
-- Sækið upplýsingar um alla áfanga sem í boði eru óháð brautum.
-- Birtið áfanganúmer, áfangaheiti, einingafjölda, önn áfangans og hvort áfanginn er skylda eða ekki.
-- AHT: Hér þarf að nota inner join

select 
    a1.afangaNumer, a1.afangaHeiti, a1.einingar, 
    a2.onnAfanga, a2.skylda
from afangar a1
inner join afangaframbod a2 
on a1.afangaNumer = a2.afangaNumer


-- 2:
-- Sækið upplýsingar um alla skylduáfanga sem skráðir eru í grunninn.
-- Birtið áfanganúmer, áfangaheiti og önn áfangans. Raðið eftir önn áfangans 

select afangar.afangaNumer, afangar.afangaHeiti, afangaframbod.onnAfanga
from afangar
inner join afangaframbod 
on afangar.afangaNumer = afangaframbod.afangaNumer
where skylda
order by onnAfanga;


-- 3:
-- Sækið úr töflunni Nemendaskraning upplýsingar um alla nemendur sem eru í eða hafa tekið áfangann STÆR2BR05AT
-- birtið nemanda númer(ID),fornafn og eftirnafn.
-- ATH: Hér þarf að nota subquery

    -- Ég skil ekki hvar ég á að nota subquery, hér er mín útfærsla án þess að nota subquery
select nemandiID, fornafn, eftirnafn from nemendaskraning n1
inner join nemendur n2 on n1.nemandiID = n2.nemandi
where n1.afangaNumer = "STÆR2BR05AT";

        -- Tilraun til þess að setja subquery inn í þetta
    select nemandiID, fornafn, eftirnafn from nemendaskraning n1
    inner join nemendur n2 on n1.nemandiID = n2.nemandi
    where n1.afangaNumer = ( select afangaNumer from afangar where afangaNumer = "STÆR2BR05AT" )

-- 4:
-- Sækið allar eikunnir nemenda sem eru lægri en meðaleiknunn(allra áfanga)
-- birtið nemanda ID, áfanganúmer og einkunn

select nemandiID, afangaNumer, einkunn from nemendaskraning
where einkunn is not null 
and  einkunn < ( select avg(einkunn) from nemendaskraning 
                where einkunn is not null )

-- 5:
-- Sækið alla áfanga sem eru í framboði á brautum skólans.
-- birtið heiti undirskóla, heiti brautar, áfanganúmer og önn áfanga.
-- Gæti verið kúl að raða eftir undirskólum og svo á hvaða önn áfangarnir eru!
-- ATH: Töflur sem þarf að nota eru: Undirskolar, Brautir, Afangaframboð.

    -- WIP - ekki búið að klára
select afangaNumer, onnAfanga, heitiBrautar, heiti from afangaframbod
inner join brautir using(brautarNumer)
inner join undirskolar on undirskolar.undirskolaNumer = brautir.tilheyrir;