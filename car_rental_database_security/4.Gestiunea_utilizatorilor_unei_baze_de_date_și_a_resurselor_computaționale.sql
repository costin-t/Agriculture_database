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


