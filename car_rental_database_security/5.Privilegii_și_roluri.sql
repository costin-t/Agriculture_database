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

