# DML script

# 1-Lista antalet produkter per kategori. Listningen ska innehålla kategori-namn och antalet produkter. 

select COUNT(s.kategori_id) as antal_produkter , k.namn as kategori_namn
from skor s, Kategori k
where s.kategori_id = k.id
group by s.kategori_id
order by antal_produkter desc;

# 2-Skapa en kundlista med den totala summan pengar som varje kund har handlat för. Kundens
# för- och efternamn, samt det totala värdet som varje person har shoppats för, skall visas

select k.fornamn, k.efternamn, ((select pris from skor where b.skor_id = skor.id) * b.antal_skor) as totalSumma
from bestallningar b
inner join kund k
on b.kund_id=k.id;

# 3-Vilka kunder har köpt svarta sandaler i storlek 38 av märket Ecco? Lista deras namn.

select CONCAT(k.fornamn , " ", k.efternamn)as fullnamn 
from bestallningar b
inner join kund k
on b.kund_id=k.id
inner join skor s
on b.skor_id = s.id
where brand='ecco' and storlek=38;


# 4-Skapa en topp-5 lista av de mest sålda produkterna.

select s.brand, antal_skor as antal
from bestallningar b
inner join skor s
on b.skor_id=s.id
order by antal_skor desc
limit 5




			
                                 
							


