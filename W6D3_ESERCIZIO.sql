CREATE TABLE STORE (
Codice_store INT NOT NULL
, Indirizzo_fisico VARCHAR(50)
, Numero_telefono CHAR(15) 
, CONSTRAINT PK_STORE PRIMARY KEY (Codice_store)
);
CREATE TABLE IMPIEGATO (
Codice_fiscale CHAR(16) NOT NULL
, Nome VARCHAR(20)
, Titolo_studio VARCHAR(50)
, Recapito VARCHAR(20)
,CONSTRAINT PK_IMPIEGATO PRIMARY KEY (Codice_fiscale)
);
ALTER TABLE IMPIEGATO
MODIFY COLUMN Recapito VARCHAR(50);

CREATE TABLE STORICO (
Codice_fiscale CHAR(16) NOT NULL
, Codice_store INT NOT NULL
, Data_inizio DATE 
, Data_fine DATE 
, Periodo_servizio DATE 
, CONSTRAINT FK_IMPIEGATO_STORICO FOREIGN KEY (Codice_fiscale)
REFERENCES IMPIEGATO (Codice_fiscale)
, CONSTRAINT FK_STORE_STORICO FOREIGN KEY (Codice_store)
REFERENCES STORE (Codice_store)
, CONSTRAINT PK_STORICO PRIMARY KEY (Codice_fiscale, Codice_store)
);
ALTER TABLE STORICO
CHANGE COLUMN Periodo_servizio Carica VARCHAR(255);

CREATE TABLE VIDEOGIOCO (
Codice_videogioco INT NOT NULL AUTO_INCREMENT
, Titolo VARCHAR(50) NOT NULL
, Sviluppatore VARCHAR(30)
, Anno_distribuzione DATE
, Costo DECIMAL(4,2)
, Genere VARCHAR(30)
, RemakeDi VARCHAR(50)
, CONSTRAINT PK_VIDEOGIOCO PRIMARY KEY (Codice_videogioco)
);
ALTER TABLE VIDEOGIOCO
MODIFY COLUMN Anno_distribuzione YEAR;

CREATE TABLE COLLOCAZIONE_videogioco (
Codice_store INT NOT NULL
, Codice_videogioco INT NOT NULL
, Quantità SMALLINT
, CONSTRAINT FK_VIDEOGIOCO_COLLOCAZIONE_videogioco FOREIGN KEY (Codice_videogioco)
REFERENCES VIDEOGIOCO (Codice_videogioco)
, CONSTRAINT FK_STORE_COLLOCAZIONE_videogioco FOREIGN KEY (Codice_store)
REFERENCES STORE (Codice_store)
, CONSTRAINT PK_COLLOCAZIONE_videogioco PRIMARY KEY (Codice_videogioco, Codice_store)
);
INSERT INTO STORE 
VALUES
(1,'Via Roma 123, Milano Corso','+39 021234567')
, (2,'Italia 456, Roma Piazza','+39 067654321')
, (3,'San Marco 789, Venezia','+39 0419876543')
, (4,'Viale degli Ulivi 234, Napoli','+39 0813456789')
, (5,'Via Torino 567, Torino','+39 0118765432')
, (6,'Corso Vittorio Emanuele 890, Firenze','+39 0552345678')
, (7,'Piazza del Duomo 123, Bologna','+39 0518765432')
, (8,'Via Garibaldi 456, Genova','+39 0102345678')
, (9,'Lungarno Mediceo 789, Pisa','+39 0508765432')
, (10,'Corso Cavour 101, Palermo','+39 0912345678')
;
INSERT INTO IMPIEGATO 
VALUES
('ABC12345XYZ67890','Mario Rossi','Laurea in Economia','mario.rossi@email.com')
, ('DEF67890XYZ12345','Anna Verdi','Diploma di Ragioneria','anna.verdi@email.com')
, ('GH112345XYZ67890','Luigi Bianchi','Laurea in Informatica','luigi.bianchi@email.com')
, ('JKL67890XYZ12345','Laura Neri','Laurea in Lingue','laura.neri@email.com')
, ('MN012345XYZ67890','Andrea Moretti','Diploma di Geometra','andrea.moretti@email.com')
, ('PQR67890XYZ12345','Giulia Ferrara','Laurea in Psicologia','giulia.ferrara@email.com')
, ('STU12345XYZ67890','Marco Esposito','Diploma di Elettronica','marco.esposito@email.com')
, ('VWX67890XYZ12345','Sara Romano','Laurea in Giurisprudenza','sara.romano@email.com')
, ('YZA12345XYZ67890','Roberto De Luca','Diploma di Informatica','roberto.deluca@email.com')
, ('BCD67890XYZ12345','Elena Santoro','Laurea in Lettere','elena.santoro@email.com')
;
INSERT INTO VIDEOGIOCO 
VALUES
(1,'Fifa 2023','EA Sports',2023,49.99, 'Calcio',NULL)
, (2,"Assassin's Creed: Valhalla",'Ubisoft',2020,59.99, 'Action',NULL)
, (3,'Super Mario Odyssey','Nintendo',2020,39.99, 'Platform',NULL)
, (4,'The Last of Us Part II','Naughty Dog',2020,69.99, 'Action',NULL)
, (5,'Cyberpunk 2077','CD Projekt Red',2020,49.99, 'RPG',NULL)
, (6,'Animal Crossing: New Horizons','Nintendo',2020,54.99, 'Simulation' ,NULL)
, (7,'Call of Duty: Warzone','Infinity Ward',2020,0.00, 'FPS',NULL)
, (8,'The Legend of Zelda: Breath of the Wild','Nintendo',2020,59.99, 'Action-Adventure',NULL)
, (9,'Fortnite','Epic Games',2020,0.00, 'Battle Royale',NULL)
, (10,'Red Dead Redemption 2','Rockstar Games',2020,39.99, 'Action-Adventure',NULL)
;
INSERT INTO STORICO VALUES
("ABC12345XYZ67890",1,"2023-01-01","2023-12-31","Cassiere")
, ("DEF67890XYZ12345",2,"2023-02-01","2023-11-30","Commesso")
, ("GH112345XYZ67890",3,"2023-03-01","2023-10-31","Magazziniere")
, ("JKL67890XYZ12345",4,"2023-04-01","2023-09-30","Addetto alle vendite")
, ("MN012345XYZ67890",5,"2023-05-01","2023-08-31","Addetto alle pulizie")
, ("PQR67890XYZ12345",6,"2023-06-01","2023-07-31","Commesso")
, ("STU12345XYZ67890",7,"2023-07-01","2023-06-30","Commesso")
, ("VWX67890XYZ12345",8,"2023-08-01","2023-05-31","Cassiere")
, ("YZA12345XYZ67890",9,"2023-09-01","2023-04-30","Cassiere")
, ("BCD67890XYZ12345",10,"2023-10-01","2023-03-31","Cassiere")
;

INSERT INTO COLLOCAZIONE_VIDEOGIOCO VALUES
(1,1,5)
, (2,2,7)
, (3,3,1)
, (4,4,2)
, (5,5,12)
, (6,6,4)
, (7,7,3)
, (8,8,6)
, (9,9,5)
, (10,10,10)
;