-- 1:
-- Skrifið function, FjoldiSkylduafanga sem skilar fjölda skylduáfanga á ákveðinni braut.
-- brautarnúmerið er sent inn sem færibreyta



-- 2:
-- Skrifið function, Meðaleinkunn sem reiknar meðaleinkunn úr áföngum sem ákv. nemandi hefur lokið.
-- Notið færibreytuna nemandi_id. 
-- Til að forma kommutöluna þannig að hún hafi einn aukastaf og mest tvo tölustafi, t.d: 10.0 er
-- sniðugt að nota float(3,1) sem return-gagnatag og rúnna svo meðaltalið með round() fallinu!



-- 3:
-- Skrifið function, FjoldiUndanfara sem telur hve marga undanfara einhver ákveðinn áfangi hefur.
-- Hafi áfangi engan undanfara þá er skilað 0



-- 4:
-- Skrifið function, HlutfallLokinnaAfanga sem reiknar út hve stórt hlutfall af áföngum
-- á ákveðinni braut, nemandinn hefur lokið.
-- gefa þarf upp bæði nemanda ID og brautarnúmer.



-- 5:
-- skrifið function, EndurteknirAfangar sem kannar hvort nemandi hefur tekið einhvern áfanga 
-- eða einhverja áfanga oftar en einu sinni. 
-- Ef nemandinn hefur t.d. tekið tvo áfanga oftar en einu sinni þá er skilað 2 en ef nemandinn
-- ATH:  Þið teljið áfangana, ekki fjölda þeirra skipta sem einhver áfangi hefur verið endurtekin.



-- 6:
-- skrifið Stored Procedure nyBraut sem skráir nýja námsbraut í gagnagrunninn.
-- gefa þarf upp heiti nýju brautarinnar og hvaða skóla hún tilheyrir.
-- Notið row_count() til að "skila" fjölda raða sem verða til við að keyra þennan SP.
-- 
-- Prófið með eftirfarandi kalli í NyBraut:  call NyBraut('Tölvuleikjaskolinn',10);



-- 7:
-- skrifið Stored Procedure SkraAfangaNemanda sem skráir ákv. nemanda í ákv. áfanga.
-- Byrjað er á að kanna hvort nemandinn er skráður í áfangann og sé svo ekki þá heldur skráningin
-- áfram.  Sé nemandinn hins vegar skráður(einkunn is null) þá er ekki aðhafst neitt.
-- Hér má nota row_count() eins og gert var í lið 5.



-- 8:
-- Skrifið Stored Procedure NemendaYfirlit sem birtir upplýsingar um nemendur og nám þeirra.
-- Sýnið eftirfarandi upplýsingar: auðkenni(ID) nemanda, nafn nemanda, áfanganúmer, afangaheiti, einkunn og einingafjölda



-- 9:
-- NemendaYfirlit úr lið 8 skilar þeim upplýsingum sem beðið er um en það er smá ónákvæmni sem vert er að skoða.
-- Hafi nemandinn fengi undir 5 í einkunn á hann ekki rétt á einingum, alla vega ekki í þessu kerfi :-)
-- Einkunnafjöldi fyrir hvern áfanga er hins vegar skráður í töfluna Afangar svo að það þarf að "reikna" út hvort
-- viðkomandi nemandi á að fá einingar fyrir áfangann eða ekki. Reglan hér er: einkunn < 5 => einingar = 0.
-- Reynið að bæta fyrirspurninaúr lið 8 þannig að þetta birtist í yfirlitinu(með t.d. case when) 
-- Kallið endurgerðan SP, NemendaYfirlit_II



-- 10:
-- Skrifið VIEW, AfangaframbodUndirskola.
-- Birtið heiti skóla, heiti undirskóla, heiti brauta, afanganúmer, áfangaheiti, önn áfangans og hvort áfangin er skylda.
-- raðið eftir skólaheiti, undirskólaheiti, brautarheiti.
