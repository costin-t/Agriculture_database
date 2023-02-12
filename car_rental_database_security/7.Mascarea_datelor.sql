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
/

SELECT ID_stoc_piese, mask_data(pret) AS pret
FROM stoc_piese;

