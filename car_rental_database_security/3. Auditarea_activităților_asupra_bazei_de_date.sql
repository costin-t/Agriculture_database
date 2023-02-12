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

