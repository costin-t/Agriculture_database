
--Join INNER 
SELECT *
FROM clienti
INNER JOIN judet
ON clienti.id_client = judet.id_client;

SELECT produse.id_comanda, produse.descriere_produs
FROM produse
INNER JOIN inventar
ON  produse.id_comanda = inventar.id_iventar

SELECT *
FROM tara
INNER JOIN judet
ON tara.id_judet = judet.id_judet;

----Left join 
SELECT angajatii.nume_angajat,angajatii.prenume_angajat, angajatii.id_angajat, 
clienti.nume_client, clienti.id_client
FROM angajatii
LEFT JOIN clienti ON angajatii.id_angajat = clienti.id_client
ORDER BY angajatii.prenume_angajat ASC

-- Outer Join -
SELECT *
FROM produse
full outer JOIN inventar
ON (produse.id_produs = inventar.id_produs);

--- join cu 3 tabele

SELECT * FROM clienti
JOIN judet ON clienti.id_client = judet.id_client
JOIN tara ON clienti.id_client = tara.id_tara

--Selecteaza judetele care incep cu litera C
SELECT judet.nume_judet from judet where nume_judet like 'C%'; 

--Subcereri - Clientii cu datori mai mari de 5000 lei
SELECT nume_client, datorii_client
FROM clienti
WHERE datorii_client >5000;

----- Servici care costa mai mult de 500 lei
SELECT nume_servicii, pret_servici
FROM servicii
WHERE pret_servici > 500;
 
 --subcereri nesincronizate sa se selecteze toti angajati care indeplinesc aceste conditii

 SELECT pret_servici, nume_servicii
FROM servicii
WHERE pret_servici > ( SELECT MIN(pret_produs)
FROM produse
WHERE servicii.id_servicii = produse.id_produs);

--Cel mai mare salariu
SELECT id_angajat, nume_angajat, salariul
FROM angajatii
WHERE salariul = ( SELECT MAX(salariul) FROM angajatii);

--Cea mai mare datorie a unui client
select id_client, nume_client
from clienti
where datorii_client = (select max(datorii_client) 
                from clienti);
---Cea mai mica datorie                
select id_client, nume_client
from clienti
where datorii_client = (select min(datorii_client) 
                from clienti);
---Nivelul mediu de datori
SELECT AVG(datorii_client) 
FROM clienti;

-- Functi de grup -- Ordonarea clientilor in ordine crescatoare

SELECT nume_client, id_client
 FROM clienti
 GROUP BY nume_client, id_client
 ORDER BY COUNT(*) desc;


--- Cursor -- Angajatii care au comisionul 0
set serveroutput on;

DECLARE
CURSOR c IS
SELECT id_angajat, nume_angajat
FROM angajatii
WHERE comision_vanzari IS NULL;
v_id_angajat angajatii.id_angajat%TYPE;
v_nume_angajat angajatii.nume_angajat%TYPE;
BEGIN
OPEN c;
LOOP
FETCH c INTO v_id_angajat, v_nume_angajat ;
EXIT WHEN c%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_id_angajat || ' ' || v_nume_angajat);
END LOOP;
CLOSE c;
END;


---- Subprograme -- Arata salariul angajatului angajatului pe nume "Ionut"

CREATE OR REPLACE FUNCTION salariul1
  (v_nume angajatii.nume_angajat%TYPE DEFAULT 'Ionut')    
RETURN NUMBER IS
    salariu angajatii.salariul%type; 
  BEGIN
    SELECT salariul INTO salariu 
    FROM   angajatii
    WHERE  nume_angajat = v_nume;
    RETURN salariu;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000, 'Nu exista angajati cu numele dat');
    WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi angajati cu numele dat');
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
END salariul1;

SELECT salariul1 from dual;

--- 15. TRIGER la nivel de comanda -- Prin acest trigger impiedica crearea unei facturii in afara orelor de program 
CREATE OR REPLACE TRIGGER triger_1
BEFORE INSERT OR DELETE OR UPDATE on factura
BEGIN 
IF (TO_CHAR(SYSDATE,'D') = 1)
    or (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 20)
THEN
    RAISE_APPLICATION_ERROR(-20001, 'Operetaiunile de facture se fac doar in programul de lucru 8:00 - 20:00');
    END IF;
    END;

-Drop trigger
DROP TRIGGER triger_1;

--INSERARE RAND FACTURA 
INSERT ALL 
INTO factura VALUES ( 11, (to_date('14/04/2022','dd/mm/yyyy')),  1 , 4 ) 
SELECT * FROM DUAL;
-- Arata data de astazi si ora
SELECT TO_CHAR
 (SYSDATE,'DD-MM-YYYY HH24:MI:SS') "NOW"
 FROM DUAL;

 

