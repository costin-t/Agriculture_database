--------2. Criptarea datelor --------


CREATE OR REPLACE PACKAGE encrypt_decrypt
AS
FUNCTION encrypt (p_plainText VARCHAR2) RETURN RAW DETERMINISTIC;
FUNCTION decrypt (p_encryptedText RAW) RETURN VARCHAR2 DETERMINISTIC;
END;

------


CREATE OR REPLACE PACKAGE BODY encrypt_decrypt
AS
encryption_type    PLS_INTEGER := DBMS_CRYPTO.ENCRYPT_DES
+ DBMS_CRYPTO.CHAIN_CBC
+ DBMS_CRYPTO.PAD_PKCS5;
encryption_key     RAW (32) := UTL_RAW.cast_to_raw('proiectmasterkey');
FUNCTION encrypt (p_plainText VARCHAR2) RETURN RAW DETERMINISTIC
IS
encrypted_raw      RAW (2000);
BEGIN
encrypted_raw := DBMS_CRYPTO.ENCRYPT
( src => UTL_RAW.CAST_TO_RAW (p_plainText),
typ => encryption_type,
key => encryption_key );
RETURN encrypted_raw;
END encrypt;
FUNCTION decrypt (p_encryptedText RAW) RETURN VARCHAR2 DETERMINISTIC
IS
decrypted_raw      RAW (2000);
BEGIN
decrypted_raw := DBMS_CRYPTO.DECRYPT
( src => p_encryptedText,
 typ => encryption_type,
 key => encryption_key );
RETURN (UTL_RAW.CAST_TO_VARCHAR2 (decrypted_raw));
END decrypt;
END;


create or replace trigger EncriptareNume
before insert on clienti
for each row
begin
 :new.nume := encrypt_decrypt.encrypt(:new.nume);
 :new.prenume := encrypt_decrypt.encrypt(:new.prenume);
end;

INSERT INTO clienti VALUES (10, 'Ionut', 'Adrian', 'Cluj','Str.Norilor nr 321',5 ,4);

---------
select * from clienti;

-------------3. Auditarea activităților asupra bazei de date

--  auditare standard
select value from v$parameter where name='audit_trail';
alter system set audit_trail=db scope=spfile;
-- pornire auditare standard pentru tabela PATIENT
AUDIT INSERT,UPDATE,DELETE,SELECT on angajat by ACCESS;


select username, action_name from dba_audit_trail;

--CREATE TABLE angajat (
-- ID_angajat int NOT NULL PRIMARY KEY,
-- nume varchar(255) NOT NULL,
-- prenume varchar(255) NOT NULL,
-- departmanet varchar(255) 
-- );
desc angajat;


--DROP TABLE angajat_audit;
CREATE TABLE angajat_audit (
 ID_angajat NUMBER(38) NOT NULL PRIMARY KEY,
 nume VARCHAR2(255) NOT NULL,
 prenume VARCHAR2(255) NOT NULL,
 departmanet VARCHAR2(255),
 action VARCHAR2(255) NOT NULL,
 timestamp TIMESTAMP NOT NULL
);

--drop trigger angajat_audit_trg;
CREATE OR REPLACE TRIGGER angajat_audit_trg
AFTER INSERT OR UPDATE OR DELETE ON angajat
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO angajat_audit (ID_angajat, nume, prenume, departmanet, action, timestamp)
    VALUES (:new.ID_angajat, :new.nume, :new.prenume, :new.departmanet, 'INSERT', CURRENT_TIMESTAMP);
  ELSIF UPDATING THEN
    INSERT INTO angajat_audit (ID_angajat, nume, prenume, departmanet, action, timestamp)
    VALUES (:new.ID_angajat, :new.nume, :new.prenume, :new.departmanet, 'UPDATE', CURRENT_TIMESTAMP);
  ELSIF DELETING THEN
    INSERT INTO angajat_audit (ID_angajat, nume, prenume, departmanet, action, timestamp)
    VALUES (:old.ID_angajat, :old.nume, :old.prenume, :old.departmanet, 'DELETE', CURRENT_TIMESTAMP);
  END IF;
END;

INSERT INTO angajat (ID_angajat, nume, prenume, departmanet)
VALUES (12, 'Ionut', 'Dorin', 'Mentenanta');

select * from angajat_audit;

-------
begin
DBMS_FGA.ADD_POLICY(
  object_schema => 'costin' ,
  object_name=>'angajat',
  policy_name=>'angajat_audit',
  audit_column=> 'ID',
  enable=>true,
  statement_types=>'insert,update,delete,select'
);
end;


------------4.Gestiunea utilizatorilor unei baze de date și a resurselor computaționale ----

CREATE USER angajati1 IDENTIFIED BY angajati1 PASSWORD EXPIRE;
GRANT CREATE SESSION TO agajati1;
--drop user angajat;
CREATE USER clienti IDENTIFIED BY clienti PASSWORD EXPIRE;
GRANT CREATE SESSION TO clienti;
--drop user clienti;
desc angajat;
desc clienti;

SELECT USERNAME, AUTHENTICATION_TYPE, ACCOUNT_STATUS, CREATED,
EXPIRY_DATE
FROM DBA_USERS ORDER BY CREATED desc

SELECT USERNAME,DEFAULT_TABLESPACE,TEMPORARY_TABLESPACE
FROM DBA_USERS ORDER BY CREATED DESC



------------ 5.Privilegii și roluri --------

CREATE ROLE selector;
GRANT SELECT ANY TABLE TO selector;


CREATE ROLE echipa_vanzari;
GRANT INSERT,UPDATE ON clienti TO echipa_vanzari;
GRANT INSERT,UPDATE ON contract TO echipa_vanzari;


CREATE ROLE vizualizare_clienti;
GRANT SELECT ON masina TO vizualizare_clienti;

CREATE ROLE echipa_mentenanta;
GRANT INSERT,UPDATE ON stoc_piese TO echipa_mentenanta;

--drop role echipa_mentenanta;

--Acordare de roluri

GRANT vizualizare_clienti TO clienti;


--------------6. SQL INJECTION

SELECT * FROM ANGAJAT WHERE NUME ='' OR '1'='1'


SELECT * FROM ANGAJAT WHERE ID_ANGAJAT = &EMPNO;


-------- 7 - Mascarea datelor
create or replace package mascare is
function functie_masc(sir varchar2) return varchar2; 
function functie_masc(nr number) return number; 
end;

CREATE OR REPLACE FUNCTION mask_data (p_value VARCHAR2)
RETURN VARCHAR2
AS
BEGIN
  RETURN RPAD(SUBSTR(p_value, 1, 1), LENGTH(p_value), '$');
END;


SELECT ID_stoc_piese, mask_data(pret) AS pret
FROM stoc_piese;


