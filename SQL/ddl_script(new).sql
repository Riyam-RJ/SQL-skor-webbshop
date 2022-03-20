use registration;
# skapa upp databasen

CREATE TABLE kategori
(
    id   int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    namn varchar(50) NOT NULL
);

CREATE TABLE skor
(
    id             		int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    storlek        		varchar(15) NOT NULL,
    color          		varchar(15) NOT NULL,
    pris           		int         NOT NULL,
    brand          		varchar(15) NOT NULL,
    totalt_i_lager 		int         NOT NULL
);

CREATE TABLE kategori_typ
(
    skor_id   int         NOT NULL,
    kategori_id int NOT NULL,
    FOREIGN KEY (kategori_id) REFERENCES kategori (id),
    FOREIGN KEY (skor_id) REFERENCES skor (id)
);

CREATE TABLE kund
(
    id      	int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fornamn    	varchar(50),
    efternamn   varchar(50),
    email   	varchar(50),
    pass	 	varchar(50),
    address 	varchar(50)
);

CREATE TABLE bestallning
(
    id         int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    kund_id    int  NOT NULL,
    datum      date NOT NULL,
    FOREIGN KEY (kund_id) REFERENCES kund (id)
);

CREATE TABLE bestallningdetalj
(
    id         int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bestallning_id    int  NOT NULL,
    skor_id    int  NOT NULL,
    antal_skor int  NOT NULL,
    FOREIGN KEY (skor_id) REFERENCES skor (id)
);

CREATE TABLE slutilager(
	id   int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	skor_id int not null,
	datum varchar(50) NOT NULL);

# fyller databasen med data

INSERT INTO kategori (namn)
VALUES 
	   ('herrskor'),
       ('dammskor'),
       ('barnskor'),
       ('sportskor'),
       ('promenadskor');
       
INSERT INTO skor (storlek, color, pris, brand, totalt_i_lager)
VALUES (42, 'svart', 500, 'vagabond', 100),
       (38, 'blå', 600, 'tamaris', 50),
       (39, 'grön', 900, 'nike', 20),
       (32, 'rosa', 300, 'reebok', 30),
       (37, 'gul', 700, 'adidas', 150),
       (38, 'svarta', 1099, 'ecco', 15),
       (40, 'röd', 599, 'puma', 60),
       (45, 'brun', 595, 'Uggs', 24);


INSERT INTO kategori_typ (skor_id, kategori_id)
VALUES 
	   (1, 1),
       (1, 4),
       (2, 2),
       (2, 4),
       (3, 4),
       (4, 5),
       (5, 2),
       (6, 2),
       (7, 4),
       (7, 1),
       (8, 4);
       

INSERT INTO kund (fornamn, efternamn, email, pass, address)
VALUES ('Jonas', 'Svensson', 'jonas90@hotmail.se', 'jonas', 'loviselundsgatan 2 16556 Stockholm'),
       ('Maria', 'Andersson', 'maria69@hotmail.se', 'maria', 'frimursvägen 24 12778 Skärholmen'),
       ('Eva','Lindgren', 'Eva60li@live.se', 'eva','Stångholmsgatan 14 12711 högdalen'),
       ('Pablo', 'Palma', 'pablooo92@live.com', 'pablo','friherregatan 1 bv 16558 hässelby'),
       ('Tuva','Sjölin', 'tuvasjolin@outlook.se', 'tuva', 'Sibyllavägen 8 12242 Stockholm'),
       ('Martin','Lundberg', 'martin@gmail.com', 'martin','Sibyllavägen 9 12242 Stockholm'),
       ('Paula', 'Queen', 'paula@gmail.com', 'paula','Sibyllavägen 10 12242 Stockholm'),
       ('Sara', 'Eriksson', 'sara@gmail.com', 'sara','Sibyllavägen 11 12242 Stockholm');

INSERT INTO bestallning (kund_id, datum)
VALUES (1,'2020-10-10'),
       (3,'2020-12-20'),
       (2,'2020-04-11'),
       (5,'2020-06-30'),
       (4,'2020-08-20'),
       (6,'2020-01-01');

INSERT INTO bestallningdetalj (bestallning_id, skor_id, antal_skor)
VALUES		(1,2,10),
			(2,1,12),
			(3,4,5),
			(4,6,8),
			(5,2,11),
			(6,8,9);
       

       
       


