
INSERT ALL 
INTO clienti VALUES ( 1,  'VICTORIA FLORENTINA ' , 2948533465748, 'Strada Radului Nr. 6', 0756747921, 50)
INTO clienti VALUES ( 2,  'GHEORGHE SERBAN' , 1938573495848, 'Strada Chilina Nr. 4', 0722743921, 8490)
INTO clienti VALUES ( 3,  'IACOB MARIAN' , 1836578495848, 'Strada Julien Nr. 254', 0732543921, 12490)
INTO clienti VALUES ( 4,  'CASMIR RAMONA' , 2334573425848, 'Strada Viitor Nr. 4', 0712343325, 2530)
INTO clienti VALUES ( 5,  'DRAGON MADALINA' , 2332376422848, 'Strada Hreanului Nr. 12', 0712393329, 9511)
INTO clienti VALUES ( 6,  'MULLER ELENA' , 2257823425848 , 'Strada Bizonului Nr. 87', 0716345325, 30000)
INTO clienti VALUES ( 7,  'DUMITRU ANGHEL' , 1324473725848, 'Strada Lalelelor Nr. 1', 0798342325, 100)
INTO clienti VALUES ( 8,  'PIRVU FLORIN' , 1234375465848, 'Strada Rovinilor Nr. 24', 0722333525, 2530)
INTO clienti VALUES ( 9,  'RADU MADALIN' , 1934573425848, 'Strada Plevna Nr. 234 Bl 20 Et 3 ap 12', 0712332506, 2050)
INTO clienti VALUES ( 10,  'MAGDALENA FLORI' , 2954573425848, 'Strada Viilor Nr. 940', 0709403325, 99999)
SELECT * FROM dual;

INSERT ALL
INTO clienti VALUES (11, 'Florin Cristian', 2458495847531, 'Strada Prid Nr. 19', 0733871000, 5600) 
SELECT * FROM dual;

INSERT ALL 
 INTO judet values ( 1 , 'Prahova', 1 )
 INTO judet values ( 2 , 'Ialomita', 2 )
 INTO judet values ( 3 , 'Calarasi', 3 )
 INTO judet values ( 4 , 'Timis', 4 )
 INTO judet values ( 5 , 'Ilfov', 5 )
 INTO judet values ( 6 , 'Arad', 6 )
 INTO judet values ( 7 , 'Dambovita', 7 )
 INTO judet values ( 8 , 'Munchen', 8 )
 INTO judet values ( 9 , 'Covasna', 9 )
 SELECT * FROM dual;

INSERT ALL 
INTO tara values ( 1, 'Romania', 1)
INTO tara values ( 2, 'Romania', 2)
INTO tara values ( 3, 'Romania', 3)
INTO tara values ( 4, 'Romania', 4)
INTO tara values ( 5, 'Romania', 5)
INTO tara values ( 6, 'Romania', 6)
INTO tara values ( 7, 'Romania', 7)
INTO tara values ( 8, 'Germania', 8)
INTO tara values ( 9, 'Romania', 9)  
SELECT * FROM DUAL;

INSERT INTO TARA ( id_tara, nume_tara)
VALUES ( 10, 'Frata');

INSERT INTO TARA ( id_tara, nume_tara)
VALUES ( 11, 'Ungara');

INSERT INTO TARA ( id_tara, nume_tara)
VALUES ( 12, 'Bulgaria');


INSERT ALL 
INTO ANGAJATII VALUES ( 1 , 3500 , 'Marian', 'Ionut', 0734684639, 2, 1,  1)
INTO ANGAJATII VALUES ( 2 , 4000 , 'Gheorghe', 'Doru', 0733875014 , 2, 2, 2)
INTO ANGAJATII VALUES ( 3 , 8000 , 'Ionut',  'Mihai', 0733738159 , 0, 3, 3)
INTO ANGAJATII VALUES ( 4 , 2900 , 'Florin','Costin', 0734543215 , 2, 4, 4)
INTO ANGAJATII VALUES ( 5 , 3000 , 'Marcu', 'Florin', 0733583260 , 2, 5, 5)
INTO ANGAJATII VALUES ( 6 , 3000 , 'Dobre', 'Cosmin', 0733917352 , 2, 6, 6)
INTO ANGAJATII VALUES ( 7 , 2500 , 'Dorin', 'Adrian', 0733000352 , 2, 7, 7)
INTO ANGAJATII VALUES ( 8 , 5000 , 'Ion',    'David', 0733725891 , 2, 8, 8)
SELECT *FROM dual;
INSERT INTO angajatii 
VALUES (9, 7000 , 'Doru' , 'Marcian' , 0762873190, null, 2, 3);
INSERT INTO angajatii 
VALUES (10, 6000 , 'Florin' , 'Teodor' , 0730875191, null, 2, 4);
INSERT INTO angajatii( id_angajat, salariul, nume_angajat, prenume_angajat, telefon_angajat, comision_vanzari)
VALUES ( 11, 2500, 'George', 'Mihai', 0736845942, 0);
INSERT INTO angajatii( id_angajat, salariul, nume_angajat, prenume_angajat, telefon_angajat)
VALUES ( 12, 2300, 'Grigore', 'Vali', 0733164844 );

INSERT ALL 
INTO comenzi VALUES (1,(to_date('21/02/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 1 )
INTO comenzi VALUES (2,(to_date('11/09/2020','dd/mm/yyyy')), 'Card', 'Depozit', 2 )
INTO comenzi VALUES (3,(to_date('02/06/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 3 )
INTO comenzi VALUES (4,(to_date('15/04/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 4 )
INTO comenzi VALUES (5,(to_date('11/11/2020','dd/mm/yyyy')), 'Transfer', 'Depozit', 5 )
INTO comenzi VALUES (6,(to_date('13/11/2020','dd/mm/yyyy')), 'Card', 'Livrat', 6 )
INTO comenzi VALUES (7,(to_date('24/07/2020','dd/mm/yyyy')), 'Cash', 'Depozit', 7 )
INTO comenzi VALUES (8,(to_date('17/03/2020','dd/mm/yyyy')), 'Transfer', 'Livrat', 8 )
SELECT * FROM dual;
INSERT ALL 
INTO comenzi VALUES (9,(to_date('21/02/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 1 )
SELECT * FROM dual;
INSERT INTO comenzi VALUES ( 10, (to_date('01/01/2021', 'dd/mm/yyyy')), 'Card', 'Depozitat', 2)

INSERT ALL 
INTO servicii VALUES ( 1, 'Recoltat',' Strangerea cerealelor,legumelor, etc', 1500,1)
INTO servicii VALUES ( 2, 'Discuit',' Lucrarea pamantului pentru maruntirea bulgarilor, afanare, distrugerea buruienilor', 400,2)
INTO servicii VALUES ( 3, 'Transport',' Transport cereale si/sau produse agricole', 600,3)
INTO servicii VALUES ( 4, 'Reparati',' Reparati la utilajele agricole', 700,4)
INTO servicii VALUES ( 5, 'Plan investiti',' Pregatirea planurilor pentru investiti si dezvoltare a organizatiei', 540,5)
INTO servicii VALUES ( 6, 'Studiu Fezabilitate ',' Studiu fezabilitatea ', 700,6)
INTO servicii VALUES ( 7, 'Semanat',' - ', 300,7)
INTO servicii VALUES ( 8, 'Stropit',' Insecticid, ierbicid, fungicid, etc', 400,8)
SELECT * FROM dual;

INSERT INTO produse (id_produs, descriere_produs, pret_produs, cantitate)
VALUES ( 1, 'Agros S', 130, 2);
INSERT INTO produse (id_produs, descriere_produs, pret_produs, cantitate)
VALUES ( 2, 'Agros L', 150, 2);
INSERT ALL 
INTO produse VALUES (3, 'Maxforce' , 25 ,1,1 )
INTO produse VALUES (4, 'Mospila' , 15 ,2,2 )
INTO produse VALUES (5, 'Homevo' , 35 ,3,3 )
INTO produse VALUES (6, 'Adego' , 45 ,3,5 )
INTO produse VALUES (7, 'S240' , 22 ,2,6 )
INTO produse VALUES (8, 'Dicopur' , 15 ,1,6 )
SELECT * FROM DUAL;

INSERT ALL 
INTO inventar VALUES ( 1, 7, (to_date('21/05/2022','dd/mm/yyyy')), 1)
INTO inventar VALUES ( 2, 9, (to_date('22/01/2022','dd/mm/yyyy')), 2)
INTO inventar VALUES ( 3, 17, (to_date('11/12/2023','dd/mm/yyyy')), 3)
INTO inventar VALUES ( 4, 26, (to_date('01/07/2024','dd/mm/yyyy')), 4)
INTO inventar VALUES ( 5, 8, (to_date('21/07/2025','dd/mm/yyyy')), 5)
INTO inventar VALUES ( 6, 30, (to_date('01/03/2023','dd/mm/yyyy')), 6)
INTO inventar VALUES ( 7, 12, (to_date('16/11/2023','dd/mm/yyyy')), 7)
INTO inventar VALUES ( 8, 11, (to_date('11/10/2024','dd/mm/yyyy')), 8)
SELECT * FROM dual;

INSERT ALL
INTO furnizori VALUES ( 1, 'Agromarket', 30000, 1)
INTO furnizori VALUES ( 2, 'Ipso', 300, 2)
INTO furnizori VALUES ( 3, 'Agroint', 30000, 3)
INTO furnizori VALUES ( 4, 'Pestcontrol', 930000, 4)
INTO furnizori VALUES ( 5, 'Ameropa', 80000, 1)
INTO furnizori VALUES ( 6, 'Cargil', 130000, 1)
INTO furnizori VALUES ( 7, 'Nidera', 895, 1)
INTO furnizori VALUES ( 8, 'Bunge', 9000, 1)
SELECT * FROM dual;

INSERT ALL 
INTO factura VALUES ( 1, (to_date('11/03/2022','dd/mm/yyyy')),  1 , 1 ) 
INTO factura VALUES ( 2, (to_date('06/10/2022','dd/mm/yyyy')), 2 , 2 ) 
INTO factura VALUES ( 3, (to_date('09/07/2022','dd/mm/yyyy')), 3 , 3 ) 
INTO factura VALUES ( 4, (to_date('23/05/2022','dd/mm/yyyy')), 4 , 4 ) 
INTO factura VALUES ( 5, (to_date('26/12/2022','dd/mm/yyyy')) , 5 , 5 ) 
INTO factura VALUES ( 6, (to_date('29/12/2022','dd/mm/yyyy')), 6 , 6 ) 
INTO factura VALUES ( 7, (to_date('21/08/2022','dd/mm/yyyy')), 7 , 7 ) 
INTO factura VALUES ( 8, (to_date('10/05/2022','dd/mm/yyyy')), 8 , 8 ) 
SELECT * FROM dual;

INSERT ALL 
INTO concentrati_substante VALUES( 1 , 'nume', 5, 6, 8)
INTO concentrati_substante VALUES ( 2 , 'Top Gazon', 8, 4, 3)
INTO concentrati_substante VALUES ( 3 , 'MasterLine', 1, 9, 2)
INTO concentrati_substante VALUES ( 4 , 'Agrocomplex', 4, 7, 6)
SELECT * FROM dual;

INSERT ALL 
INTO clienti VALUES ( 1,  'VICTORIA FLORENTINA ' , 2948533465748, 'Strada Radului Nr. 6', 0756747921, 50)
INTO clienti VALUES ( 2,  'GHEORGHE SERBAN' , 1938573495848, 'Strada Chilina Nr. 4', 0722743921, 8490)
INTO clienti VALUES ( 3,  'IACOB MARIAN' , 1836578495848, 'Strada Julien Nr. 254', 0732543921, 12490)
INTO clienti VALUES ( 4,  'CASMIR RAMONA' , 2334573425848, 'Strada Viitor Nr. 4', 0712343325, 2530)
INTO clienti VALUES ( 5,  'DRAGON MADALINA' , 2332376422848, 'Strada Hreanului Nr. 12', 0712393329, 9511)
INTO clienti VALUES ( 6,  'MULLER ELENA' , 2257823425848 , 'Strada Bizonului Nr. 87', 0716345325, 30000)
INTO clienti VALUES ( 7,  'DUMITRU ANGHEL' , 1324473725848, 'Strada Lalelelor Nr. 1', 0798342325, 100)
INTO clienti VALUES ( 8,  'PIRVU FLORIN' , 1234375465848, 'Strada Rovinilor Nr. 24', 0722333525, 2530)
INTO clienti VALUES ( 9,  'RADU MADALIN' , 1934573425848, 'Strada Plevna Nr. 234 Bl 20 Et 3 ap 12', 0712332506, 2050)
INTO clienti VALUES ( 10,  'MAGDALENA FLORI' , 2954573425848, 'Strada Viilor Nr. 940', 0709403325, 99999)
SELECT * FROM dual;

INSERT ALL
INTO clienti VALUES (11, 'Florin Cristian', 2458495847531, 'Strada Prid Nr. 19', 0733871000, 5600) 
SELECT * FROM dual;

INSERT ALL 
 INTO judet values ( 1 , 'Prahova', 1 )
 INTO judet values ( 2 , 'Ialomita', 2 )
 INTO judet values ( 3 , 'Calarasi', 3 )
 INTO judet values ( 4 , 'Timis', 4 )
 INTO judet values ( 5 , 'Ilfov', 5 )
 INTO judet values ( 6 , 'Arad', 6 )
 INTO judet values ( 7 , 'Dambovita', 7 )
 INTO judet values ( 8 , 'Munchen', 8 )
 INTO judet values ( 9 , 'Covasna', 9 )
 SELECT * FROM dual;

INSERT ALL 
INTO tara values ( 1, 'Romania', 1)
INTO tara values ( 2, 'Romania', 2)
INTO tara values ( 3, 'Romania', 3)
INTO tara values ( 4, 'Romania', 4)
INTO tara values ( 5, 'Romania', 5)
INTO tara values ( 6, 'Romania', 6)
INTO tara values ( 7, 'Romania', 7)
INTO tara values ( 8, 'Germania', 8)
INTO tara values ( 9, 'Romania', 9)  
SELECT * FROM DUAL;

INSERT INTO TARA ( id_tara, nume_tara)
VALUES ( 10, 'Frata');

INSERT INTO TARA ( id_tara, nume_tara)
VALUES ( 11, 'Ungara');

INSERT INTO TARA ( id_tara, nume_tara)
VALUES ( 12, 'Bulgaria');


INSERT ALL 
INTO ANGAJATII VALUES ( 1 , 3500 , 'Marian', 'Ionut', 0734684639, 2, 1,  1)
INTO ANGAJATII VALUES ( 2 , 4000 , 'Gheorghe', 'Doru', 0733875014 , 2, 2, 2)
INTO ANGAJATII VALUES ( 3 , 8000 , 'Ionut',  'Mihai', 0733738159 , 0, 3, 3)
INTO ANGAJATII VALUES ( 4 , 2900 , 'Florin','Costin', 0734543215 , 2, 4, 4)
INTO ANGAJATII VALUES ( 5 , 3000 , 'Marcu', 'Florin', 0733583260 , 2, 5, 5)
INTO ANGAJATII VALUES ( 6 , 3000 , 'Dobre', 'Cosmin', 0733917352 , 2, 6, 6)
INTO ANGAJATII VALUES ( 7 , 2500 , 'Dorin', 'Adrian', 0733000352 , 2, 7, 7)
INTO ANGAJATII VALUES ( 8 , 5000 , 'Ion',    'David', 0733725891 , 2, 8, 8)
SELECT *FROM dual;
INSERT INTO angajatii 
VALUES (9, 7000 , 'Doru' , 'Marcian' , 0762873190, null, 2, 3);
INSERT INTO angajatii 
VALUES (10, 6000 , 'Florin' , 'Teodor' , 0730875191, null, 2, 4);
INSERT INTO angajatii( id_angajat, salariul, nume_angajat, prenume_angajat, telefon_angajat, comision_vanzari)
VALUES ( 11, 2500, 'George', 'Mihai', 0736845942, 0);
INSERT INTO angajatii( id_angajat, salariul, nume_angajat, prenume_angajat, telefon_angajat)
VALUES ( 12, 2300, 'Grigore', 'Vali', 0733164844 );

INSERT ALL 
INTO comenzi VALUES (1,(to_date('21/02/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 1 )
INTO comenzi VALUES (2,(to_date('11/09/2020','dd/mm/yyyy')), 'Card', 'Depozit', 2 )
INTO comenzi VALUES (3,(to_date('02/06/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 3 )
INTO comenzi VALUES (4,(to_date('15/04/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 4 )
INTO comenzi VALUES (5,(to_date('11/11/2020','dd/mm/yyyy')), 'Transfer', 'Depozit', 5 )
INTO comenzi VALUES (6,(to_date('13/11/2020','dd/mm/yyyy')), 'Card', 'Livrat', 6 )
INTO comenzi VALUES (7,(to_date('24/07/2020','dd/mm/yyyy')), 'Cash', 'Depozit', 7 )
INTO comenzi VALUES (8,(to_date('17/03/2020','dd/mm/yyyy')), 'Transfer', 'Livrat', 8 )
SELECT * FROM dual;
INSERT ALL 
INTO comenzi VALUES (9,(to_date('21/02/2020','dd/mm/yyyy')), 'Cash', 'Livrat', 1 )
SELECT * FROM dual;
INSERT INTO comenzi VALUES ( 10, (to_date('01/01/2021', 'dd/mm/yyyy')), 'Card', 'Depozitat', 2)

INSERT ALL 
INTO servicii VALUES ( 1, 'Recoltat',' Strangerea cerealelor,legumelor, etc', 1500,1)
INTO servicii VALUES ( 2, 'Discuit',' Lucrarea pamantului pentru maruntirea bulgarilor, afanare, distrugerea buruienilor', 400,2)
INTO servicii VALUES ( 3, 'Transport',' Transport cereale si/sau produse agricole', 600,3)
INTO servicii VALUES ( 4, 'Reparati',' Reparati la utilajele agricole', 700,4)
INTO servicii VALUES ( 5, 'Plan investiti',' Pregatirea planurilor pentru investiti si dezvoltare a organizatiei', 540,5)
INTO servicii VALUES ( 6, 'Studiu Fezabilitate ',' Studiu fezabilitatea ', 700,6)
INTO servicii VALUES ( 7, 'Semanat',' - ', 300,7)
INTO servicii VALUES ( 8, 'Stropit',' Insecticid, ierbicid, fungicid, etc', 400,8)
SELECT * FROM dual;

INSERT INTO produse (id_produs, descriere_produs, pret_produs, cantitate)
VALUES ( 1, 'Agros S', 130, 2);
INSERT INTO produse (id_produs, descriere_produs, pret_produs, cantitate)
VALUES ( 2, 'Agros L', 150, 2);
INSERT ALL 
INTO produse VALUES (3, 'Maxforce' , 25 ,1,1 )
INTO produse VALUES (4, 'Mospila' , 15 ,2,2 )
INTO produse VALUES (5, 'Homevo' , 35 ,3,3 )
INTO produse VALUES (6, 'Adego' , 45 ,3,5 )
INTO produse VALUES (7, 'S240' , 22 ,2,6 )
INTO produse VALUES (8, 'Dicopur' , 15 ,1,6 )
SELECT * FROM DUAL;

INSERT ALL 
INTO inventar VALUES ( 1, 7, (to_date('21/05/2022','dd/mm/yyyy')), 1)
INTO inventar VALUES ( 2, 9, (to_date('22/01/2022','dd/mm/yyyy')), 2)
INTO inventar VALUES ( 3, 17, (to_date('11/12/2023','dd/mm/yyyy')), 3)
INTO inventar VALUES ( 4, 26, (to_date('01/07/2024','dd/mm/yyyy')), 4)
INTO inventar VALUES ( 5, 8, (to_date('21/07/2025','dd/mm/yyyy')), 5)
INTO inventar VALUES ( 6, 30, (to_date('01/03/2023','dd/mm/yyyy')), 6)
INTO inventar VALUES ( 7, 12, (to_date('16/11/2023','dd/mm/yyyy')), 7)
INTO inventar VALUES ( 8, 11, (to_date('11/10/2024','dd/mm/yyyy')), 8)
SELECT * FROM dual;

INSERT ALL
INTO furnizori VALUES ( 1, 'Agromarket', 30000, 1)
INTO furnizori VALUES ( 2, 'Ipso', 300, 2)
INTO furnizori VALUES ( 3, 'Agroint', 30000, 3)
INTO furnizori VALUES ( 4, 'Pestcontrol', 930000, 4)
INTO furnizori VALUES ( 5, 'Ameropa', 80000, 1)
INTO furnizori VALUES ( 6, 'Cargil', 130000, 1)
INTO furnizori VALUES ( 7, 'Nidera', 895, 1)
INTO furnizori VALUES ( 8, 'Bunge', 9000, 1)
SELECT * FROM dual;

INSERT ALL 
INTO factura VALUES ( 1, (to_date('11/03/2022','dd/mm/yyyy')),  1 , 1 ) 
INTO factura VALUES ( 2, (to_date('06/10/2022','dd/mm/yyyy')), 2 , 2 ) 
INTO factura VALUES ( 3, (to_date('09/07/2022','dd/mm/yyyy')), 3 , 3 ) 
INTO factura VALUES ( 4, (to_date('23/05/2022','dd/mm/yyyy')), 4 , 4 ) 
INTO factura VALUES ( 5, (to_date('26/12/2022','dd/mm/yyyy')) , 5 , 5 ) 
INTO factura VALUES ( 6, (to_date('29/12/2022','dd/mm/yyyy')), 6 , 6 ) 
INTO factura VALUES ( 7, (to_date('21/08/2022','dd/mm/yyyy')), 7 , 7 ) 
INTO factura VALUES ( 8, (to_date('10/05/2022','dd/mm/yyyy')), 8 , 8 ) 
SELECT * FROM dual;

INSERT ALL 
INTO concentrati_substante VALUES( 1 , 'nume', 5, 6, 8)
INTO concentrati_substante VALUES ( 2 , 'Top Gazon', 8, 4, 3)
INTO concentrati_substante VALUES ( 3 , 'MasterLine', 1, 9, 2)
INTO concentrati_substante VALUES ( 4 , 'Agrocomplex', 4, 7, 6)
SELECT * FROM dual;




