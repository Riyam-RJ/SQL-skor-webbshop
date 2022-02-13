# skapa upp databasen

CREATE TABLE kategori
(
    id   int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    namn varchar(15) NOT NULL
);

CREATE TABLE skor
(
    id             int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    storlek        varchar(15) NOT NULL,
    color          varchar(15) NOT NULL,
    pris           int         NOT NULL,
    brand          varchar(15) NOT NULL,
    totalt_i_lager int         NOT NULL,
    kategori_id    int,
    FOREIGN KEY (kategori_id) REFERENCES kategori (id)
);

CREATE TABLE kund
(
    id      int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fornamn    varchar(50) NOT NULL,
    efternamn    varchar(50) NOT NULL,
    email   varchar(50) NOT NULL,
    address varchar(50) NOT NULL
);

CREATE TABLE bestallningar
(
    id         int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    skor_id    int  NOT NULL,
    kund_id    int  NOT NULL,
    antal_skor int  NOT NULL,
    datum      date NOT NULL,
    FOREIGN KEY (skor_id) REFERENCES skor (id),
    FOREIGN KEY (kund_id) REFERENCES kund (id)
);


# fyller databasen med data

INSERT INTO kategori (namn)
VALUES 
	   ('herrskor'),
       ('dammskor'),
       ('barnskor'),
       ('sportskor'),
       ('promenadskor');

INSERT INTO skor (storlek, color, pris, model, kategori_id, totalt_i_lager)
VALUES (42, 'svart', 500, 'vagabond', 1, 100),
       (38, 'blå', 600, 'tamaris', 2, 50),
       (39, 'grön', 900, 'nike', 4, 20),
       (32, 'rosa', 300, 'reebok', 3, 30),
       (37, 'gul', 700, 'adidas', 5, 150),
       (38, 'svarta', 1099, 'ecco', 2, 15),
       (40, 'röd', 599, 'puma', 2, 60),
       (45, 'brun', 999, 'Uggs', 1, 5);



INSERT INTO kund (fornamn, efternamn, email, address)
VALUES ('Jonas', 'Svensson', 'jonas90@hotmail.se', 'loviselundsgatan 2 16556 Stockholm'),
       ('Maria', 'Andersson', 'maria69@hotmail.se', 'frimursvägen 24 12778 Skärholmen'),
       ('Eva','Lindgren', 'Eva60li@live.se', 'Stångholmsgatan 14 12711 högdalen'),
       ('Pablo', 'Palma', 'pablooo92@live.com', 'friherregatan 1 bv 16558 hässelby'),
       ('Tuva','Sjölin', 'tuvasjolin@outlook.se', 'Sibyllavägen 8 12242 Stockholm'),
       ('Martin','Lundberg', 'martin@gmail.com', 'Sibyllavägen 9 12242 Stockholm'),
       ('Paula', 'Queen', 'paula@gmail.com', 'Sibyllavägen 10 12242 Stockholm'),
       ('Sara', 'Eriksson', 'sara@gmail.com', 'Sibyllavägen 11 12242 Stockholm');

INSERT INTO bestallningar (skor_id, kund_id, antal_skor, datum)
VALUES (2,1,2, '2020-10-10'),
       (1,3,3,'2020-12-20'),
       (4,2,4, '2020-04-11'),
       (6,5,8, '2020-06-30'),
       (7,4,1, '2020-08-20'),
       (8,6,2, '2020-01-01');
       
       


