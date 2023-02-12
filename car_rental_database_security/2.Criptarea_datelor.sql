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

