use registration;

# DML script

# 1-Lista antalet produkter per kategori. Listningen ska innehålla kategori-namn och antalet produkter. 

select count(kt.kategori_id) as antal_produkter, k.namn as kategori_namn
from kategori_typ kt
inner join kategori k
on kt.kategori_id=k.id
group by kt.kategori_id
order by antal_produkter desc;



# 2-Skapa en kundlista med den totala summan pengar som varje kund har handlat för. Kundens
# för- och efternamn, samt det totala värdet som varje person har shoppats för, skall visas

select k.fornamn, k.efternamn, ((select pris from skor where bd.skor_id = skor.id) * bd.antal_skor) as totalSumma
from bestallningdetalj bd
inner join bestallning b
on bd.bestallning_id=b.id
inner join kund k
on b.kund_id=k.id;



# 3-Vilka kunder har köpt svarta sandaler i storlek 38 av märket Ecco? Lista deras namn.

select CONCAT(k.fornamn , " ", k.efternamn)as fullnamn 
from bestallningdetalj bt
inner join bestallning b
on bt.bestallning_id=b.id
inner join kund k
on b.kund_id = k.id
inner join skor s
on bt.skor_id=s.id
where brand='ecco' and storlek=38;



# 4-Skapa en topp-5 lista av de mest sålda produkterna.

select s.brand, antal_skor as antal
from bestallningdetalj bd
inner join skor s
on bd.skor_id=s.id
order by antal_skor desc
limit 5;





