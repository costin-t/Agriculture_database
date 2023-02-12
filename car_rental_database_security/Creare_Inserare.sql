----------Conectare oraclpdb----------
------orcl_root
select user from dual;

show con_name;

select name, open_mode from v$pdbs;

alter pluggable database orclpdb open;


--------------orclpdb_sysdba
create user costin identified by costin;
grant connect, resource to costin;
grant execute on dbms_crypto to costin;
grant all privileges to costin;
commit;

--------------user=costin
select user from dual;

show con_name;


-----Creare-----------


CREATE TABLE angajat (
 ID_angajat int NOT NULL PRIMARY KEY,
 nume varchar(255) NOT NULL,
 prenume varchar(255) NOT NULL,
 departmanet varchar(255) 
);

CREATE TABLE masina (
ID_masina int NOT NULL PRIMARY KEY,
serie varchar (20) NOT NULL UNIQUE,
producator varchar(50),
model_masina varchar(50),
anul_productiei int
);


CREATE TABLE carburant (
    ID_carburant INT PRIMARY KEY NOT NULL,
    tip_carburant varchar(60)
);  

 
 CREATE TABLE stoc_piese (
    ID_stoc_piese INT PRIMARY KEY NOT NULL,
    nume varchar(255),
    an_productie INT,
    producator varchar (255),
    pret int,
    stoc int,
    ID_masina REFERENCES masina(ID_masina)
); 


CREATE TABLE clienti (
    ID_clienti INT PRIMARY KEY NOT NULL ,
    nume varchar(200), 
    prenume varchar(200), 
    oras varchar(200), 
    adressa varchar(200),
    ID_masina references masina(ID_masina),
    ID_angajat references angajat(ID_angajat)
);

CREATE TABLE contract (
    ID_contract INT PRIMARY KEY NOT NULL,
    data_inceput DATE,
    data_sfarsit DATE,
    suma int,
    ID_masina REFERENCES masina(ID_masina),
    ID_clienti REFERENCES clienti(ID_clienti),
    ID_angajat REFERENCES angajat (ID_angajat)
);    

ALTER TABLE masina  ADD ID_carburant int;
ALTER TABLE masina
ADD CONSTRAINT INT FOREIGN KEY (ID_carburant) REFERENCES carburant(ID_carburant);



--DROP TABLE angajat;
--DROP TABLE stoc_piese;
--DROP TABLE carburant;
--DROP TABLE contract;
--DROP TABLE clienti;
--DROP TABLE masina;

--DESC angajat;
--DESC stoc_piese;
--DESC carburant;
--DESC contract;
--DESC clienti;
--DESC masina;
---------------- Inserare --------------------------
INSERT INTO angajat VALUES (1,'Cristi' ,'Vlad','IT');
INSERT INTO angajat VALUES (2, 'Dragomir', 'Tudor', 'Vanzari');
INSERT INTO angajat VALUES (3, 'Gon', 'Ionut' , 'Reparati');
INSERT INTO angajat VALUES (4, 'Tudorel', 'Mihai', 'Vanzari');
INSERT INTO angajat VALUES (5, 'Vlase', 'Madalin', 'Vanzari');
INSERT INTO angajat VALUES (6, 'Doru', 'Stefan' , 'Reparati');
INSERT INTO angajat VALUES (7, 'Razvan', 'Anghelus', 'Vanzari');
INSERT INTO angajat VALUES (8, 'Ana', 'Flori', 'FrontDesk');

SELECT * FROM ANGAJAT;
--DELETE FROM ANGAJAT;

INSERT INTO carburant (ID_carburant, tip_carburant) VALUES (1, 'Benzina');
INSERT INTO carburant (ID_carburant, tip_carburant) VALUES (2, 'Motorina');
INSERT INTO carburant (ID_carburant, tip_carburant) VALUES (3, 'BioDiser');
INSERT INTO carburant (ID_carburant, tip_carburant) VALUES (4, 'Gaz');
SELECT * FROM carburant;


INSERT INTO angajat VALUES (2, 'Dragomir', 'Tudor', 'Vanzari');
INSERT INTO angajat VALUES (3, 'Gon', 'Ionut' , 'Reparati');
INSERT INTO angajat VALUES (4, 'Tudorel', 'Mihai', 'Vanzari');
INSERT INTO angajat VALUES (5, 'Vlase', 'Madalin', 'Vanzari');
INSERT INTO angajat VALUES (6, 'Doru', 'Stefan' , 'Reparati');
INSERT INTO angajat VALUES (7, 'Oni', 'Anghelus', 'Vanzari');
INSERT INTO angajat VALUES (8, 'Ana', 'Flori', 'FrontDesk');
SELECT * FROM angajat;
desc stoc_piese;

INSERT INTO masina VALUES (1, '15251123ASDFGV', 'Audi', 'Audi_A1',2010,1);
INSERT INTO masina VALUES (2, 'EFDDDJF123464D', 'Audi', 'Audi_R8', 2007,1);
INSERT INTO masina VALUES (3, 'IEH8493NFNEI32', 'Alfa_Romeo' , 'Alfa_Romeo_Brera',2006,1);
INSERT INTO masina VALUES (4, '93848FBFHF48FH', 'Ac_Cars', 'AC_3000ME',1984,1);
INSERT INTO masina VALUES (5, '90595498FJRJGK', 'Porche', 'Porche_Macan',2015,1);
INSERT INTO masina VALUES (6, '978KDKFJK0VRFQ', 'Renaul' , 'Renault_Clio',1991,1);
INSERT INTO masina VALUES (7, 'MFIRNI49994NFG', 'Toyota', 'Toyota_Hilux',2017,2);
INSERT INTO masina VALUES (8, 'DNRURNU8483923', 'VOLKSWAGEN', 'Jetta',2005,1);
SELECT * FROM  masina;


INSERT INTO stoc_piese VALUES (1, 'Catalizator', 2015, 'Bosai',900,2,2);
INSERT INTO stoc_piese VALUES (2, 'Schimbator_viteze', 2018, 'Reno',1900,1,5);
INSERT INTO stoc_piese VALUES (3, 'Faruri', 2011, 'Autobius',700,3,3);
INSERT INTO stoc_piese (ID_stoc_piese, nume, an_productie, producator, pret, stoc, ID_masina)
VALUES (4, 'Pompa apa', 2010, 'ContiTech', 150, 20, 1);
INSERT INTO stoc_piese (ID_stoc_piese, nume, an_productie, producator, pret, stoc, ID_masina)
VALUES (5, 'Furtun combustibil', 2011, 'Gates', 25, 50, 2);
INSERT INTO stoc_piese (ID_stoc_piese, nume, an_productie, producator, pret, stoc, ID_masina)
VALUES (6, 'Conducta frana', 2012, 'Brembo', 30, 30, 3);

SELECT * FROM stoc_piese;



INSERT INTO clienti VALUES (1, 'Vlad', 'Mihailescu', 'Bucuresti','Str.Rucarului nr 16',1,2);
INSERT INTO clienti VALUES (2, 'Mircea', 'Ionut', 'Bucuresti','Str.Rahova 122',2,4);
INSERT INTO clienti VALUES (3, 'Achim', 'Ionut', 'Calarasi','Str.Duelului nr 100',3,2);
INSERT INTO clienti VALUES (4, 'Sobran', 'Costin', 'Buzau','Str.Vlaicu nr 303',4,7);
INSERT INTO clienti VALUES (5, 'Mihail', 'Andreea', 'Gorj','Str.Viitor nr 421',5,4);
INS   VALUES (6, 'Dragan', 'Ramona', 'Constanta','Str.Soarelui nr 2',6,2);
SELECT * FROM clienti;


INSERT INTO contract VALUES (1, TO_DATE('17/10/2022','DD/MM/YYYY'),TO_DATE('20/12/2022','DD/MM/YYYY'), 1700,1,1,2);
INSERT INTO contract VALUES (2, TO_DATE('30/11/2022','DD/MM/YYYY'),TO_DATE('20/12/2022','DD/MM/YYYY'), 2700,2,1,2);
INSERT INTO contract VALUES (3, TO_DATE('11/06/2022','DD/MM/YYYY'),TO_DATE('20/7/2022','DD/MM/YYYY'), 1500,3,2,4);
INSERT INTO contract VALUES (4, TO_DATE('1/1/2022','DD/MM/YYYY'),TO_DATE('1/12/2023','DD/MM/YYYY'), 700,4,3,2);
SELECT * FROM contract;





